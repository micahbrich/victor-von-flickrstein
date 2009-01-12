class CommentsController < ApplicationController
  before_filter :load_post

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = @post.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end


  # POST /comments
  # POST /comments.xml
  def create
    @comment = @post.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(@post, @comment) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        flash[:comment_error] = "Aw, I couldn't save it. Please double check all the boxes!"
        format.html { render( :template=> 'posts/show' ) }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_path(@post)) }
      format.xml  { head :ok }
    end
  end
  
  protected
    def load_post
      @post = Post.find(params[:post_id])
    end
end
