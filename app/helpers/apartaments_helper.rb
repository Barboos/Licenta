module ApartamentsHelper
    require 'csv' 

    def import_apartaments
        csv_text = File.read(Rails.root.join('app', 'assets', 'data.csv'))
        csv = CSV.parse(csv_text, :headers => true)
        csv.each do |row|
            h = row.to_hash
            a = Apartament.new
            a.no_of_rooms = h["no_of_rooms"].to_i
            a.no_of_parking = h["no_of_parking"].to_i
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
            a.save!
            # puts row.to_hash
        end
    end
end
