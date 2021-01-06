local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local gtk = beautiful.gtk.get_theme_variables()
local filesystem = require("gears.filesystem")
local dir = filesystem.get_configuration_dir()

local theme = {}

--------------------------------------------------------------------------------
-- General ---------------------------------------------------------------------

do -- Miscellaneous ------------------------------------------------------------
    theme.font = "Inter Regular 10"
    theme.font_bold = "Inter Bold 10"

    theme.wallpaper = dir .. "background.jpg"
    theme.icon_theme = "Tela-circle"
end

do -- Colors -------------------------------------------------------------------
    theme.fg_normal = gtk.wm_title_unfocused_color
    theme.fg_focus = gtk.wm_title_focused_color
    theme.fg_urgent = gtk.wm_title_focused_color

    theme.bg_normal = gtk.wm_border_unfocused_color
    theme.bg_focus = gtk.wm_border_focused_color
    theme.bg_urgent = gtk.wm_border_focused_color
end

--------------------------------------------------------------------------------
-- Panel -----------------------------------------------------------------------

do -- Taglist ------------------------------------------------------------------
    -- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
    theme.taglist_spacing = dpi(0)
    -- Square "inside" of tags that show that tags have open applications
    theme.taglist_squares_sel = beautiful.theme_assets.taglist_squares_sel(
        dpi(7), theme.fg_normal)
    theme.taglist_squares_unsel = beautiful.theme_assets.taglist_squares_unsel(
        dpi(7), theme.fg_normal)
end

do -- Prompt -------------------------------------------------------------------
    -- prompt_[fg|bg|fg_cursor|bg_cursor|font]
end

do -- Tasklist -----------------------------------------------------------------
    -- tasklist_[bg|fg]_[normal|focus|urgent|minimize]
    theme.tasklist_font = "Inter Regular 10"
end

do -- Systray ------------------------------------------------------------------
    -- theme.bg_systray
    theme.systray_icon_spacing = dpi(16)
end

do -- Layouts ------------------------------------------------------------------
    theme.layout_fairh = dir .. "icons/layouts/fairhw.png"
    theme.layout_fairv = dir .. "icons/layouts/fairvw.png"
    theme.layout_floating = dir .. "icons/layouts/floatingw.png"
    theme.layout_magnifier = dir .. "icons/layouts/magnifierw.png"
    theme.layout_max = dir .. "icons/layouts/maxw.png"
    theme.layout_fullscreen = dir .. "icons/layouts/fullscreenw.png"
    theme.layout_tilebottom = dir .. "icons/layouts/tilebottomw.png"
    theme.layout_tileleft = dir .. "icons/layouts/tileleftw.png"
    theme.layout_tile = dir .. "icons/layouts/tilew.png"
    theme.layout_tiletop = dir .. "icons/layouts/tiletopw.png"
    theme.layout_spiral = dir .. "icons/layouts/spiralw.png"
    theme.layout_dwindle = dir .. "icons/layouts/dwindlew.png"
    theme.layout_cornernw = dir .. "icons/layouts/cornernww.png"
    theme.layout_cornerne = dir .. "icons/layouts/cornernew.png"
    theme.layout_cornersw = dir .. "icons/layouts/cornersww.png"
    theme.layout_cornerse = dir .. "icons/layouts/cornersew.png"
end

--------------------------------------------------------------------------------
-- Clients ---------------------------------------------------------------------

do -- Borders ------------------------------------------------------------------
    theme.border_width = dpi(4)
    theme.border_normal = theme.bg_normal
    theme.border_focus = theme.bg_normal
    -- theme.border_marked
end

do -- Decorations --------------------------------------------------------------
    theme.useless_gap = dpi(8)
    theme.client_border_radius = dpi(16)
end

