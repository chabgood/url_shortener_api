# frozen_string_literal: true

# migration
class CreateUrlShorteners < ActiveRecord::Migration[6.0]
  def change
    create_table :url_shorteners do |t|
      t.string :url
      t.string :slug

      t.timestamps
    end
  end
end
