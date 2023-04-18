module Types
  module Input
    class GenreAttributes < Types::BaseInputObject
      description "Attributes for querying games by the genre type"
      one_of
      argument :ID, Integer, "ID of the Genre", required: false
      argument :name, String, "Name of the Genre", required: false
    end
  end
end
