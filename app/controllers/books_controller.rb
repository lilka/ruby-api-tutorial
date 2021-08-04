# frozen_string_literal: true

class BooksController < ApplicationController
    def index
        @books = Book.all.map do |book| 
            book_hash(book)
        render json: @books
    end 

    def show 
        book = Book.find(params[:id])
        @transformed_book = book_hash(book)
        render json: @transformed_book
    end
    
    def book_hash(book)
        {
            id: book.id,
            title: book.title,
            author: book.author.name,
            publication_year: book.publication_year,
            genre: book.genre
        }
    end
end
