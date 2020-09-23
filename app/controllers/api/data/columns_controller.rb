module Api
    module Data
        class ColumnsController < AccountController
            def index
                @board = @current_user.boards.find(params[:board_id])
                @columns = @board.columns.order('created_at DESC')
                render json: {status:'SUCCES', message:'Loaded columns for selected board', data:@column}, status: :ok
            end

            def show
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.find(params[:id])
                render json: {status:'SUCCES', message:'Loaded specified column', data:@column},status: :ok
            end

            def create
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.new(column_params)
                if @column.save
                    render json: {status:'SUCCESS', message:'Saved column', data:@column}, status: :ok
                else
                    render json: {status:'ERROR', message:'Column not saved', data:@column.errors}, status: unprocessable_entity
                end
            end
            
            def destroy
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.find(params[:id])
                @column.destroy
                render json: {status:'SUCCESS', message:'Deleted column', data:@column}, status: :ok
            end

            def update
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.find(params[:id])
                if @column.update_attributes(column_params)
                    render json: {status:'SUCCES', message:'Updated column', data:@column}, status: :ok
                else
                    render json: {status:'ERROR', message:'Column not updated', data:@column.errors}, status: unprocessable_entity
                end
            end

            private
            def column_params
                params.permit(:title, :order)
            end
        end
    end
end