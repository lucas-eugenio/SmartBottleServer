# frozen_string_literal: true

module Api
  # controllers/api/WaterConsumesController
  class WaterConsumesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      return measure_error unless params[:measure].present?
      return time_error unless params[:time].present?

      water_consume = create_water_consume(params[:measure], params[:time])
      render json: { water_consume: water_consume }, status: :ok
      return
    rescue StandardError => e
      render json: { error: e }, status: :bad_request
      return
    end

    private

    def create_water_consume(measure, time)
      last_water_consume = WaterConsume.last_from_day(params[:time].to_time).take

      consume = 0
      if last_water_consume.present?
        measure_diff = last_water_consume.measure - measure
        consume = !measure_diff.positive? ? last_water_consume.consume : last_water_consume.consume + measure_diff
      end

      WaterConsume.create(liquid: 'Água', density: 1, measure: measure, consume: consume, time: time)
    end

    def measure_error
      render json: { error: "Value Of 'measure' Is Mandatory" }, status: :bad_request
    end

    def time_error
      render json: { error: "Value Of 'time' Is Mandatory" }, status: :bad_request
    end
  end
end
