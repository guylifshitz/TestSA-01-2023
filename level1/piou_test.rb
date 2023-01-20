# Ce fichier sera lancé pour tester l'application
# Veillez à tester les situations et erreurs inattendues

require_relative "piou"

describe Translator do
  describe "translating pioupiou to french" do
    context "with valid input" do
      it "translates correctly" do
        expect(Translator.pioupiou_to_french("poup poui piou piup")).to eq("CHAT")
      end
    end
    context "with bad input" do
      it "should handle bad input" do
        expect(Translator.pioupiou_to_french("poupa poui fu piup")).to eq("#H#T")
      end
    end
  end

  describe "translating french to pioupiou" do
    context "with valid input" do
      it "translates correctly" do
        expect(Translator.french_to_pioupiou("CHAT")).to eq("poup poui piou piup")
      end
    end
    context "with bad input" do
      it "should handle bad input" do
        expect(Translator.french_to_pioupiou("AD$:@")).to eq("piou iiou ERROR ERROR ERROR")
      end
    end
  end
end
