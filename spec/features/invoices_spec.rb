require 'rails_helper'

RSpec.describe 'Transactions page', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    @category = Category.create(name: 'test', user_id: @user.id, icon_data: TestData.image_data)
    @invoice1 = Invoice.create(name: 'test1', amount: 100, user_id: @user.id)
    @invoice2 = Invoice.create(name: 'test2', amount: 200, user_id: @user.id)

    Record.create(category_id: @category.id, invoice_id: @invoice1.id)
    Record.create(category_id: @category.id, invoice_id: @invoice2.id)

    visit transactions_path(@category)
  end

  it 'shows the right content' do
    expect(page).to have_content('test Transactions')
    expect(page).to have_content('test1')
    expect(page).to have_content('test2')
    expect(page).to have_content('Total: $300.0')
  end

  it 'redirects to the new transaction page' do
    click_on 'NEW TRANSACTION'
    expect(page).to have_current_path(new_transaction_path)
    expect(page).to have_content('NEW TRANSACTION')
    expect(page).to have_content('Category')
    expect(page).to have_field('Name')
    expect(page).to have_field('Amount')
  end

  it 'goes back to the categories page' do
    click_on '←'
    expect(page).to have_current_path(categories_path)
    expect(page).to have_content('CATEGORIES')
  end
end
