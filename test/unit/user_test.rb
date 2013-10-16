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
 		user.profile_name = users(:keegan).profile_name
 		# user.profile_name = 'skmaccauley'
 		# user.email = 'skmaccauley@gmail.com'
 		# user.first_name = 'Keegan'
 		# user.last_name = 'MacCauley'
 		# user.password = '051287sm'
 		# user.password_confirmation = '051287sm'
 		# user.email = 'skmaccauley@gmail.com'
 		
 		users(:keegan)

 		assert !user.save
 		puts user.errors.inspect
 		assert !user.errors[:profile_name].empty?
 	end

 	test "a user should have a profile name without spaces" do
 		user= User.new
 		user.profile_name = "My Profile With Spaces"

 		assert !user.save
 		assert !user.errors[:profile_name].empty?
 		assert user.errors[:profile_name].include?("Must be formatted correctly.")

 	end
end
