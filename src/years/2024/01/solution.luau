local loadLists = require("./load-lists")
local part1 = require("./part-1")
local part2 = require("./part-2")

return {
    parse = loadLists,
    part1 = part1,
    part2 = part2
}