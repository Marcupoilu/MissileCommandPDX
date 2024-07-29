class("HorizontalLayout").extends()

function HorizontalLayout:init(cellSize, distance, value, y)
    self.cellSize = cellSize
    self.distance = distance
    self.value = value
    self.totalWidth = (self.value * self.cellSize) + ((self.value - 1) * self.distance)
    self.positionBaseX = ((playdate.display.getWidth() - self.totalWidth) / 2)
    self.positionBaseY = y
end

function HorizontalLayout:updateLayout()
end