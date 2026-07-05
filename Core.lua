-- SharedMedia: AlertMediaPack
-- Curated alert sounds for addons using LibSharedMedia-3.0.
-- Code license: MIT. Bundled media keeps its original upstream license.

local ADDON_NAME = ...
local LSM_ADDON_NAME = "LibSharedMedia-3.0"
local MEDIA_PATH = [[Interface\AddOns\]] .. ADDON_NAME .. [[\Media\Sounds\]]

local sounds = {
  ["Air Horn"] = "AirHorn.ogg",
  ["Alert Toast Warm"] = "AlertToastWarm.ogg",
  ["Applause"] = "Applause.ogg",
  ["Blast"] = "Blast.ogg",
  ["Bleat"] = "Bleat.ogg",
  ["Boxing Arena Gong"] = "BoxingArenaSound.ogg",
  ["Cartoon Voice Baritone"] = "CartoonVoiceBaritone.ogg",
  ["Cartoon Walking"] = "CartoonWalking.ogg",
  ["Cat Meow"] = "CatMeow2.ogg",
  ["Cow Mooing"] = "CowMooing.ogg",
  ["Focus"] = "Focus.ogg",
  ["Heartbeat Single"] = "HeartbeatSingle.ogg",
  ["Kitten Meow"] = "KittenMeow.ogg",
  ["Lossa Healer Trinket"] = "LossaHealerTrinket.ogg",
  ["Lossa Trinket"] = "LossaTrinket.ogg",
  ["Notification 18"] = "Notification18.ogg",
  ["Notification 38"] = "Notification38.ogg",
  ["Ringing Phone"] = "RingingPhone.ogg",
  ["Roaring Lion"] = "RoaringLion.ogg",
  ["Robot Blip"] = "RobotBlip.ogg",
  ["Sheep Bleat"] = "SheepBleat.ogg",
  ["Shotgun"] = "Shotgun.ogg",
  ["Sonar"] = "Sonar.ogg",
  ["Temple Bell"] = "TempleBellHuge.ogg",
  ["Torch"] = "Torch.ogg",
  ["Warning Siren"] = "WarningSiren.ogg",
  ["Watch Out"] = "WatchOut.ogg",
  ["Water Drop"] = "WaterDrop.ogg",
}

local registered = false

local function GetLibSharedMedia()
  local libStub = _G.LibStub
  local LSM = libStub and libStub(LSM_ADDON_NAME, true)

  if LSM then
    return LSM
  end

  local loadAddOn = _G.C_AddOns and _G.C_AddOns.LoadAddOn or _G.LoadAddOn

  if loadAddOn then
    pcall(loadAddOn, LSM_ADDON_NAME)
  end

  libStub = _G.LibStub
  return libStub and libStub(LSM_ADDON_NAME, true)
end

local function GetFileName(mediaPath)
  if type(mediaPath) ~= "string" then
    return nil
  end

  return mediaPath:match("[^\\/:]+$")
end

local function IsSoundAlreadyRegistered(LSM, mediaType, name, fileName)
  if LSM.IsValid and LSM:IsValid(mediaType, name) then
    return true
  end

  local mediaTable = LSM.HashTable and LSM:HashTable(mediaType)

  if not mediaTable then
    return false
  end

  local normalizedFileName = fileName:lower()

  for _, mediaPath in pairs(mediaTable) do
    local registeredFileName = GetFileName(mediaPath)

    if registeredFileName and registeredFileName:lower() == normalizedFileName then
      return true
    end
  end

  return false
end

local function RegisterMedia()
  if registered then
    return true
  end

  local LSM = GetLibSharedMedia()

  if not LSM then
    return false
  end

  local mediaType = LSM.MediaType and LSM.MediaType.SOUND or "sound"

  for name, fileName in pairs(sounds) do
    if not IsSoundAlreadyRegistered(LSM, mediaType, name, fileName) then
      LSM:Register(mediaType, name, MEDIA_PATH .. fileName)
    end
  end

  registered = true
  return true
end

if not RegisterMedia() then
  local frame = CreateFrame("Frame")
  frame:RegisterEvent("ADDON_LOADED")
  frame:RegisterEvent("PLAYER_LOGIN")
  frame:SetScript("OnEvent", function(self)
    if RegisterMedia() then
      self:UnregisterAllEvents()
      self:SetScript("OnEvent", nil)
    end
  end)
end
