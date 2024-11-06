-- glitchiness.lua (Local Script for Glitch Effect in DOORS Private Servers)
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Constants
local GLITCH_DURATION = 30 -- Effect duration in seconds
local MAX_TILT_ANGLE = 5 -- Maximum camera tilt in degrees
local MIN_DELAY = 1 -- Minimum time between tilts
local MAX_DELAY = 5 -- Maximum time between tilts

-- Local player and camera reference
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Function to create and show the glitchy overlay
local function createGlitchOverlay()
    local gui = Instance.new("ScreenGui")
    gui.Name = "GlitchOverlay"
    gui.Parent = player:WaitForChild("PlayerGui")

    local overlay = Instance.new("ImageLabel")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundTransparency = 1
    overlay.Image = "rbxassetid://YOUR_OVERLAY_IMAGE_ID" -- Replace with actual asset ID
    overlay.ImageTransparency = 0.5 -- Adjust transparency if needed
    overlay.Parent = gui

    return gui
end

-- Function to remove the glitchy overlay
local function removeGlitchOverlay(overlayGui)
    if overlayGui then
        overlayGui:Destroy()
    end
end

-- Function to apply random camera tilt
local function applyRandomCameraTilt()
    local originalCFrame = camera.CFrame
    local tiltAngle = math.rad(math.random(-MAX_TILT_ANGLE, MAX_TILT_ANGLE))
    local tiltCFrame = CFrame.Angles(math.random() > 0.5 and tiltAngle or -tiltAngle, 0, 0)
    
    -- Tween to tilt the camera
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tiltTween = TweenService:Create(camera, tweenInfo, {CFrame = originalCFrame * tiltCFrame})
    
    tiltTween:Play()
    tiltTween.Completed:Wait()
    camera.CFrame = originalCFrame -- Reset camera after tilt
end

-- Main function to start the glitch effect
local function startGlitchEffect()
    local overlayGui = createGlitchOverlay()
    local effectEndTime = tick() + GLITCH_DURATION

    -- Continuously apply camera tilts at random intervals until time runs out
    while tick() < effectEndTime do
        applyRandomCameraTilt()
        wait(math.random(MIN_DELAY, MAX_DELAY)) -- Wait randomly between 1-5 seconds
    end
    
    removeGlitchOverlay(overlayGui) -- Remove the overlay after the effect
end

-- Start the glitch effect
startGlitchEffect()
