# frozen_string_literal: true

module Api
  module V1
    # UrlShortener controller
    class UrlShortenerController < ApplicationController
      include ActionController::MimeResponds
      def create
        urls_shortener = UrlShortener.create(url_shortener_params)
        render json: urls_shortener, status: :ok if urls_shortener.persisted?
      end

      def show
        url_shortener = UrlShortener.find_by(slug: params[:slug])
        if url_shortener.expired?
          render json: 'errors/404', status: :not_found
        else
          respond_to do |format|
            format.html { redirect_to(url_shortener.url) }
            format.json { render json: url_shortener.url, status: :ok }
          end
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
