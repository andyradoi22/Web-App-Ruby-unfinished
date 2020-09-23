module Api
    module Data
        class StoriesController < AccountController
            def index
                @board = @current_user.board.find(params[:board_id])
                @column = @board.column.find(params[:column_id])
                @story = @column.stories.oreder('created_at DESC')
                render json: {status:'SUCCES', message:'Loaded stories', data:@story}, status: :ok
            end

            def show
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.find(params[:column_id])
                @story = @column.stories.find(params[:id])
                render json: {status:'SUCCES', message:'Loaded specified story', data:@story}, status: :ok
            end

            def create
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.find(params[:column_id])
                @story = @column.stories.new(story_params)
                @current_user.stories.update(stories: [story])
                if @story.save
                    render json: {status:'SUCCESS', message:'Saved sotry', data:@story}, status: :ok
                else
                    render json: {sttus:'ERROR', message:'Story not saved', data:@story.errors}, status: unprocessable_entity
                end
            end

            def destroy
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.find(params[:column_id])
                @story = @column.stories.find(params[:id])
                @story.destroy
                render json: {status:'SUCCES', message:'Deleted story', data:@story}, status: :ok
            end

            def update
                @board = @current_user.boards.find(params[:board_id])
                @column = @board.columns.find(params[:column_id])
                @story = @column.find(params[:id])
                if @story.update_attributes(story_params)
                    render json: {status:'SUCCES', message:'Updated sotry', data:@story}, status: :ok
                else
                    render json: {status:'SUCCES', message:'Cannot update sotry', data:@story.errors}, status: unprocessable_entity
                end
            end

            private
            def story_params
                params.permit(:task, :info, :order, :tag, :status, :due)
            end
        end
    end
end