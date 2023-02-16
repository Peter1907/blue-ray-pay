require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before(:each) do
    user = User.new(name: "Peter", email: "peter@gmail.com", password: "123456", password_confirmation: "123456")
    user.confirm
    user.save
    @category = Category.create(name: "Food", icon: File.open('./spec/assets/test.jpg'), user_id: user.id)
    @invoice = Invoice.new(name: "Apples", amount: 23.45, user_id: user.id)
  end

  it "should have a name" do
    @invoice.name = nil
    @invoice.save
    expect(@invoice).to_not be_valid
  end

  it "should have an amount in the form of a number" do
    @invoice.amount = nil
    @invoice.save
    expect(@invoice).to_not be_valid
    @invoice.amount = "abc"
    @invoice.save
    expect(@invoice).to_not be_valid
  end
end
