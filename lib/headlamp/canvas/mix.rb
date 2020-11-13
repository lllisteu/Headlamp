module Headlamp

  class Canvas

    def whiten!(portion=0.5)
      each { |p| p.whiten!(portion) }
    end

    def blacken!(portion=0.5)
      each { |p| p.blacken!(portion) }
    end

  end
end
