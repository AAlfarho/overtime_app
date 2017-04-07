require 'rails_helper'

describe 'navigate' do
  before do
    ##the create inside factory girl actually goes and creates a registry in the database
    ##and that takes time and slows the app, however because we have a db query User.last.posts.last.rationale
    ##it is required, when we dont do that we can use build_stubbed
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post_with_user, user_id: @user.id)
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
          expect(page).to have_content("Rationale")
        end
    end
    
    describe "creation" do 
        before do
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
      expect(page).to have_content('new rationale')
    end
  end
end