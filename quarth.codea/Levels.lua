Levels = class()

function Levels:init(level)
    
    for id,br in ipairs(level) do
        if br == 1 then 
            Shape:MakeL()
        end -- end 1
        if br ==  2 then
            Shape:MakeT()
        end -- end 2
        if br == 3 then
            Shape:MakeM()
        end -- end 3
    end
    -- you can accept and set parameters here

end -- function 

function Levels:uniqueKey(key)
    last = #test + 1
    test[last] = {}
    return test[last]
end

function Levels:draw(_player)
    
    for k,v in ipairs(test) do
        for key,value in ipairs(v) do
        fill(value.color[1], value.color[2], value.color[3])
        rect(value.x, value.y, value.width, value.height)
        value.y = value.y - 1
            end
    end
    -- Codea does not automatically call this method
end

function Levels:touched(touch)
    -- Codea does not automatically call this method
end


function Levels:up(x, y, id, results)
    inx = table_xkeys(test)
    key = math.floor(x) + math.floor(y)
    -- local results = {}
    table.insert(results, {x, y})
    -- appears to be a scope problem
    if inx[key] ~=nil then
        self:up(x, (y + uheight), id, results)
        else
        self:left(x, (y - uheight), id, {})
        self:right(x, (y - uheight), id, {})
        local key2 = x + (y - uheight)
        if inx[key2] ~= nil then
            b = inx[key2][1]
            local l = test[b]
            l.color = 50
            end
        end
    return(results)
end

function Levels:down(x, y, id, results)
    inx = table_xkeys(test)
    key = x + y
    table.insert(results, {x,y})
    if inx[key] ~=nil then
        self:down(x, (y - uheight), id, results)
        else
        local key2 = x + (y + uheight)
        if inx[key2] ~= nil then
            b = inx[key2][1]
            local l = test[b]
            l.color = 200
            end
        end
    return(results)
end

function Levels:left(x, y, id, results)
    inx = table_xkeys(test)
    key = x + y
    table.insert(results, {x, y})
    if inx[key] ~= nil then
        self:left((x - uwidth), y, id, results)
        else
        local key2 = (x + uwidth) + y
        if inx[key2] ~= nil then
            b = inx[key2][1]
            local l = test[b]
            l.color = 200
            end
        end
    return(results)
end

function Levels:right(x, y, id, results)
    inx = table_xkeys(test)
    key = x + y
    table.insert(results, {x, y})
    if inx[key] ~= nil then
        self:right((x + uwidth), y, id, results)
        else
        local key2 = (x - uwidth) + y
        if inx[key2] ~= nil then
        b = inx[key2][1]
        local l = test[b]
        l.color = 200
            end
        end
    return(results)
end

function Levels:fourDirectionsFree(x, y, block)
    if self:ComparePieces(x,y,block) or
   -- if math.floor(block.x) == math.floor(x) and math.floor(block.y) == math.floor(y) or
    self:ComparePieces(x + uwidth, y, block) or
    --math.floor(block.x) == math.floor(x + uwidth) and math.floor(block.y) == math.floor(y) or
    self:ComparePieces(x - uwidth, y, block) or
    -- math.floor(block.x) == math.floor(x - uwidth) and math.floor(block.y) == math.floor(y) or
    self:ComparePieces(x, y - uheight, block) or
    --math.floor(block.x) == math.floor(x) and math.floor(block.y) == math.floor(y - uheight) or
    self:ComparePieces(x, y + uheight, block) then
   -- math.floor(block.x) == math.floor(x) and math.floor(block.y) == math.floor(y + uheight) then
        return false
    end
    
    return true
end

function Levels:ComparePieces(x, y, block)
    xdiff = math.abs(math.floor(block.x - x))
    ydiff = math.abs(math.floor(block.y - y))
    if(xdiff < uwidth * 3 and ydiff < uheight) then
        return true
    end
    
    return false
end

function Levels:freeSpace(x, y, count)
    free = true
    lastShape = null
    for number, shape in pairs(test) do
        if type(shape) == "table" then
            for xkkey, block in pairs(shape) do
                if self:fourDirectionsFree(x, y, block) == false then
                    free = false
                    lastShape = block
                end
            end
        end
    end
    
    if free == true then
        count = count + 1
        if count > 4 then
            freespace = Bricks()
            freespace.x = x - uwidth * count
            freespace.y = HEIGHT
            freespace.id = 2
            return(freespace)
        end
         return(self:freeSpace(math.floor(x + uwidth), HEIGHT, count))
    end
    if free == false then
        return (self:freeSpace(math.floor(x + uwidth * 2), HEIGHT, 0))
    end
end


function Levels:determineFreespot(square)
    x = math.floor(math.random(3,21) * uwidth)
    freespace = self:freeSpace(x,HEIGHT, 0)
    while(freespace == false) do
        if(x < 21 * uwidth) then
            x = math.floor(x + uwidth)
        else
            x = math.floor(3 * uwidth)
        end
            freespace = self:freeSpace(x, HEIGHT, 0)
        end
    return freespace  
end

function Levels:findSomeFreeSpace(shape)
    -- find the top 5 rows
    -- can i do this imperatively?
    check = self:determineFreespot(square)
    if check ~= false then
        return check
    end
    print("default random space returned ")
    randomTopSpace = Bricks()
    randomTopSpace.y = math.floor(HEIGHT - uheight)
    randomTopSpace.x = math.floor(uwidth * math.random(1, 25))
    randomTopSpace.id = math.random(1,20)
    return randomTopSpace
    
    -- return random spot here
    
end
