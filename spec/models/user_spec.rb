require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Guilherme Costa", email: "gcosta@test.com")
  end

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  
  it { should be_valid }


  describe "with an empty email" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "with invalid email format" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "with valid email format" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
end
