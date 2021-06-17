-- test script for elevator

local speed = 60
local dist = 20
local motor = peripheral.wrap("bottom")
local currentFloor = 1
local targetSpeed

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
