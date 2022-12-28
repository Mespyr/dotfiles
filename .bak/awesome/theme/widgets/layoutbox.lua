local awful = require("awful")

return function(s)
	return awful.widget.layoutbox {screen = s}
end
