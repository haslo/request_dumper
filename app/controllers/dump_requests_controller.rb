class DumpRequestsController < ApplicationController

  def create
    headers = request.env.select { |k, _v| k =~ /\AHTTP_/ }.map do |header|
      "#{header[0].gsub(/\AHTTP_/, '')}: #{header[1]}"
    end.join("\n")
    body    = request.raw_post
    Request.create!(headers: headers, body: body)
    begin
      json_body = JSON.parse(body)
      if json_body.keys.sort == ['EUI', 'ack', 'bat', 'cmd', 'data', 'fcnt', 'port', 'seqno', 'ts']
        RequestMailer.request_mail(json_body['EUI'], json_body['data']).deliver_now
      end
    rescue
      # noop
    end
    render json: { headers: headers.split("\n"), body: body }, status: :ok
  end

end
