require 'book'
require 'author'

class Library

    attr_reader :library_name,
                :books,
                :authors

    def initialize(name)
        @library_name = name
        @books = []
        @authors = []
    end

    def add_author(author)
        authors << author
        author.books.each {|book| books << book}
    end
end