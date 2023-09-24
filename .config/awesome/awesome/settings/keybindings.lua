local awful = require("awful")
local lain  = require("lain")
local mytable = awful.util.table

local modkey = "Mod4"
local altkey = "Mod1"

-- Keybindings
local globalkeys = mytable.join(
    awful.key({ modkey,           }, "Return", function () awful.spawn(awful.util.terminal) end, {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "w",      function () awful.spawn("emacs") end, {description = "open emacs client", group = "launcher"}),

    awful.key({ modkey, "Control" }, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey }, "t", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end, {description = "toggle wibox", group = "awesome"}),

	awful.key({ modkey }, "Left",           awful.tag.viewprev,                    {description = "view previous",         group = "tag"}),
    awful.key({ modkey }, "Right",          awful.tag.viewnext,                    {description = "view next",             group = "tag"}),
    awful.key({ modkey, "Shift" }, "Left",  function() lain.util.move_tag(-1) end, {description = "move tag to the left",  group = "tag"}),
	awful.key({ modkey, "Shift" }, "Right", function() lain.util.move_tag(1)  end, {description = "move tag to the right", group = "tag"}),

    awful.key({ modkey, altkey    }, "l",     function () awful.tag.incmwfact(0.05)           end, {description = "increase master width factor",          group = "layout"}),
    awful.key({ modkey, altkey    }, "h",     function () awful.tag.incmwfact(-0.05)          end, {description = "decrease master width factor",          group = "layout"}),
	awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end, {description = "increase the number of columns",        group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end, {description = "decrease the number of columns",        group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end, {description = "select next layout",                    group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end, {description = "select previous layout",                group = "layout"}),
    awful.key({ altkey, "Control" }, "=",     function() lain.util.useless_gaps_resize(1)     end, {description = "increment useless gaps",                group = "layout"}),
    awful.key({ altkey, "Control" }, "-",     function() lain.util.useless_gaps_resize(-1)    end, {description = "decrement useless gaps",                group = "layout"}),

	awful.key({ modkey }, "j", function () awful.client.focus.byidx(1)  end, {description = "focus next by index",     group = "client"}),
    awful.key({ modkey }, "k", function () awful.client.focus.byidx(-1) end, {description = "focus previous by index", group = "client"}),
    awful.key({ modkey, "Control" }, "n",
            function ()
                local c = awful.client.restore()
                if c then
                    c:emit_signal("request::activate", "key.unminimize", {raise = true})
                end
            end, {description = "restore minimized", group = "client"}),

    -- menu
    awful.key({ modkey }, "d", function() os.execute(string.format("%s/.config/rofi/scripts/drun.sh",      os.getenv("HOME"))) end, {description = "drun prompt", group = "menu"}),
    awful.key({ modkey }, "r", function() os.execute(string.format("%s/.config/rofi/scripts/run.sh",       os.getenv("HOME"))) end, {description = "run prompt",  group = "menu"}),
    awful.key({ modkey }, "q", function() os.execute(string.format("%s/.config/rofi/scripts/powermenu.sh", os.getenv("HOME"))) end, {description = "power menu",  group = "menu"}),
	awful.key({ modkey }, "s", function() os.execute(string.format("%s/.config/rofi/scripts/settings.sh",  os.getenv("HOME"))) end, {description = "settings",    group = "menu"})
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
local clientbuttons = mytable.join(
    awful.button({ }, 1, function (c) c:emit_signal("request::activate", "mouse_click", {raise = true}) end),
    awful.button({ modkey }, 1, function (c)
    	c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

local clientkeys = mytable.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client, {description = "magnify client", group = "client"}),
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey  }, "c",                function (c) c:kill()                         end, {description = "close",              group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle ,                     {description = "toggle floating",    group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end, {description = "move to master",     group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end, {description = "move to screen",     group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end, {description = "toggle keep on top", group = "client"}),
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

return {
	clientkeys = clientkeys,
	globalkeys = globalkeys,
	clientbuttons = clientbuttons
}
