require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  user = User.create(
    email: 'angie@gmail.com',
    password: 'qwerty'
  )
  let(:valid_attributes) do
    {
      title: 'test title',
      body: 'test body text ...',
      status: 'public'
    }
  end

  describe 'GET /index' do
    it 'displays all articles' do
      get articles_url
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    context "user isn't authenticated" do
      it 'redirects to sign in page' do
        get '/articles/id', params: { article: { title: 'The IA', body: 'asdsd sd sds ds dsd sd', status: 'public' } }
        expect(response).to have_http_status(:found)
      end

      context 'user is authenticated' do
        it 'displays article page' do
          article = Article.new(valid_attributes)
          article.user = user
          article.save
          get article_url(article)
          expect(response).to have_http_status(:found)
        end
      end
    end
  end
end
