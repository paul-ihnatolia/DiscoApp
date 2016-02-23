class Admin::VideosController < AdminController

  before_action :build_video, only: :create
  before_action :find_video,  only: [:update, :destroy]

  def index
    @videos = Video.all
  end

  def create
    if @video.save
      render 'admin/videos/show.jbuilder', status: 201
    else
      render json: { errors: @video.errors.full_messages }, status: 422
    end
  end

  def update
    if @video.update(video_params)
      render json: { message: 'Updated successfully.' }, status: 200
    else
      render json: { errors: @video.errors.full_messages }, status: 422
    end    
  end

  def destroy
    @video.destroy

    render json: { message: 'Destroyed successfully.' }, status: 200
  end

  private
  def build_video
    @video = Video.new video_params
  end

  def video_params
    params.require(:video).permit(:video_type, :video_url)
  end

  def find_video
    @video = Video.find_by(id: params[:id])

    unless @video
      render json: { errors: ['Video is not found.']}, status: 404
    end
  end
end