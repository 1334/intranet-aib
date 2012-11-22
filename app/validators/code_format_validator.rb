class CodeFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^(\d{3}\S{2,6})$/i
      object.errors[attribute] << (options[:message] || "is not a valid code format")
    end
  end
end
