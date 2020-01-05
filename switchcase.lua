function switch(refVal, ...)
    local cases = {...}
    for i, case in ipairs(cases) do
        if case.key == nil or case.key == refVal then
            return case.handler(table.unpack(case.args))
        end
    end
end

function case(key, handler, ...)
    return {
        key = key,
        handler = handler,
        args = {...}
    }
end

function default(handler, ...)
    return case(nil, handler, ...)
end