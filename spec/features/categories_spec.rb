require 'rails_helper'

RSpec.describe 'Categories page', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    @category = Category.new(name: 'test', user_id: @user.id, icon_data: TestData.image_data)
    @category.save

    visit root_path
  end

  it 'shows the right content' do
    expect(page).to have_content('CATEGORIES')
    expect(page).to have_content('test')
  end

  it 'redirects to the transactions page' do
    click_on 'test'
    expect(page).to have_current_path(transactions_path(@category))
  end

  it 'redirects to the new category page' do
    click_on 'NEW CATEGORY'
    expect(page).to have_current_path(new_category_path)
    expect(page).to have_field('Name')
    expect(page).to have_content('Icon')
  end
end
