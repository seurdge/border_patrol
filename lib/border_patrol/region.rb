module BorderPatrol
  class Region < Set
    def contains_point?(*point)
      point = case point.length
                when 1 then
                  point.first
                when 2 then
                  BorderPatrol::Point.new(point[0], point[1])
                else
                  raise ArgumentError, "#{point} is invalid.  Arguments can either be an object, or a longitude,lattitude pair."
              end
      self.each do |placemark|
        placemark[:polygons].any? do |polygon|
          return polygon.contains_point?(point) ? placemark : false
        end
      end
    end
  end
end
