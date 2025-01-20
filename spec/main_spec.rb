require 'spec_helper'


RSpec.describe 'Main Configuration' do
  it 'has a database configuration' do
    expect(app.settings.database_url).not_to be_nil
  end
end
