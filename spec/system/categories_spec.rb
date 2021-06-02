require 'rails_helper'

RSpec.describe "Categories", type: :system do
  describe '#create' do
    context 'when create a category' do
      before do
        login_admin
        visit new_category_path
        fill_in 'Title', with: 'Kids'
        click_on 'Save Category'
      end

      it { expect(current_path).to eq(category_path(id: Category.last.id)) }
      it { expect(page).to have_content('Category was successfully created.') }
      it { expect(page).to have_text('Kids') }
    end

    context 'when create and attribute cannot be blank' do
      before do
        login_admin
        visit new_category_path
        fill_in 'Title', with: ''
        click_on 'Save Category'
      end

      it { expect(Category.new).to_not be_valid }
      it { expect(page).to have_text("Title can't be blank") }
    end

    context 'when the user is not an administrator' do
      before { visit new_category_path }

      it { expect(current_path).to eq(new_admin_session_path) }
    end
  end

  describe '#show' do
    it 'can view a category' do
      category = create(:category)

      visit category_path(category)
      expect(page).to have_text(category.title)
    end
  end

  describe '#index' do
    it 'can view all categories' do
      categories = create_list(:category, 5)
      visit categories_path

      expect(categories.count).to eq(5)
      categories.each do |category|
        expect(page).to have_text(category.title)
      end
    end
  end
end
