class ItemResource < ApplicationRecord
  include Validations::ItemResource
  include Modules::ItemResource

  belongs_to :item
  has_one_attached :file

  auto_strip_attributes :name, squish: true
  auto_strip_attributes :url, squish: true

  validates_presence_of :name, if: -> { self.name.present? }
  validates_length_of :name, minimum: 2, maximum: 255, if: -> { self.name.present? }
  validates :url, format: URI::regexp(%w[http https]), if: -> { self.url? && self.url.present? }
  validate :validate_resource_type, unless: -> { self.resource_type.nil? }
  validate :validate_file_type, if: -> { self.file.present? }

  enum resource_type: {
    url: 0,
    document: 1
  }

end