class HomeController < ApplicationController
  def index
    @tank_service = TankService.new
    @irregular_tank = IrregularTank.new(@tank_service.heights)
    @imaging_service = ImagingService.new(@irregular_tank)
  end
end
