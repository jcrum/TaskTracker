module Controllers
  module General
    def self.registered(app)        
      app.get '/' do
        "Welcome to #{settings.app_name}"
      end
    end
  end
end
