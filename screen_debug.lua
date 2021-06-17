local peripherals = peripheral.getNames()

for _, name in pairs(peripherals) do
    if string.find(name, "monitor") then
        local monitor = peripheral.wrap(name)
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write(name)
        print(name)
    end
end