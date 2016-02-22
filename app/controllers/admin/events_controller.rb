class Admin::EventsController < AdminController

  before_action :build_event, only: :create
  before_action :find_event,  only: [:update, :destroy]
  def index
    @events = Event.all
  end

  def create
    if @event.save
      render 'admin/events/show.jbuilder', status: 201
    else
      render json: { errors: @event.errors.full_messages }, status: 422
    end
  end

  def update
    if @event.update(event_params)
      render json: { message: 'Updated successfully.' }, status: 200
    else
      render json: { errors: @event.errors.full_messages }, status: 422
    end    
  end

  def destroy
    @event.destroy

    render json: { message: 'Destroyed successfully.' }, status: 200
  end

  private
  def build_event
    @event = Event.new event_params
  end

  def event_params
    params.require(:event).permit(:title, :event_date, :is_prior,
                                  :video_url, :banner)
  end

  def find_event
    @event = Event.find_by(id: params[:id])

    unless @event
      render json: { errors: ['Event is not found.']}, status: 404
    end
  end
end