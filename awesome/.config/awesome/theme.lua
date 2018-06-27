--[[

     Ergo Awesome WM theme 1.0
     github.com/papungag

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local beautiful= require("beautiful")
local os    = { getenv = os.getenv }

local theme                                     = {}
theme.default_dir                               = require("awful.util").get_themes_dir() .. "default"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/ergo"
--theme.wallpaper                                 = theme.dir .. "/wall.jpg"
theme.accent									= "#665c54"
theme.font                                      = "scientifica"
theme.fg_normal                                 =  "#ebdbb2"
theme.fg_focus                                  = theme.accent
theme.fg_urgent                                 = "#DDDDFF"
theme.bg_normal                                 = "#151515"
theme.bg_focus                                  = "#151515"
theme.bg_urgent                                 = "#151515"
theme.border_width                              = 7
theme.border_normal                             = "#191919"
theme.border_focus                              = "#232323"
theme.border_marked                             = "#3F3F3F"
theme.taglist_fg_focus                          = "#ebdbb2"
theme.taglist_fg_empty                          =  "#3c3836"
theme.taglist_fg_occupied                       = "#7c6f64"
theme.taglist_fg_urgent                         = "#cc241d"
theme.taglist_bg_focus                          = "#15151500"
theme.tasklist_fg_focus                         = "#ebdbb2"
theme.tasklist_bg_focus                         = "#151515"
theme.tasklist_bg_urgent                         = "#151515"
theme.red                                       = "#D6504B"
beautiful.menu_bg_normal                            = "151515"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.useless_gap                               = 8
theme.layout_txt_tile                           = "[+]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[#]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[^]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[f]"

awful.util.tagnames   = { "home", "term", "code", "file", "surf", "docs", "chat", "temp", "musc" }

-- lain related
theme.layout_txt_cascade                        = "[cascade]"
theme.layout_txt_cascadetile                    = "[cascadetile]"
theme.layout_txt_centerwork                     = "[centerwork]"
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local white  = theme.fg_normal
local gray   = theme.taglist_fg_focus

-- Textclock
local mytextclock = wibox.widget.textclock(" %H:%M ")
mytextclock.font = theme.font


-- Calendar
lain.widgets.calendar({
    attach_to = { mytextclock },
    icons = '',
	cal="/usr/bin/cal --color=always",
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal,
        pos = 'tl'
    }
})

--[[ Mail IMAP check
-- commented because it needs to be set before use
local mail = lain.widgets.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        mail_notification_preset.fg = white

        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup.font(theme.font, markup(gray, mail) .. markup(white, count)))
    end
})
]]

-- fs
theme.fs = lain.widgets.fs({
    options = "--exclude-type=tmpfs",
    --partition = "/home",
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = theme.font },
})

-- MPD
theme.mpd = lain.widgets.mpd({
    settings = function()
        mpd_notification_preset.fg = white

        artist = mpd_now.artist .. " "
        title  = mpd_now.title  .. " "

        if mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = ""
            title  = ""
        end

        widget:set_markup(markup.font(theme.font, markup(white, artist) .. "- "  .. markup(white, title)))
    end
})

-- ALSA volume
theme.volume = lain.widgets.alsa({
    
    settings = function()
        header = " Vol "
        vlevel  = volume_now.level
        vcolor = theme.fg_normal

        if volume_now.status == "off" then
            vlevel = "muted"
            vcolor = "#E3B763"
        else
            vlevel = vlevel .. " "
        end
					widget:set_markup(markup.font("siji", markup(theme.accent, '' ))
                          .. " " ..
                          markup.font("scientifica, siji", markup(vcolor, vlevel ) .. "" ))

    end
})

-- MEM
local mem = lain.widgets.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(theme.accent, " ") .. mem_now.used .. " "))
    end
})

-- CPU
local cpu = lain.widgets.sysload({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(theme.accent, " ") .. load_1 .. " "))
    end
})

-- Coretemp
local temp = lain.widgets.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(theme.accent, " temp ") .. coretemp_now .. " "))
    end
})

