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
      rgb = [0,0,0]
      count = @data.flatten.count

      @data.flatten.each do |c|
        rgb[0] += c.red
        rgb[1] += c.green
        rgb[2] += c.blue
      end

      RGB.new( [rgb[0]/count, rgb[1]/count, rgb[2]/count] )
    end

    def mix!
      fill mix
    end

    def colors
      to_a.uniq(&:values)
    end

  end

end
