-- quarth
-- move a circle around bottom of screen
-- use a basic binary array to make tetris blocks

function setup()
    X = 50
    xkeys = {}
    ykeys = {}
    bx = 0
    uwidth = math.floor(WIDTH/25)
    uheight = math.floor(HEIGHT/25)
    bullets = {}
    moving = false
    stopped = {}
    ex = Player()
    ex.x = 20
    ex.y = 50
    test = {}
    i = 0
    p = 0
    w = 0
    ras = 0
    grd = Grid()
    higher = {}
    l = {1,2,3}
    newlevel = Levels(l)
    results = {}
    score = 0
    
end -- end set up

function Count(tab)
    local count = 0
    for _ in pairs(tab) do 
        count = count + 1
    end
    return count
end

function table_invert(t)
   local s={}
   for k,v in ipairs(t) do
     s[v]=k
   end
   return s
end

function table_xkeys(t)
    local s={}
    for k,v in pairs(t) do
        if type(v) == "table" then
            for index, brick in ipairs(v) do
                s[k] = {}
                key = math.floor(brick.x + brick.y)
                s[k][key] = brick
            end
            else
            key = v.x + v.y
            s[key]= {k, v.x, v.y}
        end
        
    end
    return s
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end


function touched(touch)
    -- If the user drags their finger we'll
    --  update the number slider controlling 'X'
    -- This shows how code can affect parameter widgets
    if touch.state == MOVING then
        if touch.y < 100 then
            X = touch.x
            end
        -- needs to only update on new touch
        if touch.y > 100 then
            -- print(touch.id)
            -- moving is there to restruct updates
            -- lets restrict the numner of bullets to 5 at a time
            -- to do this we need to change bullets to a table
            if moving == false then
                bx = touch.x
                end
            end
            -- create small square at y 100 x value and translate up
            -- add to a list that then draws them.
            --end
    end
    if touch.state == ENDED and touch.y > 100 then
        t = touch.id
        t = Bullet()
        newx = 0
        for k,p in ipairs (grid) do
            if touch.x and ex.x > p[1] and touch.x and ex.x < (p[1] + uwidth) then
                newx = p[1]
            end
        end
        t.x = newx
        t.y = 100
        table.insert(bullets, t)
        if moving == false then
        bx = X
        moving = true
        end
    end
end

-- This function gets called once every frame
-- need a bullet function
function draw()
    
    -- check for new stopped and then check for completion
   -- for k, b in ipairs(test) do
        -- newlevel:solved(b.x, b,y)
       -- end
    background(40, 40, 50)
    -- This sets the line thickness
    strokeWidth(5)
    -- start my code
   -- grd:draw()
    
    fill(97, 229, 89, 255)
    player = ellipse(X,50,79)
    ex.x = X
    ex.y = 50
    ex:draw()
    newlevel:draw(ex)
    for k,x in ipairs(bullets) do
            x:draw()
            x:collide(k)
            x:top(k)
            if x.y < HEIGHT and x.stop == false then
            round = math.floor(x.y * 0.02)
            i = 0
            while i < round do
            x.y = x.y + 1
            x:collide()
                if x.stop == true then
                    i = round
                end
            i = i + 1  
            end -- end i while loop
                x:draw()
            end
               
        end -- end bullets check
    fill(255, 255, 255, 255)
    fontSize(35)
    text(score, WIDTH - 50, HEIGHT - 25)
    fill(5, 5, 5, 255)
    Complete:GameOver()
    
    
    -- Do your drawing here
    
end

