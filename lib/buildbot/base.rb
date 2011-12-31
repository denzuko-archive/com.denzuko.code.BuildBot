# external dependencies
require 'xmpp4r'
require 'xmpp4r-simple'

# app dependenceies
require 'buildbot/config'
require 'buildbot/version'
require 'buildbot/commands'

module Develnet
  module BBot
    extend self
    attr_accessor :client

    class Base < Commands

      def initialize()
        @client = self.connect
        #$LOGGER.warn "Connecting to xmpp server"
        puts "Connecting to xmpp server"
        if @client
          @client.accept_subscriptions=true
          #$LOGGER.warn "Connected, Waiting for input"
          puts "Connected, Waiting for input"
          @client.deliver(Config::JABBER['botmaster'], "beware I live.", :headline)
          loop do
            @client.received_messages do |message|
                    jid = get_jid(message.from.to_s)
                    #$LOGGER.warn "Received message from #{jid}: #{message.body}"
                    puts "Received message from #{jid}: #{message.body}"
                    parse_msg(jid, message)
            end
            sleep 0.1
          end
        else 
          puts "Error: Could not connect to server."
          #$LOGGER.error "Error: Could not connect to server."
          #throw ConnectError
        end
      end

      def connect()
        begin
          jid = Config::JABBER['jid']
          pwd = Config::JABBER['passphrase']
          conn = Jabber::Simple.new jid, passphrase, "Buildbot is online"
          return conn
        rescue
          return nil
        end
      end
      
      def get_jid(str)
        matches = str.match(/([a-z\d_.\-]{1,32})@([a-z\d.-]{1,32})\//i)
        return "#{matches[1]}@#{matches[2]}"
      end
    end
  end
end
