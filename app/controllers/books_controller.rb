# frozen_string_literal: true

class BooksController < ApplicationController
    def index
        books = Book.includes(:author)
        books = books.where('title like ?' , "%#{params[:title]}%") if params[:title]
        books = books.where(publication_year: params[:publication_year]) if params[:publication_year]
        books = books.where(genre: params[:genre]) if params[:genre]
        books = books.where(author: {first_name: params[author_first_name]}) if params[:author_first_name]
        books = books.where(author: {last_name: params[author_last_name]}) if params[:author_last_name]

        @books = books.all.map do |book| 
            book_hash(book)
        end 
        render json: @books
    end 

    def show 
        book = Book.find(params[:id])
        @transformed_book = book_hash(book)
        render json: @transformed_book
    end
    
    private
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
