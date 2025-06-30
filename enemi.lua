local player = require("player")
local inimigo = {}
inimigo.__index = inimigo

function inimigo:new(rpx, rpy, palavra, id)
    local self = setmetatable({}, inimigo)
    self.id = id
    self.rpx = rpx
    self.rpy = rpy
    self.palavra = palavra
    self.spd = 100
    self.Fspd = 7
    self.x = 20
    self.y = 20
    self.Dpontos = 0
    self.dead = false
    self.pLetra = 1 -- a primeira letra da palavra
    self.letraCerta = self.palavra:sub(self.pLetra, self.pLetra) -- a letra que precisa ser pressionada
    self.mLetra = self.palavra:sub(self.pLetra, self.pLetra) -- a letra que vai ser mostrada
    self:balanceamento()
    self:position() -- <- corrigido aqui
    return self
end


function inimigo:draw()
    love.graphics.print(self.mLetra, self.x, self.y - 40)
    love.graphics.print(self.palavra, self.x, self.y - 20)
    love.graphics.rectangle("fill", self.x-5, self.y-5, 10, 10)
end

function inimigo:muve(dt)
    local targetX = love.graphics.getWidth() / 2
    local targetY = love.graphics.getHeight() / 2

    local dx = targetX - self.x
    local dy = targetY - self.y
    local dist = math.sqrt(dx^2 + dy^2)

    if dist > 18 then
        dx = dx / dist
        dy = dy / dist
        self.x = self.x + dx * self.spd * dt
        self.y = self.y + dy * self.spd * dt
    elseif dist <= 18 then
        if self.palavra:len() == 1 then
            player.pontos = player.pontos - 20
        elseif self.palavra:len() > 1 and self.palavra:len() <= 3 then
            player.pontos = player.pontos - 25
        elseif self.palavra:len() > 3 and self.palavra:len() <= 5 then
            player.pontos = player.pontos - 30
        elseif self.palavra:len() > 5 and self.palavra:len() <= 7 then
            player.pontos = player.pontos - 35
        elseif self.palavra:len() > 7 then
            player.pontos = player.pontos - 40
        end
        player.vida = player.vida - 1
        self.dead = true
    end
end

function inimigo:position()
    if self.rpx == -1 then
        self.x = 0
    elseif self.rpx == 0 then
        self.x = love.graphics.getWidth() / 2
    elseif self.rpx == 1 then
        self.x = love.graphics.getWidth()
    end

    if self.rpy == -1 then
        self.y = 0
    elseif self.rpy == 0 then
        self.y = love.graphics.getHeight() / 2
    elseif self.rpy == 1 then
        self.y = love.graphics.getHeight()
    end

    if self.rpx == 0 and self.rpy == 0 then
        self.rpx = math.random(-1, 1)
        self.rpy = math.random(-1, 1)
        self:position()
    end
end

function inimigo:palavras(key)
    self.letraCerta = self.palavra:sub(self.pLetra, self.pLetra)
    if key == self.letraCerta then
        self.pLetra = self.pLetra + 1
        self.mLetra = self.palavra:sub(self.pLetra, self.pLetra)
    elseif key ~= self.letraCerta then
        self.pLetra = 1
        self.mLetra = self.palavra:sub(self.pLetra, self.pLetra)
    end
    if self.pLetra > self.palavra:len() then
        player.pontos = player.pontos + self.Dpontos
        self.dead = true
    end
end


function inimigo:balanceamento()
    local PalavraT = self.palavra:len()
    self.spd = self.spd - (PalavraT * self.Fspd)
    self.Dpontos = self.Dpontos + (PalavraT * self.Fspd)
    if self.spd < 20 then
        self.spd = 20
    end
    if self.Dpontos > 100 then
        self.Dpontos = 100
    end
end



return inimigo
