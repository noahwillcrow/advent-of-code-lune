local fs = require("@lune/fs")
local regex = require("@lune/regex")

local pattern = "(?<first>[0-9]+)[ \t]+(?<second>[0-9]+)"
local re = regex.new(pattern)

return function(filePath: string): ({ number }, { number })
    local list1: { number } = {}
    local list2: { number } = {}

    local input = fs.readFile(filePath)
    for line in input:gmatch("[^\n]+") do
        local capture = re:captures(line)
        local num1 = tonumber(capture:get(1).text)
        local num2 = tonumber(capture:get(2).text)
        if num1 and num2 then
            table.insert(list1, num1)
            table.insert(list2, num2)
        end
    end

    return list1, list2
end
