module Headlamp
  module Dev
    module Hue

      class Light

        def bridge
          unless defined? @bridge
            @bridge = Net::HTTP.new(config[:bridge_ip])
            @bridge.open_timeout = 3
          end
          @bridge
        end

        def api_path
          "/api/#{config[:bridge_user]}/lights/#{config[:id]}"
        end

        def request(method, path, body='')
          res = bridge.send_request(
            method,
            api_path + path,
            body
          )
          JSON.load res.body
        end

        alias req request

        def get(path='', body='')
          request('GET', path, body)
        end

        def put(path, body='')
          request('PUT', path, body)
        end

      end

    end
  end
end
