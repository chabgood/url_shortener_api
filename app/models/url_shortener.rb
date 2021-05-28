# frozen_string_literal: true

# UrlShortener AR model
class UrlShortener < ApplicationRecord
  before_create :generate_slug

  private

  def generate_slug
    self.slug = SecureRandom.uuid[0..5] if slug.blank?
    true
  end
end
