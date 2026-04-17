table.append = function (t, k)
    t[#t+1] = k
end

table.index_of = function (t, k)
    for i = 0, #t do
        if t[i] == k then
            return i
        end
    end
    return -1
end

table.accul = function (t)
    local r = 0
    for k, v in pairs(t) do
        if v then
            r = r + 1
        end
    end
    return r
end

table.keys = function (t)
    local r = {}
    for k, _ in pairs(t) do
        table.append(r, k)
    end
    return r
end

table.remove_value = function (t, ...) -- modifies in place, returns removed indexes
    local m = #t
    local n = select("#", ...)
    local r = {}

    local h = {}
    for i = 1, n do
        h[select(i, ...)] = true
    end
    local c = 1

    for i = 1, m do
        if h[t[i]] then
            r[#r + 1] = i
        else
            t[c] = t[i]
            c = c + 1
        end
    end

    for i = c, m do
        t[i] = nil
    end

    return r
end