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

    end

  end
end