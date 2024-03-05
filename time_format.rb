# frozen_string_literal: true

class TimeFormat
  TIME_FORMAT = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(params)
    @format_params = params['format']&.split(',')
  end

  def format_valid?
    unknow_formats.empty?
  end

  def current_time_formatted
    Time.now.strftime(TIME_FORMAT.values_at(*@format_params).join('-'))
  end

  def error_message
    "Unknown time format [#{unknow_formats.join(', ')}]"
  end

  private

  def unknow_formats
    @format_params - TIME_FORMAT.keys
  end
end
