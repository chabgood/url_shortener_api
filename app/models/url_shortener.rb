# frozen_string_literal: true

# UrlShortener AR model
class UrlShortener < ApplicationRecord
  before_create :generate_slug

  def expired?
    return true if expires_on.present? && Time.zone.today >= expires_on

    false
  end

  private

  def generate_slug
    self.slug = SecureRandom.uuid[0..5] if slug.blank?
    true
  end
end
