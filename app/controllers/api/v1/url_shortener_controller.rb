# frozen_string_literal: true

module Api
  module V1
    # UrlShortener controller
    class UrlShortenerController < ApplicationController
      def create
        urls_shortener = UrlShortener.create(url_shortener_params)
        render json: urls_shortener, status: :ok if urls_shortener.persisted?
      end

      def show
        url_shortener = UrlShortener.find_by(slug: params[:slug])
        if url_shortener.expired?
          render json: 'errors/404', status: :not_found
        else
          render json: url_shortener.url, status: :ok
        end
      end

      def destroy
        UrlShortener.find_by(id: params[:id]).destroy!
        head :no_content
      end

      private

      def url_shortener_params
        params.permit(:url, :slug, :expires_on)
      end
    end
  end
end
