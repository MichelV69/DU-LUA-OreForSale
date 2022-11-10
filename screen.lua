-- NB : some code elements from https://github.com/LocuraDU/DU-Locura-Storage-Info
-- NB : this code freely copiable please credit sources
-- NB : revision date 10Nov2020
-- NB : michel@wolfstar.ca
-- --
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
local wallpaper = createLayer()
local background = createLayer()
local foreground = createLayer()
local text_layer = createLayer()

-- Set font sizes
local kindalarge = loadFont('Play', 100)
local heading    = loadFont('Montserrat-Bold',75)
local large      = loadFont('Play', 60)
local kindasmall = loadFont('Play', 40)
local smallBold  = loadFont('Play-Bold',18)
local small      = loadFont('Play',14)
local subtext    = loadFont('Play', 8)

-- start loading layers
local BG_Color = "15/255,24/255,29/255" --export: (Default: 15/255,24/255,29/255 (DU/UI))
local WallPaper_URL = "assets.prod.novaquark.com/130546/b6fc96cb-c570-4554-901f-099711f5383d.jpg" --export: Wallpapper Image
local WallPaper_Image = loadImage(WallPaper_URL) 

local assetsURL_ore_coal = "assets.prod.novaquark.com/70186/edc9f97e-7359-454e-8ba9-8f960037ae9b.png"
local assetsURL_ore_iron = "assets.prod.novaquark.com/45824/36e5a9ca-c9f6-4e66-b2f4-fe64c9289224.png"

local Ore_Name = "Coal"
local Ore_URL = ore_coal
local Ore_Image = loadImage(assetsURL_ore_coal) 

local Batch_Size_L = "2000"
local Batch_Price_H = "38,000"

setBackgroundColor(15/255, 24/255, 29/255)
addImage(wallpaper, WallPaper_Image, 0, 0, rx, ry) 

local sx = ry *.3
local sy1 = (ry - (ry *.3)) / 2
local sy2 = ry *.3

addImage(background, Ore_Image, 01, sy1, sx, sy2) 

drawDoubleLine(background,x,380,mid_rx * .9,borderSpacing)
addText(text_layer,kindasmall,'WSS Ore Supply Services',mid_rx,385)

local text = Ore_Name 
addText(text_layer,heading,text,from_left,from_top * 10)

local text = "(" .. Batch_Size_L .. "L Batch; " .. Batch_Price_H .. "h per batch)"
addText(text_layer,large,text,from_left,from_top * 15)

---# Request one run per 111 frames
requestAnimationFrame(111)
