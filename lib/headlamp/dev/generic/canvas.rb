require 'headlamp/tools/rotate2d'

module Headlamp
  module Dev

    class Generic

      def get_canvas(canvas,params)
        Headlamp::Tools::rot2d canvas.data, orientation
      end

    end

  end
end
