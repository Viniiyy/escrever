local stt = {}

local menu = require("Menu")
local Enemi = require("enemi")
local Player = require("player")
local inimigo = {}
-- Nível Facil
local palavrasF = {
    "lua", "sol", "vida", "amor", "paz","ceu","ser","vil","mal","mae","ver","sob", 
    "livro", "sorte", "forca", "verde",
    "tempo", "nuvem", "luz", "brisa", "feliz", "chave", "ponto", "vento", "olhar",
    "risos", "noite", "mundo", "verao", "chuva", "sonho", "carta", "folha",
    "cores", "caminho", "mover", "rapido"
}

local dificeisF = {
    "trabalho",
    "professor",
    "computador",
    "telefone",
    "brinquedo",
    "escola",
    "cidade",
    "pessoa",
    "amigo",
    "familia"
}

-- Nível Medio
local palavrasM = {
    "porta", "trigo", "festa", "fruta", "casa", "pedra", "falar", "ondas", "leite", "nozes",
    "vento", "calor", "areia", "torre", "gente", "velho", "moeda", "terra", "salto", "barco",
    "verde", "estrela", "campo", "lento", "norte", "amigo", "mestre", "dente", "praia", "cheio",
    "longe", "sede", "doce", "somar", "linha", "pular"
}

local dificeisM = {
    "condicionamento",
    "infraestrutura",
    "caracteristicas",
    "possibilidades",
    "funcionalidade",
    "desenvolvimento",
    "profissionalismo",
    "conhecimento",
    "planejamentos",
    "responsabilidades"
}

-- Nível Dificil
local palavrasD = {
    "fugaz", "ardil", "amago", "alvor", "cumulo", "debil", "pleno", "obice", "nexo", "sagaz",
    "apice", "misero", "lugubre", "aspero", "torpe", "lexico", "inocuo", "sordido", "astuto", "apraz",
    "eximio", "candido", "etereo", "habito", "integro", "ascese", "idilico", "niveo", "efemero", "impar",
    "crivel", "vivido", "arduo", "infimo", "nitido", "fluir"
}

local dificeisD = {
    "anticonstitucional",
    "otorrinolaringologia",
    "inconstitucionalissimo",
    "interdisciplinaridade",
    "desproporcionalidade",
    "hiperidiossincrasico",
    "impreterivelmente",
    "desestabilizador",
    "incomensuravelmente",
    "transcendentalismo"
}





function stt.load()
    stt.spanw()
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
    if menu.dificuldade == 1 then
        if Player.pontos > 1200 then
            local result = math.floor(Player.pontos / 350)
            if result > 2 then
                result = 2
            end
            for i = 1, result do
                math.randomseed(os.time() + love.timer.getTime() * 1000) 
                table.insert(inimigo, Enemi:new(math.random(-1, 1),math.random(-1, 1),dificeisF[math.random(#dificeisF)],i))
            end
        end

        for i = 1, 3 do
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1),math.random(-1, 1),palavrasF[math.random(#palavrasF)],i))
        end

    elseif menu.dificuldade == 2 then
        if Player.pontos > 1000 then
            local result = math.floor(Player.pontos / 350)
            if result > 2 then
                result = 2
            end
            for i = 1, result do
                math.randomseed(os.time() + love.timer.getTime() * 1000) 
                table.insert(inimigo, Enemi:new(math.random(-1, 1),math.random(-1, 1),dificeisM[math.random(#dificeisM)],i))
            end
        end

        for i = 1, 3 do
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1),math.random(-1, 1),palavrasM[math.random(#palavrasM)],i))
        end
    elseif menu.dificuldade == 3 then
        if Player.pontos > 600 then
            local result = math.floor(Player.pontos / 350)
            if result > 2 then
                result = 2
            end
            for i = 1, result do
                math.randomseed(os.time() + love.timer.getTime() * 1000) 
                table.insert(inimigo, Enemi:new(math.random(-1, 1),math.random(-1, 1),dificeisD[math.random(#dificeisD)],i))
            end
        end
        for i = 1, 3 do
            math.randomseed(os.time() + love.timer.getTime() * 1000) 
            table.insert(inimigo, Enemi:new(math.random(-1, 1),math.random(-1, 1),palavrasD[math.random(#palavrasD)],i))
        end
    end
end

return stt