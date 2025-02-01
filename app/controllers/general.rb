# frozen_string_literal: true

module Controllers
  ######
  # General Controller
  #
  # Nothing too specific going on here
  #
  module General
    def self.registered(app)
      app.instance_eval do
        get '/' do
          settings.logger.info('In general')
          { 'success': true }.to_json
        end
      end
    end
  end
end
