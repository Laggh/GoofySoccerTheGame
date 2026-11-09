local thisState = {}

local points

function thisState.load()
    love.window.setMode(800, 450)
    changeGameState("game")
end 


return thisState
