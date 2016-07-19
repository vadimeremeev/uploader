class OperationsController < ApplicationController

  def index

  end

  def import
    Operation.import_csv(params[:attachment].tempfile.path)

    render 'import'
  end

  def export
    render 'export'
  end
end
