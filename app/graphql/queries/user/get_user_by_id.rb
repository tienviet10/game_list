# module Queries
#   module user
#     class GetUserById < Queries::BaseQuery
#       description 'Get user by id'
#       type Types::User::UserType, null: false
#       argument :id, ID, required: true

#       def resolve(id:)
#         ::User.find(id)
#       end
#     end
#   end
# end
