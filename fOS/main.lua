os.loadAPI("json")

local basalt = require("basalt")

local puertas = require("puertas.puertas")


local file = fs.open("botonesMain.json", "r") 
local data = file.readAll()
file.close()
local botones = json.decode(data)

local mainScreen = basalt.createFrame()
    :setBackground(colors.lightBlue)

local titulo = mainScreen:addText()
    :addLine("fOS")
    :setPosition("{parent.w / 2 - self.w / 4}", "{parent.h / 8}")
    :setFontSize(12)

local subTitulo = mainScreen:addText()
    :addLine("Alpha v0.0.1")
    :setPosition("{parent.w / 2 - self.w / 4}", "{parent.h / 8 + titulo.h}")

--Función para cambiar a la pantalla seleccionada
local function switchScreen()
    print("test")
end
-- Grid Configuration
local buttonSize = mainScreen.w / 3
local spacing = 5  -- Space between buttons
local columns = 2  -- Number of buttons per row (adjust as needed)

-- Button Creation Loop
local buttonCount = 0 
for _, buttonInfo in ipairs(botones.buttons) do
  local button = mainScreen:addButton()
      :setText(buttonInfo.text)

  -- Calculate Position Based on Grid
  buttonCount = buttonCount + 1
  local column = (buttonCount - 1) % columns
  local row = math.floor((buttonCount - 1) / columns)
  local positionX = column * (buttonSize + spacing)
  local positionY = row * (buttonSize + spacing)

  button:setPosition(positionX, positionY)

  -- ... (Click Event Handler)
  -- Click Event Handler
  button:onClick(function(self, event, buttonType, x, y) -- Small change here
    if event == "mouse_click" and buttonType == 1 then 
        switchScreen()
    end
end)
end

