class PostsController < ApplicationController
  layout "application", :except => [:feed]
  
  def index
    @post = Post.find_desc.first
    @comment = @post.comments.new
    
    @next = Post.next(@post)
    @prev = Post.prev(@post)
  end

  def about
  end
  
  def archive
    @posts = Post.paginate :page => params[:page], :order => 'created_at DESC'
  end
  
  def feed
    @posts = Post.find_desc(:limit => 10)
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    
    @next = Post.next(@post)
    @prev = Post.prev(@post)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

end
