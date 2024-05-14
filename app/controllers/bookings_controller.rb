class BookingsController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :set_room, only: [:new, :create]

  # GET /bookings or /bookings.json
  def index
    if params[:user] # if the user parameter is present and true
      @bookings = Booking.by_user(current_user) # show only the bookings of the current user
    else
      @bookings = Booking.all # show all the bookings
    end
  end

  # GET /bookings/1 or /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @room = Room.find(params[:room_id])
    @booking = @room.bookings.new

    # Check if the user is logged in
    unless current_user
      flash[:notice] = "Please log in to book a room."
      redirect_to new_user_session_path
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @room = Room.find(params[:room_id])
  
    if @room.can_be_booked?
      @booking = @room.bookings.new(booking_params)
      @booking.user = current_user # Assuming you have a method to get the currently logged-in user
  
      respond_to do |format|
        if current_user == @room.owner
          format.html { redirect_to @room, alert: "You cannot book your own room." }
        elsif @booking.save
          format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = "This room is coming soon and cannot be booked yet."
      redirect_to @room
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    # Find the booking by its id and destroy it
    @booking = Booking.find(params[:id])

    # Only allows deletion if the current user owns the booking
    if current_user.admin? || current_user == @booking.user
      @booking.destroy
      respond_to do |format|
        format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to bookings_url, notice: "You are not authorized to delete this booking." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      if params[:id].present? && params[:id].to_i > 0
        @booking = Booking.find_by(params[:id])
      else
        redirect_to rooms_path, alert: "Invalid booking ID"
      end
    end
  
    def set_room
      @room = Room.find(params[:room_id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:user_id, :room_id, :check_in, :check_out)
    end

    # the method is in the booking model
    def overlapping_bookings?
      Booking.exists?(room_id: @room.room_id).where.not(id: params[:id]).where(
        '(? <= check_out) AND (check_in <= ?)', 
        booking_params[:check_in], booking_params[:check_out]
      )
    end
end
