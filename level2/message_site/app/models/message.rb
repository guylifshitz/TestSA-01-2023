class Message < ApplicationRecord
  belongs_to :tag
  validate :author_fewer_than_1000_messages
  validates :author, presence: true
  
  before_save :translate


  private
  
  def translate
    if self.body_pioupiou.present? and self.body_french.present? then
      return
    end

    translator = PiouTranslator::Translator.new

    if self.body_pioupiou.present? then
      self.body_french = translator.pioupiou_to_french(self.body_pioupiou)
    end
    if self.body_french.present? then
      self.body_pioupiou = translator.french_to_pioupiou(self.body_french)
    end
  end

  def author_fewer_than_1000_messages
    author_message_count = Message.where(:author=>author).count()
    if author_message_count >= 1000 then
      errors.add(":author", "author published too many messages already:" % [author_message_count])
    end
  end
end