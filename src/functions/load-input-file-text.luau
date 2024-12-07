local buildDateDirPath = require("./build-date-dir-path")
local fs = require("@lune/fs")
local net = require("@lune/net")
local process = require("@lune/process")

return function(day: number, inputFilePath: string?): string
    if not inputFilePath then
        inputFilePath = buildDateDirPath(day) .. "/input.txt"
        
        if not fs.isFile(inputFilePath) then
            local sessionCookie = process.env["AOC_SESSION_COOKIE"]
            if not sessionCookie then
                error("Missing AOC_SESSION_COOKIE environment variable")
            end

            local response = net.request({
                url = "https://adventofcode.com/" .. process.env.year .. "/day/" .. day .. "/input",
                method = "GET",
                headers = { Cookie = "session=" .. sessionCookie }
            })
            if not response.ok then
                error("Failed to fetch input file: " .. response.body)
            end

            fs.writeFile(inputFilePath, response.body)
            return response.body
        end
    end

    return fs.readFile(inputFilePath)
end