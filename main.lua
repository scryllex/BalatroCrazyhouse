package.path = package.path
    ..";"..SMODS.current_mod.path.."?.lua"

local dirs = {'scurra', 'house'}
for _, d in ipairs(dirs) do
    local path = "src/"..d.."/"
    local dir = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path..path)
    for _, file in ipairs(dir) do
        assert(SMODS.load_file(path..file))()
    end
end

