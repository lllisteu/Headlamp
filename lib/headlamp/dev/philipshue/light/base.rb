module Headlamp
  module Dev
    module PhilipsHue

      class Light

        def initialize(ip,user,id)
          config.merge!( {
            :width       =>  1,
            :height      =>  1,
            :color_depth => 24,
            :bridge_ip   => ip,
            :bridge_user => user,
            :id          => id,
          } )

          config[:name] = get['name']
        end

        undef_method :orientation=

        # Returns true if the device can be reached.
        def online?
          get['state']['reachable']
        end

        # Immediately switch off the light.
        def off!
          put '/state', { 'on' => false, 'transitiontime' => 0 }.to_json
        end

      end

    end
  end
end
