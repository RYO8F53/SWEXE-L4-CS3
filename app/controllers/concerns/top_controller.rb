class TopController < ApplicationController
    def main
        if session[:login_uid]
            render 'main'
        else
            render 'login'
        end
    end
    
    def login
        if BCrypt::Password.new("$2a$12$i0Pr08c8Uz1fg3oJqx3OMubyeUw.o4V3Y5sL7ansDN3meVSn3SRKO") == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'login_failed'
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end