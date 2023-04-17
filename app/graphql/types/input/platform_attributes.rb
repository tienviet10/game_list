module Types
  module Input
    class PlatformAttributes < Types::BaseInputObject
      description "Attributes for querying games by the platform type"
      one_of
      argument :ID, Integer, "ID of the Platform", required: false
      argument :name, String, "Name of the Platform", required: false
    end
  end
end

