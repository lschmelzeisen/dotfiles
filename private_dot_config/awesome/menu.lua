local awful = require("awful")
local config = require("config")
local join = require("gears.table").join
local lookup_icon = require("menubar.utils").lookup_icon
local util = require("util")

local file_manager = util.apps.default_file_manager()
local editor = util.apps.default_editor()
local browser = util.apps.default_browser()
local mail = util.apps.default_mail()
local calendar = util.apps.default_calendar()
local audio = util.apps.default_audio()

local menu_apps = {
    {"Terminal", config.terminal, lookup_icon("utilities-terminal")},
    {file_manager.name, file_manager.spawn, file_manager.icon},
    {editor.name, editor.spawn, editor.icon},
    {browser.name, browser.spawn, browser.icon},
    {mail.name, mail.spawn, mail.icon},
}
if calendar.name ~= mail.name then
    table.insert(menu_apps, {calendar.name, calendar.spawn, calendar.icon})
end
table.insert(menu_apps, {audio.name, audio.spawn, audio.icon})


local menu_awesome = {
    {"Show Hotkeys", util.misc.show_hotkeys_popup, lookup_icon("keyboard")},
    {"Restart Awesome", awesome.restart, lookup_icon("reload")},
    {"Quit Awesome", awesome.quit, lookup_icon("abrt")},
}

local menu_system = {
    {"Settings", config.settings, lookup_icon("systemsettings")},
    {"Lock Screen", config.lock_screen, lookup_icon("lock-screen")},
    {"Suspend", config.suspend, lookup_icon("system-suspend")},
    {"Reboot", config.reboot, lookup_icon("system-reboot")},
    {"Power Off", config.shutdown, lookup_icon("system-shutdown")},
    {"Log Out", config.logout, lookup_icon("system-log-out")},
}

local menu = awful.menu({
    items = join(table.unpack({
        -- {{"Apps:"}}, -- lookup_icon("applications-all")
        menu_apps,
        {{}},
        -- {{"Awesome:"}}, -- lookup_icon("window-manager")
        menu_awesome,
        {{}},
        -- {{"System:"}}, -- lookup_icon("applications-system")
        menu_system,
    })),
})

return menu
