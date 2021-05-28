# frozen_string_literal: true

FactoryBot.define do
  factory :url_shortener do
    url { 'http://moo.com' }
    slug { 'moo' }
  end
end
