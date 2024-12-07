local determineYear = require("./determine-year.luau")

return function(day: number): string
    if day < 1 or day > 25 then
        error("Day must be between 1 and 25")
    end

    local dayStr = string.format("%02d", day)

    local year = determineYear()
    local yearStr = string.format("%04d", year)

    return "./years/" .. yearStr .. "/" .. dayStr
end