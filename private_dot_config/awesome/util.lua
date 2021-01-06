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
    local desktop_files = nil
    function util.apps.desktop_files()
        if desktop_files then return desktop_files end

        desktop_files = {}
        for i = #menubar.menu_gen.all_menu_dirs, 1, -1 do
            local dir = menubar.menu_gen.all_menu_dirs[i]
            if filesystem.is_dir(dir) then
                local find = io.popen("find " .. dir .. " -name '*.desktop'")
                while true do
                    local path = find:read("*l")
                    if not path then break end
                    local file = util.path.basename(path)
                    desktop_files[file] = path
                end
            end
        end

        return desktop_files
    end
end

do
    local apps = {}
    function util.apps.default_for_mime_type(mime_type)
        if apps[mime_type] then return apps[mime_type] end

        local desktop_file = util.string.trim(
            io.popen("xdg-mime query default " .. mime_type):read("*a"))
        local desktop_file_path = util.apps.desktop_files()[desktop_file]
        local app = menubar.utils.parse_desktop_file(desktop_file_path)
        apps[mime_type] = {
            icon = app.icon_path,
            spawn = function() awful.spawn(app.cmdline) end,
        }

        return apps[mime_type]
    end
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

function util.misc.show_hotkeys_popup()
    require("awful.hotkeys_popup").show_help(nil, awful.screen.focused())
end

return util
