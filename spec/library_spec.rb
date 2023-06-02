require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'
require 'pry'

RSpec.describe Library do
    before(:each) do

        @dpl = Library.new("Denver Public Library")
    end

    describe '#initialize' do
        it 'exist' do

            expect(@dpl).to be_a(Library)
        end

        it 'is created with one argument, a name string' do
            
            expect(@dpl.library_name).to eq("Denver Public Library")
        end

        it 'holds an array of book objects' do

            expect(@dpl.books).to eq([])
        end

        it 'holds an array of author objects' do

            expect(@dpl.authors).to eq([])
        end
    end 

    describe '#add_author' do
        it 'adds an author to the author array, and thier books to the book array' do

            charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
            jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
            professor = charlotte_bronte.write("The Professor", "1857")
            villette = charlotte_bronte.write("Villette", "1853")
            
            harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
            mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

            @dpl.add_author(charlotte_bronte)

            expect(@dpl.authors).to eq([charlotte_bronte])
            expect(@dpl.books).to eq([jane_eyre, professor, villette])
            
            @dpl.add_author(harper_lee)
            expect(@dpl.authors).to eq([charlotte_bronte, harper_lee])
            expect(@dpl.books).to eq([jane_eyre, professor, villette, mockingbird])

        end
    end
end