require 'spec_helper'

describe MeetingsController do

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
    let(:project) { FactoryGirl.create(:project) }
    subject { FactoryGirl.create(:meeting, owner: user, project: project) }

    before do
      sign_in user
    end

    describe 'GET #index' do
      it 'renders :index view' do
        get :index
        expect(response).to render_template :index
      end

      it 'assigns the requested meeting to subject' do
        get :index
        expect(assigns(:meetings)).to eq([subject])
      end
    end

    describe 'GET #show' do
      it 'renders :show view' do
        get :show, id: subject
        expect(response).to render_template :show
      end

      it 'assigns the requested meeting to subject' do
        get :show, id: subject
        expect(assigns(:meeting)).to eq(subject)
      end
    end

    describe 'GET #new' do
      it 'renders :new view' do
        get :new
        expect(response).to render_template :new
      end

      it 'assigns the requested meeting to new meeting' do
        get :new
        expect(assigns(:meeting)).to be_new_record
      end
    end
=begin
    describe 'POST #create' do
      context 'with valid attributes' do
        it 'create new object' do
          expect{
            post :create, project: FactoryGirl.attributes_for(:project)
          }.to change(Project, :count).by(1)
        end

        it 'redirects to index path' do
          post :create, project: FactoryGirl.attributes_for(:project)
          expect(response).to redirect_to projects_path
        end
      end
    end

    describe 'GET #edit' do
      it 'renders :edit view' do
        get :edit, id: subject
        expect(response).to render_template :edit
      end

      it 'assigns the requested project to subject' do
        get :edit, id: subject
        expect(assigns(:project)).to eq(subject)
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        it 'updates object' do
          expect{
            post :update, id: subject, project: { title: 'new_project' }
          }.to change{ subject.reload.title }.to('new_project')
        end

        it 'redirects to index path' do
          post :update, id: subject, project: { title: 'new_project' }
          expect(response).to redirect_to project_path(subject)
        end
      end
    end

    describe 'DELETE #destroy' do
      before(:each) { @project = FactoryGirl.create :project, owner: user }

      it 'deletes the object' do
        expect{
          delete :destroy, id: @project
        }.to change(Project, :count).by(-1)
      end

      it 'redirects to index path' do
        delete :destroy, id: @project
        expect(response).to redirect_to projects_path
      end
    end
=end
  end

end
