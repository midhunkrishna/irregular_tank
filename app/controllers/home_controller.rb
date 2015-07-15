class HomeController < ApplicationController
  def index
    tank_service = TankService.new
    render :text => tank_service.heights
  end
end
