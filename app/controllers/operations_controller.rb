class OperationsController < ApplicationController

	def index

	end

  def import
  	render 'import'
  end

  def export
  	render 'export'
  end
end
