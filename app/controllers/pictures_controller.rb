class PicturesController < ApplicationController
  before_action :load_picture, only:[:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except:[:show, :index]
  # before_action :ensure_user_owns_picture

  def index
    @pictures = Picture.all
    @today = Date.today
    @time = @today.prev_month
    @old_pictures = Picture.created_before(@time)
  end

  def show
  end

  def new
    #we're making a brand new instance of the Picture model that will help us set up a form in our view.
    @picture = Picture.new
  end

  def create
    @picture          = Picture.new
    @picture.title    = params[:picture][:title]
    @picture.artist   = params[:picture][:artist]
    @picture.url      = params[:picture][:url]
    @picture.user_id  = @current_user.id

    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
  end

  def update
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to "/pictures"
  end

  def ensure_user_owns_picture
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end


end
