class Operation < ApplicationRecord
	has_and_belongs_to_many :categories

	belongs_to :company


	def self.import_csv(path_to_csv)
    require 'csv'

    Rails.logger.error "File Not Exists #{path_to_csv}" and return false unless File.exists?(path_to_csv)

    csv_text = File.read(path_to_csv)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      #company  invoice_num invoice_date  operation_date  amount  reporter  notes status  kind
      #need to check dates before push to db
      #need to sanitise input data

      company    = Company.where(name: row[0]).first_or_create

      categories = row[8].present? ? row[8].split(';') : []

      operation = Operation.create(
        :invoice_num => row[1],
        :invoice_date => row[2],
        :open_date => row[3],
        :amount => row[4],
        :reporter => row[5],
        :text => row[6],
        :status => row[7]
      )

      operation.company = company
      operation.save

      categories.each do |c|
        operation.categories << Category.where(name: c).first_or_create
        operation.save!
      end
    end
	end
end
