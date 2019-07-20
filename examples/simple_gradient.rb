#!/usr/bin/env ruby

# Load Headlamp
require 'headlamp'

# Set up a canvas
canvas = Headlamp::Canvas.new 24,12

# Define an SVG file and connect it to the canvas
canvas.add_device Headlamp::Dev::SVG.new 'headlamp_example.svg'

# Draw a red/green gradient on the canvas
canvas.each_with_coordinates do |pixel,row,col|
  pixel.red   = (row+1.0) / canvas.height
  pixel.green = (col+1.0) / canvas.width
end
