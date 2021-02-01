class Cli

    def start
        puts "This app gathers information on crimes committed from the FBI's Uniform Crime Report (UCR)."
        puts "Please select a State:"
        self.gather_state
        puts "Please select an offense to view more information:"
        self.gather_offense
    end

    def gather_state
        state = gets.strip
    end

    def gather_offense(state)
        user_state = state
        offense = gets.strip
        Api.call_api(state, offense)
    end


end
