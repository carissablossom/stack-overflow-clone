require 'rails_helper'

Rspec.describe QuestionsController do
  it "responds with a status of 200" do
    get :index
    expect(response.status).to eq(200)
  end
  it "assigns the questions instance variable" do
    get :index
    expec(assigns(:questions)).to be_a(String)
  end

end