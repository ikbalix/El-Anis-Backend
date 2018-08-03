# Preview all emails at http://localhost:3000/rails/mailers/users_mailer
class UsersMailerPreview < ActionMailer::Preview
    def welcome_user_preview
        UsersMailer.welcome_user(User.first)
      end
end
