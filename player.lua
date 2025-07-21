local menu = require("Menu")
local player = {
    vida = 3,
    px = love.graphics.getWidth() / 2 -20/2,
    py = love.graphics.getHeight() / 2 -20/2,
    tx = 20,
    ty = 20,
    imgC = love.graphics.newImage("Sprites/Coracao_spr.png"),
    img = love.graphics.newImage("Sprites/Mago_spr.png"),
    pontos = 0,
    vd = 3,
    blink_timer = 0,   -- tempo restante piscando
    blink_duration = 0.2, -- segundos piscando (200ms)
    mx = 0,
    my = 0,
    Mp = 0,

    balanco = 0,
    std = false
}

function player:load()
    self.vida = 3
    self.pontos = 0
end

function player:update(dt)
    self.balanco = math.sin(love.timer.getTime() * 5) * 0.2

    self.mx = love.mouse.getX()
    self.my = love.mouse.getY()
    if self.vd > self.vida then
        self.blink_timer = self.blink_duration
        self.vd = self.vida
    end

    if self.blink_timer > 0 then
        self.blink_timer = self.blink_timer - dt
    end
    if player:mCon(love.graphics.getWidth() - 50, 10, 25, 25, self.mx, self.my) and love.mouse.isDown(1) then
        menu.inGame = 1
        menu.estado = "Menu"
    end
end

function player:draw()
    if self.blink_timer > 0 then
        love.graphics.setColor(1, 0, 0) -- vermelho
    else
        love.graphics.setColor(1, 1, 1) -- normal
    end
    love.graphics.draw(self.img, self.px-self.tx/2, self.py-self.ty/2, 0, 1, 1, self.tx/2, self.ty/2)
    love.graphics.setColor(1, 1, 1) -- normal
    
    
    if menu.estado == "Jogo" then
        
        love.graphics.printf(self.pontos, 0, 0, love.graphics.getWidth(), "center")
        love.graphics.rectangle("fill", love.graphics.getWidth()-50, 10, 25, 25)
    elseif menu.estado == "Menu" then
        if menu.inGame == 0 then
            love.graphics.setColor(1, 0, 0)
            local font = love.graphics.getFont()
            local largura = font:getWidth(self.Mp)
            local altura = font:getHeight()

            local x = love.graphics.getWidth() / 2
            local y = 11 -- ou 0, se preferir

            love.graphics.push()
            love.graphics.translate(x, y)       -- move para o centro do texto
            love.graphics.rotate(self.balanco)  -- gira
            love.graphics.print(self.Mp, -largura/2, -altura/2) -- desenha centralizado
            love.graphics.pop()

            love.graphics.setColor(1, 1, 1) 
        elseif menu.inGame == 1 then
            love.graphics.setColor(1, 0, 0)
            local font = love.graphics.getFont()
            local largura = font:getWidth(self.Mp)
            local altura = font:getHeight()

            local x = love.graphics.getWidth() / 2
            local y = 30 -- ou 0, se preferir

            love.graphics.push()
            love.graphics.translate(x, y)       -- move para o centro do texto
            love.graphics.rotate(self.balanco)  -- gira
            love.graphics.print(self.Mp, -largura/2, -altura/2) -- desenha centralizado
            love.graphics.pop()


            love.graphics.setColor(1, 1, 1) 
            love.graphics.printf(self.pontos, 0, 0, love.graphics.getWidth(), "center")
        end
    end
    if menu.inGame == 1 then
        
        if self.vida == 3 then
            love.graphics.draw(self.imgC, 25,10,0,0.75,0.75)
            love.graphics.draw(self.imgC, 50,10,0,0.75,0.75)
            love.graphics.draw(self.imgC, 75,10,0,0.75,0.75)
        elseif self.vida == 2 then
            love.graphics.draw(self.imgC, 25,10,0,0.75,0.75)
            love.graphics.draw(self.imgC, 50,10,0,0.75,0.75)
        elseif self.vida == 1 then
            love.graphics.draw(self.imgC, 25,10,0,0.75,0.75)
        end
    end
    
    
end

function player:mCon(objx,objy, objTx, objty, mx, my)
    return mx > objx and mx < objx + objTx and my > objy and my < objy + objty
end

return player