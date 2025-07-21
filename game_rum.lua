local stt = {}

local menu = require("Menu")
local Enemi = require("enemi")
local Player = require("player")
local inimigo = {}
local palavras = {
    "lua", "sol", "vida", "amor", "paz","ceu","ser","vil","mal","mae","ver","sob", "livro", "sorte", "forca", "verde",
    "tempo", "nuvem", "luz", "brisa", "feliz", "chave", "ponto", "vento", "olhar",
    "risos", "noite", "mundo", "verao", "chuva", "sonho", "carta", "folha",
    "cores", "caminho", "mover", "rapido","testicular","torcion"
}

local dificeis = {
    "inconstitucionalmente",
    "anticonstitucionalismo",
    "desproporcionalidade",
    "desorganizacao",
    "irresponsabilidade",
    "extraordinariamente",
    "compartimentalizacao",
    "transcontinentalismo",
    "interdisciplinaridade",
    "incompatibilidade"
}


function stt.load()
    math.randomseed(os.time() + love.timer.getTime() * 1000) 
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], math.random(10, 50)))
    Player:load()
end


function stt.update(dt)
    Player:update(dt)
    for  _, o in ipairs(inimigo) do
        stt.verifPos()
        o:muve(dt)
        if Player.vida == 0 then
            table.remove(inimigo, _)
        end
        if o.dead then
            table.remove(inimigo, _)
        end
    end
    if Player.vida == 0 then
        menu.estado = "Menu"
        menu.inGame = 0
        Player:load()
        stt.load()
    end
    if Player.pontos > Player.Mp then
        Player.Mp = Player.pontos
    end
    if #inimigo == 0 then
        Player.vida = Player.vida + 1
        if Player.vida > 3 then
            Player.vida = 3
        end
        if Player.pontos >= -100000 and Player.pontos < 300  then
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 1))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 2))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 3))
        elseif Player.pontos >= 300 and Player.pontos < 500 then
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 1))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 2))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 3))
        elseif Player.pontos >= 500 and Player.pontos < 600 then
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 1))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 2))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 3))
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 4))
        elseif Player.pontos >= 600 then
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 1))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 2))
            math.randomseed(os.time() + love.timer.getTime() * 1000)
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 3))
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), dificeis[math.random(#dificeis)], 4))
        end

        if Player.pontos > 1000 then
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#dificeis)]))
        end
    end
    
end


function stt.draw(dt)
    Player:draw(dt)
    if menu.inGame == 1 then
        for  _, o in ipairs(inimigo) do
            o:draw(dt)
        end
    end
    
end

function stt.verifPos()
    for i = 1, #inimigo do
        for j = i + 1, #inimigo do
            if inimigo[i].rpx == inimigo[j].rpx and inimigo[i].rpy == inimigo[j].rpy then
                inimigo[j].rpx = math.random(-1, 1)
                inimigo[j].rpy = math.random(-1, 1)
                inimigo[j]:position()
            end
        end
    end
end


function stt.keys(key)
    for  _, o in ipairs(inimigo) do
        o:palavras(key)
    end
end


return stt