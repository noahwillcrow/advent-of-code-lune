local datetime = require("@lune/datetime")
local process = require("@lune/process")

return function(): number
    return if process.env.AOC_YEAR then tonumber(process.env.AOC_YEAR) else datetime.now().year
end