class Operation < ApplicationRecord
	has_and_belongs_to_many :categories

	belongs_to :companies
end
