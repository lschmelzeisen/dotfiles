local awful = require("awful")
local config = require("config")
local join = require("gears.table").join
local key = awful.key
local menu = require("menu")
local unpack = table.unpack
local util = require("util")

local file_manager = util.apps.default_file_manager().spawn
local editor = util.apps.default_editor().spawn
local browser = util.apps.default_browser().spawn

local keys = {mod = "Mod4", shift = "Shift", control = "Control"}

local mod, shift, control = keys.mod, keys.shift, keys.control

keys.global = join(unpack({
    -- System
    key({mod}, "F1", util.misc.show_hotkeys_popup,
        {description = "show help", group = "awesome"}),
    key({mod}, "w", function() menu:show() end,
        {description = "show main menu", group = "awesome"}),
    key({mod, shift}, "q", util.misc.awesome_gnome_quit,
        {description = "quit awesome", group = "awesome"}),
    key({mod, control}, "r", awesome.restart,
        {description = "reload awesome", group = "awesome"}),

    -- Launching
    key({mod}, "r", function() awful.screen.focused().mypromptbox:run() end,
        {description = "run prompt", group = "launcher"}),
    key({mod}, "l", config.lock_screen,
        {description = "lock screen", group = "launcher"}),
    key({mod}, "Return", function() awful.spawn(config.terminal) end,
        {description = "open a terminal", group = "launcher"}),
    key({mod}, "e", file_manager,
        {description = "open file manager", group = "launcher"}),
    key({mod}, "v", editor, {description = "open editor", group = "launcher"}),
    key({mod}, "b", browser, {description = "open browser", group = "launcher"}),
    key({mod}, "s", config.settings,
        {description = "open settings", group = "launcher"}),

    -- Switching clients
    key({mod}, "Tab", function()
        awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end
    end, {description = "go back", group = "client"}),
    key({mod}, "u", awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}),
    key({mod, control}, "n", function()
        local c = awful.client.restore()
        if c then
            c:emit_signal("request::activate", "key.unminimize", {raise = true})
        end
    end, {description = "restore minimized", group = "client"}),
    key({mod}, "j", function() awful.client.focus.byidx(1) end,
        {description = "focus next by index", group = "client"}),
    key({mod}, "k", function() awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),
    key({mod, shift}, "j", function() awful.client.swap.byidx(1) end,
        {description = "swap with next client by index", group = "client"}),
    key({mod, shift}, "k", function() awful.client.swap.byidx(-1) end,
        {description = "swap with previous client by index", group = "client"}),

    -- Swiching screens/tags
    key({mod, control}, "j", function() awful.screen.focus_relative(1) end,
        {description = "focus the next screen", group = "screen"}),
    key({mod, control}, "k", function() awful.screen.focus_relative(-1) end,
        {description = "focus the previous screen", group = "screen"}),
    key({mod}, "Left", awful.tag.viewprev,
        {description = "view previous", group = "tag"}),
    key({mod}, "Right", awful.tag.viewnext,
        {description = "view next", group = "tag"}),
    key({mod}, "Escape", awful.tag.history.restore,
        {description = "go back", group = "tag"}),

    -- Adjusting screen layout
    key({mod}, "space", function() awful.layout.inc(1) end,
        {description = "select next", group = "layout"}),
    key({mod, shift}, "space", function() awful.layout.inc(-1) end,
        {description = "select previous", group = "layout"}),
    key({mod}, "x", function() awful.tag.incmwfact(0.05) end,
        {description = "increase master width factor", group = "layout"}),
    key({mod}, "z", function() awful.tag.incmwfact(-0.05) end,
        {description = "decrease master width factor", group = "layout"}),
    key({mod, shift}, "x", function() awful.tag.incnmaster(1, nil, true) end, {
        description = "increase the number of master clients",
        group = "layout",
    }),
    key({mod, shift}, "z", function() awful.tag.incnmaster(-1, nil, true) end, {
        description = "decrease the number of master clients",
        group = "layout",
    }),
    key({mod, control}, "x", function() awful.tag.incncol(1, nil, true) end,
        {description = "increase the number of columns", group = "layout"}),
    key({mod, control}, "z", function() awful.tag.incncol(-1, nil, true) end,
        {description = "decrease the number of columns", group = "layout"}),

    -- key({mod}, "x", function()
    --    awful.prompt.run {
    --        prompt = "Run Lua code: ",
    --        textbox = awful.screen.focused().mypromptbox.widget,
    --        exe_callback = awful.util.eval,
    --        history_path = awful.util.get_cache_dir() .. "/history_eval",
    --    }
    -- end, {description = "lua execute prompt", group = "awesome"}),
    -- key({mod}, "y", function()
    --    local naughty = require("naughty")
    --    naughty.notify({
    --        preset = naughty.config.presets.normal,
    --        title = "Test notification",
    --        text = "Just a test.",
    --    })
    -- end, {description = "send test notification", group = "awesome"}),
}))

for i = 1, 9 do
    -- Bind all key numbers to tags.
    -- Be careful: we use keycodes to make it work on any keyboard layout.
    -- This should map on the top row of your keyboard, usually 1 to 9.
    keys.global = join(keys.global, unpack(
        {
            key({mod}, "#" .. i + 9, function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then tag:view_only() end
            end, {description = "view tag #", group = "tag"}),
            key({mod, shift}, "#" .. i + 9, function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then client.focus:move_to_tag(tag) end
                end
            end, {description = "toggle tag #", group = "tag"}),

            -- key({mod, control}, "#" .. i + 9, function()
            --    local screen = awful.screen.focused()
            --    local tag = screen.tags[i]
            --    if tag then awful.tag.viewtoggle(tag) end
            -- end, {description = "move focused client to tag #", group = "tag"}),
            -- key({mod, control, shift}, "#" .. i + 9, function()
            --    if client.focus then
            --        local tag = client.focus.screen.tags[i]
            --        if tag then client.focus:toggle_tag(tag) end
            --    end
            -- end, {description = "toggle focused client on tag #", group = "tag"}),
        }))
end

keys.client = join(unpack({
    key({mod}, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, {description = "toggle fullscreen", group = "client"}),
    key({mod, shift}, "c", function(c) c:kill() end,
        {description = "close", group = "client"}),
    key({mod, control}, "space", awful.client.floating.toggle,
        {description = "toggle floating", group = "client"}),
    key({mod, control}, "Return",
        function(c) c:swap(awful.client.getmaster()) end,
        {description = "move to master", group = "client"}),
    key({mod}, "o", function(c) c:move_to_screen() end,
        {description = "move to screen", group = "client"}),
    key({mod}, "t", function(c) c.ontop = not c.ontop end,
        {description = "toggle keep on top", group = "client"}),
    key({mod}, "n", function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end, {description = "minimize", group = "client"}),
    key({mod}, "m", function(c)
        c.maximized = not c.maximized
        c:raise()
    end, {description = "(un)maximize", group = "client"}),
    key({mod}, "i", awful.titlebar.toggle,
        {description = "toggle titlebar", group = "client"}),

    -- key({mod, control}, "m", function(c)
    --    c.maximized_vertical = not c.maximized_vertical
    --    c:raise()
    -- end, {description = "(un)maximize vertically", group = "client"}),
    -- key({mod, shift}, "m", function(c)
    --    c.maximized_horizontal = not c.maximized_horizontal
    --    c:raise()
    -- end, {description = "(un)maximize horizontally", group = "client"}),
}))

return keys