-- Net
local net = lain.widgets.net({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(theme.accent, " net ") .. net_now.received)
                          .. " " ..
                          markup.font(theme.font, markup(theme.accent, " " ) .. net_now.sent .. " "))
    end
})
-- Separators
local spr       = wibox.widget.textbox(' ')
local small_spr = wibox.widget.textbox(markup.font("scientifica 10", " "))
local bar_spr   = wibox.widget.textbox(markup.font("scientifica 10", " ") .. markup.fontfg(theme.font, "#333333", " ") .. markup.font("scientifica 10", " "))
local clock_icon   = wibox.widget.textbox(markup.font("scientifica 10", " ") .. markup.fontfg("siji", theme.accent, "") .. markup.font("scientifica 10", ""))
local music_icon   = wibox.widget.textbox(markup.font("scientifica 10", " ") .. markup.fontfg("siji", theme.accent, "") .. markup.font("scientifica 10", ""))
local cpu_icon   = wibox.widget.textbox(markup.font("scientifica 10", " ") .. markup.fontfg("siji", theme.accent, "") .. markup.font("scientifica 10", ""))
local ram_icon   = wibox.widget.textbox(markup.font("scientifica 10", " ") .. markup.fontfg("siji", theme.accent, "") .. markup.font("scientifica 10", ""))
local wifi_icon   = wibox.widget.textbox(markup.font("scientifica 10", " ") .. markup.fontfg("siji", theme.accent, "") .. markup.font("scientifica 10", " "))
local ip_icon   = wibox.widget.textbox(markup.font("scientifica 10", " ") .. markup.fontfg("siji", theme.accent, "") .. markup.font("scientifica 10", " "))



local bat0 = lain.widgets.bat({

	batteries ={"BAT0"},
    settings = function()
        bat_perc = bat_now.perc
        bat_icon = ''
        if bat_now.ac_status == 1 then bat_icon = '' end
 	 	 widget:set_markup(markup.font("siji", markup(theme.accent, bat_icon ))
                          .. "" ..
                          markup.font("scientifica, siji", markup(theme.accent, " " ) .. bat_perc .. " "))

    end
})

local bat1 = lain.widgets.bat({

	batteries ={"BAT1"},
    settings = function()
        bat_perc = bat_now.perc
        bat_icon = ''
        if bat_now.ac_status == 1 then bat_icon = '' end
 	 	 widget:set_markup(markup.font("siji", markup(theme.accent, bat_icon ))
                          .. "" ..
                          markup.font("scientifica, siji", markup(theme.accent, " " ) .. bat_perc .. " "))

    end
})



local wifi = awful.widget.watch('iwgetid -r ', 5, function(widget, sdout)
	if(sdout == nil or sdout == '')		then 
		--widget:set_text("disconnected")
	       widget:set_markup("<span foreground='#D6504B'>disconnected</span>")
		else widget:set_text(sdout)
		end
		return
	end)
wifi.font ="scientifica"

local ip = awful.widget.watch('getip', 5, function(widget, sdout)
	if(sdout == nil or sdout == '')		then 
	    widget:set_markup("<span foreground='#D6504B'>no ip</span>")
		else widget:set_text(sdout)
		end
		return
	end)
ip.font ="scientifica"

local baticon = awful.widget.watch('batstate', 5, function(widget, sdout)
	if(sdout == 'c')		then 
	   -- widget:set_markup("<span foreground='#D6504B'>no ip</span>")
	   widget.set_text("")
		else widget:set_text("")
		end
		return
	end)




-- Weather
theme.weather = lain.widgets.weather({
    city_id = 611717, -- placeholder (London)
    notification_preset = { font = theme.font, fg = white }
})

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
        theme.wallpaper = theme.wallpaper(s)
    end
    gears.wallpaper.maximized(theme.wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(awful.util.table.join(
                           awful.button({}, 1, function() awful.layout.inc(1) end),
                           awful.button({}, 3, function() awful.layout.inc(-1) end),
                           awful.button({}, 4, function() awful.layout.inc(1) end),
                           awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 20, bg = theme.bg_normal, fg = theme.fg_normal })

        local  mylayout1 = wibox.layout.align.horizontal()
     mylayout1:set_expand("outside")
    local  mylayout2 = wibox.layout.align.horizontal()
     mylayout2:set_expand("outside")
    local  mylayout3 = wibox.layout.align.horizontal()
     mylayout3:set_expand("outside")
    local  mylayout4 = wibox.layout.align.horizontal()
     mylayout4:set_expand("none")
    -- Add widgets to the wibox
    s.mywibox:setup {
            layout = wibox.layout.fixed.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
             small_spr,
             small_spr,
             small_spr,
             small_spr,
             small_spr,
             --small_spr,
            s.mytxtlayoutbox,
             wifi_icon,
            wifi,
            ip_icon, 
            ip, 
              },
        	layout = mylayout4,
        { -- middle widgets
      	  	layout = wibox.layout.fixed.horizontal,
            small_spr,
            s.mytaglist,
            --spr,
            --s.mypromptbox,
            small_spr,

               },

        { -- Right widgets
	   layout = wibox.layout.fixed.horizontal,
	   -- music_icon,
			bat0.widget,
            small_spr,
            bat1.widget,
            small_spr,
            --theme.mpd.widget,
            theme.volume.widget,
             small_spr,
			--ram_icon,
            --mem.widget,cpu_icon,
            --cpu.widget,
             clock_icon,
            mytextclock,
            wibox.widget.systray(),
      	  	 small_spr,
             small_spr,
             small_spr,
             small_spr,


                    },
    }

end

return theme
