local awful = require("awful")
local config = require("config")
local join = require("gears.table").join
local lookup_icon = require("menubar.utils").lookup_icon
local util = require("util")

local apps = join({
    config.terminal,
    config.file_manager or util.apps.default_file_manager(),
    config.editor or util.apps.default_editor(),
    config.browser or util.apps.default_browser(),
    config.audio or util.apps.default_audio(),
    config.mail or util.apps.default_mail(),
    config.calendar or util.apps.default_calendar(),
}, config.apps)
local seen_apps = {}
local menu_apps = {}
for _, app in ipairs(apps) do
    local app = util.apps.app(app)
    if not seen_apps[app.name] then
        seen_apps[app.name] = true
        table.insert(menu_apps, {app.name, app.spawn, app.icon})
    end
end

local menu_awesome = {
    {"Show Hotkeys", util.misc.show_hotkeys_popup, lookup_icon("keyboard")},
    {"Restart Awesome", awesome.restart, lookup_icon("reload")},
    {"Quit Awesome", awesome.quit, lookup_icon("abrt")},
}

local settings = util.apps.app(config.settings)
local menu_system = {
    {settings.name, settings.spawn, settings.icon},
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
