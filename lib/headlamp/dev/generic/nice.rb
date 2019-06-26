module Headlamp
  module Dev

    class Generic

      def inspect
        "%s (%s x %s, %s)" % [
          config[:name] || self.class.name,

          (config[:width]  || '?').to_s,
          (config[:height] || '?').to_s,

          config[:color_depth] ? config[:color_depth].to_s+'-bit color' : 'unknown color-depth'
        ]
      end
    end

  end
end