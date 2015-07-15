# Draggable.lua

A tiny library (mostly for documentation/reference) to help move LÖVE windows around with the mouse.

This is particularly useful for borderless, non-fullscreen windows.

## Install

Add `draggable.lua` to your project, and require it

```lua
local Draggable = require('draggable')
```

## Usage

### `Draggable.start()`

Begin dragging. The cursor will disappear until you call `Draggable.stop()`.

Be aware that this enables the relative mouse mode behind the scenes, which will change the `x` and `y` arguments passed to `love.mousemove`.

### `Draggable.stop()`

Stop dragging. The cursor will reeappear.

### ```Draggable.move(x, y)```
Move the window by a relative amount if `Draggable.start()` has been called.

```lua
function love.mousemoved(x, y, dx, dy)
  Draggable.move(dx, dy)
end
```

See [main.lua](main.lua) for example use.