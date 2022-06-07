class Friendship < ApplicationRecord
  include Validations::Friendship
  include Modules::Friendship

  belongs_to :sent_to, class_name: 'User', foreign_key: 'sent_to_id'
  belongs_to :sent_by, class_name: 'User', foreign_key: 'sent_by_id'

  validate :validate_self_request, on: :create
  validate :validate_already_sent_request
  validate :validate_already_friends

end