require 'spec_helper'

describe MeetingsController do

  # Не авторизованный пользователь
  context 'when user not logged in' do
    let(:project) { FactoryGirl.create(:project) }
    describe 'GET #index' do
      it 'redirects to login page' do
        get :index, project_id: project.id
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
        get :index, project_id: project.id
        expect(response).to render_template :index
      end

      it 'assigns the requested meeting to subject' do
        get :index, project_id: project.id
        expect(assigns(:meetings)).to eq([subject])
      end
    end

    describe 'GET #show' do
      it 'renders :show view' do
        get :show, project_id: project.id, id: subject
        expect(response).to render_template :show
      end

      it 'assigns the requested meeting to subject' do
        get :show, project_id: project.id, id: subject
        expect(assigns(:meeting)).to eq(subject)
      end
    end

    describe 'GET #new' do
      it 'renders :new view' do
        get :new, project_id: project.id
        expect(response).to render_template :new
      end

      it 'assigns the requested meeting to new meeting' do
        get :new, project_id: project.id
        expect(assigns(:meeting)).to be_new_record
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'create new object' do
          expect{
            post :create, meeting: FactoryGirl.attributes_for(:meeting, project_id: project.id)
          }.to change(Meeting, :count).by(1)
        end

        it 'redirects to index path' do
          post :create, meeting: FactoryGirl.attributes_for(:meeting, project_id: project.id)
          expect(response).to redirect_to project_meetings_path(project)
        end
      end
    end

    describe 'GET #edit' do
      it 'renders :edit view' do
        get :edit, project_id: project.id, id: subject
        expect(response).to render_template :edit
      end

      it 'assigns the requested meeting to subject' do
        get :edit, project_id: project.id, id: subject
        expect(assigns(:meeting)).to eq(subject)
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        it 'updates object' do
          expect{
            post :update, project_id: project.id, id: subject, meeting: { title: 'new_meeting' }
          }.to change{ subject.reload.title }.to('new_meeting')
        end

        it 'redirects to index path' do
          post :update, project_id: project.id, id: subject, meeting: { title: 'new_meeting' }
          expect(response).to redirect_to project_meeting_path(project, subject)
        end
      end
    end

    describe 'DELETE #destroy' do
      before(:each) { @meeting = FactoryGirl.create :meeting, owner: user, project: project }

      it 'deletes the object' do
        expect{
          delete :destroy, project_id: project.id, id: @meeting
        }.to change(Meeting, :count).by(-1)
      end

      it 'redirects to index path' do
        delete :destroy, project_id: project.id, id: @meeting
        expect(response).to redirect_to project_meetings_path(project)
      end
    end

  end

end
