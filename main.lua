-- test script for elevator

local speed = 60
local dist = 20
local motor = peripheral.wrap("bottom")
local currentFloor = 1
local targetSpeed

local screenNumbers = { -- floor = shaft screen #, hallway screen #.
    floor1 = {9, 10};
    floor2 = {6, 12};
    floor3 = {4, 3};
    floor4 = {11, 13]:
}

local function returnToGround()
    motor.setSpeed(-256)
    sleep(15)
    motor.setSpeed(0)
end

local function moveToFloor(targetFloor)
    local floorDelta = targetFloor - currentFloor
    if floorDelta < 0 then
        targetSpeed = -speed
    elseif floorDelta > 0 then
        targetSpeed = speed
    end
    local floorDistance = floorDelta * dist
    currentFloor = targetFloor
    motor.setSpeed(targetSpeed)
    sleep(motor.translate(floorDistance))
    motor.setSpeed(0)
end

returnToGround()

-- do stuff
