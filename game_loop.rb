def gameloop(events, bangs)
    print bangs

    currentEvent = events
    gameOver = false
    storyMemory = {}

    storyMemory[:wealth] = 1
    storyMemory[:year] = 1500

	while !gameOver
		print "\n"

		currentEvent.process storyMemory

		print currentEvent.text

		if (currentEvent.prompt)
			prompt_gameloop currentEvent storyMemory
		end

		if currentEvent.next == nil
			currentEvent = bangs_gameloop(bangs, storyMemory)

			if currentEvent == nil
                gameOver = true
			end
		else
			currentEvent = currentEvent.next		
		end
		
	end
	print "\n\n End of the game!"
	print storyMemory
end

def bangs_gameloop(bangs, storyMemory)

    for i in (0..10) 
        storyMemory[:year] += 1

    	print "\n Year: "
    	print storyMemory[:year]
        for bang in bangs
            if bang.checkReqs storyMemory
                print "\n"
                print bang.text
                return bang.branch
            end
        end
    end

    return nil
end

def prompt_gameloop currentEvent storyMemory
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