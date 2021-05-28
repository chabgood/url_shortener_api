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

    describe 'can expire a url' do
      xit 'should return a 404' do
        get :show, params: { url: 'http://moo.com/i_love_this_site', expires_on: Date.today.yesterday }
        expect(response.status).to eq 404
      end
    end
    describe 'can delete a url'
  end
end
