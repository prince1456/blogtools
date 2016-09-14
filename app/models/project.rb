class Project < ApplicationRecord

  has_many :discussions, dependent: :destroy
end
