class IrregularTank
  TANK_MATERIAL = "M"
  WATER_MATERIAL = "W"
  attr_accessor :initial_heights, :tank_matrix, :volume
  
  def initialize heights
    @initial_heights = heights + []
    @heights = heights
    @tank_matrix = make_tank
    @volume = calculate_volume
  end

  def width
    @heights.size
  end

  def height
    @tank_matrix.size
  end

  def any_non_zero?
    !all_zero?
  end

  def make_tank
    tank_matrix = [@heights]
    while(any_non_zero?) do
      @heights = unit_reduced_heights
      tank_matrix.push(@heights)
    end
    tank_matrix.reverse
  end

  def calculate_volume
    mark_tank
    mark_water
    @tank_matrix.flatten.count(WATER_MATERIAL)
  end
  
  private
  
  def mark_water
    regex_for_water = "(?<=#{TANK_MATERIAL})[^#{TANK_MATERIAL}]+(?=#{TANK_MATERIAL})"
    @tank_matrix.each do |array|
      array.replace(
        array.join.gsub(Regexp.new(regex_for_water)){
          |s| s.gsub(s.first, WATER_MATERIAL)
        }.split("")
      )
    end
  end
  
  def mark_tank
    @tank_matrix.each do |array|
      array.replace(array.join.tr('^0', TANK_MATERIAL).split(""))
    end
  end
  
  def unit_reduced_heights
    @heights.map{ |element| element > 0 ? (element - 1) : 0 }
  end

  def all_zero?
    @heights.uniq.length == 1 and @heights.first == 0
  end
end
