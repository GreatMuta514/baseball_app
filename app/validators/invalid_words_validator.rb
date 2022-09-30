class InvalidWordsValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    return if value.blank?

    blacklist = YAML.load_file('./config/blacklist.yml')
    record.errors.add(:contain_blacklist_words, '') if blacklist.any? { |word| value.include?(word) }
  end
end
