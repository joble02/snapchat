require "snapchat/version"
require "snapcat"
require "thor"

module Snapchat
  # Your code goes here...
  class CLI < Thor
  desc 'block', 'Block user'
  def block(input)
  	username = ask 'Enter your username:'
    password = ask 'Enter your password:'
    snapcat = Snapcat::Client.new(username)
    snapcat.login(password)
    	snapcat.block(input)
    snapcat.logout 
  end
  desc 'unblock', 'Unblock user'
  def unblock(input)
    username = ask 'Enter your username: '
    password = ask 'Enter your password: '
    snapcat = Snapcat::Client.new(username)
    snapcat.login(password)
      snapcat.unblock(input)
    snapcat.logout 
  end
  end
end
