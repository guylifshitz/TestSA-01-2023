# Ce fichier devra contenir votre système de traduction en langue PiouPiou.
# Veuillez vous assurer de tirer le meilleur profit de la programmation objet
# d'assurer une qualité de production
#
# Il sera exécuté de la façon suivante :
# ruby piou.rb encode '...'
# ruby piou.rb decode '...'

# TODO change this to use options parser
translation_direction = ARGV[0]
sentence = ARGV[1]

class Translator
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

  def self.french_to_pioupiou(sentence)
    translation = ""
    sentence.split("").each { |character|
      translation += @mapping_french_to_pioupious.fetch(character, "ERROR") + " "
    }
    return translation.strip()
  end

  def self.pioupiou_to_french(sentence)
    translation = ""
    sentence.split(" ").each { |piou_letter|
      french_letter = @mapping_french_to_pioupious.key(piou_letter)
      french_letter = "#" if not french_letter
      translation += french_letter
    }
    return translation
  end
end

case translation_direction
when "encode"
  puts Translator.french_to_pioupiou(sentence)
when "decode"
  puts Translator.pioupiou_to_french(sentence)
else
  puts "Non valid first parameter."
end
