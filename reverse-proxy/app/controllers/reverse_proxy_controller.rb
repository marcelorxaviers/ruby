class ReverseProxyController < ApplicationController
  def redirect
    to_url = Rule.fetch_to_url(request.url)

    if to_url.present?
      redirect_to to_url
    else
      render json: {error: "not-found", status: 404}.to_json, status: 404
    end
  end

  def render_now
    render json: ["You are at: #{request.url}"]
  end
end