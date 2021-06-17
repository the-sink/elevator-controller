local scripts = {"main", "screen_debug", "download"}

for _, scriptName in pairs(scripts) do
    fs.delete(scriptName..".lua")
    shell.run("wget https://raw.githubusercontent.com/the-sink/elevator-controller/main/"..scriptName..".lua")
end