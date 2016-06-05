Bricks = class()
-- use math.floor to round down floats

function Bricks:init()
    form = {}
    -- you can accept and set parameters here
    -- x and y are randoms in the top of the screen
    -- width and heigh are randoms in a certian amount
    self.x = 10
    t = false
    while t == false do
    picker = math.random(1, #grid)
    p = grid[picker]
        if p[2] > 300 then
            t = true
        end
    end
    self.x = p[1]
    self.y = p[2]
    self.width = uwidth
    self.height = uheight
    self.color = {255, 30, 10, 1}
    self.id = 0
    box = {self.x, self.y, self.width, self.height}
    table.insert(form, box)
    -- print(picker)
    -- print(marker[1])
end

function Bricks:isTarget(_player)
    print(self.x)
    return true
end

function Bricks:draw()
    -- how to draw from grid?
    fill(255, 166, 0, 255)
    v = form[1]
    rect(self.x, self.y, self.width, self.height)
    fill(30, 66, 35, 255)
    -- Codea does not automatically call this method
end

function Bricks:rotate(shape)
    middle = self:findMiddle(shape)
    -- will need to rotate the entire brick 90 degrees
    -- math.pi
    -- degrees = radians * (180 / math.pi)
    -- radians = degree * (math.pi / 180)
end

function Bricks:findMiddle(shape)
    -- find the middle brick and chart the circle from there
    
    return true
end

function Bricks:touched(touch)
    -- Codea does not automatically call this method
end

function Bricks:collide()
    -- collision code here
end
