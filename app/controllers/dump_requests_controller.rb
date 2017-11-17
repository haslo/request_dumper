class DumpRequestsController < ApplicationController

  def create
    headers = request.env.select { |k, _v| k =~ /\AHTTP_/ }.map do |header|
      "#{header[0].gsub(/\AHTTP_/, '')}: #{header[1]}"
    end.join("\n")
    body    = request.raw_post
    Request.create!(headers: headers, body: body)
    render json: { headers: headers.split("\n"), body: body }, status: :ok
  end

end
