class MessageInABottle < Sinatra::Base
	@@beach_count = 1

	get "/" do
		erb :index	
	end

	get "/end" do
		erb :end
	end

	get "/beach" do
		if @@beach_count == 20
			@@beach_count = 1
			redirect to('/end') 

		elsif (@@beach_count % 5 == 0) 
			@message = "Ouch there was a crab in the bottle."

		else 
			beach_message = {
				'west' => "It's totally awesome to write messages in your used bottles at the end of a spring break rager!",
				'east' => "Argh, the Island of Tortuga runs short of turtles.",
				'north' => "Argggggggggggghhhhhhhhhhhhhhhhhhh.",
				'south' => "meow."  
			}

			@message = beach_message[params['location']]
		end

		@@beach_count+=1
		erb :beach

	end	

end	