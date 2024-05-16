@props(["courses"])
<div class="max-w-[85rem] px-4 py-10 sm:px-6 lg:px-8 lg:py-14 mx-auto">
    <!-- Grid -->
    {{-- class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6" --}}
    <!-- Card -->
    {{-- when activate col remove max-w and mx-auto --}}
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
        @foreach($courses as $course)
            <x-homepage.language_card :background_image="$course->background_url"
                                      :title="$course->title"
                                      :excerpt="$course->excerpt"
                                      :slug="$course->slug"
            />
        @endforeach
        @if(count($courses) === 0)
            <p>Aradığın kursu bulamadık.</p>
        @endif
    </div>
    <!-- End Card -->
    <!-- End Grid -->
</div>
