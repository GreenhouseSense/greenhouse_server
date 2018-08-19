class Api::V1::DecisionsController < ApplicationController
  def add
    # Método POST para adicionar uma decisão à bd
    new_decision = Decision.new(decision_params)
    if new_decision.save
      render json: {status: 'SUCCESS', message: 'Added new decision', data: new_decision}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Decision not added', data: new_decision.errors}, status: :unprocessable_entity
    end
  end

  def get_last
    last_decision = Decision.order("created_at").last
    render json: {status: 'SUCCESS', message: 'Loaded decisions', data: last_decision},status: :ok
  end

  def get_weeks
    # Método GET para obter as decições das últimas X semanas
  end

  def get_months
    # Método GET para obter as decições dos últimos Y meses
  end

  def get_years
    # Método GET para obter as decições dos últimos K anos
  end

  private
   # Never trust parameters from the scary internet, only allow the white list through.
    def decision_params
      
      params.permit(:origin, :description)
    end

end
