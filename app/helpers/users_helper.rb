module UsersHelper
    def display_auth_token(user)
        return unless can? :read, user
    
        "Auth token: #{user.auth_token}"
    end
end