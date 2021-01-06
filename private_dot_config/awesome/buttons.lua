local awful = require("awful")
local button = awful.button
local join = require("gears.table").join
local menu = require("menu")
local mod = require("keys").mod
local unpack = table.unpack

local buttons = {left = 1, right = 3, mwclick = 2, mwup = 4, mwdown = 5}

local left, right, mwclick, mwup, mwdown = buttons.left, buttons.right,
    buttons.mwclick, buttons.mwup, buttons.mwdown

buttons.global = join(unpack({
    button({}, right, function() menu:toggle() end),
    button({}, mwup, awful.tag.viewnext),
    button({}, mwdown, awful.tag.viewprev),
}))

buttons.client = join(unpack({
    button({}, left, function(c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    button({mod}, left, function(c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    button({mod}, right, function(c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end),
}))

function buttons.titlebar(c)
    join(unpack({
        button({}, left, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        button({}, right, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end),
    }))
end

buttons.taglist = join(unpack({
    button({}, left, function(t) t:view_only() end),
    button({mod}, left,
        function(t) if client.focus then client.focus:move_to_tag(t) end end),
    button({}, right, awful.tag.viewtoggle),
    button({mod}, right,
        function(t) if client.focus then client.focus:toggle_tag(t) end end),
    button({}, mwup, function(t) awful.tag.viewnext(t.screen) end),
    button({}, mwdown, function(t) awful.tag.viewprev(t.screen) end),
}))

buttons.tasklist = join(unpack({
    button({}, left, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal("request::activate", "tasklist", {raise = true})
        end
    end),
    button({}, right,
        function() awful.menu.client_list({theme = {width = 250}}) end),
    button({}, mwup, function() awful.client.focus.byidx(1) end),
    button({}, mwdown, function() awful.client.focus.byidx(-1) end),
}))

buttons.layoutbox = join(unpack({
    button({}, left, function() awful.layout.inc(1) end),
    button({}, right, function() awful.layout.inc(-1) end),
    button({}, mwup, function() awful.layout.inc(1) end),
    button({}, mwdown, function() awful.layout.inc(-1) end),
}))

return buttons
