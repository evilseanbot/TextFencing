class Bang
    attr_accessor :text
    def checkReqs
    end
end

@bangs = []

steal_bread_bang = Bang.new()
steal_bread_bang.text = "You're very hungry, you want to steal some bread!"

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