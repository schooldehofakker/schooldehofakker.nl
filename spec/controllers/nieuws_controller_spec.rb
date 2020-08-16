require 'rails_helper'

# Change this NieuwsController to your project
RSpec.describe NieuwsController, type: :controller do
  let(:invalid_news_attributes) { {} }

  let(:valid_news_attributes) do
    { title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph,
      status: ['published', 'unpublished', 'deleted'].sample,
      published_at: Time.now }
  end

  let(:valid_session) { {} }

  context 'as a guest' do
    describe 'GET #index' do
      it 'returns a success response' do
        News.create! valid_news_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #create' do
      it 'redirects to signin' do
        get :create, params: { news: valid_news_attributes }, session: valid_session
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'as an user' do
    login_user

    describe 'GET #index' do
      it 'returns a success response' do
        News.create! valid_news_attributes
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #create' do
      it 'redirects to signin' do
        get :create, params: { news: valid_news_attributes }, session: valid_session
        expect(response).to have_http_status(302)
      end
    end
  end

  context 'as an admin' do
    login_admin

    context 'with valid_news_attributes' do
      describe 'GET #create' do
        it 'redirect an admin to news slug' do
          get :create, params: { news: valid_news_attributes }, session: valid_session
          slug = "/nieuws/#{valid_news_attributes[:title].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}"
          expect(response).to redirect_to slug
        end
      end

      describe 'GET #new' do
        it 'returns a success response' do
          get :new, params: {}, session: valid_session
          expect(response).to be_successful
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
