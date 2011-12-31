module Develnet
  module BBot
    module VERSION
      MAJOR = 0
      MINOR = 0
      TINY  = 3

      def self.to_s # :nodoc:
        [MAJOR,MINOR,TINY].join(".")
      end
    end
  end
end
