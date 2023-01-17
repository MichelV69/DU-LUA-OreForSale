--- === stuff you should change === ---  
local yourOrgName  = {}
yourOrgName[1] = "Resource Supply"
yourOrgName[2] = "by Wolfstar Services"

local Ore_Name = "Coal"
local Batch_Size_Litres = "2000"
local Price_Per_Litre = "8.8"

local messageToCustomers = {}
messageToCustomers[1] = "Prices based on recent averages of Alioth Market 06"
messageToCustomers[2] = "and Aegis Space Station"

local Background_Colours = {}
Background_Colours.red   =  15/255
Background_Colours.green =  24/255
Background_Colours.blue  =  29/255

local WallPaper_URL = "assets.prod.novaquark.com/130546/b6fc96cb-c570-4554-901f-099711f5383d.jpg"

--- === below here should not need changing === ---  
wss_software ={}
wss_software.id = "ore_for_sale_banner"
wss_software.title = "Ore For Sale -- Sales Terminal Screen"
wss_software.version = "1.2.0"
wss_software.revision = "16 JAN 2023 22h15 AST"
wss_software.author = "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

-- define local funtions
function drawDoubleLine(layer,x,y,rx,space)
  addLine(layer,x,y,rx-x,y)
  addLine(layer,x,y+space,rx-x,y+space) 
  end

-- Figure spacing
local rx,ry = getResolution()
local x,borderSpacing = 10,4
local from_left = rx * 0.05
local from_top = ry * 0.05
local mid_rx = rx / 2

-- Create layers
local layers = {}
layers.wallpaper  = createLayer()
layers.background = createLayer()
layers.foreground = createLayer()
layers.text       = createLayer()

-- Set font sizes
local fontSize = {}
fontSize.reference  = 50
fontSize.banner     = loadFont('Montserrat-Bold', fontSize.reference * 1.8)
fontSize.heading    = loadFont('Montserrat', fontSize.reference * 1.4)

fontSize.text       = loadFont('Play', fontSize.reference)

fontSize.small      = loadFont('Play', fontSize.reference * 0.8)
fontSize.smallBold  = loadFont('Play-Bold', fontSize.reference * 0.8)
fontSize.subtext    = loadFont('RefrigeratorDeluxe', fontSize.reference * 0.6)
fontSize.finePrint  = loadFont('RobotoCondensed', fontSize.reference * 0.3)

local fontColour  = {}
fontColour.Black  = {0, 0, 0, 1}
fontColour.White  = {1, 1, 1, 1}
fontColour.Red    = {1, 0, 0, 1}
fontColour.Blue   = {0, 0, 1, 1}
fontColour.Cyan   = {0, 1, 1, 1}
fontColour.Yellow = {1, 1, 0, 1}

-- library data
local assetsURL = {}
assetsURL.ore   = {}
assetsURL.ore['coal']     = "assets.prod.novaquark.com/70186/edc9f97e-7359-454e-8ba9-8f960037ae9b.png"
assetsURL.ore['hematite'] = "assets.prod.novaquark.com/45824/36e5a9ca-c9f6-4e66-b2f4-fe64c9289224.png"

-- start loading layers
setBackgroundColor(Background_Colours.red, Background_Colours.blue, Background_Colours.green)

local WallPaper_Image = loadImage(WallPaper_URL) 
local Ore_Image = loadImage(assetsURL.ore[string.lower(Ore_Name)]) 
addImage(layers.wallpaper, WallPaper_Image, 0, 0, rx, ry) 

local scalar = 0.4
local sx = ry * scalar
local sy1 = (ry - (ry * scalar)) / 2
local sy2 = ry * scalar

addImage(layers.background, Ore_Image, 01, sy1, sx, sy2) 
drawDoubleLine(layers.background, x,  from_top * 12.5, mid_rx * 0.8, borderSpacing)

local sales_summary = "(" .. Batch_Size_Litres .. "Litres @ " .. Price_Per_Litre .. "Q/L; " .. Batch_Size_Litres * Price_Per_Litre .. "Q per batch)"

local shadowPX = 7
setDefaultShadow(layers.text, Shape_Text,shadowPX, 0, 0, 1, 1)

addText(layers.text, fontSize.banner, Ore_Name, from_left, from_top * 10)

addText(layers.text, fontSize.heading, yourOrgName[1], mid_rx * 0.8, from_top * 12)
addText(layers.text, fontSize.smallBold, yourOrgName[2], mid_rx * 0.8, from_top * 13.3)

addText(layers.text, fontSize.text, sales_summary, from_left, from_top * 15)

addText(layers.text, fontSize.subtext, messageToCustomers[1], from_left, from_top * 18)
addText(layers.text, fontSize.subtext, messageToCustomers[2], from_left, from_top * 19)

---# Request one run per 111 frames
requestAnimationFrame(111)

--- eof ---