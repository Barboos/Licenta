class PriceModel < Eps::Base
    def build
      apartaments = Apartament.where("price < 1000")
  
      # train
      data = apartaments.map { |v| features(v) }
      model = Eps::Model.new(data, target: :price, split: {validation_size: 0.4})
      puts model.summary
  
      # save to file
      File.write(model_file, model.to_pmml)
  
      # ensure reloads from file
      @model = nil
    end
  
    def predict(house)
      model.predict(features(house)).round
    end
  
    private
  
    def features(apartament)
      {
        no_of_rooms: apartament.no_of_rooms,
        no_of_terraces: apartament.no_of_terraces,
        no_of_bathrooms: apartament.no_of_bathrooms,
        price: apartament.price,
        surface: apartament.surface,
        partitioning: apartament.partitioning,
        city: apartament.city,
        county: apartament.county,
        # no_of_parking: apartament.no_of_parking,
        age: apartament.age,
        zone: apartament.zone
      }
    end

    def model
        @model ||= Eps::Model.load_pmml(File.read(model_file))
      end
    
      def model_file
        File.join(__dir__, "price_model.pmml")
      end
  end