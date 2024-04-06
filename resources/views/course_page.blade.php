<x-general.layout>
    <div class="lg:mt-12 md:mt-10 mt-8"></div>
    <x-coursepage.hero :user_courses="$user_courses" />
    <x-coursepage.stats />
    <x-coursepage.sections :topics="$topics" :user_courses="$user_courses" />
</x-general.layout>
