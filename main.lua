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
    decal.Texture = decalTextureId 
    decal.Parent = luckyblock 
    decal.Face = face 
  end
end

local TriggeredFunctions={
  ["glitchiness"]={Chance=20,CallBack="functions/glitchiness"}
}
function activator(block)
  block.Activated:Connect(function()
      local isFunction=false
      if math.rsndom(1,100)<=25 then
        isFunction=true
      end
  if isFunction==true then for i, table in ipairs(TriggeredFunctions) do
     loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Lucky-block-assets/refs/heads/main/"..table.CallBack..".lua"
  end 
          else
            local isTool=math.random(1,100)<=50
            if isTool then
              local tool
              while tool==nil do
                wait()
                for _, too in ipairs(game:GetDescendants()) do
                  if too:IsA("Tool") and math.random(1,100)<=15 then
                    tool=too
                    break
                  end
                end
              end
              tool:Clone().Parent=game.Players.LocalPlayer.Backpack
          end
          block:Destroy()
end)
        end

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
  local doorNV = game.ReplicatedStorage.GameData.LatestRoom
  local door = doorNV.Value
  while wait() do
    if doorNV.Value > door then
      door=doorNV.Value
      local block = lucky:Clone()
      block.Parent=game.Players.LocalPlayer.Backpack
      activator(block)
    end
  end
    else
      while wait(10) do
           local block = lucky:Clone()
        block.Parent=game.Players.LocalPlayer.Backpack
      activator(block)
      end
end
