module Headlamp

  class Canvas

    def automatic=(v)
      @automatic = !!v
    end

    def automatic
      @automatic = true unless (defined? @automatic)
      @automatic
    end

    def devices
      @dev ||= []
    end

    def dev0
      devices[0]
    end

    def add_device(d)
      devices.push d
    end

    def render
      devices.each do |d|
        if d.respond_to? :render
          d.render self, {}
        end
      end
    end

    private

    def automatically_render
      render if automatic
    end

  end

end
