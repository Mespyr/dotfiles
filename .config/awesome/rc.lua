-- Import Awesome Libraries
                      pcall(require, "luarocks.loader")
local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local beautiful     = require("beautiful")
local dpi           = require("beautiful.xresources").apply_dpi
local naughty       = require("naughty")
local lain          = require("lain")
local hotkeys_popup = require("awful.hotkeys_popup")
                      require("awful.hotkeys_popup.keys")
local mytable       = awful.util.table or gears.table

-- Notifications
naughty.config.spacing = dpi(20)
naughty.config.defaults.margin = dpi(15)
naughty.config.defaults.border_width = dpi(0)
naughty.config.padding = dpi(10)
naughty.config.presets.critical.bg = "#ed7f76"
naughty.config.presets.critical.fg = "#12191d"

-- Awesome Errors on startup
if awesome.startup_errors then
    awful.spawn.with_shell("notify-send -u critical 'Oops, there were errors during startup!' '" .. awesome.startup_errors .. "'")
end
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true
        awful.spawn.with_shell("notify-send -u critical 'Oops, an error happened!' '" .. tostring(err) .. "'")
        in_error = false
    end)
end

-- dpi
awful.screen.set_auto_dpi_enabled(true)

-- Init Theme
beautiful.init(string.format("%s/.config/awesome/theme.lua", os.getenv("HOME")))

-- Variables
local modkey       = "Mod4"
local altkey       = "Mod1"
awful.util.terminal = "alacritty"
awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }

--Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}
-- Taglist button function
awful.util.taglist_buttons = mytable.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ }, 3, awful.tag.viewtoggle)
)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- Keybindings
local globalkeys = mytable.join(
    -- Show help
    awful.key({ modkey }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(awful.util.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    -- Tag browsing
    awful.key({ modkey }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    -- Default client focus
    awful.key({ modkey }, "j", function ()
            awful.client.focus.byidx(1)
        end, {description = "focus next by index", group = "client"}),
    awful.key({ modkey }, "k", function ()
            awful.client.focus.byidx(-1)
        end, {description = "focus previous by index", group = "client"}),
    -- Show/hide wibox
    awful.key({ modkey }, "t", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end, {description = "toggle wibox", group = "awesome"}),
    -- On-the-fly useless gaps change
    awful.key({ altkey, "Control" }, "=", function()
            lain.util.useless_gaps_resize(1)
        end, {description = "increment useless gaps", group = "tag"}),
    awful.key({ altkey, "Control" }, "-", function()
            lain.util.useless_gaps_resize(-1)
        end, {description = "decrement useless gaps", group = "tag"}),
    -- Dynamic tagging
    awful.key({ modkey, "Shift" }, "Left", function()
            lain.util.move_tag(-1)
        end, {description = "move tag to the left", group = "tag"}),
    awful.key({ modkey, "Shift" }, "Right", function()
            lain.util.move_tag(1)
        end, {description = "move tag to the right", group = "tag"}),
    -- restart awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    -- clients
    awful.key({ modkey, altkey    }, "l",     function () awful.tag.incmwfact(0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, altkey    }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    -- restore minimized client
    awful.key({ modkey, "Control" }, "n",
            function ()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                    c:emit_signal("request::activate", "key.unminimize", {raise = true})
                end
            end, {description = "restore minimized", group = "client"}),
    -- Menus
    -- Run menu
    awful.key({ modkey }, "d", function () os.execute("sh ~/.config/awesome/scripts/run.sh") end,
            {description = "run prompt", group = "launcher"}),
    -- Power Menu
    awful.key({ modkey }, "q", function () os.execute("bash ~/.config/awesome/scripts/powermenu.sh") end,
            {description = "power menu", group = "launcher"})
)

clientkeys = mytable.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey  }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end, {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end, {description = "(un)maximize", group = "client"})
)

-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = mytable.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- client buttons
clientbuttons = mytable.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    { rule = { }, properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
        size_hints_honor = false }},

    { rule = { class = "mpv" },
      properties = { floating = true }},
    { rule = { class = "Minecraft" },
      properties = { fullscreen = true }}

}

-- Autostart
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({
    "picom --experimental-backends",
    "setxkbmap -option ctrl:nocaps"
})