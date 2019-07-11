require 'headlamp/tools/rotate2d'

module Headlamp

  class Canvas

    def rotate!(degrees=90)
      @data = Headlamp::Tools.rot2d(@data,degrees)
      automatically_render
    end

    def flip_horizontal!
      @data.each { |r| r.reverse! }
      automatically_render
    end

    def flip_vertical!
      @data.reverse!
      automatically_render
    end

  end

end
