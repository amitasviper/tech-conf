require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Amit Kumar', email: 'amitasviper@gmail.com',
                     password: 'strong', password_confirmation: 'strong')
  end

  test 'User with valid username and email address should be valid' do
    assert @user.valid?
  end

  test 'name should not be empty' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name should be not be whitespaces' do
    @user.name = '    '
    assert_not @user.valid?
  end

  test 'name should not be more than 50 characters' do
    @user.name = 'A' * 51
    assert_not @user.valid?
  end

  test 'email should not be empty' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should be not be whitespaces' do
    @user.email = '    '
    assert_not @user.valid?
  end

  test 'email should not be more than 256 characters' do
    @user.email = 'A' * 257
    assert_not @user.valid?
  end

  test 'should fail for invalid email addresses' do
    invalid_emails = %w[amitasviper@gmailcom amitasvipergmail.com amitasviper@
                        amitasviper-gmail.com amitasviper@gmail@com]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} must be invalid"
    end
  end

  test 'should pass for valid email addresses' do
    valid_emails = %w[amitasviper@gmail.com amitas_viper@hotmail.com
                      amit.as.viper@gmail.com amitasviper123@gmail.com]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} must be valid"
    end
  end

  test 'email address should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email address should be unique ignoring case' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password must be non empty' do
    @user.password = @user.password_confirmation = ' ' * 10
    assert_not @user.valid?
  end

  test 'password should be atleast 6 characters long' do
    @user.password = @user.password_confirmation = 'a' * 4
    assert_not @user.valid?
  end

end
