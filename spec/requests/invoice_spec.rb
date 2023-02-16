require 'rails_helper'

RSpec.describe 'Invoices', type: :request do
  before(:each) do
    @user = User.create(name: 'Peter', email: 'peter@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user
    @category = Category.new(name: 'Food', icon: File.open('./spec/assets/test.jpg'))
    @category.user = @user
    @category.icon_derivatives!
    @category.save
    @invoice = Invoice.create(name: 'Apples', amount: 23.45, user: @user)
  end

  it 'should have a 200 status code' do
    get new_transaction_path
    expect(response).to have_http_status(200)
  end

  it 'should render the index template' do
    get new_transaction_path
    expect(response).to render_template(:new)
  end

  it 'should have a new transaction link' do
    get new_transaction_path
    expect(response.body).to include('Create')
  end
end
