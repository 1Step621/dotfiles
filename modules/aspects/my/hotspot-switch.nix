{
  my.hotspot-switch = {
    os =
      {
        pkgs,
        ethernet-if,
        wifi-if,
        hotspot-name,
        ...
      }:
      {
        networking = {
          nat = {
            enable = true;
            internalInterfaces = [ wifi-if ];
            externalInterface = ethernet-if;
          };
          firewall.interfaces.${wifi-if} = {
            allowedTCPPorts = [ 53 ];
            allowedUDPPorts = [
              53
              67
              68
            ];
          };
          networkmanager.dispatcherScripts = [
            {
              type = "basic";
              source = pkgs.writeShellScript "hotspot-switch" ''
                export PATH="${pkgs.networkmanager}/bin"

                IFACE="$1"
                STATE="$2"

                ETH_IF="${ethernet-if}"
                WIFI_IF="${wifi-if}"

                HOTSPOT_NAME="${hotspot-name}"

                log() {
                    logger "[dispatcher] $1"
                }

                if [ "$IFACE" = "$ETH_IF" ]; then
                    case "$STATE" in
                        up)
                            log "Ethernet connected -> enable hotspot"
                            nmcli -w 0 connection up "$HOTSPOT_NAME"
                            ;;

                        down|device-removed)
                            log "Ethernet disconnected -> disable hotspot"
                            nmcli -w 0 connection down "$HOTSPOT_NAME" 2>/dev/null
                            ;;

                        *)
                            ;;
                    esac
                fi
              '';
            }
          ];
        };
      };
  };
}
