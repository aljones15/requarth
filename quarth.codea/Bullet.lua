Bullet = class()

function Bullet:init()
    -- you can accept and set parameters here
    self.x = x
    self.y = y
    self.width = uwidth
    self.height = uheight
    self.stop = false
    self.color = 300
    self.id = 0
end

function Bullet:draw()
    -- Codea does not automatically call this method
    stroke(172, 166, 166, 255)
    fill(163, 96, 110, 255)
    rect(self.x, self.y, self.width, self.height)
    fill(30, 66, 35, 255)
end

function Bullet:touched(touch)
    -- Codea does not automatically call this method
end

function Bullet:marker(m)
    marker = #m
    if marker > 1 then
        marker = marker - 1
    end
    return(m[marker])
    end

function Bullet:collide(k)
    for n, b in pairs(test) do
        for key, brick in pairs(b) do  
        -- tried self.x + 1 and b.width - 1
        -- problem is with how the grid is constructed.
        -- possibly a float rounding error
        if (math.floor(self.x + 1) >= math.floor(brick.x))
                 and (self.x + 1 < (brick.x + brick.width)) then 
            if math.floor(self.y) >= math.floor(brick.y)
                     and math.floor(self.y) < math.floor(brick.y + uheight) then
                self.stop = true
                self.x = brick.x
                self.y = brick.y - uheight
                self.id = brick.id
                self.color = {120, 25, 10, 2}
                self:insert(self, brick, b)
                    brick.color = {30, 205, 10, 1}
                
                        break
                end
            end
                
        end  -- end second for
        end -- end first for loop
        
end -- end function

function Bullet:insert(bullet, brick, shape)
    shapeTable = table_invert(shape)
    if shapeTable[self] == nil then
        table.insert(shape, bullet)
        local finder = table_invert(bullets)
        local s = finder[self]
        table.remove(bullets, s)
    end
    finished = Complete()
    if(finished:alleven(self, shape) == true) then
        local remover = table_invert(test)
        local place = remover[shape]
        table.remove(test, place)
        else
        -- rotate here if the piece is a rotator
            Shape:rotate(shape)
    end

end

function Bullet:pop(self)
    -- need to replace with a walker
    up = newlevel:up(self.x, self.y, self.id, {})
    local marker = Bullet:marker(up)
    upleft = newlevel:left(marker[1], marker[2], self.id, {})
    upright = newlevel:right(marker[1], marker[2], self.id, {})
    local marker = Bullet:marker(upleft)
    downleft = newlevel:down(marker[1], marker[2], self.id, {})
    local marker = Bullet:marker(upright)
    downright = newlevel:down(marker[1], marker[2], self.id, {})
    local marker = Bullet:marker(downright)
    dright = newlevel:right(marker[1], marker[2], self.id, {})
    dleft = newlevel:left(marker[1], marker[2], self.id, {})
    local marker = Bullet:marker(downleft)
    dleftright = newlevel:right(marker[1], marker[2], self.id, {})
    dleftleft = newlevel:left(marker[1], marker[2], self.id, {})
    if (#downleft == #downright) then
    if (#upleft + #upright) == (#dright + #dleft) and (#upleft + #upright) == (#dleftright + #dleftleft) then
            complete = {}
            for k,v in ipairs(downleft) do
            table.insert(complete, {v[1] + uwidth, v[2]})
            end
            Bullet:complete(complete)
            Bullet:complete(downleft)
            Bullet:complete(downright)
            Bullet:complete(up)
            levels = {1,2}
            
      end      
    end
end

function Bullet:complete(result)
        for k,v in ipairs(result) do
                local remover = table_xkeys(test)
                local place = remover[v[1]+v[2]]
                if not(place == nill) then
                table.remove(test, place[1])
                    end
            end
        end

function Bullet:top(k)
    if self.y > HEIGHT then
        local finder = table_invert(bullets)
        local k = finder[self]
        table.remove(bullets, k)
    end
end
