module Headlamp
  module Dev

    class RPiSH

      def transition__none(canvas,params)
        poke get_canvas(canvas,params).flatten.map(&:rgb565).join
      end

      def transition__dissolve(canvas,params)
        old = peek.scan(/.{2}/)
        new = get_canvas(canvas,params).flatten.map(&:rgb565)

        changes = (0..63).reject { |i| new[i] == old[i] }

        changes.shuffle.each { |i| nap 0.01; poke i, new[i] }
      end

    end

  end
end
