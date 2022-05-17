module Modules::ItemResource
  extend ActiveSupport::Concern
  
  RESOURCE_TYPE = {
    url: 'Url',
    document: 'Document'
  }

end