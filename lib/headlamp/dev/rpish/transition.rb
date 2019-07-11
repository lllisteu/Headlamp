module Headlamp
  module Dev

    class RPiSH

      def transition__none(canvas,params)
        poke canvas.to_a.map(&:rgb565).join
      end

    end

  end
end
