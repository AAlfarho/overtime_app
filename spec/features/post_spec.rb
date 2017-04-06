require 'rails_helper'

describe 'navigate' do
    describe 'index' do 
        before do
            user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "andres", last_name: "alfaro")
            post = Post.create(date: Date.today, rationale: "P1")
            login_as(user, :scope => :user)
            visit posts_path
        end
        it "can be reached" do 
            expect(page.status_code).to eq(200)
        end
        
        it "has title of Posts" do 
            expect(page).to have_content("Posts")
        end

        it "has a list of posts" do
          expect(page).to have_content("P1")
        end
    end
    
    describe "creation" do 
        before do
            user = User.create(email: "test@test.com", password: "asdasd", password_confirmation: "asdasd", first_name: "andres", last_name: "alfaro")
            login_as(user, :scope => :user)
            visit new_post_path
        end
        
        it 'can reach form' do 
            expect(page.status_code).to eq(200)
        end
        
        it "can be created from new page" do 
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'Rationale set'
            
            click_on 'Save'
            expect(page).to have_content("Rationale set")
        end
        
        it 'post associated with user' do
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'user_association'
            
            click_on 'Save'
            expect(User.last.posts.last.rationale).to eq('user_association')
        end
    end
end