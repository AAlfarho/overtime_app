require 'rails_helper'

describe 'navigate' do
  before do
    ##the create inside factory girl actually goes and creates a registry in the database
    ##and that takes time and slows the app, however because we have a db query User.last.posts.last.rationale
    ##it is required, when we dont do that we can use build_stubbed
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post_with_rationale_n_user, user_id: @user.id, rationale: "User #{@user.id} Rationale")
    #post = FactoryGirl.create(:post_with_user, user_id: user.id)
    # #Post.create(date: Date.today, rationale: "P1", user_id: user.id)
    login_as(@user, :scope => :user)
  end
    describe 'index' do
      before do
        visit posts_path
      end
        it "can be reached" do 
            expect(page.status_code).to eq(200)
        end
        
        it "has title of Posts" do 
            expect(page).to have_content("Posts")
        end

        it "has a list of posts" do
          expect(page).to have_content("User #{@user.id} Rationale")
        end

        it "unauthorized user cant see other user post" do
          logout(:user)
          unauthorized_user = FactoryGirl.create(:custom_user, first_name: "another", last_name: "user")
          login_as(unauthorized_user, :scope => :user)
          visit posts_path
          expect(page).to_not have_content("User #{@user.id} Rationale")
        end
    end
    
    describe "creation" do 
        before do
          login_as(@user, :scope => :user)
          visit new_post_path
        end
        
        it 'can reach form' do 
            expect(page.status_code).to eq(200)
        end
        
        it "can be created from new page" do 
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'Rationale set'
            fill_in 'post[overtime_hours]', with: '0.5'
            click_on 'Save'

            expect(@user.posts.last.rationale).to eq('Rationale set')
        end
        
        it 'post associated with user' do
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'user_association'
            fill_in 'post[overtime_hours]', with: '0.5'
            
            click_on 'Save'
            expect(@user.posts.last.rationale).to eq('user_association')
        end
    end

  describe 'edit ' do
    it 'can be reached by clickin edit ont he index page' do
      visit posts_path
      click_link("edit_post_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be succesfully edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: @post.date
      fill_in 'post[rationale]', with: 'new rationale'

      click_on 'Save'
      expect(@post.reload.rationale).to eq('new rationale')

    end

    it 'cannot be edited by unauthorized user' do
      another_user = FactoryGirl.create(:custom_user, first_name: "another first", last_name: "another last")
      logout(:user)
      login_as(another_user, :scope => :user)

      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end

  describe 'delete' do
     it 'can be deleted' do
       login_as(@user, :scope => :user)
       postToDelete = FactoryGirl.create(:post_with_rationale_n_user, user_id: @user.id, rationale: "tobedeleted")
       visit posts_path
       click_link("delete_post_#{postToDelete.id}")
       expect(page.status_code).to eq(200)
     end
  end
end