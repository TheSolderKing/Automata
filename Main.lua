-- SICK IDEA

-- Use this function to perform your initial setup
function setup()
    FEILDWIDTH = (WIDTH - WIDTH/3.72 )//10 * 10
    FEILDHEIGHT = HEIGHT
    FEILDSTART = WIDTH/3.72
    print(FEILDWIDTH)
    w = World()
    numTouches = 0
    touches = {}
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(252, 252, 252, 255)

    -- This sets the line thickness
    strokeWidth(5)
    sprite("Project:Sidebar",WIDTH/(3.72*2),HEIGHT/2,275,HEIGHT)
    -- Do your drawing here
    fill(0)
    rect(FEILDSTART + FEILDWIDTH,0,10,HEIGHT)  
    w:draw()
    if numTouches == 1 then
    else 
        
    end
end

function touched(t)
    if t.state == BEGAN then
        numTouches = numTouches + 1
        touches[t.id] = t
    elseif t.state == MOVING then
        
    elseif t.state == ENDED then
        numTouches = numTouches - 1
        touches[t.id] = nil
    end
end
