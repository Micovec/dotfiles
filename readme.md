# Micovec's dotfiles

This is my personal setup for linux

## Stuff you need to change

There are some configuration files that are tied to my specific computer, such as:

- `./waybar/scripts/lock` contains hard-coded:
    - wayland output: `grim -o <output> ...`
    - folder cache: `folder_cache="<folder cache>"`
- Wallpaper:
    - Edit `~/.config/hypr/hyprpaper.conf` and put there your own wallpaper
- Keyboard (if you use multiple languages):
    - Run `hyprctl devices` and find the keyboard that switches languages
    - Put its name in `~/.config/waybar/config` file under section `hyprland/language:keyboard-name`
