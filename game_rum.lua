local stt = {}

local menu = require("Menu")
local Enemi = require("enemi")
local Player = require("player")
local inimigo = {}
local palavras = {
    "lua", "sol", "vida", "amor", "paz","ceu","ser","vil","mal","mae","ver","sob", "livro", "sorte", "forca", "verde",
    "tempo", "nuvem", "luz", "brisa", "feliz", "chave", "ponto", "vento", "olhar",
    "risos", "noite", "mundo", "verao", "chuva", "sonho", "carta", "folha",
    "cores", "caminho", "mover", "rapido"
}

local dificeis = {
    "responsável",
    "universidade",
    "oportunidade",
    "planejamento",
    "desenvolvido",
    "administrador",
    "questionamento",
    "comunicadores",
    "relacionamento",
    "transformador"
}




function stt.load()
    math.randomseed(os.time() + love.timer.getTime() * 1000) 
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)]))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)]))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)]))
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
        stt.spanw()

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

function stt.spanw()
    local numD = 0
    if menu.Dificuldade == 1 then
        numD = 700
    elseif menu.Dificuldade == 2 then
        numD = 500
    elseif menu.Dificuldade == 3 then
        numD = 300
    end
    local pontos = Player.pontos/numD
    local inte = math.floor(pontos)
    for i = 1, inte do
        table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)]))
    end
    math.randomseed(os.time() + love.timer.getTime() * 1000) 
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 1))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 2))
    math.randomseed(os.time() + love.timer.getTime() * 1000)
    table.insert(inimigo, Enemi:new(math.random(-1, 1), math.random(-1, 1), palavras[math.random(#palavras)], 3))
end


return stt





