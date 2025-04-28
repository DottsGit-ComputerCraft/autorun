-- Run scripts in workspace/autorun
print("--- Running Autorun Scripts ---")
local autorunDir = "workspace/autorun"
if fs.isDir(autorunDir) then
    local files = fs.list(autorunDir)
    if #files == 0 then
        print("No scripts found in " .. autorunDir)
    else
        print("Found " .. #files .. " item(s) in " .. autorunDir .. ". Attempting to run scripts...")
        for i, filename in ipairs(files) do
            local fullPath = autorunDir .. "/" .. filename -- Construct full path
            if not fs.isDir(fullPath) then -- Make sure it's a file, not a directory
                print("  Running script: " .. fullPath)
                local ok = shell.run(fullPath) -- Run the script
                if not ok then
                    printError("  ERROR: Failed to run script: " .. fullPath)
                end
            else
                 print("  Skipping directory: " .. fullPath)
            end
        end
        print("Finished running autorun scripts.")
    end
else
    print("Autorun directory does not exist: " .. autorunDir)
end

shell.run("cls")
print("CraftOS 1.8 - Dotts's Env")