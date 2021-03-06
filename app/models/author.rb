# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books

  def name
    [first_name, last_name].join(' ')
  end
end
