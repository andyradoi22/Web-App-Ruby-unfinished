class UserMailer < ApplicationMailer
    def welcome_emaile(user_id)
        @user = User.find(user_id)
        mail(to: @user.email, subject: "Welcome")
    end

    def assigment_email(user_id, task_id)
        @user = User.find(user_id)
        @task = Story.find(task_id)
        mail(to: @user.email, subject: "Assignment")
    end
end