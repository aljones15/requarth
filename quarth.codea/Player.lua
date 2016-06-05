Player = class()

function Player:init(x)
    -- you can accept and set parameters here
    self.x = x
    self.y = y
end

function Player:draw()
    fill(228, 255, 0, 255)
    ellipse(self.x, self.y, 40)
    fill(30, 66, 35, 255)
    -- Codea does not automatically call this method
end

function Player:touched(touch)
    -- Codea does not automatically call this method
end
