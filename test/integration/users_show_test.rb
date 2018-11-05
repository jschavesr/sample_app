require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
	def setup
		@act_user = users(:michael)
		@non_act_user = users(:pepe)
	end

	test "show non activated user should redirect to root" do
		get user_path(@non_act_user)
		assert_redirected_to root_url
	end

	test "show activated user should redirect to user" do
		get user_path(@act_user)
		assert_template 'users/show'
	end
end
