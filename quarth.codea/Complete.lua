Complete = class()

function Complete:init()
    -- you can accept and set parameters here
    outside = {}
    crawled = {}
end

function Complete:walker(bullet, shape)
    if(self:alleven(bullet, shape) == false) then
    inx = table_xkeys(test)
    key = math.floor(bullet.x) + math.floor(bullet.y)
    -- needs to compute line by line perhaps adding x and y values.
    directionchooser = math.random(1,4)
    direction = {}
        if directionchooser == 1 then direction = {uwidth, 0}
            elseif directionchooser == 2 then direction = {-uwidth, 0}
            elseif directionchooser == 3 then direction = {0, uheight}
            elseif directionchooser == 4 then direction = {0, -uheight}
        end
    
        newbullet = Bullet()
        newbullet.x = bullet.x + direction[1]
        newbullet.y = bullet.y + direction[2]
    
    if inx[key] ~= nil then
        table.insert(crawled, bullet)
        --self:alleven()
        self:walker(newbullet, shape)
    
    elseif (outside[bullet.x] == nil) then 
            outside[bullet.x] = {}
        
        
        table.insert(outside[bullet.x], bullet.y)
            print(#crawled)
            self:walker(crawled[1], shape)
        end
        -- self:walker(bullet)
        -- self:walker(newbullet)
        -- make this a class with results and a completion method
        
    end
    return true
end

function Complete:MakeXTable(shape)
    local byX = {}
    for k,v in pairs(shape) do
        if byX[v.x] == null then
            byX[v.x] = {v}
        else
            table.insert(byX[v.x], v)
        end
        
        -- a nulls is complete if it has 2 entries and incomplete if it has > 2
    end
    return byX
end

function Complete:alleven(bullet, shape)
    local nullbottom = 0
    local realbottom = 0
    local xTable = self:MakeXTable(shape)
    local count = 0
    for key, value in pairs(xTable) do
        for key2, value2 in pairs(xTable) do
            if Count(value2) ~= Count(value) then
                return false
            end
        end
    end
    score = score + #shape * 5
    self:newPiece(score)
    return true
end

function Complete:newPiece(score)
    newpieces = math.ceil(score / 1000)
    while newpieces > 0 do
    Levels({math.random(1,3)})
        newpieces = newpieces - 1
        end
end

function Complete:offScreen()
    for number, shape in pairs(test) do
        if type(shape) == "table" then
            for xkkey, block in pairs(shape) do
                if block.y < 0 then
                    table.remove(test, number)
                end
                end
            end
        end
    
end

function Complete:GameOver()
    self:offScreen()
    if Count(test) == 0 then
        fill(255, 0, 60, 255)
    text("Game Over", WIDTH/2, HEIGHT/2)
        return true
    end
    return false
end

function Complete:delete()
    print("deleting")
end
