# frozen_string_literal: true

require_relative 'time_format'

class App
  def call(env)
    request = Rack::Request.new(env)
    handle_time(request)
  end

  private

  def handle_time(request)
    status = 200
    body = ''

    if request.params['format'].nil?
      body = 'enter param'
    else
      time_format = TimeFormat.new(request.params)

      if time_format.format_valid?
        body = time_format.current_time_formatted
      else
        status = 400
        body = time_format.error_message
      end
    end
    @response = Rack::Response.new(body, status)
    @response.finish
  end
end
