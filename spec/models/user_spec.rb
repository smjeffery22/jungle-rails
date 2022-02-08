require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'must be created with password and password_confirmation fields' do
      @user = User.new
      @user.name = 'Test'
      @user.email = 'test@test.com'
      @user.password = 'test'
      @user.password_confirmation = 'test'
      
      expect(@user.valid?).to be true
    end

    it 'must be created with password and password_confirmation fields' do
      @user = User.new
      @user.name = 'Test'
      @user.email = 'test@test.com'
      @user.password = 'test'
      @user.password_confirmation = 'tes'
      
      expect(@user.valid?).to be false
    end

    it 'must be created with name' do
      @user = User.new
      @user.name = nil
      @user.email = 'test@test.com'
      @user.password = 'test'
      @user.password_confirmation = 'test'
      
      expect(@user.valid?).to be false
    end

    it 'must be created with email' do
      @user = User.new
      @user.name = 'Test'
      @user.email = nil
      @user.password = 'test'
      @user.password_confirmation = 'test'
      
      expect(@user.valid?).to be false
    end

    it 'must be created unique email' do
      @user1 = User.new
      @user1.name = 'Test1'
      @user1.email = 'test@test.COM'
      @user1.password = 'test1'
      @user1.password_confirmation = 'test1'
      @user1.save

      @user2 = User.new
      @user2.name = 'Test2'
      @user2.email = 'TEST@TEST.com'
      @user2.password = 'test2'
      @user2.password_confirmation = 'test2'
      
      expect(@user2.valid?).to be false
    end
  end

  describe 'Password minimum length' do
    it 'must be created with minimum password and password_confirmation length of 4' do
      @user = User.new
      @user.name = 'Test'
      @user.email = 'test@test.com'
      @user.password = 'tes'
      @user.password_confirmation = 'tes'
      
      expect(@user.valid?).to be false
    end
  end

  describe '.authenticate_with_credentials' do
    
  end
end
