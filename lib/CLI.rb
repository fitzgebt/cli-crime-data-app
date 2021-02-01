class Cli

    @state = ""
    @offense = ""

    def start
        puts "This app gathers information on crimes committed from the FBI's Uniform Crime Report (UCR)."
        puts "Information displayed will have occurred between 2006 and 2019."
        puts "Please select a State:"
        self.gather_state
        puts "Please select an offense to view more information:"
        self.gather_offense(@state)
        # return readable list of requested state/offenses
        puts "Do you wish to see victim demographics related to your last search?"
        

    end

    def gather_state
        @state = gets.strip
    end

    def gather_offense(state)
        @offense = gets.strip
        Api.call_api(@state, @offense)
    end

    def victim_demographic_option
        puts "1. Yes"
        puts "2. No"
        input = gets.strip
        if input == "1" || input == "Yes" || input == "yes" || input == "y"
            #call victim_demographic_list
        elsif input == 2 || input == "No" || input == "no" || input == "n"
            # return readable list of requested state/offenses
        elsif input == "exit" || input == "Exit" || input == "quit"
            # end the program
        else
            puts "Please select a valid option."


        end


    end


end
