class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
          flash[:success] = "Comment successfully created"
          redirect_to @comment.post
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end
    
end