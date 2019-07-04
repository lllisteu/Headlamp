module Headlamp
  module Dev

    class Generic

      def inspect
        "%s (%s x %s, %s)" % [
          config[:name] || self.class.name,

          (width  || '?').to_s,
          (height || '?').to_s,

          color_depth ? color_depth.to_s+'-bit color' : 'unknown color-depth'
        ]
      end
    end

  end
end
