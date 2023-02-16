require 'rails_helper'

RSpec.describe "Home", type: :request do
  it "should have a 200 status code" do
    get home_index_path
    expect(response).to have_http_status(200)
  end

  it "should render the index template" do
    get home_index_path
    expect(response).to render_template(:index)
  end

  it "should have a sign up link" do
    get home_index_path
    expect(response.body).to include("SIGN UP")
  end

  it "should have a sign in link" do
    get home_index_path
    expect(response.body).to include("LOG IN")
  end
end
