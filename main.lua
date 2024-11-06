local lucky = Instance.new("Tool", game.ReplicatedStorage) -- Create a Tool
local luckyblock = Instance.new("Part", lucky) -- Create a MeshPart as child of Tool
luckyblock.Name="Handle"
luckyblock.Size=Vector3.new(1.5,1.5,1.5)
local TriggeredFunctions={
  ["glitchiness"]={Chance=20,CallBack="functions/glitchiness"}
}
-- Define the decal properties
local decalTextureId = "rbxassetid://8277401585"

function setDecalsToAllFaces()
  local faces = Enum.NormalId:GetEnumItems() -- Get all face directions

  for _, face in ipairs(faces) do
    local decal = Instance.new("Decal") -- Create a new Decal instance
    decal.TextureId = decalTextureId -- Set the decal texture
    decal.Parent = luckyblock -- Parent the decal to the MeshPart
    decal.Face = face -- Set the decal to the current face
  end
end
Instance.new("LocalScript", lucky).Source=[[
script.Parent.Activated:Connect(function(
  for i, table in ipairs(TriggeredFunctions) do
     loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Lucky-block-assets/main/]]..table.CallBack..[[.lua
  end
end)
]]
setDecalsToAllFaces() -- Call the function to apply decals
local function isPlayerInDoors(player)
    local playerPlaceInstance = Players:GetPlayerPlaceInstance(player.UserId)
    if playerPlaceInstance then
        local placeId = playerPlaceInstance.PlaceId
        -- Replace "6516141723" with the actual Doors place ID
        return placeId == 6516141723
    end
    return false
end
function 
if isPlayerInDoors(game.Players.LocalPlayer) then
  game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function(
      
    end)
end
