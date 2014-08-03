require "snapchat/version"
require "snapcat"
require "thor"
require 'yaml'

module Snapchat
  class CLI < Thor
    def initialize(*args)
      super
      read_config
    end

    desc 'login', 'Login Credentials'
    def login(user, pass)
      @username = user
      @password = pass
      write_config
    end

    desc 'block', 'Block user'
    def block(input)
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        snapcat.block(input)
      snapcat.logout 
    end

    desc 'unblock', 'Unblock user'
    def unblock(input)
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        snapcat.unblock(input)
      snapcat.logout 
    end

    private

    CONFIG_FILE = 'myprogram.conf'

    def write_config
      config = {}
      config['username']=@username
      config['password']=@password
      File.open(CONFIG_FILE, 'w') do |f|
        f.write config.to_yaml
      end
    end

    def read_config
      config = YAML.load_file(CONFIG_FILE)
      @username = config['username']
      @password = config['password']
    end
  end
end
