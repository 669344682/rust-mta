local TEST_BUILDING_POS = Vector3 { x = -1627.964, y = -2466.334, z = 95 }
local TEST_BUILDING_ROT = -40 + 180

outputChatBox(" ")
local baseFoundation = Foundation:new()
building1 = Building:new(TEST_BUILDING_POS, TEST_BUILDING_ROT, baseFoundation)

building1:addPart(Foundation:new(), 1, 0, 0, 0)
building1:addPart(Foundation:new(), 1, 1, 0, 0)
building1:addPart(Foundation:new(), 0, 1, 0, 0)

local testWall = WallDoor:new()
outputChatBox("Wall 1: %s" % tostring(building1:addPart(testWall, 1, 0, 0, getDirectionFromName("right"))))


building1:addPart(Wall:new(), 1, 0, 0, getDirectionFromName("backward"))
building1:addPart(Wall:new(), 0, 0, 0, getDirectionFromName("backward"))
building1:addPart(Wall:new(), 0, 0, 0, getDirectionFromName("left"))
building1:addPart(Wall:new(), 0, 1, 0, getDirectionFromName("left"))
building1:addPart(Wall:new(), 0, 1, 0, getDirectionFromName("forward"))
building1:addPart(Wall:new(), 1, 1, 0, getDirectionFromName("forward"))
building1:addPart(Wall:new(), 1, 1, 0, getDirectionFromName("right"))

building1:addPart(Floor:new(), 1, 0, 1)
building1:addPart(Floor:new(), 0, 0, 1)
building1:addPart(Floor:new(), 1, 1, 1)

building1:addPart(Stairway:new(), 0, 1, 0, 1)
-- local testStairway = Stairway:new()
-- outputChatBox("Stairway 1: %s" % tostring(building1:addPart(testStairway, 0, 0, 0, 2)))

-- local testWall3 = Wall:new()
-- outputChatBox("Wall 3: %s" % tostring(building1:addPart(testWall3, 0, 0, 0, 2)))
-- local testWall4 = WallWindow:new()
-- outputChatBox("Wall 4: %s" % tostring(building1:addPart(testWall4, 0, 0, 1, 6)))
-- local testWall5 = Wall:new()
-- outputChatBox("Wall 5: %s" % tostring(building1:addPart(testWall5, 0, 0, 1, 1)))

-- local testStairway2 = Stairway:new()
-- outputChatBox("Stairway 2: %s" % tostring(building1:addPart(testStairway2, 1, 0, 1, 4)))

-- local testFloor2 = Floor:new()
-- outputChatBox("Floor 2: %s" % tostring(building1:addPart(testFloor2, 0, 0, 2)))

-- local testStairway3 = Stairway:new()
-- outputChatBox("Stairway 3: %s" % tostring(building1:addPart(testStairway3, 0, 0, 2, 2)))
-- local testWall6 = Wall:new()
-- outputChatBox("Wall 6: %s" % tostring(building1:addPart(testWall6, 0, 0, 2, 2)))
-- local testWall7 = Wall:new()
-- outputChatBox("Wall 6: %s" % tostring(building1:addPart(testWall7, 0, 0, 2, 3)))