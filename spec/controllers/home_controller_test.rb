require 'rails_helper'

describe HomeController do
  describe '#index' do
    it 'renders index view' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end