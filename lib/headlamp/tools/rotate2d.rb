module Headlamp
  module Tools

    def self.rot2d(a,deg=90)

        case ( deg % 360 )
          when 90
            a.transpose.map(&:reverse)
          when 180
            a.reverse.map(&:reverse)
          when 270
            a.transpose.reverse
          else
            a
        end

    end

  end
end
