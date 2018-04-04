class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    id = params[:id]
    @driver = Driver.find(id)
  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.new(driver_params)
    if driver.save
      redirect_to driver_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if !@driver.nil?
      if @driver.update(driver_params)
        redirect_to driver_path(@driver.id)
      else
        render :edit
      end
    else
      redirect_to drivers_path
    end
  end

  def destroy
    id = params[:id]
    @driver = Driver.find(id)
    if @driver
      @driver.destroy
    end
    redirect_to drivers_path
    end

    private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end
