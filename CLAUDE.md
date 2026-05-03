# Dotfiles — CLAUDE.md

## System
- **OS:** Arch Linux
- **WM:** Hyprland
- **Terminal:** Kitty
- **Shell:** Bash (`.bashrc` is the active config, despite README listing Zsh)
- **Bar:** Waybar
- **Launcher:** Rofi (`rofi -show drun`) — README says Wofi but hyprland.conf uses Rofi
- **Notifications:** Dunst
- **Editor:** nano / vim

## Repo Structure
```
dotfiles/
├── bash/.bashrc          # Shell config, aliases, fastfetch on login, TODO system
├── dunst/dunstrc         # Notification daemon (Catppuccin Mocha)
├── grub/theme/theme.txt  # GRUB visual theme → /boot/grub/themes/baker/
├── hypr/hyprland.conf    # WM config: keybinds, theme, animations, input
├── kitty/kitty.conf      # Terminal config (Catppuccin Mocha, JetBrains Mono 13pt)
├── kitty/mocha.conf      # Catppuccin Mocha colour palette
├── rofi/config.rasi      # Launcher theme (Catppuccin Mocha, purple accent)
├── sddm/sddm.conf        # Login manager config
└── waybar/               # Bar config (config.jsonc + style.css)
```

## Theme
- **Kitty:** Catppuccin Mocha (dark, `#1e1e2e` background, 0.7 opacity)
- **Hyprland borders:** Purple→cyan gradient (`rgba(cc99ffee)` → `rgba(66ccffee)`, 45deg)
- **Font:** JetBrains Mono (kitty), FontAwesome + Roboto (waybar)
- **Rounding:** 0 (sharp corners)
- **Gaps:** 2px inner, 5px outer

## Known Issues / TODOs
- README says Wofi but Rofi is in use — README needs updating
- README says Zsh + Oh My Zsh + Starship but `.bashrc` is the active shell config

## Key Aliases & Scripts
- `jarvis` — activates `~/.venvs/jarvis`, cds to `~/projects/jarvis`, runs `python main.py`
- `baker-update` — runs `~/projects/baker/upgrade.sh`
- `tz-uk` / `tz-us` — timezone switching via `timedatectl`
- `WORKON_HOME="$HOME/.venvs"` — Python venv root

## Hyprland Keybinds (main)
- `SUPER + Return` — Kitty
- `SUPER + Space` — Rofi launcher
- `SUPER + Q` — kill active window
- `SUPER + V` — toggle floating
- `SUPER + M` — exit (uses `hyprshutdown` if available)
- `SUPER + SHIFT + P` — screenshot area (grimblast)
- `SUPER + S` — special workspace (magic scratchpad)
- Workspaces 1–10 via `SUPER + [0-9]`
- 3-finger horizontal swipe — switch workspace

## Deployment
All configs live in this repo. Symlinking is handled externally by the OS repo's update script — changes here are picked up on the next system update run. After editing configs, commit and push so the OS repo pulls the latest.

**GRUB split:** `/etc/default/grub` is managed by baker's `configure.sh` (machine-specific: LUKS UUID, nvidia modeset, os-prober, timeout). Only the theme lives here — `grub/theme/` symlinks to `/boot/grub/themes/baker/`, and `configure.sh` sets `GRUB_THEME` and runs `grub-mkconfig` if `theme.txt` is present.
