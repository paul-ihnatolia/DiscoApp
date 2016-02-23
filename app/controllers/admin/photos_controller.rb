class Admin::PhotosController < AdminController

  before_action :build_photo, only: :create
  before_action :find_photo,  only: [:update, :destroy]

  def index
    @photos = Photo.all
    if params[:event_id].present?
      @photos = @photos.where(event_id: params[:event_id])
    elsif params[:standalone]
      @photos = @photos.where(standalone: true)
    end
  end

  def create
    if @photo.save
      render 'admin/photos/show.jbuilder', status: 201
    else
      render json: { errors: @photo.errors.full_messages }, status: 422
    end
  end

  def update
    if @photo.update(photo_params)
      render json: { message: 'Updated successfully.' }, status: 200
    else
      render json: { errors: @photo.errors.full_messages }, status: 422
    end    
  end

  def destroy
    @photo.destroy

    render json: { message: 'Destroyed successfully.' }, status: 200
  end

  private
  def build_photo
    @photo = Photo.new photo_params
    if params[:event_id].present?
      @photo.event_id = params[:event_id].to_i
    end
  end

  def photo_params
    params.require(:photo).permit(:content, :is_cover, :standalone)
  end

  def find_photo
    @photo = Photo.find_by(id: params[:id])

    unless @photo
      render json: { errors: ['Photo is not found.']}, status: 404
    end
  end
end