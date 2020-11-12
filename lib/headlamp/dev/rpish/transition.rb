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

      def transition__swirl(canvas,params)
        poke_blocks(
      [
        [ 0, 63],
        [ 1, 62],
        [ 2, 61],
        [ 3, 60],
        [ 4, 59],
        [ 5, 58],
        [ 6, 57],
        [ 7, 56],
        [15, 48],
        [23, 40],
        [31, 32],
        [39, 24],
        [47, 16],
        [55,  8],
        [54,  9],
        [53, 10],
        [52, 11],
        [51, 12],
        [50, 13],
        [49, 14],
        [41, 22],
        [33, 30],
        [25, 38],
        [17, 46],
        [18, 45],
        [19, 44],
        [20, 43],
        [21, 42],
        [29, 34],
        [37, 26],
        [36, 27],
        [35, 28],
      ].reverse,
          canvas, params)
      end

      private

      def poke_blocks(blocks,canvas,params)
        frame = raw_frame(canvas,params)
        blocks.each do |b|
          b.each { |p| poke p, frame[p] }
          nap 0.05
        end
      end

      def raw_frame(canvas,params)
        get_canvas(canvas,params).flatten.map(&:rgb565)
      end

    end

  end
end
