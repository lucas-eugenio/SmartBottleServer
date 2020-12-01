class HomeController < ActionController::Base
  def index
    measures = get_measures
    consume = last_consume

    @last_measure = consume.present? ? consume.time.to_s.gsub('-0300', '') : 'Ainda Sem Medidas'
    @today_drink = consume.present? ? consume.consume : 0
    @measures_label = measures.map { |measure| measure[0] }
    @measures_data = measures.map { |measure| measure[1] }
  end

  private

  def last_consume
    WaterConsume.last_from_day(Time.now).take
  end
  
  def get_measures
    measures = []
    for hour in 0..Time.now.hour + 1
      water_consume = WaterConsume.last_from_hour(Time.now.change(hour: hour)).take
      consume = water_consume.present? ? water_consume.consume : 0
      measures << [hour, consume]
    end
    measures
  end
end
