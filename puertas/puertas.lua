local IDMesa = 4

local monitorFrame = basalt.createFrame()
:setBackground(colors.lightGray)
:hide()

local titulo = monitorFrame:addTextfield()
:addLine("Control de Puertas")
:setPosition("{parent.w / 2 - self.w / 4}", "{parent.h / 8}")
:setBackground(colors.lightGray)
:setForeground(colors.black)

local botonMesa = monitorFrame:addButton()
:setText("Mesa")
:setForeground(colors.green)
:setPosition("{parent.w / 2 - self.w / 2}", "{parent.h / 2 - self.h / 2}")
:setBackground(colors.white)
:setBorder(colors.black)
:setShadow(colors.gray)

function sendCommand(id, command)
    rednet.open("back")
    rednet.send(id, command)
    rednet.close("back")
end

botonMesa:onClick(function(self,event,button,x,y)
    if(event=="mouse_click")and(button==1)then
        botonMesa:setBackground(colors.gray)
        botonMesa:setShadow(colors.lightGray)
        sendCommand(IDMesa, "ok")
    end
end)

botonMesa:onClickUp(function(self,event,button,x,y)
    botonMesa:setBackground(colors.white)
    botonMesa:setShadow(colors.gray)
end)

basalt.autoUpdate()
