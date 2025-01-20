require 'sinatra/base'

module Api
  class Main < ::Sinatra::Base
    configure :development do
      set :host_authorization, { permitted_hosts: [] }
    end
   
    get '/' do
      "Welcome to Task Tracker"
    end

  end # end module MainController
end # end module Api
