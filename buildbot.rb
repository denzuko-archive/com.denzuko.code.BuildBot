$:.unshift File.join(File.dirname(__FILE__),'lib')
require 'rubygems'
require 'bundler/setup'

Bundler.require

require 'buildbot'

bbot = Develnet::BBot::Base.new
