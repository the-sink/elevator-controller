local peripherals = peripheral.getNames()

for _, name in pairs(peripherals) do
    if string.find(name, "monitor") then
        local monitor = peripheral.wrap(name)
        monitor.clear()
        monitor.setTextScale(0.5)
        monitor.setCursorPos(1, 1)
        monitor.write(string.sub(name, -1))
        print(name)
    end
end
