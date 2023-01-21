require 'rails_helper'


RSpec.describe Message, type: :model do



  context "test creating the messages" do
    let(:tag) { build :tag }

    it "can make a fully defined message" do
      expect(Message.new(author: "laurence", body_pioupiou: "poup uiui piop poup uiui piop", body_french: "COUCOU", tag: tag)).to be_valid
    end

    it "can save a fully defined message" do
      expect(Message.create(author: "laurence", body_pioupiou: "poup uiui piop poup uiui piop", body_french: "COUCOU", tag: tag)).to be_valid
    end

    it "new fails when missing a tag" do
      expect(Message.new(author: "laurence", body_pioupiou: "poup uiui piop poup uiui piop", body_french: "COUCOU")).not_to be_valid
    end
  end 

  context "limits to 1000" do 
    let(:tag) { build :tag }
    it "can make up to 999 messages from the same author" do
      (1..999).each do |n|      
        expect(Message.create(author: "laurence", body_pioupiou: "poup uiui piop poup uiui piop", body_french: "COUCOU", tag: tag)).to be_valid
      end
    end

    it "fails to make 1000 messages from the same author" do
      (1..999).each do |n|      
        expect(Message.create(author: "laurence", body_pioupiou: "poup uiui piop poup uiui piop", body_french: "COUCOU", tag: tag)).to be_valid
      end
      expect(Message.create(author: "laurence", body_pioupiou: "poup uiui piop poup uiui piop", body_french: "COUCOU", tag: tag)).not_to be_valid
    end
  end


  context "translation of texts" do
    let(:message_only_french) { build :message_with_only_french }
    let(:message_only_piou) { build :message_with_only_pioupiou }
    let(:message_with_both_langauges) { build :message_with_both_langauges }
 
    it "translates french to pioupiou when no pioupiou is present" do 
      expect { message_only_french.save }.to change { message_only_french.body_pioupiou }.from(nil).to("pouu ioui piiu uiui piui iiou ioui ipuu")
    end
     it "translates pioupiou to french when no french is present" do 
      expect { message_only_piou.save }.to change { message_only_piou.body_french }.from(nil).to("LEMONDE.")
    end
    it "doesnt translate if the french and pioupiou are both present" do 
      expect { message_with_both_langauges.save }.to_not change {message_only_piou.body_french}
    end
  end   

end   
