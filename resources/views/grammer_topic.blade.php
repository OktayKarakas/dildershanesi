<x-general.layout>
    <x-grammerpage.index :title="$konu_anlatimi->title"
                         :body="$konu_anlatimi->body"
                         :sirasi="$konu_anlatimi->sirasi"
                         :next_topic_slug="$next_topic_slug"
                         :previous_topic_slug="$previous_topic_slug"
                         :previous_is_grammar="$previous_is_grammar"
                         :next_is_grammar="$next_is_grammar"
    />
</x-general.layout>
