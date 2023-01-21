module PiouTranslator

  class Translator

    def initialize
      @mapping_french_to_pioupious = {
      "A" => "piou",
      "B" => "ioup",
      "C" => "poup",
      "D" => "iiou",
      "E" => "ioui",
      "F" => "pipp",
      "G" => "ouip",
      "H" => "poui",
      "I" => "ppou",
      "J" => "ipip",
      "K" => "oupi",
      "L" => "pouu",
      "M" => "piiu",
      "N" => "piui",
      "O" => "uiui",
      "P" => "opui",
      "Q" => "pupu",
      "R" => "iupi",
      "S" => "piuu",
      "T" => "piup",
      "U" => "piop",
      "V" => "ipou",
      "W" => "oupu",
      "X" => "uopu",
      "Y" => "iupu",
      "Z" => "iupp",
      "!" => "iipu",
      "," => "iupo",
      "." => "ipuu",
      "?" => "ppip",
    }
  end

  def french_to_pioupiou(sentence)
    translation = ""
    sentence.split("").each { |character|
      translation += @mapping_french_to_pioupious.fetch(character, "ERROR") + " "
    }
    return translation.strip()
  end

  def pioupiou_to_french(sentence)
    translation = ""
    sentence.split(" ").each { |piou_letter|
      french_letter = @mapping_french_to_pioupious.key(piou_letter)
      french_letter = "#" if not french_letter
      translation += french_letter
    }
    return translation
  end
end
end