class SessionsController < ApplicationController
    def new
        @sessions = Session.new
    end

    def create

    end 
end