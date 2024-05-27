<x-general.layout>
    <h1 class="text-3xl font-bold text-center my-5">Kurslarım</h1>
    <script type="text/javascript"
            src="https://udbaa.com/bnr.php?section=General2&pub=915192&format=300x250&ga=g"></script>
    <noscript><a href="https://yllix.com/publishers/915192" target="_blank"><img
                src="//ylx-aff.advertica-cdn.com/pub/300x250.png"
                style="border:none;margin:0;padding:0;vertical-align:baseline;"
                alt="ylliX - Online Advertising Network"/></a></noscript>
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
        @if($user_courses->count())
            @foreach($user_courses as $course)
                @php
                    $course = App\Models\Course::where('id', $course->course_id)->first();
                @endphp
                <x-usercoursepage.card :title="$course->title" :excerpt="$course->excerpt" :slug="$course->slug"/>
            @endforeach
        @else
            <p class="text-center my-2">Kursun yok.</p>
            <a href="/" class="text-center text-blue-500">Ana Sayfaya Dön</a>
        @endif
    </div>
</x-general.layout>
