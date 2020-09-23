class TaskAssigner
    include Sidekiq::Worker
    def perform(uid, sid)
        UserMailer.assignment_email(uid, sid).deliver
    end
end