require_relative 'lib/gilt.rb'

class Runner

	def welcome
		puts "
	        ______  _____  _____   _________  
	      .' ___  ||_   _||_   _| |  _   _  | 
	     / .'   '_|  | |    | |   |_/ | | '_| 
	     | |   ____  | |    | |   _   | |     
	     . `.___]  |_| |_  _| |__/ | _| |_    
	      `._____.'|_____||________||_____|   

	 		"
		puts "Welcome to Gilt's text based shopping assistant!"
		puts " "
		puts " Start by entering the store you want to browse "
		puts "Choose from the following: Women Men Home or Kids"
	end

	def print_store_info(store)
		valid_stores = ['men', 'women', 'kids', 'home']
		if valid_stores.include? store
			shopper = GiltStore.new(store)
			data = shopper.get_api_data
			puts shopper.display_sales(data)
		else
			puts "Don't be an idiot. Choose a correct store"
			store_type = gets.strip.downcase
			print_store_info(store_type)
		end
	end
end

runner = Runner.new
runner.welcome
store_type = gets.strip.downcase

runner.print_store_info(store_type)
