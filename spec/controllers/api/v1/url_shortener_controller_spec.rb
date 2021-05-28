# frozen_string_literal: true

describe Api::V1::UrlShortenerController do
  context '#create' do
    describe 'when slug provided' do
      it 'returns a 200' do
        post :create, params: { url: 'http://moo.com/i_love_this_site', slug: 'moo' }
        expect(response.status).to eq 200
      end
    end

    describe 'when slug not provided' do
      it 'returns generates a slug' do
        post :create, params: { url: 'http://moo.com/i_love_this_site' }
        expect(response.status).to eq 200
      end
      it 'returns a 200' do
        post :create, params: { url: 'http://moo.com/i_love_this_site' }
        expect(response.status).to eq 200
      end
    end
  end
  context '#show' do
    it 'when a slug is provided' do
      url_shortener = FactoryBot.create(:url_shortener)
      get :show, params: { slug: url_shortener.slug }
      expect(response.status).to eq 200
    end

    it 'should return the url when a slug is given' do
      url_shortener = FactoryBot.create(:url_shortener)
      get :show, params: { slug: url_shortener.slug }
      expect(response.body).to eq url_shortener.url
    end

    describe 'can expire a url' do
      it 'should return a 404' do
        url_shortener = FactoryBot.create(:url_shortener, expires_on: Time.zone.today.yesterday)
        get :show, params: { slug: url_shortener.slug }
        expect(response.status).to eq 404
      end
    end
  end
  describe 'can delete a url' do
    it 'should delete a url shortener' do
      url_shortener = FactoryBot.create(:url_shortener)
      expect do
        delete :destroy, params: { id: url_shortener.id }
      end.to change(UrlShortener, :count).by(-1)
    end
  end
end
