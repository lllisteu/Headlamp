# Partially reverse engineered from:
# https://github.com/RPi-Distro/python-sense-hat/blob/master/sense_hat/sense_hat.py

module Headlamp
  module Dev

    class RPiSH

      # Current gamma lookup table as a list of 32 numbers, each in range 0..31
      def gamma_get
        a = ''
        gamma_ctl 61696, a
        a[0..31].bytes
      end

      # Define a user (custom) gamma and switch to it
      def gamma_set(a)
        if ( a.size == 32 ) and ( a.all? { |i| (0..31).include? i } )
          gamma_ctl 61697, a.map(&:chr).join
        else
          raise ArgumentError, 'Not a valid gamma'
        end
      end

      # Define a linear (flat) user gamma and switch to it
      def gamma_linear
        a = (0..31).each.map { |v| v.chr }.join
        gamma_ctl 61697, a
      end

      # Switch back to default gamma
      def gamma_default
        gamma_ctl 61698, 0
      end

      alias gamma_reset gamma_default

      # Switch to low-light gamma
      def gamma_low_light
        gamma_ctl 61698, 1
      end

      # Switch to user gamma
      def gamma_user
        gamma_ctl 61698, 2
      end

      private

      def gamma_ctl(cmd, arg)
        fb.ioctl cmd, arg
      end

    end

  end
end
