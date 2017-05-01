class PhotosController < ApplicationController

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    # render("photos/create_row.html.erb")
    p = Photo.new
    p.source = params["the_image_url"]
    p.caption = params["the_caption"]
    p.save
    redirect_to("/photos")
  end

  def index
    @all_photos = Photo.all.order({:created_at => :desc })
    render("photos/index.html.erb")
  end

  def show
    # The params has looks like this: {"the_id_number"=>}

    id_number = params["the_id_number"]

    @photo = Photo.find(id_number)
    render("photos/show.html.erb")
  end


  def edit_form
    @photo = Photo.find(params[:the_id])
    render ("photos/edit_form.html.erb")
  end

  def update_row
    p = Photo.find(params[:the_id])

    p.source = params[:the_source]
    p.caption = params[:the_caption]
    p.save

    @the_id = p.id

    redirect_to("/photos/#{@the_id}")
  end

  def destroy_row
    p = Photo.find(params[:the_id])
    p.destroy
    @remaining_count = Photo.count
    redirect_to("/photos")
  end

end
