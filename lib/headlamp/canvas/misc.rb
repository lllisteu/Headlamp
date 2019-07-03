module Headlamp

  class Canvas

    def fill(color)
      v = color.values
      each { |p| p.values = v }
    end

    alias all fill

    def clear(color=RGB.black)
      fill color
    end

    alias clr clear

    def invert!
      each { |p| p.invert! }
    end

    def mix
      RGB.new to_a.map(&:values).transpose.map { |a| a.inject(:+) / a.size }
    end

    def mix!
      fill mix
    end

    def colors
      to_a.uniq(&:values)
    end

  end

end
