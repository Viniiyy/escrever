local inimigo = {}
inimigo.__index = inimigo

function inimigo:new(posicao, palavra, spd)
    local self = setmetatable({}, inimigo)
    self.posicao = posicao
    self.palavra = palavra
    self.spd = spd
    self.x = 20
    self.y = 20
    return self
end


function inimigo:draw()
    love.graphics.print(self.palavra, self.x, self.y-20)
    love.graphics.rectangle("fill", self.x, self.y, 10, 10)
end

function inimigo:muve(dt)
    local targetX = love.graphics.getWidth() / 2
    local targetY = love.graphics.getHeight() / 2

    local dx = targetX - self.x
    local dy = targetY - self.y
    local dist = math.sqrt(dx^2 + dy^2)

    if dist > 1 then
        dx = dx / dist
        dy = dy / dist
        self.x = self.x + dx * self.spd * dt -- velocidade = 100 pixels por segundo
        self.y = self.y + dy * self.spd * dt
    end
end


return inimigo