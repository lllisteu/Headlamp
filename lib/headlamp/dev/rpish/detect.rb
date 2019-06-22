module Headlamp

  module Dev

    class RPiSH

      # Framebuffer as an opened read/write stream
      def fb
        unless @fb
          if fb_path and File.writable? fb_path
            @fb = File.open fb_path, 'r+b'
            @fb.sync = true
          end
        end
        @fb
      end

      alias framebuffer fb

      # Framebuffer path. Usually '/dev/fb1'
      def fb_path
        unless defined? @fb_path
          @fb_path = fb_id ? "/dev/#{fb_id}" : nil
        end
        @fb_path
      end

      # Framebuffer id. Usually 'fb1'
      def fb_id
        unless defined? @fb_id
          @fb_id = detect_fb_id
        end
        @fb_id
      end

      private

      # Scan for a Sense HAT framebuffer
      def detect_fb_id
        Dir.glob('/sys/class/graphics/fb*/name').each do |file|
          if (File.readable? file ) and ( (File.read file).chomp == 'RPi-Sense FB' )
            return file.sub /.*\/(fb\S+)\/name$/, '\1'
          end
        end
        return nil
      end

    end

  end

end
