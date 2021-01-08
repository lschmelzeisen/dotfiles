local awful = require("awful")
local filesystem = require("gears.filesystem")
local menubar = require("menubar")

local util = {string = {}, path = {}, apps = {}, misc = {}}

function util.string.trim(s)
    -- from: http://lua-users.org/wiki/StringTrim
    return s:match("^%s*(.-)%s*$")
end

--- Like shell `basename` return last components of a path.
-- For example "/path/to/your/file.ext" returns "file.ext".
-- @tparam string path The file path.
function util.path.basename(path) return path:match("/([^/]-)$") end

do
    local cache = nil
    function util.apps.desktop_files()
        if cache then return cache end

        cache = {}
        for i = #menubar.menu_gen.all_menu_dirs, 1, -1 do
            local dir = menubar.menu_gen.all_menu_dirs[i]
            if filesystem.is_dir(dir) then
                local find = io.popen("find " .. dir .. " -name '*.desktop'")
                while true do
                    local path = find:read("*l")
                    if not path then break end
                    local file = util.path.basename(path)
                    cache[file] = path
                end
            end
        end

        return cache
    end
end

function util.apps.app(spec)
    if type(spec) == "string" then spec = {spec} end
    if spec.name and spec.icon and spec.spawn then return spec end

    local _, desktop_file = next(spec)
    local desktop_file_path = util.apps.desktop_files()[desktop_file]
    local app = menubar.utils.parse_desktop_file(desktop_file_path)
    return {
        name = spec.name or app.Name,
        icon = spec.icon or app.icon_path,
        spawn = spec.spawn or function() awful.spawn(app.cmdline) end,
    }
end

function util.apps.default_for_mime_type(mime_type)
    return util.string.trim(
        io.popen("xdg-mime query default " .. mime_type):read("*a"))
end

function util.apps.default_file_manager()
    return util.apps.default_for_mime_type("inode/directory")
end

function util.apps.default_editor()
    return util.apps.default_for_mime_type("text/plain")
end

function util.apps.default_browser()
    return util.apps.default_for_mime_type("text/html")
end

function util.apps.default_mail()
    return util.apps.default_for_mime_type("x-scheme-handler/mailto")
end

function util.apps.default_calendar()
    return util.apps.default_for_mime_type("text/calendar")
end

function util.apps.default_audio()
    return util.apps.default_for_mime_type("x-content/audio-player")
end

function util.misc.show_hotkeys_popup()
    require("awful.hotkeys_popup").show_help(nil, awful.screen.focused())
end

return util
