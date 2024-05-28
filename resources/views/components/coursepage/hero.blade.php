@props(['user_course','course'])

@php
    $devam_et_link = '/';
    if(isset($user_course)){
        $devam_et_link = "/languages/".$user_course->course->slug."/".($user_course->topic->isGrammar ? 'grammar' : 'word')."/".$user_course->topic->slug;
    }
@endphp

    <!-- Hero -->
<div
    class="relative overflow-hidden before:absolute before:top-0 before:start-1/2 before:bg-[url('https://preline.co/assets/svg/examples/squared-bg-element.svg')] before:bg-no-repeat before:bg-top before:size-full before:-z-[1] before:transform before:-translate-x-1/2'https://preline.co/assets/svg/examples-dark/squared-bg-element.svg')]">
    <div class="max-w-[85rem] mx-auto px-4 sm:px-6 lg:px-8 pt-24 pb-10">


        <!-- Title -->
        <div class="mt-5 max-w-xl text-center mx-auto">
            <h1 class="block font-bold text-gray-800 text-4xl md:text-5xl lg:text-6xl">
                {!! $course->title !!}
            </h1>
        </div>
        <!-- End Title -->

        <div class="mt-5 max-w-3xl text-center mx-auto">
            {!! $course->excerpt !!}
        </div>

        <!-- Buttons -->
        <div class="mt-8 gap-3 flex justify-center">
            @if(!isset($user_course))
                <form method="post">
                    @csrf
                    <button type="submit"
                            class="inline-flex justify-center items-center gap-x-3 text-center bg-gradient-to-tl from-blue-600 to-violet-600 hover:from-violet-600 hover:to-blue-600 border border-transparent text-white text-sm font-medium rounded-full focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 focus:ring-offset-white py-3 px-4">
                        Kursa Başla
                    </button>
                </form>
            @elseif($user_course->isCompleted)
                <form method="post">
                    @csrf
                    @method('PATCH')
                    <button type="submit"
                            class="inline-flex justify-center items-center gap-x-3 text-center bg-gradient-to-tl from-blue-600 to-violet-600 hover:from-violet-600 hover:to-blue-600 border border-transparent text-white text-sm font-medium rounded-full focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 focus:ring-offset-white py-3 px-4">
                        Kursu Sıfırla
                    </button>
                </form>
            @else
                <a href="{{$devam_et_link}}"
                   class="inline-flex justify-center items-center gap-x-3 text-center bg-gradient-to-tl from-blue-600 to-violet-600 hover:from-violet-600 hover:to-blue-600 border border-transparent text-white text-sm font-medium rounded-full focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-offset-2 focus:ring-offset-white py-3 px-4">
                    Devam et
                </a>
            @endif
        </div>
        <!-- End Buttons -->
    </div>
    <div class="flex items-center justify-center">
        <script type="text/javascript"
                src="https://udbaa.com/bnr.php?section=General2&pub=915192&format=300x250&ga=g"></script>
        <noscript><a href="https://yllix.com/publishers/915192" target="_blank"><img
                    src="//ylx-aff.advertica-cdn.com/pub/300x250.png"
                    style="border:none;margin:0;padding:0;vertical-align:baseline;"
                    alt="ylliX - Online Advertising Network"/></a></noscript>
    </div>
</div>
<div id="courseModal" class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 hidden">
    <div class="bg-white rounded-lg overflow-hidden shadow-xl transform transition-all max-w-lg w-full">
        <div class="bg-gray-100 px-4 py-2">
            <h5 class="text-lg font-semibold">Kurs Bilgisi</h5>
        </div>
        <div class="p-4">
            Bu Kurs Yapım Aşamasındadır. Kursu Kullanabilirsiniz fakat hatalarla karşılaşabilirsiniz. Ayrıca Kursu
            bitirmeniz durumunda yeni eklenen topiclere bakmak için yine ziyaret etmeyi unutma :)
        </div>
        <div class="bg-gray-100 px-4 py-2 flex justify-end">
            <button id="closeModal" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">Kapat</button>
        </div>
    </div>
</div>

@if(!$course->done)
    <script>
        $(document).ready(function () {
            $('#courseModal').removeClass('hidden');
            $('#closeModal').click(function () {
                $('#courseModal').addClass('hidden');
            });
        });
    </script>
@endif
<!-- End Hero -->
