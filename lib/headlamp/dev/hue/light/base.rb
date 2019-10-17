module Headlamp
  module Dev
    module Hue

      class Light

        def initialize(ip,user,id)
          config.merge!( {
            :width        =>  1,
            :height       =>  1,
            :color_depth  => 24,
            :gateway_ip   => ip,
            :gateway_user => user,
            :id           => id,
          } )
        end

      end

    end
  end
end
