class District < ActiveRecord::Base
  validates_presence_of :name, :phone, :mailing_address, :notes, :status
end

