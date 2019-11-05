module Headlamp
  module Dev

    class RPiSH

      def initialize
        config.merge!( {
          :name        => 'Sense HAT LED matrix',
          :width       =>  8,
          :height      =>  8,
          :color_depth => 15,
        } )
      end

      # Returns true if the device can be reached.
      def online?
        !! fb
      end

      # Immediately switch off all 64 LEDs.
      def off!
        poke "\x00" * 128
      end

    end

  end
end
