local basalt = require("basalt")

local main = basalt.createFrame():setTheme({FrameBG = colors.black, FrameFG = colors.lightGray})

local sub1 = main:addScrollableFrame()
:setSize(main:getWidth() - 2, main:getHeight() - 4)
:setPosition(2, 4)
:setDirection("vertical")

sub1:addLabel():setPosition(3, 2):setText("Scrollable"):setForeground(colors.lightGray)
sub1:addLabel():setPosition(3, 12):setText("Inside"):setForeground(colors.lightGray)
sub1:addLabel():setPosition(3, 20):setText("Outside"):setForeground(colors.lightGray)

basalt.autoUpdate()
