require 'rspec'
require './lib/book'
require './lib/author'
require 'pry'

RSpec.describe Author do
    before(:each) do 
        @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
        
    end
    describe '#initialize' do
        it 'exist' do
            expect(@charlotte_bronte).to be_a(Author)
        end

        it 'takes a hash and stores the data as 2 attributes' do
            
            expect(@charlotte_bronte.first_name).to eq("Charlotte")
            expect(@charlotte_bronte.last_name).to eq("Bronte")

        end

        it 'starts with an empty array as books' do 
            
            expect(@charlotte_bronte.books).to eq([])
            
        end
    end

    describe '#name' do
        it 'adds the first and last name and returns them as one string' do
            
            expect(@charlotte_bronte.name).to eq("Charlotte Bronte")

        end
    end

    describe '#write' do
        it 'takes a title, and date argument and returns a new book with that and the authors name' do
            
            jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
            expect(@charlotte_bronte.books[0]).to be_a(Book)
            expect(jane_eyre.title).to eq("Jane Eyre")
            expect(jane_eyre.publication_year).to eq("1847")
            expect(jane_eyre.author).to eq("Charlotte Bronte")

            villette = @charlotte_bronte.write("Villette", "1853")
            expect(villette).to be_a(Book)
            expect(villette.title).to eq("Villette")
            expect(villette.publication_year).to eq("1853")
            expect(villette.author).to eq("Charlotte Bronte")

        end
    end

    describe '#add_author' do
        it 'adds that book to the @books array' do
            
            expect(@charlotte_bronte.books).to eq([])

            jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
            expect(@charlotte_bronte.books).to eq([jane_eyre])
            
            villette = @charlotte_bronte.write("Villette", "1853")
            expect(@charlotte_bronte.books).to eq([jane_eyre, villette])

        end
    end
end