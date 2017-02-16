require 'rspec'

RSpec.describe ConferencesController, :type => :controller do

  describe 'Get #index of conferences' do
    it 'should return the conference' do
      get :index
      expect(response).to render_template('index')
    end
  end
end