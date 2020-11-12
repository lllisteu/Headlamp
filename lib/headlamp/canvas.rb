module Headlamp

  class Canvas
  end

end

%w(

  base

  nice view

  devices

  misc

  random

  rotate

).each { |m| require "headlamp/canvas/#{m}" }
