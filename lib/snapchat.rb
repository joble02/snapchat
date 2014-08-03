require "snapchat/version"
require "snapcat"
require "thor"

module Snapchat
  # Your code goes here...
  class CLI < Thor
  desc 'block', 'Block a person'
  def block(input)
  	username = ask 'Enter your username:'
    password = ask 'Enter your password:'
    snapcat = Snapcat::Client.new(username)
    snapcat.login(password)
    	snapcat.block(input)
    snapcat.logout 
  end
  end
end
