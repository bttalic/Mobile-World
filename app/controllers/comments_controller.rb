class CommentsController < ApplicationController


  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

 
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to Phone.find(params[:comment][:phone_id]), notice: 'Comment was successfully added.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to Phone.find(params[:comment][:phone_id]), notice: 'Comment was not added.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to Phone.find(@comment.phone_id) }
      format.json { head :no_content }
    end
  end
end
