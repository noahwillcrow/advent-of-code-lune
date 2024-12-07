return function(list1: { number }, list2: { number }): number
    local list2AppearancesForList1Entries: {[number]: number} = {}
    for _, num in list1 do
        list2AppearancesForList1Entries[num] = 0
    end

    for _, num in list2 do
        if list2AppearancesForList1Entries[num] ~= nil then
            list2AppearancesForList1Entries[num] = list2AppearancesForList1Entries[num] + 1
        end
    end

    local totalScore = 0
    for a, b in pairs(list2AppearancesForList1Entries) do
        totalScore = totalScore + a * b
    end

    return totalScore
end