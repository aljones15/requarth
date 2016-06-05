Grid = class()

function Grid:init(x)
    grid = {}
    while math.floor(w) < math.floor(WIDTH) do
        if w + uwidth > WIDTH and p < HEIGHT then
            tup = {math.floor(w),math.floor(p)}
            table.insert(grid, tup)
            p = p + uheight
            w = 0
        end
        fill(205, 36, 79, 255)
        tup = {math.floor(w),math.floor(p)}
        table.insert(grid, tup)
        w = w + uwidth
    end
    -- you can accept and set parameters here
    self.x = x
end

function Grid:draw()
    
    
    for l,p in ipairs(grid) do
        stroke(167, 124, 124, 255)
        noFill()
        rect(p[1], p[2], uwidth, uheight)
        fill(106, 84, 170, 255)
    end
    -- Codea does not automatically call this method
end

function Grid:touched(touch)
    -- Codea does not automatically call this method
end
