require 'spec_helper'

RSpec.describe 'Api::Main' do
  it 'responds to GET / with the welcome message' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to Task Tracker')
  end
end
