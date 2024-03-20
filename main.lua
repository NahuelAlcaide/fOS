os.loadAPI("fOS/json.lua")

local basalt = require("basalt")

local puertas = require("puertas.puertas")

--Abrir json y decoding
local file = fs.open("fOS/botonesMain.json", "r") 
local data = file.readAll()
file.close()
local botones = json.decode(data)

--Crear frame principal + scroll
local screen = basalt.createFrame()    
    :setBackground(colors.lightBlue)
    :show()

local titulo = screen:addLabel():setText("fOS"):setBackground(colors.lightBlue)

titulo:setPosition(screen:getWidth() / 2 - titulo:getWidth(), 1):setFontSize(2)

local mainScreen = screen:addScrollableFrame()
    :setSize(screen:getWidth() - 2, screen:getHeight() - 4)
    :setPosition(2, 4)
    :setDirection("vertical")
    :setBackground(colors.lightBlue)

--Función para cambiar a la pantalla seleccionada
local function switchScreen(path)
    local targetMenu = require(path)
    targetMenu.show()
end

-- Grid Configuration
local buttonSize = math.floor(mainScreen:getWidth() / 3)
local spacing = 1  -- Space between buttons
local columns = 2  -- Number of buttons per row (adjust as needed)

-- Grid Offset Calculations 
local totalGridWidth = (buttonSize * columns) + (spacing * (columns - 1))
local gridOffsetX = math.ceil((mainScreen:getWidth() - totalGridWidth) / 2)

-- Button Creation Loop
local buttonCount = 0 
for _, buttonInfo in ipairs(botones.buttons) do
  local button = mainScreen:addButton()
      :setText(tostring(buttonInfo.text))
      :setSize(buttonSize, buttonSize / 2)
      :setBackground(colors.blue)
      :setBorder(colors.black)

  -- Calculate Position Based on Grid
  buttonCount = buttonCount + 1
  local column = (buttonCount - 1) % columns
  local row = math.floor((buttonCount - 1) / columns)
  local positionX = column * (buttonSize + spacing) + gridOffsetX 
  local positionY = spacing + row * (button:getHeight() + spacing)

  button:setPosition(positionX, positionY)

  -- Click Event Handler
  button:onClick(function(self, event, buttonType, x, y) -- Small change here
    if event == "mouse_click" and buttonType == 1 then 
        switchScreen(buttonInfo.path)
    end
end)
end

basalt.autoUpdate()