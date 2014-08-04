require 'spec_helper'

describe ProjectsController do

  describe 'index action' do

    # Не авторизованный пользователь
    context 'when user not logged in' do
      describe 'GET #index' do
        it 'redirects to login page' do
          get :index
          expect(response).to redirect_to new_user_session_path
        end
      end
    end

    # Авторизованный пользователь
    context 'when user logged in' do
      let(:user) { FactoryGirl.create(:user) }
      #subject { FactoryGirl.create(:project, owner: user) }

      before do
        sign_in user
      end

      describe 'GET #index' do
        it 'render :index view' do
          get :index
          expect(response).to render_template :index
        end
      end
    end

  end

end
