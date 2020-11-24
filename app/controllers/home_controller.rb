class HomeController < ActionController::Base
    def index
        @last_measure = "11/10/2010"
        @today_drink = 400
        @measures_label = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
        @measures_data = [0, 0, 0, 0, 0, 0, 0, 0, 100, 150, 150, 500, 700, 750, 750, 1000, 1100, 1150, 1300, 1500, 2000, 2000, 2000, 2000]
    end
end
