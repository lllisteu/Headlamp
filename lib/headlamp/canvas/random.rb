module Headlamp

  class Canvas

    def randomize!
      each { |p| p.randomize! }
    end

    def shuffle!
      @data = to_a.shuffle.each_slice(width).to_a
      automatically_render
    end

  end

end
