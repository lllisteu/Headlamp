require 'headlamp/tools/rotate2d'

module Headlamp

  class Canvas

    def rotate!(degrees=90)
      @data = Headlamp::Tools.rot2d(@data,degrees)
      automatically_render
    end

  end

end
