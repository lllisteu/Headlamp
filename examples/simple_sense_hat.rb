#!/usr/bin/env ruby

# Load Headlamp and support for Sense HAT
require 'headlamp'
require 'headlamp/dev/rpish'

# Set up a canvas with the Sense HAT as output device
canvas = Headlamp::Canvas.new Headlamp::Dev::RPiSH.new

# Fill the canvas with random colors
canvas.randomize!
