return function(list1: { number }, list2: { number }): number
    table.sort(list1)
    table.sort(list2)

    local totalDiff = 0
    for i = 1, #list1 do
        totalDiff = totalDiff + math.abs(list1[i] - list2[i])
    end

    return totalDiff
end