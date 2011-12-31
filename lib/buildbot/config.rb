module Develnet
  module BBot
    module Config
      JABBER = YAML::load_file File.join('config','jabber.yml')
    end
  end
end
