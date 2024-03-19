os.loadAPI("fOS/json.lua")

local basalt = require("basalt")

--local puertas = require("puertas.puertas")


local file = fs.open("fOS/botonesMain.json", "r") 
local data = file.readAll()
file.close()
local botones = json.decode(data)

local mainScreen = basalt.createFrame()
    :setBackground(colors.lightBlue)
    :show()

--local titulo = mainScreen:addText(mainScreen:getWidth() / 2, mainScreen:getHeight() / 8, "fOS")

--local subTitulo = mainScreen:addText(mainScreen:getWidth() / 2, mainScreen:getHeight() / 8 + titulo:getHeight(), "Alpha v0.0.1")

--Función para cambiar a la pantalla seleccionada
local function switchScreen()
    print("test")
end

-- Grid Configuration
local buttonSize = math.floor(mainScreen:getWidth() / 3)
local spacing = 1  -- Space between buttons
local columns = 2  -- Number of buttons per row (adjust as needed)

-- Grid Offset Calculations 
local totalGridWidth = (buttonSize * columns) + (spacing * (columns - 1))
local gridOffsetX = (mainScreen:getWidth() - totalGridWidth) / 2

-- Button Creation Loop
local buttonCount = 0 
for _, buttonInfo in ipairs(botones.buttons) do
  local button = mainScreen:addButton()
      :setText(tostring(buttonInfo.text))
      :setSize(buttonSize, buttonSize / 2)

  -- Calculate Position Based on Grid
  local column = (buttonCount - 1) % columns
  local row = math.floor((buttonCount - 1) / columns)
  local positionX = column * (buttonSize + spacing) + gridOffsetX 
  local positionY = row * (buttonSize + spacing)
  buttonCount = buttonCount + 1

  button:setPosition(positionX, positionY)

  -- Click Event Handler
  button:onClick(function(self, event, buttonType, x, y) -- Small change here
    if event == "mouse_click" and buttonType == 1 then 
        switchScreen()
    end
end)
end

basalt.autoUpdate()