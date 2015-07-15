class ImagingService
  attr_accessor :matrix, :image

  COLOR_MAP = {
    "0" => ChunkyPNG::Color('black @ 0.0'),
    "W" => ChunkyPNG::Color('blue @ 1.0'),
    "M" => ChunkyPNG::Color.from_hex('4db6ac')
  }
  
  def initialize irregular_tank
    @tank= irregular_tank
    @matrix = irregular_tank.tank_matrix
    @image = generate_image
  end

  def generate_image
    png = png_canvas
    @matrix.each_with_index do |list, list_i|
      list.each_with_index do |elem, elem_i|
        png[elem_i, list_i] = COLOR_MAP[elem]
      end
    end
    png
  end

  
  def png_canvas
     ChunkyPNG::Canvas.new(@tank.width, @tank.height, ChunkyPNG::Color::TRANSPARENT)
  end
end
