local ler
local escrever 



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