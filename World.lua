World = class()

function World:init()
    -- you can accept and set parameters here
    self.curTranslation = vec2(0,0)
    self.curScale = 1
end

function World:draw()
    -- Codea does not automatically call this method
    pushMatrix()
    translate(self.curTranslation.x,self.curTranslation.y)
    scale(self.curScale)
    strokeWidth(1)
    stroke(0)
    for x = 0,FEILDWIDTH/20 do
        line(FEILDSTART + x*20,0,FEILDSTART + x*20,HEIGHT)
    end
    for y = 0,FEILDHEIGHT//20 do
        line(FEILDSTART,y*20,WIDTH,y*20)
    end
    
    popMatrix()
end

function World:touched(touch)
    -- Codea does not automatically call this method
end

function World:translate(dx,dy)
    self.curTranslation = self.curTranslation + vec2(dx,dy)
end

function World:scale(amount)
    self.curScale = self.curScale + amount
end
