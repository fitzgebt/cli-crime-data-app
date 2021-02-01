class Cli

    def start
        puts "This app gathers information on crimes committed from the FBI's Uniform Crime Report (UCR)."
        puts "Please select a State:"
        self.gather_state
        puts "Please select an offense to view more information:"
        self.gather_offense
        # return readable list of requested info
        puts "Do you wish to see victim demographics related to your last search?"

    end

    def gather_state
        state = gets.strip
    end

    def gather_offense(state)
        user_state = state
        offense = gets.strip
        Api.call_api(state, offense)
    end

    def victim_demographic_option
        puts "1. Yes"
        puts "2. No"
        input = gets.strip
        if input == "1" || input == "Yes" || input == "yes" || input == "y"
            #call victim_demographic_list
        elsif input == 2 || input == "No" || input == "no" || input == "n"
            # return 

        end


    end


end
