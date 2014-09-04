# Snapchat

Now you can access snapchat in your command line. Uses the gem snapcat.

## Installation (Download manually for now)

Add this line to your application's Gemfile:

    gem 'snapchat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snapchat

## Usage

<b>Commands:</b>

    snapchat
    
Get details about all the commands. 

    snapchat block [user]

Command to block a specific user. Type in the user you want to block in place of [user]

    snapchat unblock [user]

Command to unblock a specific user. Type in the user you want to unblock in place of [user]

	snapchat add [user]

Command to add a user as a friend. Type in the user you want to add as friend in place of [user]

	snapchat delete [user]

Command to delete a friend. Type in the user you want to delete in place of [user]

	snapchat feedclear

Command to clear your feed.

	snapchat privacy [input]

Command to change your privacy settings. Enter 'e' or 'f' instead of [input]. 
(e = Everyone, f = Friends)

    snapchat email_update [input]

Command to update the email address linked to your account. Enter the email address in place of [input].

	snapchat friend_type [input]

Command to see the status of a friend. Enter id of the friend in place of [input].

	snapchat send_snap [input] -l [location] -d [duration]

Command to send snaps (Both images and videos). Enter the snapchat id of the person you want to send to in place of [input]. Put the path of of the file you want to send in [location]. Enter the view duration instead of [duration]. Use .jpeg for images and .mp4 for videos.

## Things to add

Operations with pictures/videos.
Oauth

## Contributing

1. Fork it ( https://github.com/[my-github-username]/snapchat/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
