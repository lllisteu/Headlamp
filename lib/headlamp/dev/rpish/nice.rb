module Headlamp
  module Dev

    class RPiSH

      def inspect
        if fb
          "#{super}, '#{fb_path}'"
        else
          'No usable Sense HAT found'
        end
      end
    end

  end
end
