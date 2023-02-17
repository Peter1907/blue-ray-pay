require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:each) do
    @user = User.new(name: 'Peter', email: 'peter@gmail.com', password: '123456', password_confirmation: '123456')
    @user.confirm
    @user.save
    sign_in @user
  end

  describe 'index action' do
    before { get root_path }

    it 'should have a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'should have a new category link' do
      expect(response.body).to include('NEW CATEGORY')
    end
  end
end
