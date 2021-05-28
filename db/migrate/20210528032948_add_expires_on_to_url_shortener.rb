# frozen_string_literal: true

# migration
class AddExpiresOnToUrlShortener < ActiveRecord::Migration[6.0]
  def change
    add_column :url_shorteners, :expires_on, :datetime
  end
end
