Shape = class()

function Shape:init(x, index)
    -- you can accept and set parameters here
    placeinTest = index
end

function Shape:draw()
    -- Codea does not automatically call this method
end

function Shape:touched(touch)
    -- Codea does not automatically call this method
end

function Shape:rotate(shape, angle)
    for key, brick in ipairs(shape) do
        rotate(30, brick.x, brick.y)
    end
    
end

function Shape:getData(index)
    return test[index]
end

function Shape:MakeL()
    local d = math.random(1,20)
    onearray = Levels:uniqueKey(d)
    one = Levels:findSomeFreeSpace("one")
    -- one.x = 0
    -- one.y = math.floor(HEIGHT - uheight)
    -- one.id = d
    table.insert(onearray, one)
    two = Bricks()
    two.x = math.floor(one.x)
    two.y = math.floor(one.y) - uheight
    two.id = d
    table.insert(onearray, two)
    thr = Bricks()
    thr.x = two.x
    thr.y = two.y - uheight
    thr.id = d
    table.insert(onearray, thr)
    four = Bricks()
    four.x = one.x - uwidth
    four.y = one.y
    four.id = d
    table.insert(onearray, four)
    return onearray
end

function Shape:MakeT()
    twoarray = Levels:uniqueKey()
    local d = math.random(1,20)
    one = Levels:findSomeFreeSpace("two")
    table.insert(twoarray, one)
    two = Bricks()
    two.x = one.x + uwidth
    two.y = one.y
    two.id = d
    table.insert(twoarray, two)
    three = Bricks()
    three.x = one.x + uwidth * 2
    three.y = one.y
    three.id = d
    table.insert(twoarray, three)
    four = Bricks()
    four.x = one.x + uwidth
    four.y = one.y - uheight
    four.id = d
    table.insert(twoarray, four)
    return twoarray
end

function Shape:MakeM()
    threearray = Levels:uniqueKey()
    local d = 3
    one = Levels:findSomeFreeSpace("three")
    table.insert(threearray, one)
    two = Bricks()
    two.x = one.x + uwidth
    two.y = one.y
    two.id = d
    table.insert(threearray, two)
    three = Bricks()
    three.x = two.x + uwidth
    three.y = one.y
    three.id = d
    table.insert(threearray, three)
    four = Bricks()
    four.x = three.x + uwidth
    four.y = one.y
    four.id = d
    table.insert(threearray, four)
    oned1 = Bricks()
    oned1.x = one.x
    oned1.y = one.y - uheight
    oned1.id = d
    table.insert(threearray, oned1)
    oned2 = Bricks()
    oned2.x = one.x
    oned2.y = oned1.y - uheight
    oned2.id = d
    table.insert(threearray, oned2)
    fourd1 = Bricks()
    fourd1.x = four.x
    fourd1.y = four.y - uheight
    fourd1.id = d
    table.insert(threearray, fourd1)
    fourd2 = Bricks()
    fourd2.x = four.x
    fourd2.y = fourd1.y - uheight
    fourd2.id = d
    table.insert(threearray, fourd2)
    return threearray
end
