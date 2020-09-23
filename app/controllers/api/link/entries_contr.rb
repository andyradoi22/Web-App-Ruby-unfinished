class Api::Link::EntriesController < AccountController
    def update
        @board = Board.find(params[:id])
        @board.update(users:[@current_user])
        @link = Entery.where(user_id: @current_user.id, @board.id)
        @link.update(entery_params)
        render json: {status:'SUCCES', message:'Linked board', data@link}, status: :ok
    end

    def destroy
        @board = Board.find(params[:id])
        @link = Entery.where(user_id: @current_user.id, board_id:@board.id)
        @link.destroy
        render json: {status:'SUCCES', messahge:'Removed link', data:@link}, status: :ok
    end

    private
    def entery_params
        params.permit(:title, :level)
    end
end