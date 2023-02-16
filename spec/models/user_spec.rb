require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: "Peter", email: "peter@gmail.com", password: "123456", password_confirmation: "123456")
  before { user.save }

  it "should have a name" do
    user.name = nil
    user.confirm
    expect(user).to_not be_valid
  end
end
