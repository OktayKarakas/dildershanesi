<x-general.layout>
    <div class="lg:mt-12 md:mt-10 mt-8"></div>
    <x-coursepage.hero :user_course="$user_course" />
    <x-coursepage.stats :user_course="$user_course" :topic_count="$topic_count" :topics="$topics" :course="$course" />
    <x-coursepage.sections :topics="$topics" :topic_count="$topic_count" :user_course="$user_course" :course="$course" />
    <div class="mx-8">
    {{$topics->links()}}
    </div>
</x-general.layout>
