mouse = {
    released = {}
}
local menu = {
    timer = 0,
    dificuldade = 1,

    FundoMenu = love.graphics.newImage("Sprites/Fundo_menu_spr.png"),
    fundX = 62,
    fundY = 62,

    JgarImg = love.graphics.newImage("Sprites/Btn_spr.png"), -- Botão de jogar
    objX = 150,
    objY = 150,

    mx = love.mouse.getX(),
    my = love.mouse.getY(),
    inGame = 0,
    estado = "Menu",

    ConfImg = love.graphics.newImage("Sprites/Btn_spr.png"), -- Botão de configuração
    CobjX = 150,
    CobjY = 220,

    -- Botão de sair
    SairImg = love.graphics.newImage("Sprites/Btn_spr.png"),
    SobjX = 150,
    SobjY = 290,


    ObjBTNX = 0,
    ObjBTNY = 0,

    -- Botão de voltar para o menu
    SaiBTN = love.graphics.newImage("Sprites/btn_saida_spr.png"),
    VMenuX = 695,
    VMenuY = 82,
    VMenuTX = 20,
    VMenuTY = 20,

    -- Botão de dificuldade principal
    Dific = love.graphics.newImage("Sprites/Btn_spr.png"),
    DobjBtnX = 122,
    DobjBtnY = 92,

    -- Botão branco (+ dificuldade)
    AddBTN = love.graphics.newImage("Sprites/btn_adicionar_spr.png"),
    vBtnx = 0,
    vBtny = 0,

    -- Botão vermelho (- dificuldade)
    RemBTN = love.graphics.newImage("Sprites/btn_remover_spr.png"),
    aBtnx = 0,
    aBtny = 0,

    tBtn = 20, -- tamanho dos quadradinhos
}

function menu:load()
    self.ObjBTNX = self.JgarImg:getWidth()
    self.ObjBTNY = self.JgarImg:getHeight()

    -- Posição do botão branco (aumentar dificuldade)
    self.vBtnx = 122 - 20 - 20/2
    self.vBtny = 92 + self.tBtn/2

    -- Posição do botão vermelho (diminuir dificuldade)
    self.aBtnx = self.ObjBTNX + 122 + 20/2
    self.aBtny = 92 + self.tBtn/2
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
        elseif menu:mCon(self.SobjX, self.SobjY, self.ObjBTNX, self.ObjBTNY, self.mx, self.my) and love.mouse.isDown(1) then
            love.event.quit()
        end
    elseif self.estado == "Config" then
        -- Botão de voltar
        if menu:mCon(self.VMenuX, self.VMenuY, self.VMenuTX, self.VMenuTY, self.mx, self.my) and love.mouse.isDown(1) then 
            self.estado = "Menu"
        end

        -- Botão branco (+ dificuldade)
        if menu:mCon(self.vBtnx, self.vBtny, self.tBtn, self.tBtn, self.mx, self.my) and love.mouse.isDown(1) and self.timer == 1 then
            self.dificuldade = self.dificuldade - 1
            if self.dificuldade < 1 then
                self.dificuldade = 1
            end
        end

        -- Botão vermelho (- dificuldade)
        if menu:mCon(self.aBtnx, self.aBtny, self.tBtn, self.tBtn, self.mx, self.my) and love.mouse.isDown(1) and self.timer == 1 then
            self.dificuldade = self.dificuldade + 1
            if self.dificuldade > 3 then
                self.dificuldade = 3
            end
        end
        if not love.mouse.isDown(1) then
            self.timer = self.timer + 0.2
            if self.timer > 1 then
                self.timer = 1
            end
        else
            self.timer = 0
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

        love.graphics.draw(self.SairImg, self.SobjX, self.SobjY)
        love.graphics.print("Sair", self.SobjX+45, self.SobjY+12)

    elseif self.estado == "Config" then
        
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.FundoMenu, self.fundX, self.fundY)

        love.graphics.setColor(1, 0, 0) -- botão de voltar
        love.graphics.print("Configuracoes", 70, 67)
        love.graphics.draw(self.SaiBTN, self.VMenuX, self.VMenuY)

        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.Dific, self.DobjBtnX, self.DobjBtnY)

        -- aumenta dificuldade
        love.graphics.draw(self.RemBTN, self.vBtnx, self.vBtny)
        

        -- diminui dificuldade
        love.graphics.draw(self.AddBTN, self.aBtnx, self.aBtny)

        love.graphics.setColor(1, 1, 1)
        if self.dificuldade == 1 then
            love.graphics.print("Facil", self.DobjBtnX+45, self.DobjBtnY+12)
        elseif self.dificuldade == 2 then
            love.graphics.print("Medio", self.DobjBtnX+45, self.DobjBtnY+12)
        elseif self.dificuldade == 3 then
            love.graphics.print("Dificil", self.DobjBtnX+45, self.DobjBtnY+12)
        end
        love.graphics.setColor(1, 1, 1)
    end
end

function menu:mCon(objx, objy, objTx, objty, mx, my)
    return mx > objx and mx < objx + objTx and my > objy and my < objy + objty
end

return menu
