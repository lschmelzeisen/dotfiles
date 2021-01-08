local awful = require("awful")

local config = {
    terminal = "org.gnome.Terminal.desktop",
    settings = "gnome-control-center.desktop",
    apps = {
        {"org.gnome.Calendar.desktop"},
        {"teams.desktop", name = "Microsoft Teams"},
    },
}

function config.lock_screen()
    awful.spawn("dbus-send --type=method_call --dest=org.gnome.ScreenSaver " ..
                    "/org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock")
end

function config.suspend() awful.spawn("systemctl suspend") end

function config.reboot() awful.spawn("gnome-session-quit --reboot") end

function config.shutdown() awful.spawn("gnome-session-quit --power-off") end

function config.logout() awful.spawn("gnome-session-quit --logout") end

return config
