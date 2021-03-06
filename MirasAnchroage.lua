-----------------------------------------------------------------------------------------------
-- Client Lua Script for MirasAnchroage
-- Copyright (c) NCsoft. All rights reserved
-----------------------------------------------------------------------------------------------
 
require "Window"
 
-----------------------------------------------------------------------------------------------
-- MirasAnchroage Module Definition
-----------------------------------------------------------------------------------------------
local MirasAnchroage = {} 
 
-----------------------------------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------------------------------
-- e.g. local kiExampleVariableMax = 999

 local ktMiraDirectory = {
	[3] = { player = "Nithiel", plotName = "Nithiels Procurement Services", owner = "Nithiel Le'Fer", description = "A shop of many things one may need or didn't know they needed.  Mostly parts and and salvage.  You can go here to order something you cannot find elsewhere.  \"If I don't have it, I can get it.  If I can't get it, it doesn't exist.\"", features = "Junkyard Challenge, 50/50 T3 Mineral, Crafting Table, Vendbot, Mailbox", public = true, },
	[7] = { player = "Jasp", plotName = "New Hope Dojo & Gym", owner = "Jaspiria HemeOnyx", description = "Dojo and Gym", features = "Shardspire Challenge, Crafting station", public = True, },
	[9] = { player = "Toymaker", plotName = "The Toyworks", owner = "Nathan LeJean, The Toymaker", description = "Nathan supplies and builds gadgets, bots for maintenance and construction, and various techy services", features = "Mineral Deposit", public = true, },
	[10] = { player = "Fawn", plotName = "Travellers Tale", owner = "Fawn Cassidy", description = "Chronicler House", features = "", public = true, },
	[11] = { player = "AlyssiaSwiftwind", plotName = "Bulletz Boltz N Bekkn", owner = "Alyssia \"Pinky\" Swiftwind", description = "A bright and garishly painted building that houses both a cafe and general fix-it workshop. The cafe portion is open for breakfast and lunch, while the workshop stays open later.", features = "Farming , 50/50. Crafting Station.", public = true, },
	[12] = { player = "Sarahann", plotName = "Needs and Things", owner = "Bobby Paterson", description = "A simple country general store where one may find a variety of sundries and things that you would need. Ranging from food and clothing to books and supplies!", features = "", public = false, },
	[14] = { player = "Zaytu", plotName = "Miras Anchorage Archives", owner = "Zaytu Riverwind", description = "The town Archives & public Library", features = "", public = true, },
	[15] = { player = "bobbypaterson", plotName = "Peace Keepers Office", owner = "Mira's Anchorage", description = "The town Jail / Peace Keepers office, Briyana's office and place where the town security forces are based", features = "", public = true, },
	[17] = { player = "Nuphrati", plotName = "In-Style Outfitters", owner = "Nuphrati", description = "Thrift apparel, outdoor gear, and shiny trinkets!", features = "", public = true, },
	[19] = { player = "Quille", plotName = "Sugar Teeth", owner = "Quillen Pompon", description = "Small Bakery offering sweet treats and free hugs.", features = "", public = false, },
	[21] = { player = "AbigailAshford", plotName = "The Crazy Chompacabra", owner = "Abigail Ashford", description = "A saloon styled bar off the main drag.  Serves drinks, conversation and entertainment.", features = "", public = true, },
	[23] = { player = "DJMalak", plotName = "Quantum State Radio", owner = "Damian \"DJ\" Malak", description = "Base of operations for Quantum State Radio.  Site will feature a place for shows and other festivities.", features = "", public = true, },
	[24] = { player = "Zoisite", plotName = "The School of Hard Gnox", owner = "Zoisite", description = "A school and library for the children of Mira's Anchorage and the surrounding areas. (Under Construction)", features = "Moonshiner's Cabin", public = true, },
	[25] = { player = "JennyFitzgerald", plotName = "Fitzgerald Landing", owner = "Jenny Fitzgerald", description = "Jenny's refurbished spaceship", features = "Algoroc biome, Crafting station, Garden, Thicket", public = false, },
	[27] = { player = "AribelleLangston", plotName = "Langston Mechanics", owner = "Aribelle Langston", description = "A small residential building next to a large garage-like structure that would resemble most of the mechanic shops in the universe with the exception that this one is usually manned by bots.", features = "Crafting station, tier 2 Mineral Deposit, moonshine challange, loftite challange", public = true, },
	[29] = { player = "Fenwick", plotName = "Starbound Surgery", owner = "Doctor Fenwick Starbound", description = "A reasonably large surgery and research lab, built inside a large, sprawling tree. The tree itself seems to have been forced to grow around the building, rather than hollowed out.", features = "", public = true, },
	[31] = { player = "Akiri", plotName = "Supur Scynce Doctur Lab", owner = "Akiri Cloudsong", description = "Science Lab", features = "", public = true, },
	[32] = { player = "Craft", plotName = "The SpeakEasy Brewing Co.", owner = "Craft Ramsay", description = "Brewery of Nexus' Best Beer and small pub", features = "", public = true, },
	[35] = { player = "Igna", plotName = "MA Lot 35: Igna's Pad", owner = "Igna", description = "An old asteroid-hopper now serves as a domicile. Drop in just to say hi, have a beer, scavenge for some \"rustic handmade\" decoration for your own pad, or help yourself to the shipping containers!", features = "Crafting Station, 50/50 Mineral Deposit", public = true, },
	[37] = { player = "Tyrianne", plotName = "Sunfire Estate", owner = "Tyrianne Sunfire", description = "Tyr's landing pad. Residence for the moment. Perhaps a shop later on.", features = "", public = false, },
	[39] = { player = "Nimarhie", plotName = "39 Spirovine Lane", owner = "Ananya Siduri", description = "A small unobtrusive house on the edge of town.", features = "", public = false, },
	[40] = { player = "Dustwind", plotName = "Hunting Cabin", owner = "Dustwind Longstride", description = "Hunting cabin", features = "Shardspire Canyon, Garden", public = false, },
	[44] = { player = "Nastasja", plotName = "Hristov Apothecary", owner = "the Hristov twins", description = "A large elegant old-style ( almost victorian)  house with an austere facade and well tended gardens. on the  wrought iron gate is a small, stately sign stating  \"Apothecary: Enquire Within\"", features = "", public = true, },
	[45] = { player = "Afanasiia", plotName = "The Apothecary garden Teahouse", owner = "the Hristov twins", description = "Stately gardens near the Hristove Apothecary that hold beautifully tended gardens and pools and  a cozy, welcoming tea house that would be ideal for  weddings, parties or other social gatherings. ", features = "", public = true, },
	[49] = { player = "Anyura", plotName = "Any's House", owner = "Anyura Mirinova", description = "Any's House and workshop for custom Armorsmithing", features = "Mineral Deposit, Mineral Deposit 2, Crafting Station, ", public = false, },
	[50] = { player = "Meda", plotName = "The Treehouse", owner = "Meda Duskwillow", description = "A large treehouse/hooka/liquor bar/outdoor sleeping area.", features = "", public = true, },
	[52] = { player = "Erstwhile", plotName = "The Steadfast", owner = "Erstwhile Sawyer", description = "An XG-Valkyrie class that has seen better days, this cracked and tarnished frame has been pieced together from what was obviously a catastrophic crash.  Now it serves as the base of operations for \"Sawyer and Sawyer Aquisitions.\" A mercenary outfit of two.", features = "Moonshine Cabin, Crafting Station, Mineral Deposit, Weapons Testing Site.", public = true, },
	[53] = { player = "Tonky.", plotName = "B00B13 R0CK3T", owner = "Tonky", description = "A beat-up old spaceship that seems to have crashed where it now rests. Home of T.I.T.S.", features = "", public = false, },
	[55] = { player = "Lanore", plotName = "A Taste of Nexus", owner = "Lanore Nolan", description = "A nightclub offering all of the pleasures and fancies Nexus has to offer, from the finest cuisine to premier entertainment.  Come, have a Taste of Nexus and see what you have been missing!", features = "", public = true, },
	[56] = { player = "CassidyMitchals", plotName = "Home Place", owner = "Cassidy Mitchals", description = "A place for her Starship the Wreckingball to land, as well as for her small workshop and fabrication buildings to be errected! Come on down if you ever need anything! Double quick if you need a boom!", features = "", public = true, },
	[57] = { player = "Tallyn", plotName = "Grinders 'N Gears", owner = "Tallyn", description = "An old, out-of-service ship now houses a garage in its cargo bay and a sleeping area in the storage area above.  Tallyn lives and works in practically the same space.", features = "None as yet.", public = true, },
	[58] = { player = "Elloise", plotName = "Paradise Cove Exports and Sundries", owner = "Ellie Harper", description = "A roughly assembled, and shabby looking collection of scrapped ship hulls formed into a 'shanty-town' of warehouses, offices and recieving yards. Oh and a Moonshine Still!", features = "Crafting Station, Tier 2 Mineral Deposit, Moonshine Still Challenge, Vending Machine", public = false, },
	[59] = { player = "Briyana", plotName = "Walker Residence", owner = "Briyana Walker / Vanessa ", description = "The Walker House Hold and Farm, residence of the Town PeaceKeeper", features = "", public = true, },
	["TownHall"] = { player = "Zackarie", plotName = "Town Hall", owner = "Mira's Anchorage", description = "A large building, constructed from various pieces gathered from the Mira and the surrounding landscape. The hall has enough room to hold the majority of the town for meetings.", features = "", public = true, },
}

 local ktWaitingStrings = {
	"Recombobulating teleporter to %s.",
	"Searching ProtostarMaps for best route to %s.",
	"Waving down cabbie for trip to %s.",
	"Recalculating best route to %s.",
	"Asking for directions to %s.",
 }
 
