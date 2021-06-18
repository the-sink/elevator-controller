-- test script for elevator

local speed = 60
local dist = 20
local motor = peripheral.wrap("bottom")
local currentFloor = 1
local targetSpeed

local screens = { -- floor = shaft screen #, hallway screen #.
    floor1 = {9, 10},
    floor2 = {6, 12},
    floor3 = {4, 3},
    floor4 = {11, 13}
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

local i = 1
for _, floor in pairs(screens) do
    -- initialize monitor variables as peripherals
    floor[1] = peripheral.wrap("monitor_"..floor[1])
    floor[2] = peripheral.wrap("monitor_"..floor[2])

    local shaftScreen = floor[1]
    local hallScreen = floor[2]

    print(i)

    hallScreen.clear()
    hallScreen.setTextScale(0.5)
    hallScreen.setCursorPos(1, 1)
    hallScreen.write("Floor "..i..":")

    i = i + 1
end

while true do
    local event = {os.pullEvent("monitor_touch")}
    print("touch event fired")
end

-- do stuff
