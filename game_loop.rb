def gameloop events
    currentEvent = events
    gameOver = false
    storyMemory = {}

	while !gameOver
		print "\n"

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

def bangs_gameloop bangs
    storyMemory = {}
    storyMemory[:wealth] = 1

    for i in (0..10) 
    	print "\n Year: "
    	print i
        for bang in bangs
            if bang.checkReqs storyMemory
                print "\n"
                print bang.text
            end
        end
    end
end