-----------------------------------------------------------------------------------------------
-- Initialization
-----------------------------------------------------------------------------------------------
function MirasAnchroage:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 
	self.bSearch = false
    -- initialize variables here

    return o
end

function MirasAnchroage:Init()
	local bHasConfigureFunction = false
	local strConfigureButtonText = ""
	local tDependencies = {
		-- "UnitOrPackageName",
	}
    Apollo.RegisterAddon(self, bHasConfigureFunction, strConfigureButtonText, tDependencies)
end
 

-----------------------------------------------------------------------------------------------
-- MirasAnchroage OnLoad
-----------------------------------------------------------------------------------------------
function MirasAnchroage:OnLoad()
    -- load our form file
	Apollo.LoadSprites("MirasAnchroageSprites.xml", "MirasAnchroageSprites")
	self.xmlDoc = XmlDoc.CreateFromFile("MirasAnchroage.xml")
	self.xmlDoc:RegisterCallback("OnDocLoaded", self)
end

-----------------------------------------------------------------------------------------------
-- MirasAnchroage OnDocLoaded
-----------------------------------------------------------------------------------------------
function MirasAnchroage:OnDocLoaded()

	if self.xmlDoc ~= nil and self.xmlDoc:IsLoaded() then
	    self.wndMain = Apollo.LoadForm(self.xmlDoc, "MirasAnchroageForm", nil, self)
		self.wndTicker = self.wndMain:FindChild("wnd_Ticker")		
		if self.wndMain == nil then
			Apollo.AddAddonErrorText(self, "Could not load the main window for some reason.")
			return
		end
		
	    self.wndMain:Show(false, true)
				
		for i,v in pairs(ktMiraDirectory) do
			local btnCurr = self.wndMain:FindChild(tostring(i))
			local xmlTooltip = XmlDoc.new()
			xmlTooltip:StartTooltip(Tooltip.TooltipWidth)
			-- string, color, font, align
			xmlTooltip:AddLine(v.plotName, "FF00FF99", "CRB_Header14_O", "Center")
			if v.owner and string.len(v.owner) > 0 then
				xmlTooltip:AddLine(string.format("Owner: %s", v.owner), "FF00FFFF", "CRB_Interface10_BO", "Left")
			end
			xmlTooltip:AddLine(v.description, "FFFFFFFF", "CRB_Interface12_O")
			if v.features and string.len(v.features) > 0 then
				xmlTooltip:AddLine("――――――――――――――――", "FF00FF99", "CRB_Interface12_BO", "Center")
				xmlTooltip:AddLine(v.features, "FF00FF00", "CRB_Interface12_O")
			end
			
			if v.public == true then
				btnCurr:SetTextColor("FF00FF00")
			else
				btnCurr:SetTextColor("FFFFFF00")
				xmlTooltip:AddLine(string.format("Player, %s, has not made this plot pubic.", v.player), "FF991111", "CRB_Interface10_I")
			end
			btnCurr:SetTooltipDoc(xmlTooltip)
			btnCurr:SetData({ strPlayer = v.player, bPublic = v.public})
		end

		self.xmlDoc = nil
		
		Apollo.RegisterSlashCommand("mira", "OnMirasAnchroageOn", self)
		Apollo.RegisterEventHandler("HousingRandomResidenceListRecieved", "TimeToCheck", self)
		Apollo.RegisterEventHandler("ToggleAddon_Mira", "OnMirasAnchroageOn", self)
		Apollo.RegisterEventHandler("InterfaceMenuListHasLoaded", "OnInterfaceMenuListHasLoaded", self)
	end
