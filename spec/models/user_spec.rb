require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      name: 'Test Test',
      email: 'test@test.com',
      password: 'test',
      password_confirmation: 'test'
    )
  end

  describe 'Validations' do
    it 'must be created with password and password_confirmation fields' do
      @user.save
      
      expect(@user.valid?).to be true
    end

    it 'must not be created with password and password_confirmation fields' do
      @user.password_confirmation = 'tes'
      @user.save
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'must be created with name' do
      @user.name = nil
      @user.save
      
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'must be created with email' do
      @user.email = nil
      @user.save
      
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'must be created with unique email' do
      @new_user = User.new(
        name: 'Test2 Test2',
        email: 'TEST@TEST.com',
        password: 'test2',
        password_confirmation: 'test2'
      )
      @user.save
      @new_user.save
      
      expect(@new_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'must be created with minimum password and password_confirmation length of 4' do
      @user.password = 'tes'
      @user.password_confirmation = 'tes'
      @user.save
      
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end 
  end

  describe '.authenticate_with_credentials' do
    it "should log in user" do
      @user.save
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eql(@user)
    end

    it "should not log in user with incorrect email" do
      @user.save

      expect(User.authenticate_with_credentials('test@tset.com', @user.password)).to eql(nil)
    end

    it "should not log in user with incorrect password" do
      @user.save
      expect(User.authenticate_with_credentials(@user.email, "testtest")).to eql(nil)
    end

    it "should log in user with white spaces around email" do
      @user.save
      expect(User.authenticate_with_credentials(" test@test.com ", @user.password)).to eql(@user)
    end
  end
end
