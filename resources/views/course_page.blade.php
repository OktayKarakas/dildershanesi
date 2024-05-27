<x-general.layout>
    <div class="lg:mt-12 md:mt-10 mt-8"></div>
    <div class="flex items-center justify-center">
    <script type="text/javascript"
            src="https://udbaa.com/bnr.php?section=General2&pub=915192&format=300x250&ga=g"></script>
    <noscript><a href="https://yllix.com/publishers/915192" target="_blank"><img
                src="//ylx-aff.advertica-cdn.com/pub/300x250.png"
                style="border:none;margin:0;padding:0;vertical-align:baseline;"
                alt="ylliX - Online Advertising Network"/></a></noscript>
    </div>
    <x-coursepage.hero :user_course="$user_course" :course="$course"/>
    <x-coursepage.stats :user_course="$user_course" :topic_count="$topic_count" :topics="$topics" :course="$course"/>
    <x-coursepage.sections :topics="$topics" :topic_count="$topic_count" :user_course="$user_course" :course="$course"/>
    <div class="mx-8">
        {{$topics->links()}}
    </div>
</x-general.layout>
