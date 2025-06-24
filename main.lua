local Enemi = require("enemi")
local inimigo = {}
local palavras = {"ola", "mundo", "lua", "programacao", "e", "divertida", "como", "voce", "esta", "meu", "bem"}

function love.load()
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[4], math.random(10, 50)))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
end

function love.update(dt)
    for  _, o in ipairs(inimigo) do
        o:muve(dt)
        if o.dead then
            table.remove(inimigo, _)
        end
    end
    if #inimigo == 0 then
        math.randomseed(os.time() + love.timer.getTime() * 1000)
        table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
        math.randomseed(os.time() + love.timer.getTime() * 1000)
        table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
        math.randomseed(os.time() + love.timer.getTime() * 1000)
        table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
    end
end

local agora = ""

function love.draw()
    love.graphics.print("".. palavras[1], 20, 20)
    love.graphics.print("".. agora, 20, 40)
    for  _, o in ipairs(inimigo) do
        o:draw(dt)
    end
end


function love.keypressed(key)
    for  _, o in ipairs(inimigo) do
        o:palavras(key)
    end
end