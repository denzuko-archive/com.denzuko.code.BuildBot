# external dependencies
require 'xmpp4r'
require 'xmpp4r-simple'

# stdlib dependencies
require 'time'

# app dependenceies
require 'buildbot/config'
require 'buildbot/version'
require 'buildbot/base'

module Develnet
  module BBot
    extend self

    class Commands 
      def time(jid)
        respond jid, "Server time is: #{Time.now}"
      end

      def version(jid)
        respond jid, "Server version is #{VERSION}"
      end

      def help(jid)
        respond jid, "No help documented yet."
      end

      def respond(to, msg)
        @client.deliver to, msg, :chat
      end

      def parse_msg(jid, msg)
        cmd = msg.body.strip
        begin
          case cmd
            when /^help$/i then help(jid)
            when /^time$/i then time(jid)
            when /^jid$/i  then respond(jid, "Your Jabber id is: ${jid}")
            else
                respond(jid, "Unknown command")
            end
        rescue Exception => ex
          respond(jid, "SYSTEM_ERROR: #{ex}")
        end
      end
    end
  end
end
