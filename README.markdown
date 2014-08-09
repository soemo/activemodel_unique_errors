# activemodel_unique_error

Only add a error messages for one model attribute if this error message not exists for the model attribute

## Installation

Add this line to your application's Gemfile:

    gem 'activemodel_unique_errors'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activemodel_unique_errors

## Usage
```ruby
user = User.new
user.errors.size # 0

msg = 'This error text must be uniq!'
user.errors.add(:login, msg)
user.errors.add(:login, msg)
user.errors[:login]= msg


user.errors[:login] # [msg] -  only unique error for this attr. and msg 
```

## Contributing to activemodel_unique_errors
                 
- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 soeren mothes. See LICENSE.txt for
further details.
