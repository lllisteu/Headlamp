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

    end

  end
end
