module Headlamp
  module Dev

    class Generic

      def config
        @config ||= {
          :width       => nil,
          :height      => nil,
          :color_depth => nil,
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

    end

  end
end
