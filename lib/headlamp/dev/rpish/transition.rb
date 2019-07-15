module Headlamp
  module Dev

    class RPiSH

      def transition__none(canvas,params)
        poke get_canvas(canvas,params).flatten.map(&:rgb565).join
      end

    end

  end
end
