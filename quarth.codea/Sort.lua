Sort = class()

function Sort:init(x)
    -- you can accept and set parameters here
    self.x = x
end

function Sort:byX(_table)
    local _max = 0
    function f(first, _t)
        if first.x > _max then
            _max = first.x
            return true
        end
        return false
    end
    return table.sort(_table, f)
end

function Sort:draw()
    -- Codea does not automatically call this method
end

function Sort:touched(touch)
    -- Codea does not automatically call this method
end
