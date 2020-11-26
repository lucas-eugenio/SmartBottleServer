class WeeklyConsumeController < ActionController::Base
  def index
    measures = get_measures

    @measures_label = measures.map { |measure| measure[0] }
    @measures_data = measures.map { |measure| measure[1] }
  end

  private
  
  def get_measures
    measures = []
    for date in Date.today-6..Date.today
      water_consume = WaterConsume.last_from_day(date).take
      consume = water_consume.present? ? water_consume.consume : 0
      measures << [date.strftime("%d/%m"), consume]
    end
    measures
  end
end
