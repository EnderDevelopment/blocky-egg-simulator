-- EnvironmentInteraction.server.lua

local function createEnvironment()
    -- Create ground
    local ground = Instance.new("Part")
    ground.Name = "Ground"
    ground.Size = Vector3.new(100, 1, 100)
    ground.Position = Vector3.new(0, -1, 0)
    ground.Anchored = true
    ground.Parent = workspace

    -- Create walls
    local wall1 = Instance.new("Part")
    wall1.Name = "Wall1"
    wall1.Size = Vector3.new(100, 20, 1)
    wall1.Position = Vector3.new(0, 9, 50)
    wall1.Anchored = true
    wall1.Parent = workspace

    local wall2 = Instance.new("Part")
    wall2.Name = "Wall2"
    wall2.Size = Vector3.new(100, 20, 1)
    wall2.Position = Vector3.new(0, 9, -50)
    wall2.Anchored = true
    wall2.Parent = workspace

    local wall3 = Instance.new("Part")
    wall3.Name = "Wall3"
    wall3.Size = Vector3.new(1, 20, 100)
    wall3.Position = Vector3.new(50, 9, 0)
    wall3.Anchored = true
    wall3.Parent = workspace

    local wall4 = Instance.new("Part")
    wall4.Name = "Wall4"
    wall4.Size = Vector3.new(1, 20, 100)
    wall4.Position = Vector3.new(-50, 9, 0)
    wall4.Anchored = true
    wall4.Parent = workspace

    -- Create some blocky objects
    local object1 = Instance.new("Part")
    object1.Name = "Object1"
    object1.Size = Vector3.new(5, 5, 5)
    object1.Position = Vector3.new(20, 2.5, 20)
    object1.Anchored = true
    object1.Parent = workspace

    local object2 = Instance.new("Part")
    object2.Name = "Object2"
    object2.Size = Vector3.new(5, 5, 5)
    object2.Position = Vector3.new(-20, 2.5, -20)
    object2.Anchored = true
    object2.Parent = workspace

    -- Handle player interactions
    local function onTouched(hit)
        local part = hit.Parent
        if part and part:IsA("Part") and part.Name:match("Object") then
            part.Transparency = 0.5
            wait(1)
            part.Transparency = 0
        end
    end

    workspace.ChildAdded:Connect(function(child)
        if child:IsA("Part") then
            child.Touched:Connect(onTouched)
        end
    end)

    -- Connect existing parts
    for _, child in ipairs(workspace:GetChildren()) do
        if child:IsA("Part") then
            child.Touched:Connect(onTouched)
        end
    end
end

createEnvironment()