$:.unshift File.join(File.dirname(__FILE__),'lib')
require 'rubygems'
require 'bundler/setup'
require 'pp'

Bundler.require

require 'buildbot'

bbot = Develnet::BBot
agent = bbot::Base.new
puts bbot::VERSION
pp bbot::Config::JABBER
