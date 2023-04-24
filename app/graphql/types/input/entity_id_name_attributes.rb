module Types
  module Input
    class EntityIdNameAttributes < Types::BaseInputObject
      description "Attributes for querying by an ID or name"
      one_of
      argument :ID, Integer, "ID of the Entity", required: false
      argument :name, String, "Name of the Entity", required: false
    end
  end
end
