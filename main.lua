local inspect = require("modules/inspect")


function love.load()
    volcanoIsland = love.graphics.newImage("images/Volcano island.png")
    tiki = love.graphics.newImage("images/tiki.png")
    rat = love.graphics.newImage("images/rat.png")
    pinkCat = love.graphics.newImage("images/kitty/pink.png")
    screenWidth, screenHeight = love.window.getDesktopDimensions()
    gameWidth = 400
    gameHeight = 240
    
    xScale = screenWidth/gameWidth
    yScale = screenHeight/gameHeight
    scale  = math.min(xScale, yScale)
    cellSize = 10*xScale;
    cellsWide = screenWidth/cellSize
    cellsHigh = screenHeight/cellSize
    love.window.setMode(gameWidth,gameHeight, {fullscreen=true})
    hero = {posX=0, posY=0, updater=heroUpdate, image=tiki}
    objects = {
        hero,
        {posX=0, posY=0, vX=0, vY=0, updater=ratUpdate, image=rat},
        {posX=0, posY=0, vX=0, vY=0, updater=ratUpdate, image=rat},
        {posX=0, posY=0, vX=0, vY=0, updater=ratUpdate, image=rat},
        {posX=0, posY=0, vX=0, vY=0, updater=ratUpdate, image=rat},
        {posX=0, posY=0, vX=0, vY=0, updater=ratUpdate, image=rat},
        {posX=0, posY=0, vX=0, vY=0, updater=catUpdate, image=pinkCat, following=true},
    }
end

function blockFPS(max,dt) -- Call this function in love.update
	if dt < 1/max then
		love.timer.sleep(1/max-dt)
	end
end
function love.update(dt)
    speed = 0.3
    for i=1,#objects do
        if objects[i].updater then
            objects[i].updater(objects[i])
        end
    end
    blockFPS(24 --[[Maximum FPS]],dt --[[Deltatime]])
end

function heroUpdate(object)
    newPosX = object.posX;
    newPosY = object.posY;

    if love.keyboard.isDown("right") then
        newPosX = newPosX+speed
    end
    if love.keyboard.isDown("up") then
        newPosY = newPosY-speed
    end
    if love.keyboard.isDown("down") then
        newPosY = newPosY+speed
    end
    if love.keyboard.isDown("left") then
        newPosX = newPosX-speed
    end
    updatePositionIfAllowed(object,newPosX, newPosY) 
end

function catUpdate(object)
    cat
end

function ratUpdate(object)
    newPosX = object.posX;
    newPosY = object.posY;
    local maxSpeed = 0.3
    local dx = (love.math.random(50)-25)/100
    local dy = (love.math.random(50)-25)/ 100
    newPosX= newPosX + dx
    newPosY = newPosY + dy
    updatePositionIfAllowed(object,newPosX, newPosY) 
end

function updatePositionIfAllowed(object, newPosX, newPosY)
    if  newPosX<0 or newPosY<0 or newPosX > (cellsWide -1) or newPosY > (cellsHigh -2) then
        return false
    else
        object.posX = newPosX
        object.posY = newPosY
    end
end


function love.draw()
    local tikiHeightInCells = 2
    local tikigameWidthInCells = 1
    -- Show background image
    love.graphics.draw( volcanoIsland , 0, 0, 0, scale, scale)
    for i=1,#objects do
        local object = objects[i]
        love.graphics.draw( object.image , object.posX * cellSize, object.posY * cellSize, 0, scale, scale)
    end
end
