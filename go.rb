module BK
	module_function()
	
	class Lion
		def go
			puts "coding?"
		end

	end
	def go
		puts "hahaha"
	end 

	
end 

def go
	puts '??'
end



a=BK::Lion.new
a.go
BK.go