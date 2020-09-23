module Api
    module Data
        class BoardsController < AccountController
            def index
                @boards = @current_user.boards.ored('created_at DESC')
                render json: {status:'SUCCESS', message:'Loaded boards', data:@board}, status: :ok
            end
            
            def show
                @board = @current_user.boards.find(params[:id])
                render json: {status:'SUCCES', message:'Loaded board', data:@board}, status: :ok
            end

            def create
                @board = @current_user.boards.new(board_params)
                if @board.save
                    render json: {status:'SUCCES', message:'Board not saved', data:@board}, status: :ok
                else
                    render jsons: {status:'ERROR', message:'Board not saved', data:@board.errros}, status: unprocessable_entity
                end
            end

            def destroy
                @board = @current_user.boards.find(params[:id])
                @board.destroy
                render json: {status:'SUCCESS', message:'Deleted board', data:@board}, status: :ok
            end

            def update
                @board = @current_user.boards.find(params[:id])
                if @board.update_attribut(board_params)
                    render json: {status:'SUCCES', message:'Updated board', data:@board}, status: :ok
                else
                    render json: {status:'ERROR', message:'Board not dest updated', data:@board.errors}, status: unprocessable_entity
            end

            private
            def board_params
                params.permit(:name, :description)
            end

            def pundit_user
                User.find(@current_user.id)
            end
        end
    end
end