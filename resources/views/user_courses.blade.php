<x-general.layout>
    <h1 class="text-3xl font-bold text-center my-5">Kurslarım</h1>
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
