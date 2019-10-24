module Headlamp
  module Dev
    module Hue

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

      end

    end
  end
end
