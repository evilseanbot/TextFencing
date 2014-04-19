class StoryBranch
	attr_accessor :text
	attr_accessor :next
	attr_accessor :prompt
	attr_accessor :options
end

events = StoryBranch.new()
events.text = "Hello!"

event2 = StoryBranch.new()
event2.text = "Please pick a gender"
event2.prompt = true
event2.options = {"1" => "boy", "2" => "girl", "3" => "Its actually quite mysterious"}

events.next = event2

def gameloop events
    currentEvent = events
    gameOver = false

	while !gameOver
		print "\n\n"

		print currentEvent.text

		if (currentEvent.prompt)
	        print "\n Your options are:"
	        currentEvent.options.each do |hash, key|
	        	print "\n"
	        	print hash
	        	print " : "
	        	print key
	        end
	        print "\n"
	        response = gets.chomp()


		end

		if currentEvent.next == nil
			gameOver = true
		else
			currentEvent = currentEvent.next		
		end
		
	end
	print "\n\n End of the game!"
end

gameloop events