--- === stuff you should change === ---  
local yourLogoFile = "assets.prod.novaquark.com/145024/8ab0175a-333a-4980-970f-accc4940f234.jpg"
local yourOrgname  = "Wolfstar Services"
local thisSiteName = "The Ore Hall"
local messageToCustomers = "COMING SOON \n".. "This Location \n"

--- === below here should not need changing === ---  

wss_software ={}
wss_software.id = "ore_for_sale_banner"
wss_software.title = "Ore For Sale -- Site Banner Screen"
wss_software.version = "1.0.0"
wss_software.revision = "16 JAN 2023 20h39 AST"
wss_software.author = "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

---

local rslib = require('rslib')
rslib.drawQuickImage(yourLogoFile)

---
local fontColour = {}
fontColour['Black']  = {0, 0, 0, 1}
fontColour['White']  = {1, 1, 1, 1}
fontColour['Red']    = {1, 0, 0, 1}
fontColour['Blue']   = {0, 0, 1, 1}
fontColour['Cyan']   = {0, 1, 1, 1}
fontColour['Yellow'] = {1, 1, 0, 1}

---
local config = { fontSize = 68, textColor =  fontColour['Black'] }
local text = yourOrgname .. "\n\n\n\n\n\n"
rslib.drawQuickText(text, config)

local config = { fontSize = 64, textColor =  fontColour['Red'] }
rslib.drawQuickText(text, config)

---
config = { fontSize = 52, textColor = fontColour['Blue'] }
text = "\n" .. messageToCustomers
rslib.drawQuickText(text, config)

config = { fontSize = 48, textColor = fontColour['Cyan'] }
rslib.drawQuickText(text, config)

---
config = { fontSize = 76, textColor = fontColour['Red'] }
text = "\n\n\n\n"
text = text .. thisSiteName
rslib.drawQuickText(text, config)

config = { fontSize = 72, textColor = fontColour['Yellow'] }
rslib.drawQuickText(text, config)
--- eof ---