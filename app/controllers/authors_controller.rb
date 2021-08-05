# frozen_string_literal: true

class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    @authors = @authors.where(last_name: params[:last_name]) if params[:last_name]
    @authors = @authors.where(first_nema: params[:first_name]) if params[:first_name]
    @authors = @authors.where('notes like ?', "%#{params[:notes]}%") if params[:notes]

    render json: @authors
  end

  def show
    @authors = Author.find(params[:id])
    render json: @authors
  end
end
