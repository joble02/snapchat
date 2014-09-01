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

    desc 'add', 'Add user as friend'
    def add(input)
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        snapcat.add_friend(input)
      snapcat.logout
    end

    desc 'delete', 'Delete a friend'
    def delete(input)
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        snapcat.delete_friend(input)
      snapcat.logout
    end

    desc 'feedclear', 'Clear your feed'
    def feedclear
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        snapcat.clear_feed
      snapcat.logout
    end
    
    desc 'stories', 'Get all stories'
    def stories
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        say snapcat.get_stories
      snapcat.logout
    end

    desc 'privacy', 'Update your privacy settings'
    def privacy(input)
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        if input=='f'
          snapcat.update_privacy(Snapcat::User::Privacy::FRIENDS)
        elsif input=='e'
          snapcat.update_privacy(Snapcat::User::Privacy::EVERYONE)
        else
          say 'Incorrect input. Please choose from f (friends) or e(everyone)'
        end
      snapcat.logout
    end

    desc 'email_update', 'Update your email'
    def email_update(input)
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
        snapcat.update_email(input)
      snapcat.logout
    end

    desc 'list_friends', 'List all your friends'
    def list_friends
      snapcat = Snapcat::Client.new(@username)
      snapcat.login(@password)
      user=snapcat.user
      @friends=user.friends
      puts()
      @friends.each do |friend|
        puts(friend.display_name)
      end
      snapcat.logout
    end

    desc 'friend_type', 'See the status of friend'
    def friend_type(input)
      snapcat=Snapcat::Client.new(@username)
      snapcat.login(@password)
        friend = user.friends[input]
        puts(friend.type)
      snapcat.logout
    end

    desc 'send_snap', 'Send a snap'
    method_option :location, :aliases => '-l', :desc => "Enter the path of the image"
    def send_snap(input)
      snapcat=Snapcat::Client.new(@username)
      snapcat.login(@password)
        img=File.open(options[:location]).read
        snapcat.send_media(img, input)
        puts(Snap Sent!)
      snapcat.logout
    end

    private

    CONFIG_FILE = '/Users/rishabhjain/Desktop/main/ruby/commandline/snapchat/lib/myprogram.yml'

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
