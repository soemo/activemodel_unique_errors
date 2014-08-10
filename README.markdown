# activemodel_unique_error

[![Build Status](https://travis-ci.org/soemo/activemodel_unique_errors.svg?branch=master)](https://travis-ci.org/soemo/activemodel_unique_errors)
[![Gem Version](https://badge.fury.io/rb/activemodel_unique_errors.svg)](http://badge.fury.io/rb/activemodel_unique_errors)

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


user.errors[:login] # ['Login This error text must be uniq!'] - only one unique error for this attribute and message 
user.errors.size # 1

user.errors.add(:login, 'New error message')
user.errors[:login] # ['Login This error text must be uniq!', 'Login New error message'] 
user.errors.size # 2
```

## Copyright

Copyright (c) 2014 soeren mothes. See LICENSE.txt for
further details.
