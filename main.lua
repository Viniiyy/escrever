local gStt = require("game_rum")
local Player = require("player")
local est = require("Menu")

function love.load()
    love.graphics.setFont(love.graphics.newFont("font/Tmilk.ttf",18))
    av1 = love.graphics.newImage("Sprites/Arvore1_spr.png")
    av2 = love.graphics.newImage("Sprites/Arvore2_spr.png")
    arvoreWidth = av1:getWidth()
    arvoreHeight = av1:getHeight()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()


    tile = love.graphics.newImage("Sprites/Ground.png")
    tileWidth = tile:getWidth()
    tileHeight = tile:getHeight()
    screenWidth = love.graphics.getWidth()
    screenHeight = love.graphics.getHeight()

    if est.estado == "Menu" then
        est:load()
    elseif est.estado == "Jogo" then
        gStt.load()
    end
end

function love.update(dt)
    if est.estado == "Menu" then
        Player:update(dt)
        est:update()
    elseif est.estado == "Jogo" then
        gStt.update(dt)
    elseif est.estado == "Config" then
        est:update()
    end
    
end



function love.draw(dt)
    if est.estado == "Menu" then
        Player:draw()
        for y = 0, screenHeight, tileHeight do
            for x = 0, screenWidth, tileWidth do
                love.graphics.draw(tile, x, y)
            end
        end
        gStt.draw(dt)
        est:draw()
    elseif est.estado == "Config" then
        for y = 0, screenHeight, tileHeight do
            for x = 0, screenWidth, tileWidth do
                love.graphics.draw(tile, x, y)
            end
        end
        gStt.draw(dt)
        est:draw()
    elseif est.estado == "Jogo" then
        for y = 0, screenHeight, tileHeight do
            for x = 0, screenWidth, tileWidth do
                love.graphics.draw(tile, x, y)
            end
        end
        gStt.draw(dt)
    end
    
end


function love.keypressed(key)
    if est.estado == "Menu" then
    elseif est.estado == "Jogo" then
        gStt.keys(key)
    end
end

