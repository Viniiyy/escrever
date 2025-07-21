
local menu = {
    JgarImg = love.graphics.newImage("Sprites/Btn_spr.png"),
    objX = 150,
    objY = 150,
    objJMX = 0,
    objJMY = 0,


    mx = love.mouse.getX(),
    my = love.mouse.getY(),
    inGame = 0,
    estado = "Menu",


    ConfImg = love.graphics.newImage("Sprites/Btn_spr.png"),
    CobjX = 150,
    CobjY = 300,
    CobjJMX = 0,
    CobjJMY = 0,
    
}
function menu:load()
    self.objJMX = self.JgarImg:getWidth()
    self.objJMY = self.JgarImg:getHeight()
end

function menu:update()
    
    self.my = love.mouse.getY()
    self.mx = love.mouse.getX()
    if self.estado == "Menu" then

        if menu:mCon(self.objX, self.objY, self.objJMX, self.objJMY, self.mx, self.my) and love.mouse.isDown(1) then
            self.inGame = 1
            self.estado = "Jogo"
        elseif menu:mCon(self.CobjX, self.CobjY, self.CobjJMX, self.CobjJMY, self.mx, self.my) and love.mouse.isDown(1) then
            self.estado = "Config"
        end

    end
    
end

function menu:draw()
    
    if self.estado == "Menu" then
        love.graphics.rectangle("fill",125, 125, 200, 250)
        
        love.graphics.draw(self.JgarImg, self.objX, self.objY)
        love.graphics.print("Jogar", self.objX+45, self.objY+12)
        love.graphics.draw(self.ConfImg, self.CobjX, self.CobjY)
        love.graphics.print("Config", self.CobjX+45, self.CobjY+12)
    elseif self.estado == "Config" then

    end
end

function menu:mCon(objx,objy, objTx, objty, mx, my)
    return mx > objx and mx < objx + objTx and my > objy and my < objy + objty
end

return menu