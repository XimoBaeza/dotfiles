pcall(require, "luarocks.loader")
--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
               ~ AestheticArch ~
            https://github.com/rxyhn
--]]

-- π Library
local gfs = require("gears.filesystem")
local awful = require("awful")
local beautiful = require("beautiful")
dpi = beautiful.xresources.apply_dpi

-- π¨ Themes
themes = {
      "day",      -- [1] π Beautiful Light Colorscheme
      "night",    -- [2] π Aesthetic Dark Colorscheme
}

theme = themes[2]
beautiful.init(gfs.get_configuration_dir() .. "theme/" .. theme .."/theme.lua")

-- π Default Applications
terminal = "kitty"
editor = terminal .. " -e " .. os.getenv("EDITOR")
vscode = "code"
browser = "firefox"
launcher = "rofi -show drun -theme " .. gfs.get_configuration_dir() .. "theme/rofi.rasi"
file_manager = "nautilus"
music_client = terminal .. " --class music -e ncmpcpp"

-- π Weather API
openweathermap_key = "" -- API Key
openweathermap_city_id = "" -- City ID
weather_units = "metric" -- Unit

-- π₯ Screen
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- π Launch Autostart
awful.spawn.with_shell(gfs.get_configuration_dir() .. "configuration/autostart")

-- π€ Import Configuration & module
require("configuration")
require("module")

-- β¨ Import Daemons, UI & Widgets
require("signal")
require("ui")

-- π Garbage Collector Settings
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)

-- Wallpaper
-- local wallpaper_cmd="feh --bg-fill /home/ximo/Descargas/linux.png"
local wallpaper_cmd="feh --bg-fill '/home/ximo/ImΓ‘genes/wallpaperbetter.com_1920x1080.jpg'"
os.execute(wallpaper_cmd)
