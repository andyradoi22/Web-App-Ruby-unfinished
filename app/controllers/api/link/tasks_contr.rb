class Api::Link::TasksController < AccountController
    def update
        @story = Story.find(params[:id])
        @story.update(users: [@current_user])
        TaskAssigner.perform_async(@current_user.id, @story.id)
        render json: {status:'SUCCES', message: 'Linked tasks', data:@story}, status: :ok
    end

    def destroy
        @tasks = Entery.where(user_id:@current_user.id)
        @tasks.destroy_all
        render json: {status:'SUCCES', message: 'Cleared tasks', data:@tasks}, status: :ok
    end
end