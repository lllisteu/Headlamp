module Headlamp

  class Canvas
  end

  def self.canvas(*args)
    Canvas.new(*args)
  end

end

%w(

  base

  nice view

  devices

  misc mix

  random

  rotate

).each { |m| require "headlamp/canvas/#{m}" }
