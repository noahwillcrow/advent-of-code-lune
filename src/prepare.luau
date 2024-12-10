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
    },
    {
        aliases = { { shortName = "t" } },
        description = "The type of the parsed input (defaults to any)",
        name = "type",
        required = false
    }
})

local dateDirPath = buildDateDirPath(tonumber(parsedArgs.options["day"]))

if not fs.isDir(dateDirPath) then
    fs.writeDir(dateDirPath)
end

if not fs.isFile(dateDirPath .. "/solution.luau") then
    local parsedType = parsedArgs.options["type"] or "any"
    local fileContent = table.concat({
        "type Input = " .. parsedType,
        "function parse(inputText: string): Input",
        "\treturn inputText",
        "end",
        "",
        "function part1(input: Input)",
        "end",
        "",
        "function part2(input: Input)",
        "end",
        "",
        "return {",
        "\tparse = parse,",
        "\tpart1 = part1,",
        "\tpart2 = part2",
        "}"
    }, "\n")
    fs.writeFile(dateDirPath .. "/solution.luau", fileContent)
end