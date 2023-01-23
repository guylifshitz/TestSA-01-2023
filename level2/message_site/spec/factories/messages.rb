  
FactoryBot.define do

    factory :message do
        tag factory: :tag
        author { 'John' }
        body_french {}
        body_pioupiou {}
        trait :has_french do
            body_french { "LEMONDE." }
        end
        trait :has_pioupiou do
            body_pioupiou { "pouu ioui piiu uiui piui iiou ioui ipuu" }
        end
        trait :is_rigolo do
            tag factory: :rigolo_tag
        end
        trait :has_another_name do
            author { "Larrry" }
        end

        factory :rigolo_message, traits: [:is_rigolo]
        factory :rigolo_message_2, traits: [:is_rigolo, :has_another_name]
        factory :message_with_only_french, traits: [:has_french]
        factory :message_with_only_pioupiou, traits: [:has_pioupiou]
        factory :message_with_both_langauges, traits: [:has_french, :has_pioupiou]
    end
end
  