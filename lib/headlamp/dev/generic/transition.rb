module Headlamp
  module Dev

    class Generic

      def speed
        @speed ||= 1.0
      end

      def speed=(v)
        @speed = v.to_f
      end

      def transitions
        methods.map { |m| m.match( /^transition__(.*)/ ) ? $1 : nil }.compact
      end

      def transition
        @transition ||= default_transition
      end

      def transition=(t)
        if transitions.include? t
          @transition = t
        else
          raise ArgumentError, "'#{t}' is not a transition for device"
        end
      end

      def render(canvas,params)
        if transition
          send "transition__#{transition}", canvas, params
        end
      end

      private

      def default_transition
        if transitions.any?
          transitions.include?('none') ? 'none' : transitions.first
        else
          nil
        end
      end

    end

  end
end
