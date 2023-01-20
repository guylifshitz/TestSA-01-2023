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

case translation_direction
when "encode"
  puts "encode"
when "decode"
  puts "decode"
else
  puts "Non valid first parameter."
end
