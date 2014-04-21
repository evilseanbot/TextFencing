class StoryBranch
	attr_accessor :text
	attr_accessor :next
	attr_accessor :prompt
	attr_accessor :options
	attr_accessor :decision

	def process memory
		return
	end
end

events = StoryBranch.new()
events.text = "Hello!"

event2 = StoryBranch.new()
event2.text = "Please pick a gender"
event2.prompt = true
event2.options = {"1" => "boy", "2" => "girl", "3" => "Its actually quite mysterious"}
event2.decision = "gender"

event3 = StoryBranch.new() 

def event3.process memory

    print memory

    if memory["gender"] == "1"
    	@text = "Booga!"
    else
    	@text = "Nooga."
    end
end


events.next = event2
event2.next = event3

# Roll this off into its own function.

def gameloop events
    currentEvent = events
    gameOver = false
    storyMemory = {}

	while !gameOver
		print "\n\n"

		currentEvent.process storyMemory

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

	        storyMemory[currentEvent.decision] = response


		end

		if currentEvent.next == nil
			gameOver = true
		else
			currentEvent = currentEvent.next		
		end
		
	end
	print "\n\n End of the game!"
	print storyMemory
end

gameloop events