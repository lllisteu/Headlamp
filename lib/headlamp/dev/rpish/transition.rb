module Headlamp
  module Dev

    class RPiSH

      def transition__none(canvas,params)
        poke raw_frame(canvas,params).join
      end

      def transition__dissolve(canvas,params)
        old = peek.scan(/.{2}/)
        new = raw_frame(canvas,params)

        changes = (0..63).reject { |i| new[i] == old[i] }

        changes.shuffle.each { |i| nap 0.01; poke i, new[i] }
      end

      def transition__wipe_down(canvas,params)
        poke_blocks(index, canvas, params)
      end

      def transition__wipe_up(canvas,params)
        poke_blocks(index.reverse, canvas, params)
      end

      def transition__wipe_right(canvas,params)
        poke_blocks(index.transpose, canvas, params)
      end

      def transition__wipe_left(canvas,params)
        poke_blocks(index.transpose.reverse, canvas, params)
      end

      private

      def poke_blocks(blocks,canvas,params)
        new = raw_frame(canvas,params)
        blocks.each do |b|
          b.each { |p| poke p, new[p] }
          nap 0.05
        end
      end

      def raw_frame(canvas,params)
        new = get_canvas(canvas,params).flatten.map(&:rgb565)
      end

    end

  end
end
