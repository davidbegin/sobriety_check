require "sobriety_check/version"

module SobrietyCheck
	class Base
		def initialize(env:)
			@env = env
		end

		def call
			return env if non_production_env?
			can_you_do_math?
		end

		private

		attr_reader :env

		def can_you_do_math?
			first_number = Random.rand(100).to_i
			second_number = Random.rand(100).to_i
			$stdout.print "What is the result of #{first_number} + #{second_number}? "
			answer = $stdin.gets.chomp.to_i
			if answer == first_number + second_number
				puts "\n\e[35;1mYOU PASSED!\e[0m\n"
				env
			else
				puts "\n\e[31;1mDON'T CODE DRUNK\e[0m\n"
				sleep 2
				exit
			end
		end

		def non_production_env?
			env != "production"
		end
	end
end
