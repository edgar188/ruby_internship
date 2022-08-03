module Validations::Variables
  extend ActiveSupport::Concern

  VALID_IMAGE_TYPES = %w[image/jpeg image/jpg image/png].freeze
  VALID_FILE_TYPES = %w[
    text/csv
    application/excel
    application/vnd.ms-excel
    application/x-excel
    application/x-msexcel
    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
    application/x-ole-storage
  ].freeze

  CSV = %w[text/csv].freeze
  VALID_URL = %w[http https].freeze

end