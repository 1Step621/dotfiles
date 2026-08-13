{ my, ... }:
{
  my.wl-screenrec = {
    includes = [
      my.desktop
    ];

    homeManager =
      { pkgs, ... }:
      let
        wl-screenrec-toggle = pkgs.writeShellApplication {
          name = "wl-screenrec-toggle";
          runtimeInputs = [
            pkgs.coreutils
            pkgs.slurp
            pkgs.wl-screenrec
          ];
          text = ''
            set -euo pipefail
            pidfile="''${XDG_RUNTIME_DIR:?XDG_RUNTIME_DIR is not set}/wl-screenrec.pid"

            is_wl_screenrec_pid() {
              local pid="$1"
              local comm
              if [[ -z "$pid" ]] || [[ ! "$pid" =~ ^[0-9]+$ ]]; then
                return 1
              fi
              if ! kill -0 "$pid" 2>/dev/null; then
                return 1
              fi
              if ! IFS= read -r comm < "/proc/$pid/comm"; then
                return 1
              fi
              [[ "$comm" == "wl-screenrec" ]]
            }

            stop_recording() {
              local pid="$1"
              local i
              kill -INT "$pid"
              for ((i = 0; i < 50; i++)); do
                if ! kill -0 "$pid" 2>/dev/null; then
                  rm -f "$pidfile"
                  return 0
                fi
                sleep 0.1
              done
              printf 'wl-screenrec did not exit after SIGINT: %s\n' "$pid" >&2
              exit 1
            }

            if [[ -e "$pidfile" ]]; then
              if ! IFS= read -r pid < "$pidfile"; then
                printf 'Failed to read pidfile: %s\n' "$pidfile" >&2
                exit 1
              fi
              if is_wl_screenrec_pid "$pid"; then
                stop_recording "$pid"
                exit 0
              fi
              rm -f "$pidfile"
            fi

            geometry="$(slurp)"
            wl-screenrec -g "$geometry" "$@" &
            printf '%s\n' "$!" > "$pidfile"
          '';
        };
      in
      {
        home.packages = [
          pkgs.pulseaudio-ctl
          wl-screenrec-toggle
        ];

        programs.niri.settings.binds."Ctrl+Print".action.spawn-sh = [
          "wl-screenrec-toggle --audio --audio-device=\"$(pactl get-default-sink).monitor\" -f \"$HOME/Videos/screencaptures/$(date +%F-%H-%M-%S).mp4\""
        ];
      };
  };
}
