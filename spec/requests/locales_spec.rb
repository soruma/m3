# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'locales', type: :request do
  context 'パスに言語指定がある場合' do
    it 'その言語とする' do
      get '/ja'
      expect(I18n.locale).to eq :ja
    end

    it '無効な言語の場合はデフォルトの英語とする' do
      get '/zh'
      expect(I18n.locale).to eq :en
    end
  end

  context '環境変数 HTTP_ACCEPT_LANGUAGE がある場合' do
    it 'HTTP_ACCEPT_LANGUAGE の言語を使用する' do
      get '/', headers: { HTTP_ACCEPT_LANGUAGE: 'ja' }
      expect(I18n.locale).to eq :ja
    end

    it '国コードがついていても正しく判断できる' do
      get '/', headers: { HTTP_ACCEPT_LANGUAGE: 'ja-JP' }
      expect(I18n.locale).to eq :ja
    end

    it '複数の言語がある場合、最初に一致した有効な言語を使用する' do
      get '/', headers: { HTTP_ACCEPT_LANGUAGE: 'zh,ja' }
      expect(I18n.locale).to eq :ja
    end

    it '有効な言語がない場合、デフォルトの英語とする' do
      get '/', headers: { HTTP_ACCEPT_LANGUAGE: 'zh,cn' }
      expect(I18n.locale).to eq :en
    end

    it 'パスに言語指定もある場合、パスの指定を優先する' do
      get '/ja', headers: { HTTP_ACCEPT_LANGUAGE: 'en' }
      expect(I18n.locale).to eq :ja
    end
  end

  context 'いずれもない場合' do
    it 'デフォルトで英語になる' do
      get '/'
      expect(I18n.locale).to eq :en
    end
  end
end
