# frozen_string_literal: true 


class AuthorsController < ApplicationController
    def index 
        @authors = Author.all 
        render json: @authors
    end

    def show
        @authors = Author.find(params[:id])
        render json: @authors
    end

end