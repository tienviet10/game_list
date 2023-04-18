module Types
  module Input
    class TagAttributes < Types::BaseInputObject
      description "Attributes for querying games by the tag type"
      # one_of
      argument :ID, Integer, "ID of the Tag", required: false
      argument :name, String, "Name of the Tag", required: false
    end
  end
end
