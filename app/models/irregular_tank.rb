class IrregularTank 
  attr_accessor :heights, :tank_height, :tank_width

  def initialize heights
    @heights = heights
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

  private
  
  def subtract_one_until_zero
    @heights.map{ |element| element > 0 ? (element - 1) : 0 }
  end

  def all_zero?
    @heights.uniq.length == 1 and heights.first == 0
  end
end
