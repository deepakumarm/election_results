class ShortLinksController < ApplicationController
  after_action :increment_view_count, only: :redirect_to_original_url

  def index
    puts "link"
    @url = "www.google.com"
  end

  def redirect_to_original_url
    link = ShortLink.find(params[:short_url])
    redirect_to "http://#{link.name}"
  end

  private

  def increment_view_count
    ShortLink.increment_counter(:value, params[:short_url])
  end

end