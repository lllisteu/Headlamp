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

    end

  end
end