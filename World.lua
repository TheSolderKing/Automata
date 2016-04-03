World = class()

function World:init(sidebar)
    -- you can accept and set parameters here
    self.curTranslation = vec2(0,0)
    self.curScale = 1
    self.sidebar = sidebar
    self.colIds = {WHITE = 0,BLUE = 1,GREEN = 2,RED = 3}
    self.colVals = {WHITE = color(255),BLUE = color(0,0,255),RED = color(255,0,0), GREEN = color(0,255,0)}
    self.mesh = mesh()
    self.map = {}
    for x = 1,FIELDWIDTH//20+1 do
        self.map[x] = {}
        for y = 1,FIELDHEIGHT//20+1 do
            self.map[x][y] = self.colIds["WHITE"]
            local i = self.mesh:addRect(FIELDSTART + (x-1)*20+10,(y-1)*20+10,20,20)
            self.mesh:setRectColor(i,self.colVals["WHITE"])
            print(x .. "," .. y .. ":" .. i)
        end
    end
end

function World:draw()
    -- Codea does not automatically call this method
    pushMatrix()
    translate(self.curTranslation.x,self.curTranslation.y)
    scale(self.curScale)
    self.mesh:draw()
    strokeWidth(1)
    stroke(0)
    for x = 0,FIELDWIDTH//20 do
        line(FIELDSTART + x*20,0,FIELDSTART + x*20,HEIGHT)
    end
    for y = 0,FIELDHEIGHT//20 do
        line(FIELDSTART,y*20,WIDTH,y*20)
    end
    popMatrix()
end

function World:touched(touch)
    -- Codea does not automatically call this method
    if touch.x > FIELDSTART and touch.x < WIDTH and touch.y > 0 and touch.y < HEIGHT and touch.state == ENDED then
        self:change((touch.x-FIELDSTART)//(20)+1,(touch.y)//(20)+1)
    end
end

function World:change(x,y)
   self.map[x][y] = self.colIds[s:getSelected()] 
    local i = y + (x-1) * (FIELDHEIGHT//20+1)
    self.mesh:setRectColor(i,self.colVals[s:getSelected()])
end

function World:translate(dx,dy)
    self.curTranslation = self.curTranslation + vec2(dx,dy)
end

function World:scale(amount)
    self.curScale = self.curScale + amount
end
