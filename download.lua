local scripts = {"main", "screen_debug", "download"}

for _, scriptName in pairs(scripts) do
    local data = http.get()
    shell.run("wget https://raw.githubusercontent.com/the-sink/elevator-controller/main/"..scriptName..".lua "..scriptName.."-temp.lua")
    if fs.exists(scriptName.."-temp.lua") then
        fs.delete(scriptName..".lua")
        fs.copy(scriptName.."-temp.lua", scriptName..".lua")
        fs.delete(scriptName.."-temp.lua")
    end
end