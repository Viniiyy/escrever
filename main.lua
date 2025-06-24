local Enemi = require("enemi")
local inimigo = {}
local palavras = {"hello", "world", "lua", "programming", "fun"}

function love.load()
    math.randomseed(os.time() + love.timer.getTime() * 3000)
    table.insert(inimigo, Enemi:new(math.random(1, 8), palavras[math.random(#palavras)], math.random(10, 100)))
end

function love.update(dt)
    for  _, o in ipairs(inimigo) do
        o:muve(dt)
    end
    
end

function love.draw()
    for  _, o in ipairs(inimigo) do
        o:draw(dt)
    end
end