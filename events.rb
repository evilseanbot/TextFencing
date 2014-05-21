
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

@events = StoryBranch.new()
@events.text = "Hello!"

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

event6 = StoryBranch.new()
event6.text = "What country are you from?"
event6.prompt = true;
event6.decision = "country";

def event6.process memory
    if memory["continent"] == "1"
        @options = {"1" => "Germany", "2" => "France", "3" => "Italy", "4" => "Spain"};
    elsif memory["continent"] == "2"
    	@options = {"1" => "China", "2" => "India", "3" => "Arab"};
    elsif memory["continent"] == "3"
    	@options = {"1" => "Ghana"}
    end
end

# @events.next = event2
event2.next = event3
event3.next = event4
event4.next = event5
event5.next = event6