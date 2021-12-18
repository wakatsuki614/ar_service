class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    
    if @room.save
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to rooms_path
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def search
    if params[:search_area].present?
      @rooms = Room.where("address like?", "%#{params[:search_area]}%")
      @keyword = params[:search_area]
      render "search"
    else
      @rooms = Room.where("name like?", "%#{params[:search]}%")
      @keyword = params[:search]
      render "search"
    end
  end

  private

  def room_params
    params.require(:room).permit(:user_id, :name, :room_introduce, :price, :address, :room_image)
  end

end
