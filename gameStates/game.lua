local thisState = {}
screenLib = require("libs/screen")

local ball
local characters



function newPlayerLine(_Owner, _X, _YOffsets, _Controls)
    for i=1, #_YOffsets do
        local player = {}
        player.owner = _Owner
        player.x = _X
        player.y = _YOffsets[i]
        player.sx = 0
        player.sy = 0
        player.angle = 3*math.pi/2 --270 graus
        player.controls = _Controls
        table.insert(characters, player)
    end

end


function thisState.load()
    screenLib.setScreen(800, 450)

    characters = {}

    newPlayerLine(1, 30, {30,50,70}, {up="t", down="g", left="f", right="h"})
    newPlayerLine(1, 10, {40,60}, {up="w", down="s", left="a", right="d"})

    newPlayerLine(2, 70, {30,50,70}, {up="up", down="down", left="left", right="right"})
    newPlayerLine(2, 90, {40,60}, {up="kp5", down="kp2", left="kp1", right="kp3"})

    ball = {
        x = 50,
        y = 50,
        sx = 0,
        sy = 0,
    }
    
end 



function thisState.update(dt)
   
end


function drawBall(ball)
    x = 400 + (ball.x - 50) * 8
    y = 225 + (ball.y - 50) * 8
    
    love.graphics.circle("fill", x, y, 5)
end

function drawCharacter(character)
    x = 400 + (character.x - 50) * 8
    y = 225 + (character.y - 50) * 8
    
    --depois desenhar a hitbox
    withColor(1, 1, 1, 0.2, function()
        love.graphics.circle("fill", x, y, 5)
    end)
end

function thisState.draw()
    drawBall(ball)
    for i=1, #characters do
        drawCharacter(characters[i])
    end
end


function thisState.mousepressed()
    points = points + 1
end

return thisState
