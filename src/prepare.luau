local args = require("../packages/args/index.luau")
local buildDateDirPath = require("./functions/build-date-dir-path")
local fs = require("@lune/fs")
local loadInputFileText = require("./functions/load-input-file-text")
local process = require("@lune/process")

local parsedArgs = args.parseArgs({
    {
        aliases = { { shortName = "d" } },
        description = "Day number to solve",
        name = "day",
        required = true
    }
})

local dateDirPath = buildDateDirPath(tonumber(parsedArgs.options["day"]))

if not fs.isDir(dateDirPath) then
    fs.writeDir(dateDirPath)
end

if not fs.isFile(dateDirPath .. "/solution.luau") then
    fs.writeFile(dateDirPath .. "/solution.luau", "function parse(inputText: string): any\n\treturn inputText\nend\n\nfunction part1(input: any)\nend\n\nfunction part2(input: any)\nend\n\nreturn {\n\tparse = parse,\n\tpart1 = part1,\n\tpart2 = part2\n}")
end