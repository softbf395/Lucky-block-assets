local lucky = Instance.new("Tool")
lucky.Parent=game.ReplicatedStorage
local luckyblock = Instance.new("Part") 
luckyblock.Parent = lucky
luckyblock.Name="Handle"
luckyblock.Size=Vector3.new(1.5,1.5,1.5)
local TriggeredFunctions={
  ["glitchiness"]={Chance=20,CallBack="functions/glitchiness"}
}

local decalTextureId = "rbxassetid://8277401585"

function setDecalsToAllFaces()
  local faces = Enum.NormalId:GetEnumItems() 

  for _, face in ipairs(faces) do
    local decal = Instance.new("Decal") 
    decal.TextureId = decalTextureId 
    decal.Parent = luckyblock 
    decal.Face = face 
  end
end
Instance.new("LocalScript", lucky).Source=[[
script.Parent.Activated:Connect(function(
  for i, table in ipairs(TriggeredFunctions) do
     loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Lucky-block-assets/main/]]..table.CallBack..[[.lua
  end
end)
]]
setDecalsToAllFaces()
local function isPlayerInDoors(player)
    if game.ReplicatedStorage:FindFirstChild("GameData") then
      if game.ReplicatedStorage.GameData:FindFirstChild("LatestRoom") then
        return true
    end
  end
    return false
end
if isPlayerInDoors(game.Players.LocalPlayer) then
  game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
      lucky:Clone().Parent=game.Players.LocalPlayer.Backpack
    end)
    else
      while wait(60) do
           lucky:Clone().Parent=game.Players.LocalPlayer.Backpack
      end
end