end

function MirasAnchroage:OnInterfaceMenuListHasLoaded()
	Event_FireGenericEvent("InterfaceMenuList_NewAddOn", "Mira's Anchorage", {"ToggleAddon_Mira", "", ""})
end

-----------------------------------------------------------------------------------------------
-- MirasAnchroage Functions
-----------------------------------------------------------------------------------------------
-- Define general functions here

-- on SlashCommand "/mira"
function MirasAnchroage:OnMirasAnchroageOn()
	self.wndMain:Invoke() -- show the window
end

-----------------------------------------------------------------------------------------------
-- MirasAnchroageForm Functions
-----------------------------------------------------------------------------------------------
function MirasAnchroage:ReturnHome()
	HousingLib.RequestTakeMeHome()
	self.wndTicker:StopDoogie()
	self.wndTicker:SetText("")
	self.wndMain:Show(false)
end

function MirasAnchroage:OnCancel()
	self.wndMain:Close() -- hide the window
end

function MirasAnchroage:OnPlotClick(wndHandler, wndControl, eMouseButton)
	local tInfo = wndControl:GetData()
	if tInfo == nil or tInfo.bPublic == false then return end
	
	if tInfo.strPlayer == GameLib.GetPlayerUnit():GetName() then
		HousingLib.RequestTakeMeHome()
		self.wndTicker:StopDoogie()
		self.wndTicker:SetText("")
		self.wndMain:Show(false)

		self.wndMain:Show(false)
		return
	end
	self.wndMain:SetData(tInfo.strPlayer)
	-- Taken from The Visitor Addon
	if HousingLib.IsHousingWorld() == false then
		ChatSystemLib.PostOnChannel( ChatSystemLib.ChatChannel_Command, "You must enter a housing plot first.", "Mira's Anchorage")
		return
	end
	
	for i, v in pairs(ktMiraDirectory) do
		if v.player == tInfo.strPlayer then
			local xmlWaiting = XmlDoc.new()
			xmlWaiting:AddLine()
			xmlWaiting:AppendImage("CRB_Anim_Spinner:sprAnim_SpinnerLarge", 48, 48)
			xmlWaiting:AppendText(string.format(ktWaitingStrings[math.random(1, #ktWaitingStrings)], v.plotName), "FF00FF99", "CRB_Header12_O", "Left")
			self.wndTicker:SetDoc(xmlWaiting)
			self.wndTicker:BeginDoogie(150)
		end
	end
	
	self.tTotalNameList = {}
	--check if neighbor
	local tNeightborList = HousingLib.GetNeighborList()
	for i, v in pairs(tNeightborList) do
		if tNeightborList[i].strCharacterName == tInfo.strPlayer then
			HousingLib.VisitNeighborResidence(tNeightborList[i].nId)
			self.wndTicker:StopDoogie()
			self.wndTicker:SetText("")
			self.wndMain:Show(false)
			return
		end
	end
	--find target
	self.bSearch = true;
	self.tTotalNameList = {}

	HousingLib.RequestRandomResidenceList();
end

function MirasAnchroage:TimeToCheck()
	if HousingLib.IsHousingWorld() == false then
		ChatSystemLib.PostOnChannel( ChatSystemLib.ChatChannel_Command, "You must enter a housing plot first.", "Mira's Anchorage")
		self.bSearch = false;
		return;
	end;

	if self.bSearch == false then 
		return;
	end
	local strPlayerName = self.wndMain:GetData()
	strPlayerName = strPlayerName:lower()

	local bFound = false;
	local tCurrRandomSet = HousingLib.GetRandomResidenceList();

	local i=0;
	while i < #tCurrRandomSet do
		i=i+1;
		if tCurrRandomSet[i] == nil  then
			i=i+100;
		else
		   --update favorite
			local strOwnerrName = tCurrRandomSet[i].strCharacterName;
			self.tTotalNameList[strOwnerrName] = 1;
			
			if string.lower(strOwnerrName) == strPlayerName  then 
				bFound = true;
				self.bSearch = false;
				self.tTotalNameList = {}
				HousingLib.RequestRandomVisit(tCurrRandomSet[i].nId);
				self.wndTicker:StopDoogie()
				self.wndTicker:SetText("")
				self.wndMain:Show(false)
				return
			end
		end
	end
	HousingLib.RequestRandomResidenceList();
end

-----------------------------------------------------------------------------------------------
-- MirasAnchroage Instance
-----------------------------------------------------------------------------------------------
local MirasAnchroageInst = MirasAnchroage:new()
MirasAnchroageInst:Init()
