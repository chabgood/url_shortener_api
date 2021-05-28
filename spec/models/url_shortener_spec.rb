# frozen_string_literal: true

describe UrlShortener do
  it 'should generate a slug if not provided' do
    url_shortener = FactoryBot.create(:url_shortener, url: 'http://example.com', slug: nil)
    expect(url_shortener.slug).to_not be_nil
  end

  describe '#expired?' do
    it 'returns true if the date is earlier than today' do
      url_shortener = FactoryBot.create(:url_shortener, expires_on: Time.zone.today.yesterday)
      expect(url_shortener.expired?).to be_truthy
    end

    it 'returns true if the date is today' do
      url_shortener = FactoryBot.create(:url_shortener, expires_on: Time.zone.today)
      expect(url_shortener.expired?).to be_truthy
    end

    it 'returns false if the date is later than today' do
      url_shortener = FactoryBot.create(:url_shortener, expires_on: Time.zone.tomorrow)
      expect(url_shortener.expired?).to be_falsey
    end
  end
end
