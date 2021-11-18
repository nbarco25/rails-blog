require 'rails_helper'

RSpec.describe Visible do
  let(:current_user) do
    User.create(
      email: 'natalia25@gmail.com',
      password: 'qwerty123456'
    )
  end

  let(:valid_article_params) do
  {
    title: 'Hello',
    body: 'This is a first article',
    status: 'public'
  }
  end

  let(:valid_comment_params) do
  {
    body: "Ohhh, that's cool",
    status: 'public'
  }
  end

  describe 'valid statuses' do
    context 'validates articles statuses' do
      it 'expects false when public' do
        article = current_user.articles.create(valid_article_params)
        article.save
        expect(article.archived?).to eq(false)
      end

      it 'expects true when archived' do
        article = current_user.articles.create(valid_article_params)
        article.status = 'archived'
        article.save
        expect(article.archived?).to eq(true)
      end

      it 'expects false when private' do
        article = current_user.articles.create(valid_article_params)
        article.status = 'private'
        article.save
        expect(article.archived?).to eq(false)
      end
    end

    context 'validates comments statuses' do
      it 'expects false when public' do
        article = current_user.articles.create(valid_article_params)
        article.save
        comment = article.comments.create(valid_comment_params)
        expect(comment.archived?).to eq(false)
      end

      it 'expects true when archived' do
        article = current_user.articles.create(valid_article_params)
        article.save
        comment = article.comments.create(valid_comment_params)
        comment.status = 'archived'
        expect(comment.archived?).to eq(true)
      end

      it 'expects false when private' do
        article = current_user.articles.create(valid_article_params)
        article.save
        comment = article.comments.create(valid_comment_params)
        comment.status = 'private'
        expect(comment.archived?).to eq(false)
      end
    end
  end
end
