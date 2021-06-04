require 'rails_helper'

RSpec.describe "Movies", type: :system do
  describe '#create' do
    context 'when data is valid' do
      it 'when create a movie' do
        category = create(:category)
        login_admin
        visit new_movie_path
        fill_in 'Title', with: 'Matrix'
        fill_in 'Description', with: 'Best action movie'
        fill_in 'Rent price', with: '9.99'
        fill_in 'Category', with: category.id
        click_on 'Save Movie'

        expect(current_path).to eq(movie_path(id: Movie.last.id))
        expect(page).to have_content('Movie was successfully created.')
        expect(page).to have_text(category.title)
        expect(page).to have_text('Best action movie')
        expect(page).to have_text('9.99')
      end
    end

    context 'when create and attribute cannot be blank' do
      before do
        category = create(:category)
        login_admin
        visit new_movie_path
        fill_in 'Title', with: ''
        fill_in 'Description', with: ''
        fill_in 'Rent price', with: ''
        fill_in 'Category', with: ''
        click_on 'Save Movie'
      end

      it { expect(Category.new).to_not be_valid }
      it { expect(page).to have_text('Category must exist') }
      it { expect(page).to have_text("can't be blank", count: 3) }
    end

    context 'when the user is not an administrator' do
      before { visit new_movie_path }

      it { expect(current_path).to eq(new_admin_session_path) }
    end
  end

  describe '#show' do
    it 'can view a movie' do
      movie = create(:movie)

      visit movie_path(movie)
      expect(page).to have_text(movie.title)
      expect(page).to have_text(movie.description)
      expect(page).to have_text(movie.rent_price)
      expect(page).to have_text(movie.category.title)
    end
  end

  describe '#index' do
    it 'can view all categories' do
      movies = create_list(:movie, 5)
      visit movies_path

      expect(movies.count).to eq(5)
      movies.each do |movie|
        expect(page).to have_text(movie.title)
        expect(page).to have_text(movie.description)
        expect(page).to have_text(movie.rent_price)
      end
    end
  end

  describe '#update' do
    context 'when is admin' do
      it 'can edit movie' do
        login_admin
        movie = create(:movie)
  
        visit movie_path(movie)
        click_on 'Edit'
        fill_in 'Title', with: 'Lost'
        fill_in 'Description', with: 'Favorite serie'
        fill_in 'Rent price', with: '9.99'
        click_on 'Save Movie'
    
        expect(current_path).to eq(movie_path(movie))
        expect(page).to have_text('Lost')
        expect(page).to have_text('Favorite serie')
        expect(page).to have_text('9.99')
      end
  
      it 'cannot update category with blank attribute' do
        login_admin
        movie = create(:movie)
  
        visit movie_path(movie)
        click_on 'Edit'
        fill_in 'Title', with: ''
        fill_in 'Description', with: ''
        fill_in 'Rent price', with: ''
        click_on 'Save Movie'
  
        expect(Movie.new).to_not be_valid
        expect(page).to have_text("can't be blank", count: 3)
      end
    end

    context 'when user is not an admin' do
      it 'cannot view link edit' do
        movie = create(:movie)

        visit movie_path(movie)
        expect(page).to_not have_link('Edit')
      end

      it 'cannot render edit page' do
        movie = create(:movie)

        visit edit_movie_path(movie)
        expect(current_path).to eq(new_admin_session_path)
      end
    end
  end

  describe '#destroy' do
    context 'when is an admin' do
      it 'can delete a movie' do
        login_admin
        movie = create(:movie)
  
        visit movie_path(movie)
        click_on 'Delete'
  
        expect(current_path).to eq(movies_path)
        expect(page).to_not have_text(movie.title)
      end
    end

    context 'when is an user' do
      it 'cannot view link delete' do
        movie = create(:movie)

        visit movie_path(movie)
        expect(page).to_not have_link('Delete')
      end
    end
  end
end
