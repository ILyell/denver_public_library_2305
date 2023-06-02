require 'rspec'
require './lib/book'
require_relative 'book_spec'

RSpec.describe Book do
    before(:each) do
       @book_1 = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
        
    end
    describe '#initialize' do
        it 'exist' do
            expect(@book_1).to be_a(Book)
        end

        it 'stores 4 arguments from a hash' do

            expect(@book_1.author_first_name).to eq("Harper")
            expect(@book_1.author_last_name).to eq("Lee")
            expect(@book_1.title).to eq("To Kill a Mockingbird")
            expect(@book_1.publication_date).to eq("July 11, 1960")
            
        end
    end
        
    describe '#author' do
        it 'returns a string of the authers First and Last name entrys' do
            
            expect(@book_1.author).to eq("Harper Lee")
        end
    end
    describe '#publication_year' do 
        it 'returns the year published as a string' do
            expect(@book_1.publication_year).to eq("1960")

        end
    end
end