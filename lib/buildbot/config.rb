module Develnet
  module BBot
    module Config
      JABBER = YAML::load File.join('config','jabber.yml')
    end
  end
end
