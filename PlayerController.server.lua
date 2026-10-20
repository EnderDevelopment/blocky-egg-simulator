-- PlayerController.server.lua

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local function onPlayerAdded(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local camera = workspace.CurrentCamera

    -- Set up camera
    camera.CameraType = Enum.CameraType.Custom
    camera.CameraSubject = humanoid

    -- Handle movement
    local moveDirection = Vector3.new(0, 0, 0)
    local moveSpeed = 16

    local function onInputChanged(input, gameProcessed)
        if gameProcessed then return end

        if input.KeyCode == Enum.KeyCode.W then
            moveDirection = moveDirection + Vector3.new(0, 0, -1)
        elseif input.KeyCode == Enum.KeyCode.S then
            moveDirection = moveDirection + Vector3.new(0, 0, 1)
        elseif input.KeyCode == Enum.KeyCode.A then
            moveDirection = moveDirection + Vector3.new(-1, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.D then
            moveDirection = moveDirection + Vector3.new(1, 0, 0)
        end
    end

    local function onInputEnded(input, gameProcessed)
        if gameProcessed then return end

        if input.KeyCode == Enum.KeyCode.W then
            moveDirection = moveDirection - Vector3.new(0, 0, -1)
        elseif input.KeyCode == Enum.KeyCode.S then
            moveDirection = moveDirection - Vector3.new(0, 0, 1)
        elseif input.KeyCode == Enum.KeyCode.A then
            moveDirection = moveDirection - Vector3.new(-1, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.D then
            moveDirection = moveDirection - Vector3.new(1, 0, 0)
        end
    end

    UserInputService.InputChanged:Connect(onInputChanged)
    UserInputService.InputEnded:Connect(onInputEnded)

    -- Update player position
    game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
        if moveDirection.Magnitude > 0 then
            humanoid:Move(moveDirection.Unit * moveSpeed, false)
        end
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)