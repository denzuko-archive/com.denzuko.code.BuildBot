module Develnet
  module BBot
    module VERSION
      MAJOR = 0
      MINOR = 0
      TINY  = 1
      def .to_s
        [MAJOR,MINOR,TINY].join(".")
      end
    end
  end
end
