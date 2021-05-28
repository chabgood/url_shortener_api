# frozen_string_literal: true

describe 'Html Show', type: :request do
  it 'redirects to the url' do
    url_shortener = FactoryBot.create(:url_shortener)
    get api_v1_show_url(url_shortener.slug)
    expect(response).to redirect_to url_shortener.url
  end
end