do -- Titlebars ----------------------------------------------------------------
    -- titlebar_[bg|fg]_[normal|focus]
    theme.titlebar_bg_focus = theme.bg_normal
    theme.titlebar_size = dpi(34)
    theme.titlebar_margin = dpi(4)

    theme.titlebar_close_button_normal =
        dir .. "icons/titlebar/close-inactive.png"
    theme.titlebar_close_button_normal_hover =
        dir .. "icons/titlebar/close-prelight.png"
    theme.titlebar_close_button_normal_press =
        dir .. "icons/titlebar/close-pressed.png"
    theme.titlebar_close_button_focus = dir .. "icons/titlebar/close-active.png"
    theme.titlebar_close_button_focus_hover =
        dir .. "icons/titlebar/close-prelight.png"
    theme.titlebar_close_button_focus_press =
        dir .. "icons/titlebar/close-pressed.png"

    theme.titlebar_minimize_button_normal =
        dir .. "icons/titlebar/hide-inactive.png"
    theme.titlebar_minimize_button_normal_hover =
        dir .. "icons/titlebar/hide-prelight.png"
    theme.titlebar_minimize_button_normal_press =
        dir .. "icons/titlebar/hide-pressed.png"
    theme.titlebar_minimize_button_focus =
        dir .. "icons/titlebar/hide-active.png"
    theme.titlebar_minimize_button_focus_hover =
        dir .. "icons/titlebar/hide-prelight.png"
    theme.titlebar_minimize_button_focus_press =
        dir .. "icons/titlebar/hide-pressed.png"

    theme.titlebar_ontop_button_normal_inactive =
        dir .. "icons/titlebar/menu-inactive.png"
    theme.titlebar_ontop_button_normal_inactive_hover =
        dir .. "icons/titlebar/menu-prelight.png"
    theme.titlebar_ontop_button_normal_inactive_press =
        dir .. "icons/titlebar/menu-pressed.png"
    theme.titlebar_ontop_button_focus_inactive =
        dir .. "icons/titlebar/menu-active.png"
    theme.titlebar_ontop_button_focus_inactive_hover =
        dir .. "icons/titlebar/menu-prelight.png"
    theme.titlebar_ontop_button_focus_inactive_press =
        dir .. "icons/titlebar/menu-pressed.png"
    theme.titlebar_ontop_button_normal_active =
        dir .. "icons/titlebar/menu-inactive.png"
    theme.titlebar_ontop_button_normal_active_hover =
        dir .. "icons/titlebar/menu-prelight.png"
    theme.titlebar_ontop_button_normal_active_press =
        dir .. "icons/titlebar/menu-pressed.png"
    theme.titlebar_ontop_button_focus_active =
        dir .. "icons/titlebar/menu-active.png"
    theme.titlebar_ontop_button_focus_active_hover =
        dir .. "icons/titlebar/menu-prelight.png"
    theme.titlebar_ontop_button_focus_active_press =
        dir .. "icons/titlebar/menu-pressed.png"

    theme.titlebar_sticky_button_normal_inactive =
        dir .. "icons/titlebar/stick-inactive.png"
    theme.titlebar_sticky_button_normal_inactive_hover =
        dir .. "icons/titlebar/stick-prelight.png"
    theme.titlebar_sticky_button_normal_inactive_press =
        dir .. "icons/titlebar/stick-pressed.png"
    theme.titlebar_sticky_button_focus_inactive =
        dir .. "icons/titlebar/stick-active.png"
    theme.titlebar_sticky_button_focus_inactive_hover =
        dir .. "icons/titlebar/stick-prelight.png"
    theme.titlebar_sticky_button_focus_inactive_press =
        dir .. "icons/titlebar/stick-pressed.png"
    theme.titlebar_sticky_button_normal_active =
        dir .. "icons/titlebar/stick-toggled-inactive.png"
    theme.titlebar_sticky_button_normal_active_hover =
        dir .. "icons/titlebar/stick-toggled-prelight.png"
    theme.titlebar_sticky_button_normal_active_press =
        dir .. "icons/titlebar/stick-toggled-pressed.png"
    theme.titlebar_sticky_button_focus_active =
        dir .. "icons/titlebar/stick-toggled-active.png"
    theme.titlebar_sticky_button_focus_active_hover =
        dir .. "icons/titlebar/stick-toggled-prelight.png"
    theme.titlebar_sticky_button_focus_active_press =
        dir .. "icons/titlebar/stick-toggled-pressed.png"

    theme.titlebar_floating_button_normal_inactive =
        dir .. "icons/titlebar/shade-inactive.png"
    theme.titlebar_floating_button_normal_inactive_hover =
        dir .. "icons/titlebar/shade-prelight.png"
    theme.titlebar_floating_button_normal_inactive_press =
        dir .. "icons/titlebar/shade-pressed.png"
    theme.titlebar_floating_button_focus_inactive =
        dir .. "icons/titlebar/shade-active.png"
    theme.titlebar_floating_button_focus_inactive_hover =
        dir .. "icons/titlebar/shade-prelight.png"
    theme.titlebar_floating_button_focus_inactive_press =
        dir .. "icons/titlebar/shade-pressed.png"
    theme.titlebar_floating_button_normal_active =
        dir .. "icons/titlebar/shade-toggled-inactive.png"
    theme.titlebar_floating_button_normal_active_hover =
        dir .. "icons/titlebar/shade-toggled-prelight.png"
    theme.titlebar_floating_button_normal_active_press =
        dir .. "icons/titlebar/shade-toggled-pressed.png"
    theme.titlebar_floating_button_focus_active =
        dir .. "icons/titlebar/shade-toggled-active.png"
    theme.titlebar_floating_button_focus_active_hover =
        dir .. "icons/titlebar/shade-toggled-prelight.png"
    theme.titlebar_floating_button_focus_active_press =
        dir .. "icons/titlebar/shade-toggled-pressed.png"

    theme.titlebar_maximized_button_normal_inactive =
        dir .. "icons/titlebar/maximize-inactive.png"
    theme.titlebar_maximized_button_normal_inactive_hover =
        dir .. "icons/titlebar/maximize-prelight.png"
    theme.titlebar_maximized_button_normal_inactive_press =
        dir .. "icons/titlebar/maximize-pressed.png"
    theme.titlebar_maximized_button_focus_inactive =
        dir .. "icons/titlebar/maximize-active.png"
    theme.titlebar_maximized_button_focus_inactive_hover =
        dir .. "icons/titlebar/maximize-prelight.png"
    theme.titlebar_maximized_button_focus_inactive_press =
        dir .. "icons/titlebar/maximize-pressed.png"
    theme.titlebar_maximized_button_normal_active =
        dir .. "icons/titlebar/maximize-toggled-inactive.png"
    theme.titlebar_maximized_button_normal_active_hover =
        dir .. "icons/titlebar/maximize-toggled-prelight.png"
    theme.titlebar_maximized_button_normal_active_press =
        dir .. "icons/titlebar/maximize-toggled-pressed.png"
    theme.titlebar_maximized_button_focus_active =
        dir .. "icons/titlebar/maximize-toggled-active.png"
    theme.titlebar_maximized_button_focus_active_hover =
        dir .. "icons/titlebar/maximize-toggled-prelight.png"
    theme.titlebar_maximized_button_focus_active_press =
        dir .. "icons/titlebar/maximize-toggled-pressed.png"
end

--------------------------------------------------------------------------------
-- Overlay ---------------------------------------------------------------------

do -- Menu ---------------------------------------------------------------------
    -- menu_[bg|fg]_[normal|focus]
    -- menu_[border_color|border_width]
    theme.menu_font = "Inter Regular 10"
    theme.menu_submenu_icon = dir .. "icons/submenu.svg"
    theme.menu_height = dpi(8 * 3)
    theme.menu_width = dpi(8 * 25)
    theme.menu_border_width = dpi(8)
end

do -- Tooltips -----------------------------------------------------------------
    -- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
end

do -- Notifications ------------------------------------------------------------
    -- notification_font
    -- notification_[bg|fg]
    -- notification_[width|height|margin]
    -- notification_[border_color|border_width|shape|opacity]
    theme.notification_width = dpi(8 * 25)
end

do -- Hotkeys ------------------------------------------------------------------
    -- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
    theme.hotkeys_group_margin = dpi(8 * 2)
end

return theme
