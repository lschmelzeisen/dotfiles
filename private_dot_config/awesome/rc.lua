-- awesome_mode: api-level=6
-- For readers: don't be surprised about the mass of table.unpack(). These are
-- just because my automatic Lua formatter is terrible with functions and a bit
-- better with tables.
print("-- Restarting awesome --")

require("beautiful").init(require("theme"))

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

require("clients")
require("screens")

root.buttons(require("buttons").global)
root.keys(require("keys").global)

do -- Print notifications for LUA errors (only works after config parsing)
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        if in_error then return end

        in_error = true
        local naughty = require("naughty")
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err),
        })
        in_error = false
    end)
end
