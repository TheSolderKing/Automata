Sidebar = class()

function Sidebar:init()
    -- you can accept and set parameters here
    self.buttons = {
    Button(FIELDSTART/2+45,5+FIELDHEIGHT/10,FIELDSTART/2,FIELDHEIGHT/5-5,"RED",color(255,0,0)),
    Button(FIELDSTART/2+45,5+3*FIELDHEIGHT/10,FIELDSTART/2,FIELDHEIGHT/5-5,"GREEN",color(0,255,0)),
    Button(FIELDSTART/2+45,5+5*FIELDHEIGHT/10,FIELDSTART/2,FIELDHEIGHT/5-5,"BLUE",color(0,0,255)),
    Button(FIELDSTART/2+45,5+7*FIELDHEIGHT/10,FIELDSTART/2,FIELDHEIGHT/5-5,"WHITE",color(255,255,255)),
    }
    self.buttons[4]:select()
end

function Sidebar:draw()
    -- Codea does not automatically call this method
    sprite("Project:Sidebar",WIDTH/(3.72*2),HEIGHT/2,275,HEIGHT)
    for i,v in pairs(self.buttons) do
        v:draw()
    end
end

function Sidebar:touched(touch)
    -- Codea does not automatically call this method
    for i,v in pairs(self.buttons) do
        local t = v:touched(touch)
        if t == true then
            self:deselectAll()
            v:select()
        end
    end
end

function Sidebar:deselectAll()
    for i,v in pairs(self.buttons) do
        v:deselect()
    end
end

function Sidebar:getSelected()
    for i,v in pairs(self.buttons) do
        if v.selected then
            return v.text
        end
    end
end
