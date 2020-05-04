module Headlamp
  module Dev

    class RPiSH

      def initialize
        config.merge!( {
          :name        => 'Sense HAT LED matrix',
          :width       =>  8,
          :height      =>  8,
          :color_depth => 16,
        } )
      end

      # Returns true if the device can be reached.
      def online?
        !! fb
      end

      # Immediately switches off all 64 LEDs.
      def off!
        poke "\x00" * 128
      end

      # Sets all 64 LEDs to a single color.
      def clear(color=RGB.black)
        poke color.rgb565 * 64
      end

    end

  end
end
