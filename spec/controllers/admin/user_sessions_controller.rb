require 'rails_helper'

RSpec.describe Admin::UserSessionsController, type: :controller do
  describe "POST #create" do
    context 'it creates user_session' do
      before :each do
        FactoryGirl.create(:user, email: 'test@t.com',
                                  password: 'derevo',
                                  password_confirmation: 'derevo')
        user_session_params = { email: 'test@t.com',
                                password: 'derevo'
                              }
        post :create, user_session: user_session_params
      end

      it "returns http success" do
        expect(response).to redirect_to(admin_root_path)
      end
    end

    context 'it fails' do
      before :each do
        user_session_params = { email: 'test@t.com',
                                password: 'derevo'
                              }
        post :create, user_session: user_session_params
      end

      it 'render new_session page' do
        expect(response).to render_template(:new)
      end

      it 'contains errors' do
        expect(assigns(:user_session).errors.empty?).not_to be true
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      activate_authlogic
      user = FactoryGirl.create(:user)
      UserSession.create(user)
      delete :destroy
    end

    it 'returns success' do
      expect(response).to redirect_to(root_url)
    end
  end

  describe "GET #new" do
    context 'when user signed in' do
      before :each do
        activate_authlogic
        user = FactoryGirl.create(:user)
        UserSession.create(user)
        get :new
      end

      it 'should redirect user to root_url' do
        expect(response).to redirect_to(admin_root_path)
      end

      it 'should set flash message' do
      end
    end

    context 'when user is not signed in' do
      before :each do
        get :new
      end

      it 'should render new' do
        expect(response).to render_template(:new)
      end
    end
  end
end
