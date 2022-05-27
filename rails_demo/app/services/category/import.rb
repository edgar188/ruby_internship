class Category::Import
  
  def initialize(file)
    @file = file
    @errors = []
  end

  def call
    if @file.present? && @file.content_type.in?(Validations::Variables::CSV)
      import()
    else
      @errors << I18n.t(:not_valid_file) 
    end

    return OpenStruct.new(success?: false, errors: @errors) if @errors.present?
    OpenStruct.new(success?: true)
  end

  # It's importing the categories from a csv file.
  def import
    CSV.foreach(@file.path, headers: true).with_index do |row, index|
      category_hash = row.to_hash
      
      if category_hash['parent'] != 'N/A' && Category.find_by_name(category_hash['parent'])&.id.nil?
        @errors << "Row #{index + 2}, Parent #{I18n.t(:not_valid)} "
      end

      category_hash['options'] ||= [] 
      category_hash['options'] = category_hash['options'].split(',')

      category = Category.new(
        parent_id: Category.find_by_name(category_hash['parent'])&.id,
        name: category_hash['name'],
        options: category_hash['options'] 
      )

      unless category.save
        category.errors.messages.inject({}) do |hash, error|
          @errors << "Row #{index + 2}, #{error[0]} - #{error[1][0]} "
        end
      end
    end
  end
end