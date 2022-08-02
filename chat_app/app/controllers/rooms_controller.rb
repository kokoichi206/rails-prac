class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
    render 'index'
  end

  def show
    @single_room = Room.find(params[:id])

    @rooms = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)
    render 'index'
  end

  def create
    # prams に渡ってき方は何で決まってる？
    # @room = Room.create(name: params["room"]["name"])
    @room = Room.create(name: params['room']['name'])
  end
end
