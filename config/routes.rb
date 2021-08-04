# frozen_string_literal: true 


Rails.application.routes.draw do
  rosources :authors, only: %i[index, show]

end
