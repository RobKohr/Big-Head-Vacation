local inspect = require("modules/inspect")


function love.load()
    volcanoIsland = love.graphics.newImage("images/Volcano island.png")
    tiki = love.graphics.newImage("images/tiki.png")
    rat = love.graphics.newImage("images/rat.png")
    pinkCat = love.graphics.newImage("images/kitty/pink.png")
    screenWidth, screenHeight = love.window.getDesktopDimensions()
    gameWidth = 400
    gameHeight = 240

    xScale    = screenWidth / gameWidth
    yScale    = screenHeight / gameHeight
    scale     = math.min(xScale, yScale)
    cellSize  = 10 * xScale;
    cellsWide = screenWidth / cellSize
    cellsHigh = screenHeight / cellSize
    love.window.setMode(screenWidth, screenHeight, { fullscreen = false })
    hero = { x = 0, y = 0, updater = heroUpdate, image = tiki, type = "hero" }
    objects = {
        hero,
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = ratUpdate, image = rat, type = "rat" },
        { x = 0, y = 0, vX = 0, vY = 0, updater = catUpdate, image = pinkCat, following = true, type = "cat" }
    }
end

function love.update(dt)
    speed = 0.3
    for i = 1, #objects do
        if objects[i].updater then
            objects[i].updater(objects[i])
        end
    end
    blockFPS(24--[[Maximum FPS]] , dt--[[Deltatime]] )
end

-- function findClosestOfType(type, x, y)
--     local closest = nil

--     for i=1,#objects do

--     end
-- end

function heroUpdate(object)
    newX = object.x;
    newY = object.y;

    if love.keyboard.isDown("right") then
        newX = newX + speed
    end
    if love.keyboard.isDown("up") then
        newY = newY - speed
    end
    if love.keyboard.isDown("down") then
        newY = newY + speed
    end
    if love.keyboard.isDown("left") then
        newX = newX - speed
    end
    updatePositionIfAllowed(object, newX, newY)
end

function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function distanceBetweenTwoObjects(obj1, obj2)
    return distance(obj1.x, obj1.y, obj2.x, obj2.y)
end

function findNearestOfType(sourceObj, type)
    local nearest = nil
    local nearestDistance = 10000000
    for i = 1, #objects do
        local obj = objects[i]
        local dist = distanceBetweenTwoObjects(sourceObj, obj)
        if obj.type == type and dist < nearestDistance then
            nearestDistance = dist
            nearest = obj
        end
    end
    return nearest
end

function catUpdate(object)
    local nearestRat = findNearestOfType(object, 'rat');
    local followSpeed = 0.2
    local maxDistance = 3
    -- if(nearestRat and distanceBetweenTwoObjects(object, nearestRat)) then
    --     moveToward(object, nearestRat, followSpeed)
    -- end
    if (object.following) then
        if (distanceBetweenTwoObjects(hero, object) < maxDistance) then
            moveToward(object, hero, followSpeed)
        end
    end
end

function moveToward(object, target, speed)
    local x = target.x
    local y = target.y
    local newX = object.x;
    local newY = object.y;
    if (newX < x) then
        newX = newX + speed
    elseif (newX > x) then
        newX = newX - speed
    end
    if (newY < y) then
        newY = newY + speed
    elseif (newY > y) then
        newY = newY - speed
    end
    updatePositionIfAllowed(object, newX, newY)
end

function ratUpdate(object)
    newX = object.x;
    newY = object.y;
    local maxSpeed = 0.3
    local dx = (love.math.random(50) - 25) / 100
    local dy = (love.math.random(50) - 25) / 100
    newX = newX + dx
    newY = newY + dy
    updatePositionIfAllowed(object, newX, newY)
end

function updatePositionIfAllowed(object, newX, newY)
    if newX < 0 or newY < 0 or newX > (cellsWide - 1) or newY > (cellsHigh - 2) then
        return false
    else
        object.x = newX
        object.y = newY
    end
end

function love.draw()
    -- Show background image
    love.graphics.draw(volcanoIsland, 0, 0, 0, scale, scale)
    for i = 1, #objects do
        local object = objects[i]
        love.graphics.draw(object.image, object.x * cellSize, object.y * cellSize, 0, scale, scale)
    end
end

function blockFPS(max, dt) -- Call this function in love.update
    if dt < 1 / max then
        love.timer.sleep(1 / max - dt)
    end
end
