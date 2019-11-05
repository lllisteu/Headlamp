require 'headlamp/dev/generic'

require 'net/http'
require 'json'

module Headlamp
  module Dev
    module PhilipsHue

      class Light < Headlamp::Dev::Generic
      end

    end
  end
end

require 'headlamp/dev/philipshue/light/base'
require 'headlamp/dev/philipshue/light/net'
require 'headlamp/dev/philipshue/light/nice'
require 'headlamp/dev/philipshue/light/transition'
