# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe 'searches/index.html.erb' do
#   let(:user) { create(:user) }
#
#   context "when user is authenticated" do
#     before do
#       sign_in user
#       assign(:user_searches, [])
#       assign(:pagy, double('pagy', page: 1))
#     end
#
#     it "renders successfully" do
#       render
#       expect(rendered).to match /Searches/
#     end
#   end
#
#   context "when user is not authenticated" do
#     before do
#       assign(:user_searches, [])
#       assign(:pagy, double('pagy', page: 1))
#     end
#
#     it "redirects to login page" do
#       render
#       expect(rendered).to have_selector("form[action='#{new_user_session_path}']")
#     end
#   end
# end
