require 'test_helper'

class TranslationEnnderTest < ActionController::IntegrationTest
	def initialize
		puts "TranslationEnnderTest.initialize"
	end

	# TODO à tester (sans contrôleur !!!, alors que ce test est un test de contrôleur => jamais activé )
	test "the truth" do
#		_2011_01_01__16_00_00 = Time.utc(2011,"jan",1,16,0,0)
#		puts "_2011_01_01__16_00_00=[#{_2011_01_01__16_00_00}]"
#		puts "_2011_01_01__16_00_00_s=[#{_2011_01_01__16_00_00.to_s(:short)}]"

#		assert( _2011_01_01__16_00_00.to_s(:short) == '2011/12/01 16:02' )
		assert(true)
	end
end
