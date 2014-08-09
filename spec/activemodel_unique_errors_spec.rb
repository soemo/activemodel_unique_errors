require 'spec_helper'
require 'active_model'
require 'activemodel_unique_errors'

describe 'ActivemodelUniqueErrors' do

  class User
    include ActiveModel::Validations
    #include ActiveModel::Conversion
    #extend ActiveModel::Naming

    attr_accessor :login, :notice
  end

  before(:each) do
    @user = User.new
    @user.errors.size.should == 0
  end


  it 'should add only errors if this error not exists - []' do
    msg = 'This error text must be uniq!'
    @user.errors[:login]= msg
    @user.errors[:login].should == [msg]

    # next add with same error msg on same attr. will not insert the error
    @user.errors[:login]= msg
    @user.errors[:login].should == [msg]
    @user.errors['login']= msg
    @user.errors['login'].should == [msg]
    @user.errors.size.should == 1

    # on other attr should work
    @user.errors[:notice]= msg
    @user.errors[:notice].should == [msg]

    # a new error msg could also add
    other_msg = 'new error text'
    @user.errors[:login]= other_msg
    @user.errors[:login].should == [msg, other_msg]

    # final
    @user.errors.size.should == 3
    @user.errors.full_messages.should == ['Login This error text must be uniq!',
                                          'Login new error text',
                                          'Notice This error text must be uniq!']

  end

  it 'should add errors the normal way - []' do

  end

  it 'should add only errors if this error not exists - add()' do
    msg = 'This error text must be uniq!'
    @user.errors.add(:login, msg)
    @user.errors[:login].should == [msg]

    # next add with same error msg on same attr. will not insert the error
    @user.errors.add(:login, msg)
    @user.errors[:login].should == [msg]
    @user.errors['login'].should == [msg]
    @user.errors.size.should == 1

    # on other attr should work
    @user.errors.add(:notice, msg)
    @user.errors[:notice].should == [msg]

    # a new error msg could also add
    other_msg = 'new error text'
    @user.errors.add(:login, other_msg)
    @user.errors[:login].should == [msg, other_msg]

    # final
    @user.errors.size.should == 3
    @user.errors.full_messages.should == ['Login This error text must be uniq!',
                                          'Login new error text',
                                          'Notice This error text must be uniq!']

  end

  it 'should add errors the normal way' do
    msg = 'This error text must be uniq!'
    @user.errors.add_without_unique_check(:login, msg)
    @user.errors[:login].should == [msg]

    @user.errors.add_without_unique_check(:login, msg)
    @user.errors[:login].should == [msg, msg]
  end

end
