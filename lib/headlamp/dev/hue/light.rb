require 'headlamp/dev/generic'

module Headlamp
  module Dev
    module Hue

      class Light < Headlamp::Dev::Generic
      end

    end
  end
end

require 'headlamp/dev/hue/light/base'
require 'headlamp/dev/hue/light/nice'
require 'headlamp/dev/hue/light/transition'
