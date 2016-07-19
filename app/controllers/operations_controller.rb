class OperationsController < ApplicationController

  def index

  end

  def import
    path = '/Users/vadim/Downloads/ImporterAppExample.csv'
    Operation.import_csv(path)

    render 'import'
  end

  def export
    render 'export'
  end
end
