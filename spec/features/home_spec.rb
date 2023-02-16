require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456', password_confirmation: '123456')
    @user.confirm

    visit home_index_path
  end

  it 'shows the right content' do
    expect(page).to have_link('LOG IN')
    expect(page).to have_link('SIGN UP')
  end

  it 'redirects to the login page' do
    click_link 'LOG IN'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end

  it 'redirects to the signup page' do
    click_link 'SIGN UP'
    expect(page).to have_current_path(new_user_registration_path)
    expect(page).to have_field('Full Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password (min. 6 chars)')
    expect(page).to have_field('Confirm Password')
  end
end
