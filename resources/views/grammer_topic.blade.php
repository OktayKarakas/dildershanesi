<x-general.layout>
    <x-grammerpage.index :title="$konu_anlatimi->title"
                         :body="$konu_anlatimi->body"
                         :konu="$konu_anlatimi"
                         :topic="$grammer"
                         :course="$language"
                         :sirasi="$konu_anlatimi->sirasi"
                         :next_topic_slug="$next_topic_slug"
                         :topic_general="$topic_general"
                         :previous_topic_slug="$previous_topic_slug"
                         :previous_topic_general="$previous_topic_general"
                         :isLast="$isLast"
                         :user_bookmark="$user_bookmark"
    />
</x-general.layout>
