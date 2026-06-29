{ my, ... }:
{
  my.zed-editor = {
    includes = [ my.desktop ];

    homeManager =
      { pkgs, ... }:
      {
        programs.niri.settings.binds."Mod+E".action.spawn = "zeditor";
        programs.zed-editor = {
          enable = true;
          package = pkgs.zed-editor;
          extensions = [
            "catppuccin-icons"
            "git-firefly"
            "html"
            "haskell"
            "java-eclipse-jdtls"
            "nix"
            "svelte"
            "toml"
            "typst"
            "base16"
            "codex-acp"
          ];
          userSettings = {
            outline_panel.button = false;
            collaboration_panel.button = false;
            debugger.button = false;
            agent.default_model = {
              provider = "copilot_chat";
              model = "gpt-5.2-codex";
              enable_thinking = true;
              effort = "high";
            };
            semantic_tokens = "combined";
            diagnostics.inline.enabled = true;
            git.inline_blame.enabled = false;
            icon_theme = "Catppuccin Frappé";
            gutter = {
              runnables = false;
              breakpoints = false;
              folds = false;
            };
            close_on_file_delete = true;
            auto_signature_help = true;
            focus_follows_mouse = {
              enabled = true;
              debounce_ms = 0;
            };
            ui_font_family = "Inter";
            ui_font_fallbacks = [
              "Noto Sans CJK JP"
            ];
            session.trust_all_worktrees = true;
            cli_default_open_behavior = "new_window";
            git_panel = {
              tree_view = true;
              dock = "right";
            };
            project_panel.dock = "left";
            terminal = {
              dock = "bottom";
              cursor_shape = "bar";
              line_height = "comfortable";
              minimum_contrast = 0;
            };
            sticky_scroll.enabled = false;
            scroll_sensitivity = 3;
            minimap.show = "never";
            current_line_highlight = "all";
            cursor_blink = true;
            buffer_font_fallbacks = [
              "Noto Sans CJK JP"
            ];
            buffer_font_family = "Roboto Mono";
            file_types = {
              cpp = [
                "*.hpp"
              ];
            };
            linked_edits = true;
            show_edit_predictions = true;
            ensure_final_newline_on_save = true;
            tab_size = 2;
            base_keymap = "VSCode";
            ui_font_size = 16;
            buffer_font_size = 15;
            theme = {
              mode = "system";
              light = "One Light";
              dark = "Base16 OneDark";
            };
            load_direnv = "shell_hook";
            lsp = {
              clangd.binary.arguments = [
                "--header-insertion=never"
              ];
              tinymist = {
                binary.path = "${pkgs.tinymist}/bin/tinymist";
                settings = {
                  exportPdf = "onSave";
                  outputPath = "$root/$dir/$name";
                };
              };
            };
            languages = {
              Rust = {
                tab_size = 4;
                hard_tabs = false;
              };
              "C++" = {
                tab_size = 4;
                hard_tabs = false;
              };
            };
          };
          userKeymaps = [
            {
              context = "Workspace";
              bindings = {
                "shift shift" = "file_finder::Toggle";
              };
            }
            {
              context = "Pane";
              bindings = {
                alt-right = "pane::ActivateNextItem";
              };
            }
            {
              context = "Pane";
              bindings = {
                alt-left = "pane::ActivatePreviousItem";
              };
            }
            {
              unbind = {
                ctrl-o = "workspace::OpenFiles";
              };
            }
            {
              context = "Editor && mode == full";
              bindings = {
                ctrl-o = "outline::Toggle";
              };
            }
            {
              context = "Editor && mode == full";
              unbind = {
                ctrl-shift-o = "outline::Toggle";
              };
            }
            {
              unbind = {
                ctrl-q = "zed::Quit";
              };
            }
          ];
        };
        programs.zsh.zsh-abbr.abbreviations = {
          code = "zeditor";
          zed = "zeditor";
        };
        xdg.mimeApps.defaultApplications = {
          "text/plain" = "dev.zed.Zed";
          "text/csv" = "dev.zed.Zed";
          "text/x-c++hdr" = "dev.zed.Zed";
          "text/x-c++src" = "dev.zed.Zed";
          "text/x-python" = "dev.zed.Zed";
          "text/x-shellscript" = "dev.zed.Zed";
          "text/x-java" = "dev.zed.Zed";
          "text/x-csharp" = "dev.zed.Zed";
          "text/x-go" = "dev.zed.Zed";
          "text/x-rust" = "dev.zed.Zed";
          "text/x-javascript" = "dev.zed.Zed";
          "text/x-typescript" = "dev.zed.Zed";
          "text/markdown" = "dev.zed.Zed";
          "application/yaml" = "dev.zed.Zed";
          "application/json" = "dev.zed.Zed";
          "application/xml" = "dev.zed.Zed";
          "text/x-cmake" = "dev.zed.Zed";
          "application/toml" = "dev.zed.Zed";
        };
      };
  };
}
