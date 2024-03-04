# frozen_string_literal: true

require_relative 'time_format'

class App
  def call(env)
    request = Rack::Request.new(env)
    handle_time(request)
  end

  def handle_time(request)
    if request.params['format'].nil?
      @response = Rack::Response.new('enter param', 200)
    else
      time_format = TimeFormat.new(request.params)

      @response = if time_format.valid?
                    Rack::Response.new(time_format.result, 200)
                  else
                    Rack::Response.new(time_format.error_message, 400)
                  end
    end
    @response.finish
  end
end
