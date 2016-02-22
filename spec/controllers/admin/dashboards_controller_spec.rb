require 'rails_helper'

describe Admin::DashboardsController do
  describe '#show' do
    it 'renders :show view' do
      get :show
      expect(response).to render_template(:show)
    end
  end
end