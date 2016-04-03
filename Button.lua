Button = class()

function Button:init(x,y,w,h,tex,col)
    -- you can accept and set parameters here
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.text = tex
    self.color = col
    self.selected = false
end

function Button:draw()
    -- Codea does not automatically call this method
    noStroke()
    fill(self.color)
    if self.selected then
        rect(self.x-self.w/2-5,self.y-self.h/2-5,self.w+10,self.h+10)
    end
    rect(self.x-self.w/2,self.y-self.h/2,self.w,self.h)
    fill(0, 0, 0, 255)
    font("AmericanTypewriter-Bold")
    text(self.text,self.x,self.y)
end

function Button:touched(touch)
    -- Codea does not automatically call this method
    if touch.x > self.x - self.w/2 and touch.x < self.x + self.w/2 and touch.y > self.y - self.h/2 and touch.y < self.y + self.h/2 and touch.state == ENDED then
        print(true)
        return true
    end
end

function Button:deselect()
    self.selected = false
end

function Button:select()
    self.selected = true
end
