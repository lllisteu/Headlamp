module Headlamp
  module Dev

    class Generic

      def config
        @config ||= {
          :width       => nil,
          :height      => nil,
          :color_depth => nil,
          :orientation => 0,
        }
      end

      def width
        config[:width]
      end

      def height
        config[:height]
      end

      def color_depth
        config[:color_depth]
      end

      def orientation
        config[:orientation]
      end

      def orientation=(degrees)
        if degrees.remainder(90).nonzero?
          raise ArgumentError, "#{degrees} is not a valid orientation"
        else
          config[:orientation] = degrees % 360
        end
      end

    end

  end
end
