module Headlamp
  module Dev

    class Terminal

      def initialize
        config.merge!( {
          :name        => 'Terminal',
          :width       =>  `tput cols`.to_i,
          :height      =>  `tput lines`.to_i,
          :color_depth => 24,
          :pixel       => '  ',
        } )
      end

      undef_method :orientation=

      # Returns true if the device can be reached.
      def online?
        true
      end

      # Clears the screen.
      def off!
        print ( @clear_sequence ||= `clear` )
      end

    end

  end
end
