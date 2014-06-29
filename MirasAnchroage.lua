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
	[3] = { player = "Nithiel", plotName = "Nithiels Procurement Services", owner = "Nithiel Le'Fer", description = "A shop of many things one may need or didn't know they needed.  Mostly parts and and salvage.  You can go here to order something you cannot find elsewhere.  \"If I don't have it, I can get it.  If I can't get it, it doesn't exist.\"", features = "Junkyard Challenge, 50/50 T3 Mineral, Crafting Table, Vendbot, Mailbox", },
	--[7] = { player = "Jasp", plotName = "New Hope Dojo & Gym", owner = "Jaspiria HemeOnyx", description = "Dojo and Gym", features = "", },
	[9] = { player = "Toymaker", plotName = "The Toyworks", owner = "Nathan LeJean, The Toymaker", description = "Nathan supplies and builds gadgets, bots for maintenance and construction, and various techy services", features = "Mineral Deposit", },
	[10] = { player = "Fawn", plotName = "Travellers Tale", owner = "Fawn Cassidy", description = "Chronicler House", features = "", },
	[11] = { player = "AlyssiaSwiftwind", plotName = "Bulletz Boltz N Bekkn", owner = "Alyssia \"Pinky\" Swiftwind", description = "A bright and garishly painted building that houses both a cafe and general fix-it workshop. The cafe portion is open for breakfast and lunch, while the workshop stays open later.", features = "Farming , 50/50. Crafting Station.", },
	[12] = { player = "Sarahann", plotName = "Needs and Things", owner = "Bobby Paterson", description = "A simple country general store where one may find a variety of sundries and things that you would need. Ranging from food and clothing to books and supplies!", features = "", },
	[14] = { player = "Zaytu", plotName = "Miras Anchorage Archives", owner = "Zaytu Riverwind", description = "The town Archives & public Library", features = "", },
	[15] = { player = "bobbypaterson", plotName = "Peace Keepers Office", owner = "Mira's Anchorage", description = "The town Jail / Peace Keepers office, Briyana's office and place where the town security forces are based", features = "", },
	[17] = { player = "Nuphrati", plotName = "In-Style Outfitters", owner = "Nuphrati", description = "Thrift apparel, outdoor gear, and shiny trinkets!", features = "", },
	[19] = { player = "Quille", plotName = "Sugar Teeth", owner = "Quillen Pompon", description = "Small Bakery offering sweet treats and free hugs.", features = "", },
	[21] = { player = "AbigailAshford", plotName = "The Crazy Chompacabra", owner = "Abigail Ashford", description = "A saloon styled bar off the main drag.  Serves drinks, conversation and entertainment.", features = "", },
	[23] = { player = "DJMalak", plotName = "Quantum State Radio", owner = "Damian \"DJ\" Malak", description = "Base of operations for Quantum State Radio.  Site will feature a place for shows and other festivities.", features = "", },
	[25] = { player = "JennyFitzgerald", plotName = "Fitzgerald Landing", owner = "Jenny Fitzgerald", description = "Jenny's refurbished spaceship", features = "Algoroc biome, Shardspire canyon, Crafting, Garden, Thicket", },
	[26] = { player = "Obsidiak", plotName = "Obsidia Crib and Defense", owner = "Obsidia Keystone", description = "Fortress bunker", features = "Crafting, Mine", },
	[29] = { player = "Fenwick", plotName = "Starbound Surgery", owner = "Doctor Fenwick Starbound", description = "A reasonably large surgery and research lab, built inside a large, sprawling tree. The tree itself seems to have been forced to grow around the building, rather than hollowed out.", features = "", },
	[31] = { player = "Akiri", plotName = "Supur Scynce Doctur Lab", owner = "Akiri Cloudsong", description = "Science Lab", features = "", },
	[32] = { player = "Craft", plotName = "The SpeakEasy Brewing Co.", owner = "Craft Ramsay", description = "Brewery of Nexus' Best Beer and small pub", features = "", },
	[39] = { player = "Nimarhie", plotName = "39 Spirovine Lane", owner = "Ananya Siduri", description = "A small unobtrusive house on the edge of town.", features = "", },
	[49] = { player = "Anyura", plotName = "Any's House", owner = "Anyura Mirinova", description = "Any's House and workshop for custom Armor-smithing", features = "Mineral Deposit, Mineral Deposit 2, Crafting Station, ", },
	[51] = { player = "Qupid", plotName = "Qupid Cultural Collection", owner = "Qupid", description = "(to be added)", features = "", },
	[53] = { player = "Tonky.", plotName = "B00B13 R0CK3T", owner = "Tonky", description = "A beat-up old spaceship that seems to have crashed where it now rests. Home of T.I.T.S.", features = "", },
	[58] = { player = "Elloise", plotName = "Paradise Cove Exports and Sundries", owner = "Ellie Harper", description = "A roughly assembled, and shabby looking collection of scrapped ship hulls formed into a 'shanty-town' of warehouses, offices and receiving yards. Oh and a Moonshine Still!", features = "Crafting Station, Tier 2 Mineral Deposit, Moonshine Still Challenge, Vending Machine", },
	[59] = { player = "Briyana", plotName = "Walker Residence", owner = "Briyana Walker / Vanessa ", description = "The Walker House Hold and Farm, residence of the Town PeaceKeeper", features = "", },
	["TownHall"] = { player = "Zackarie", plotName = "Town Hall", owner = "Mira's Anchorage", description = "A large building, constructed from various pieces gathered from the Mira and the surrounding landscape. The hall has enough room to hold the majority of the town for meetings.", features = "", },
 }

 local ktWaitingStrigns = {
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
		self.wndMain:FindChild("wnd_Waiting"):Show(false)
		
		if self.wndMain == nil then
			Apollo.AddAddonErrorText(self, "Could not load the main window for some reason.")
			return
		end
		
	    self.wndMain:Show(false, true)
				
		for i,v in pairs(ktMiraDirectory) do
			local btnCurr = self.wndMain:FindChild(tostring(i))
			local xmlTooltip = XmlDoc.new()
			-- string, color, font, align
			xmlTooltip:AddLine(v.plotName, "FF00FF99", "CRB_Header14_O")
			if v.owner and string.len(v.owner) > 0 then
				xmlTooltip:AddLine(string.format("Owner: %s", v.owner), "FF00FFFF", "CRB_Interface10_BO")
			end
			xmlTooltip:AddLine(v.description, "FFFFFFFF", "CRB_Interface12_O")
			if v.features and string.len(v.features) > 0 then
				xmlTooltip:AddLine("――――――――――――――――", "FF00FF99", "CRB_Interface12_BO")
				xmlTooltip:AddLine(v.features, "FF00FF00", "CRB_Interface12_O")
			end
			btnCurr:SetTooltipDoc(xmlTooltip)
			btnCurr:SetTextColor("FF00FF00")
			btnCurr:SetData(v.player)
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
-- when the OK button is clicked
function MirasAnchroage:OnOK()
	self.wndMain:Close() -- hide the window
end

-- when the Cancel button is clicked
function MirasAnchroage:OnCancel()
	self.wndMain:Close() -- hide the window
end

function MirasAnchroage:OnPlotClick(wndHandler, wndControl, eMouseButton)
	local strOwner = wndControl:GetData()
	if strOwner == nil then return end
	self.wndMain:SetData(strOwner)
	-- Taken from The Visitor Addon
	if HousingLib.IsHousingWorld() == false then
		Print("You must enter a housing plot first.")
		return
	end
	
	for i, v in pairs(ktMiraDirectory) do
		if v.player == strOwner then
			self.wndMain:FindChild("wnd_Waiting"):Show(true)
			local strTicketText = string.format("<T Font=\"CRB_Header12_O\" Align=\"Left\" TextColor=\"FF00FF99\" >%s</T>", string.format(ktWaitingStrigns[math.random(1, #ktWaitingStrigns)], v.plotName))
			self.wndTicker:SetAML(strTicketText)
			self.wndTicker:BeginDoogie(150)
		end
	end
	
	self.iTotalSearches = 1
	self.tTotalNameList = {}
	--check if neighbor
	local tNeightborList=HousingLib.GetNeighborList()
	i=0
	while tNeightborList[i+1] ~= nil do
		i=i+1
		if string.lower(tNeightborList[i].strCharacterName) == strOwner then 
			HousingLib.VisitNeighborResidence(tNeightborList[i].nId)
			return
		end
	end
	--find target
	self.bSearch = true;
	self.iTotalSearches = 1;
	self.tTotalNameList = {}

	HousingLib.RequestRandomResidenceList();
end

function MirasAnchroage:TimeToCheck()
	if HousingLib.IsHousingWorld() == false then
		Print("You must enter a housing plot first.")
		self.bSearch = false;
		return;
	end;
		
	if self.bSearch == false then 
		return;
	end
	--		Print("Looking");
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
			self.tTotalNameList[strOwnerrName]=1;
			
			if string.lower(strOwnerrName) == strPlayerName  then 
				bFound = true;
				self.bSearch = false;
				self.iTotalSearches = 0
				self.tTotalNameList = {}
				HousingLib.RequestRandomVisit(tCurrRandomSet[i].nId);
				self.wndMain:FindChild("wnd_Waiting"):Show(false)
				self.wndTicker:StopDoogie()
				self.wndTicker:SetText("")
				return
			end
		end

	end
	if bFound == false then
		self.iTotalSearches =self.iTotalSearches +1;
	end
	HousingLib.RequestRandomResidenceList();
end

-----------------------------------------------------------------------------------------------
-- MirasAnchroage Instance
-----------------------------------------------------------------------------------------------
local MirasAnchroageInst = MirasAnchroage:new()
MirasAnchroageInst:Init()
