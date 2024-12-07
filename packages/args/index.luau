local process = require("@lune/process")

type OptionAlias = {
    longName: string,
} | {
    shortName: string,
}

type Option = {
    aliases: { OptionAlias },
    description: string,
    name: string,
    required: boolean
}

type ArgsParseResult = { options: { [string]: string }, otherArgs: { string } }

function parseArgs(optionDefinitions: { Option }): ArgsParseResult
    local optionAliasToOptionName: { [string]: string } = {}
    
    for _, option in optionDefinitions do
        optionAliasToOptionName["--" .. option.name] = option.name

        for _, alias in option.aliases do
            if alias.longName then
                optionAliasToOptionName["--" .. alias.longName] = option.name
            elseif alias.shortName then
                optionAliasToOptionName["-" .. alias.shortName] = option.name
            end
        end
    end

    local optionValues: { [string]: string } = {}
    local otherValues: { string } = {}

    for i = 1, #process.args do
        local arg = process.args[i]
        if optionAliasToOptionName[arg] then
            local optionName = optionAliasToOptionName[arg]
            if optionValues[optionName] then
                error("Duplicate option: " .. arg)
            end
            if i + 1 > #process.args then
                error("Missing value for option: " .. arg)
            end
            optionValues[optionName] = process.args[i + 1]
            i = i + 1
        else
            table.insert(otherValues, arg)
        end
    end

    for _, option in optionDefinitions do
        if option.required and optionValues[option.name] == nil then
            error("Missing required option: " .. option.name)
        end
    end

    return { options = optionValues, otherArgs = otherValues }
end

return {
    parseArgs = parseArgs
}
