local awful = require("awful")
local beautiful = require("beautiful")
local buttons = require("buttons")
local gears = require("gears")
local keys = require("keys")
local wibox = require("wibox")

awful.rules.rules = {
    { -- Default
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = keys.client,
            buttons = buttons.client,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen,
            shape = function()
                return function(c, width, height)
                    gears.shape.rounded_rect(c, width, height,
                        beautiful.client_border_radius)
                end
            end,
        },
    },

    { -- Add titlebars notifications and dialog
        rule_any = {type = {"notification", "dialog"}},
        except_any = {class = {"Org.gnome.*", "Gnome*", "Gedit", "Evolution"}},
        properties = {titlebars_enabled = true},
    },

    { -- Make dialogs floating
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
            },
            name = {
                -- Note that the name property shown in xprop might be set
                -- slightly after creation of the client and the name shown
                -- there might not match defined rules here.
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = {floating = true},
    },
}

client.connect_signal("manage", function(c)
    -- Set new windows as slaves in the screen layout.
    if not awesome.startup then awful.client.setslave(c) end

    -- Prevent clients from being unreachable after screen count changes.
    if awesome.startup and not c.size_hints.user_position and
        not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("request::titlebars", function(c)
    awful.titlebar(c, {size = beautiful.titlebar_size}):setup{
        layout = wibox.layout.align.horizontal,
        {
            widget = wibox.container.margin,
            margins = beautiful.titlebar_margin,
            {
                buttons = buttons.titlebar(c),
                layout = wibox.layout.fixed.horizontal,
                awful.titlebar.widget.iconwidget(c),
            },
        },
        {
            buttons = buttons.titlebar(c),
            layout = wibox.layout.flex.horizontal,
            {widget = awful.titlebar.widget.titlewidget(c), align = "left"},
        },
        {
            widget = wibox.container.margin,
            margins = beautiful.titlebar_margin,
            {
                layout = wibox.layout.fixed.horizontal(),
                spacing = 2 * beautiful.titlebar_margin,
                {
                    layout = wibox.layout.fixed.horizontal(),
                    awful.titlebar.widget.floatingbutton(c),
                    awful.titlebar.widget.stickybutton(c),
                    awful.titlebar.widget.ontopbutton(c),
                },
                {
                    layout = wibox.layout.fixed.horizontal(),
                    awful.titlebar.widget.minimizebutton(c),
                    awful.titlebar.widget.maximizedbutton(c),
                    awful.titlebar.widget.closebutton(c),
                },
            },
        },
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus",
    function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus",
    function(c) c.border_color = beautiful.border_normal end)
