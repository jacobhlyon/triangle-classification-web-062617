# require 'pry'

class Triangle

	attr_accessor :side1, :side2, :side3
  
	def initialize(side1, side2, side3)
		@side1 = side1
		@side2 = side2
		@side3 = side3
		@all_sides = []
		kind
	end

	def sort_sides
		@all_sides << @side1
		@all_sides << @side2
		@all_sides << @side3
		@all_sides.sort!
	end

	def kind
		sort_sides
		if @all_sides.include?(0)
			raise TriangleError
		elsif @all_sides.min < 0
			raise TriangleError
		elsif triangle_inequality
			raise TriangleError	
		elsif equilateral
			return :equilateral
		elsif isosceles
			return :isosceles
		elsif scalene
			return :scalene	
		else
			raise TriangleError
		end
	end

	def scalene
		if @side1 != @side2 && @side1 != @side3 && @side2 != @side3
			true
		end
	end

	def equilateral
		if @side1 == @side2 && @side2 == @side3
			true
		end
	end

	def isosceles
		if (@side1 == @side2 && @side2 != @side3) ||
		   (@side2 == @side3 && @side2 != @side1) ||
		   (@side1 == @side3 && @side2 != @side1)
		   true
		end
	end

	def triangle_inequality
		if ((@side1 + @side2) <= @side3) ||
		   ((@side2 + @side3) <= @side1) ||
		   ((@side1 + @side3) <= @side2)
		   true
		end
	end
			
		
end

class TriangleError < StandardError

end


	# binding.pry