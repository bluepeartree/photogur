class PicturesController < ApplicationController
  before_action :ensure_logged_in, except:[:show, :index]

  def index
    @pictures = Picture.all
    @today = Date.today
    @time = @today.prev_month
    @old_pictures = Picture.created_before(@time)


  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    #we're making a brand new instance of the Picture model that will help us set up a form in our view.
    @picture = Picture.new
  end

  def create
    @picture = Picture.new
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

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
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end


end
