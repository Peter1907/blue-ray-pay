require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    user = User.new(name: "Peter", email: "peter@gmail.com", password: "123456", password_confirmation: "123456")
    user.confirm
    user.save
    @category = Category.new(name: "Food", user_id: user.id)
    @category.icon = File.open('./spec/assets/test.jpg')
  end

  it "should have a name" do
    @category.name = nil
    @category.save
    expect(@category).to_not be_valid
  end

  it "should have an icon" do
    @category.icon = nil
    @category.save
    expect(@category).to_not be_valid
  end

  it "should validate the icon" do
    @category.icon = File.open('./spec/assets/test.txt')
    @category.save
    expect(@category).to_not be_valid
  end

  it "creates a thumbnail for the icon" do
    @category.icon_derivatives!
    @category.save
    expect(@category.icon(:small).url).to be_present
  end
end
