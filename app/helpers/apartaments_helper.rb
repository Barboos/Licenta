module ApartamentsHelper
    require 'csv' 

    def import_apartaments
        csv_text = File.read(Rails.root.join('app', 'assets', 'data2.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            h = row.to_hash
            a = Apartament.new
            a.no_of_rooms = h["no_of_rooms"].to_i
            a.no_of_bathrooms = h["no_of_bathrooms"].to_i
            a.no_of_terraces = h["no_of_terraces"].to_i
            a.surface = h["surface"].to_i
            a.price = h["price"].to_f
            a.partitioning = h["partitioning"]
            a.age = h["age"]
            a.user_id = h["user_id"].to_i
            a.city = h["city"]
            a.county = h["county"]
            a.title = h["title"]
            a.zone = h["cartier"]
            a.no_of_parking = h["no_of_parking"]
            a.save!
            # puts row.to_hash
        end
    end

    def average_error
        no_of_apartaments = Apartament.where("price < 1000").count 
        apartaments = Apartament.where("price < 1000") 
        error_sum = 0
        apartaments.each do |apartament|
            predicted_price = PriceModel.predict(apartament)
            actual_price = apartament.price 
            error_sum = error_sum + (predicted_price - actual_price).abs
        end
        puts "Average price error (euros): #{error_sum / no_of_apartaments}"
    end
end
