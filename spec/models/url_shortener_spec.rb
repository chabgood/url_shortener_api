# frozen_string_literal: true

describe UrlShortener do
  it 'should generate a slug if not provided' do
    url_shortener = FactoryBot.create(:url_shortener, url: 'http://example.com', slug: nil)
    expect(url_shortener.slug).to_not be_nil
  end
end
