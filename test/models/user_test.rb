require 'test_helper'

class UserTest < ActiveSupport::TestCase
	    test "a user should enter a first name" do 
		  user = User.new
		  assert !user.save
		  assert !user.errors[:first_name].empty?
	    end

	 	test "a user should enter a last name" do 
		  user = User.new
		  assert !user.save
		  assert !user.errors[:last_name].empty?
	    end

	  	test "a user should enter a profile name" do 
		  user = User.new
		  assert !user.save
		  assert !user.errors[:profile_name].empty?
	    end

	 	test "a user should have a unique profile name" do
	 	  user = User.new
	 	  user.profile_name = "scgrzona"
	      user.email = "stephanie@800ceoread.com"
	 	  user.first_name = "Stephanie"
	      user.last_name = "Grzona"
	 	  	 	  
	 	  assert !user.save
	 	  assert !user.errors[:profile_name].empty? 
	    end

	    test "a user should have a profile name without spaces" do
	    	user = User.new(first_name: 'Stephanie', last_name: 'Grzona', email: 'scgrzona@yahoo.com')
	    	user.password = user.password_confirmation = 'st0114GR'

	    	user.profile_name = "My Profile With Spaces"

	    	assert !user.save
	    	assert !user.errors[:profile_name].empty?
	    	assert user.errors[:profile_name].include?("Must be formatted correctly.")
        end



	    test "a user can have a correctly formattes profile name" do
	    	user = User.new(first_name: 'Stephanie', last_name: 'Grzona', email:'scgrzona@yahoo.com')
	    	user.password = user.password_confirmation = 'st0114GR'
	    	user.profile_name = 'binx1223'
	    	assert user.valid?
	    end
end



