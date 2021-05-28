# frozen_string_literal: true

module Api
  module V1
    # UrlShortener controller
    class UrlShortenerController < ApplicationController
      def create
        urls_shortener = UrlShortener.create(url_shortener_params)
        if urls_shortener.persisted?
          render json: urls_shortener, status: :ok
        end
      end

      # def show

      # end

      private

      def url_shortener_params
        params.permit(:url, :slug, :expires_on)
      end
    end
  end
end
