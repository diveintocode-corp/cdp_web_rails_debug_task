require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    context 'ルートパスに遷移した場合' do
      it '一覧画面が表示される' do
        visit root_path
        expect(page).to have_content 'Blogs'
      end
    end
  end
  describe '新規作成機能' do
    context 'ブログを新規作成した場合' do
      it '作成したブログが表示される' do
        visit blogs_path
        find('#new_blog').click
        fill_in 'Title', with: 'タイトル１'
        fill_in 'Content', with: 'コンテンツ１'
        find('#submit').click
        expect(page).to have_content 'タイトル１'
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のブログ詳細画面に遷移した場合' do
      it '該当ブログの内容が表示される' do
        FactoryBot.create(:blog)
        visit blogs_path
        find('#show').click
        expect(page).to have_content 'コンテンツ１'
        expect(current_path).to eq(blog_path(1))
      end
    end
  end
  describe '編集機能' do
    context '任意のブログ編集画面に遷移した場合' do
      it '該当ブログの内容が表示される' do
        FactoryBot.create(:blog)
        visit blogs_path
        find('#edit').click
        fill_in 'Title', with: '編集したタイトル'
        fill_in 'Content', with: '編集したコンテンツ'
        find('#submit').click
        expect(page).to have_content '編集したタイトル'
      end
    end
  end
  describe '削除機能' do
    context '任意のブログを削除した場合' do
      it '該当ブログの内容が表示されない' do
        FactoryBot.create(:blog)
        visit blogs_path
        page.accept_confirm do
          find('#destroy').click
        end
        expect(page).not_to have_content 'コンテンツ１'
      end
    end
  end
end
