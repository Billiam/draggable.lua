local Draggable = require('draggable')

local handle = {
  x = 50,
  y = 100,
  img = love.graphics.newImage('drag_handle.png'),
  height = 40,
  width = 200
}

local cursor = love.mouse.getSystemCursor('sizeall')
local hover = false

local function inside_handle(x, y)
  return x > handle.x and x < handle.x + handle.width
    and y > handle.y and y < handle.y + handle.height
end

function love.load()
  love.graphics.setBackgroundColor(235, 235, 235, 255)
end

function love.mousemoved(x, y, dx, dy)
  if Draggable.dragging() or inside_handle(x, y) then
    hover = true
    love.mouse.setCursor(cursor)
  else
    hover = false
    love.mouse.setCursor()
  end

  Draggable.move(dx, dy)
end

function love.mousepressed(x, y)
  if inside_handle(x, y) then
    Draggable.start()
  end
end

function love.mousereleased()
  Draggable.stop()
end

function love.draw()
  love.graphics.setColor(210, 210, 210, 255)
  love.graphics.rectangle('fill', handle.x, handle.y, handle.width, handle.height)

  local color = hover and {255, 100, 100, 255} or {100, 100, 100, 255}
  love.graphics.setColor(color)
  love.graphics.rectangle('line', handle.x, handle.y, handle.width, handle.height)

  love.graphics.draw(handle.img, handle.x + 10, handle.y + 12)
  love.graphics.print('Drag here', handle.x + 30, handle.y + 12)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end