# -*- coding: undecided -*-
require 'test_helper'
 
puts "Version de Rails : [#{Rails::VERSION::STRING}]"

class TranslationTest < ActionController::IntegrationTest
	fixtures :all
 
	# TODO à tester (sans contrôleur !!!, alors que ce test est un test de contrôleur => jamais activé )
	test "the truth" do
		assert ( Time.utc(2011,"jan",1,16,0,0).to_s(:short) == '2011/12/01 16:01' )
	end
end
