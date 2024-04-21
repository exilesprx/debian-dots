## Dependencies

- rofi
- nerd fonts

## Logo

- a default logo is provided in `logos` directory
- however, you can use your own logo by replacing the default logo with your own logo
- use a symlink to create the logo in the `logos` directory. Example:
  - `ln -s /path/to/your/logo.png ~/.config/qtile/logos/logo`
  - using a symlink without an extension enables you to use your own logo without changing the configuration file and allows you to switch between different file types more easily

## Wallpapers

- a default wallpaper is provided in `wallpapers` directory
- however, you can use your own wallpaper by replacing the default wallpaper with your own wallpapers
- the config is currently set to use the `primary` wallpaper and `secondary` wallpaper
- use a symlink to create the wallpapers in the `wallpapers` directory. Example:
  - `ln -s /path/to/your/wallpaper.png ~/.config/qtile/wallpapers/primary`
  - using a symlink without an enables you to use your own wallpaper without changing the configuration file and allows you to switch between different file types more easily
