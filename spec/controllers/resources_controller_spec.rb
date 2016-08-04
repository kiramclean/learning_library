# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'action that is allowed for guests'
  end

  describe 'GET #show' do
    let(:resource) { create :resource }
    subject { get :show, params: { id: resource.id } }

    it_behaves_like 'action that is allowed for guests'
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'action that is allowed for guests'
  end

  describe 'POST #create' do
    subject { post :create, params: { resource: resource_params } }

    context 'with valid params' do
      let(:resource_params) { attributes_for :resource }

      it 'creates a new Resource' do
        expect { subject }.to change(Resource, :count).by 1
      end

      it 'redirects to resource index' do
        subject
        expect(response).to redirect_to resources_path
      end

      it 'notifies success in a flash message' do
        subject
        expect(controller).to set_flash['notice'].to t('resources.create.success.guest')
      end

      it 'does not assign the new resource to any user' do
        expect(Resource.count).to eq 0
        subject
        expect(Resource.last.user_id).to eq nil
      end

      context 'a user is logged in' do
        let(:user) { create :user }

        before { allow(controller).to receive(:current_user).and_return user }

        it 'assigns the new resource to the current user' do
          expect(user.resources.count).to eq 0
          subject
          expect(user.resources.count).to eq 1
        end
      end
    end

    context 'with invalid params' do
      let(:resource_params) { { link: nil } }

      it 'does not create a new Resource' do
        expect { subject }.not_to change(Resource, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:resource) { create :resource }

    subject { delete :destroy, params: { id: resource.id } }

    it 'destroys the requested resource' do
      expect { subject }.to change(Resource, :count).by(-1)
    end

    it 'redirects to the resources list' do
      subject
      expect(response).to redirect_to(resources_url)
    end

    it 'notifies success in a flash message' do
      subject
      expect(controller).to set_flash[:notice].to 'Resource was successfully destroyed.'
    end
  end
end
