require 'rails_helper'

RSpec.describe Operation do
  it "csv file is empty" do
    path = ''
    result = Operation.import_csv(path)
    expect(result).to eq(false)
  end
end