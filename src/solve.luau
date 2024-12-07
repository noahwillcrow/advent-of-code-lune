local args = require("../packages/args/index.luau")
local buildDateDirPath = require("./functions/build-date-dir-path")
local fs = require("@lune/fs")
local loadInputFileText = require("./functions/load-input-file-text")
local process = require("@lune/process")

type Solution = { parse: (inputText: string) -> any, part1: (input: any) -> any, part2: (input: any) -> any }

local parsedArgs = args.parseArgs({
    {
        aliases = { { shortName = "d" } },
        description = "Day number to solve",
        name = "day",
        required = true
    },
    {
        aliases = { { shortName = "i" } },
        description = "Path to input file to use instead of fetching from internet",
        name = "input-file",
        required = false
    }
})

local day = tonumber(parsedArgs.options["day"])
local dateDirPath = buildDateDirPath(day)
local inputText = loadInputFileText(day, parsedArgs.options["input-file"])

local solution: Solution = require(dateDirPath .. "/solution")
local data = solution.parse(inputText)

print("Part 1:", solution.part1(data))
print("Part 2:", solution.part2(data))
