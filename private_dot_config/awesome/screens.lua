local awful = require("awful")
local beautiful = require("beautiful")
local buttons = require("buttons")
local gears = require("gears")
local wibox = require("wibox")

awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
local default_layout = awful.layout.layouts[2]

local function set_wallpaper(screen)
    local wallpaper = beautiful.wallpaper
    if wallpaper then
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(screen)
        end
        gears.wallpaper.maximized(wallpaper, screen, true)
    end
end

screen.connect_signal("property::geometry", set_wallpaper)

local mytextclock = wibox.widget.textclock("%H:%M", 10)

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    for i = 1, 9 do
        awful.tag.add(tostring(i), {
            layout = default_layout,
            selected = (i == 1),
            screen = s,
        })
    end

    local mytaglist = awful.widget.taglist(
        {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = buttons.taglist,
        })

    s.mypromptbox = awful.widget.prompt()

    local mytasklist = awful.widget.tasklist(
        {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = buttons.tasklist,
        })

    local mylayoutbox = awful.widget.layoutbox(s)
    mylayoutbox:buttons(buttons.layoutbox)

    local mywibox = awful.wibar({position = "top", screen = s})
    mywibox:setup{
        layout = wibox.layout.align.horizontal,
        {layout = wibox.layout.fixed.horizontal, mytaglist, s.mypromptbox},
        mytasklist,
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mytextclock,
            mylayoutbox,
        },
    }
end)
