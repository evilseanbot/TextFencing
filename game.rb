class StoryBranch
	attr_accessor :text
	attr_accessor :next
	attr_accessor :prompt
	attr_accessor :options
	attr_accessor :decision
	attr_accessor :textEntry

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

    if memory["gender"] == "1"
    	@text = "Boys are interesting."
    elsif memory["gender"] == "2"
    	@text = "Girls are pretty."
    elsif memory["gender"] == "3"
    	@text = "Iiiiiinnteresting"
    end
end

event4 = StoryBranch.new()
event4.text = "What is your name?"
event4.decision = "name"
event4.prompt = true
event4.textEntry = true

event5 = StoryBranch.new()
event5.text = "What continent are you from?"
event5.prompt = true
event5.options = {"1" => "Europe", "2" => "Asia", "3" => "Africa"}
event5.decision = "continent"

events.next = event2
event2.next = event3
event3.next = event4
event4.next = event5

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
			print "\n"
			if (!currentEvent.textEntry) 
		        print "Your options are:"
		        currentEvent.options.each do |hash, key|
		        	print "\n"
		        	print hash
		        	print " : "
		        	print key
		        end
		        print "\n"
		    end
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