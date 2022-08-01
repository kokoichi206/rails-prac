class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
  end

  def create
    # prams に渡ってき方は何で決まってる？
    # @room = Room.create(name: params["room"]["name"])
    @room = Room.create(name: params["name"])
  end
end
