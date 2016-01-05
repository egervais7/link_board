class LinkValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/
      record.errors[attribute] << (options[:message] || "is not a link")
    end
  end
end


class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {in: 10..100}
  validates :link, presence: true, link: true

end
