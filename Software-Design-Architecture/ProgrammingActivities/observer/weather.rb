# File: weather.rb
# Observer Pattern
# Date: 01-Feb-2016
# Authors:
#          A01166738     Aileen N. Ayala   
#          A01372276     Eduardo Castilla

require "observer"

class WeatherData
    include Observable

  def set_measurements(temperature, humidity, pressure)
    @temperature = temperature
    @humidity = humidity
    @pressure = pressure
    
    changed
    notify_observers(temperature,humidity,pressure)
  end
   
    
end


class CurrentConditionsDisplay
    
    def update(temperature, humidity, pressure)
        puts "Current conditions: #{temperature}°F and #{humidity}% humidity"
    end
    
end


class StatisticsDisplay
    
    def initialize
      @avg = 0.0;
      @max = 0.0;
      @min = 0.0;
      @count = 0;
      @total = 0;
    end
    
    def update(temperature, humidity, pressure)
      @total += temperature
      @count += 1
      @max = temperature if @max == 0.0 or temperature > @max
      @min = temperature if @min == 0.0 or @min > temperature 
      @avg = if @count <=1 or @avg == 0.0 then temperature else @total/@count end
     
      puts "Avg/Max/Min temperature = #{@avg}/#{@max}/#{@min}"
    end 

end


class ForecastDisplay
  
   def initialize
    @lastPreasure = 0
   end
    
  def update(temperature, humidity, pressure)
    if @lastPreasure < pressure
      puts "Forecast: Improving weather on the way!"
    elsif @lastPreasure > pressure
      puts "Forecast: Watch out for cooler, rainy weather"
    else
       puts "Forecast: More of the same"
    end
   
   @lastPreasure = pressure
  end
    
    
end