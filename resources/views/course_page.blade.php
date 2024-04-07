<x-general.layout>
    <div class="lg:mt-12 md:mt-10 mt-8"></div>
    <x-coursepage.hero :user_course="$user_course" />
    <x-coursepage.stats :user_course="$user_course" :topics="$topics" />
    <x-coursepage.sections :topics="$topics" :user_course="$user_course" />
</x-general.layout>
