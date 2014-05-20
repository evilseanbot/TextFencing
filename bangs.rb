class Bang
    attr_accessor :text
    attr_accessor :branch
    def checkReqs
    end
end

@bangs = []

steal_bread_bang = Bang.new()
steal_bread_bang.text = "You're very hungry, you want to steal some bread!"

steal_bread_event = StoryBranch.new()
steal_bread_event.text = "You're very hungry, and you have a chance to steal some bread. Do you?"
steal_bread_event.prompt = true
steal_bread_event.options = {"1" => "yes", "2" => "no"}
steal_bread_event.decision = "steal_bread_attempt"

steal_bread_bang.branch = steal_bread_event

def steal_bread_bang.checkReqs memory
    if memory[:wealth] > 3
    	return false
    elsif 
        chance = 3 - memory[:wealth]

        if rand(0..10) <= chance
        	return true
        end
    end
end

@bangs.push steal_bread_bang