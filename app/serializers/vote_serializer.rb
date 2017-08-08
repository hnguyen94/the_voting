class VoteSerializer < ActiveModel::Serializer
  attributes :id, :vote, :voteable_type, :voteable_id, :voter_type, :voter_id, :created_at, :updated_at
end
