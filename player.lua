local player = {
    vida = 3,
    px = love.graphics.getWidth() / 2 -20/2,
    py = love.graphics.getHeight() / 2 -20/2,
    tx = 20,
    ty = 20,

    pontos = 0
}

function player:draw()
    if self.vida == 3 then
        love.graphics.rectangle("fill", 0, 5, 5, 5)
        love.graphics.rectangle("fill", 10, 5, 5, 5)
        love.graphics.rectangle("fill", 20, 5, 5, 5)
    elseif self.vida == 2 then
        love.graphics.rectangle("fill", 0, 5, 5, 5)
        love.graphics.rectangle("fill", 10, 5, 5, 5)
    elseif self.vida == 1 then
        love.graphics.rectangle("fill", 0, 5, 5, 5)
    end
    love.graphics.printf(self.pontos, 0, 0, love.graphics.getWidth(), "center")
    love.graphics.rectangle("fill", self.px, self.py, self.tx, self.ty)
end


return player