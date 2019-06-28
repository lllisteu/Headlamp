# Read/write raw RGB565 data directly from/to framebuffer

module Headlamp
  module Dev

    class RPiSH

#     private
#     you can call these, but you usually wouldn't

      def peek(*args)
        case args.count
          when 0
            fb.rewind
            fb.read
          when 1
            fb.seek(args.first * 2)
            fb.read 2
          when 2
            fb.seek(args.first * 2)
            fb.read(args.last * 2)
        end
      end

      def poke(*args)
        case args.count
          when 1
            fb.rewind
            fb.write args.first
          when 2
            fb.seek(args.first * 2)
            fb.write args.last
        end
      end

    end

  end
end