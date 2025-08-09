local menu = {
    JgarImg = love.graphics.newImage("Sprites/Btn_spr.png"), -- Botão de jogar
    objX = 150,
    objY = 150,

    mx = love.mouse.getX(),
    my = love.mouse.getY(),
    inGame = 0,
    estado = "Menu",

    ConfImg = love.graphics.newImage("Sprites/Btn_spr.png"), -- Botão de configuração
    CobjX = 150,
    CobjY = 220,

    ObjBTNX = 0,
    ObjBTNY = 0,


    -- Botão de voltar para o menu
    VMenuX = 695,
    VMenuY = 82,
    VMenuTX = 20,
    VMenuTY = 20,


    -- Botão de dificuldade
    Dific = love.graphics.newImage("Sprites/Btn_spr.png"),
    DobjBtnX = 122,
    DobjBtnY = 92,

    vBtnx = 0,
    vBtny = 0,

    aBtnx = 0,
    aBtny = 0,

    tBtn = 20,
    
    -- ConfDificuldade
    Dificuldade = 2

}

function menu:load()
    self.ObjBTNX = self.JgarImg:getWidth()
    self.ObjBTNY = self.JgarImg:getHeight()


    self.vBtnx = 122-20-20/2
    self.vBtny = 92+self.tBtn/2

    self.aBtnx = self.ObjBTNX+122+20/2
    self.aBtny = 92+self.tBtn/2

    
end

function menu:update()
    self.my = love.mouse.getY()
    self.mx = love.mouse.getX()

    if self.estado == "Menu" then
        if menu:mCon(self.objX, self.objY, self.ObjBTNX, self.ObjBTNY, self.mx, self.my) and love.mouse.isDown(1) then
            self.inGame = 1
            self.estado = "Jogo"
        elseif menu:mCon(self.CobjX, self.CobjY, self.ObjBTNX, self.ObjBTNY, self.mx, self.my) and love.mouse.isDown(1) then
            self.estado = "Config"
        end
    elseif self.estado == "Config" then
        if menu:mCon(self.VMenuX, self.VMenuY, self.VMenuTX, self.VMenuTY, self.mx, self.my) and love.mouse.isDown(1) then
            self.estado = "Menu"
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
        love.graphics.setColor(0, 0, 1)
        love.graphics.rectangle("fill",62, 62, 675, 448)
        love.graphics.setColor(1, 0, 0)
        love.graphics.print("Config", 62, 62)
        love.graphics.rectangle("fill", 675+self.VMenuTX, 62+self.VMenuTY, self.VMenuTX, self.VMenuTY)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.Dific, self.DobjBtnX, self.DobjBtnY)
        love.graphics.rectangle("fill",self.vBtnx, self.vBtny, self.tBtn, self.tBtn)
        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("fill",self.aBtnx, self.aBtny, self.tBtn, self.tBtn)
        love.graphics.setColor(1, 1, 1)
    end
end

function menu:mCon(objx, objy, objTx, objty, mx, my)
    return mx > objx and mx < objx + objTx and my > objy and my < objy + objty
end

return menu
