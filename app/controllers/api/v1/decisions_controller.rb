class Api::V1::DecisionsController < ApplicationController
  def add
  	# Método POST para adicionar uma decisão à bd
  	render json: {status: 'SUCCESS', message: 'Loaded decisions', data:'{lixo:lixo}', status: :ok }
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
end
