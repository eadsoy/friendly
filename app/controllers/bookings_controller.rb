class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @friend_group = FriendGroup.find(params[:friend_group_id])
    @booking.friend_group = @friend_group
    @user = User.last.id
    @booking.user_id = @user


    if @booking.save
      redirect_to friend_group_path(@friend_group)
    else
      render 'cocktails/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :total_price)
  end
end
