<x-general.layout>
    @if($bookmarks->count())
        @foreach($bookmarks as $bookmark)
            @php
                $course = \App\Models\Course::find($bookmark->course_id);
                $topic = \App\Models\Topic::find($bookmark->topic_id);
                $konu_anlatimi = \App\Models\Konu_Anlatimi::find($bookmark->konu_anlatimi_id);
                if($topic->isGrammar) {
                    $topic_general = 'grammar';
                }elseif($topic->isWord) {
                    $topic_general = 'word';
                }elseif($topic->isQuiz){
                    $topic_general = 'quiz';
                }else {
                    $topic_general = null;
                }
            @endphp
            <a class="m-5 group flex flex-col bg-white border shadow-sm rounded-xl hover:shadow-md transition dark:bg-slate-900 dark:border-gray-800" href="{{"/languages/$course->slug/$topic_general/$topic->slug"}}">
                <div class="p-4 md:p-5">
                    <div class="flex justify-between items-center">
                        <div>
                            <h3 class="group-hover:text-blue-600 font-semibold text-gray-800 dark:group-hover:text-gray-400 dark:text-gray-200">
                                Course: {{$course->title}}
                            </h3>
                            <p class="text-sm text-gray-500">
                               Topic: {{$topic->title}}
                            </p>
                            <p class="text-sm text-gray-500">
                                Konu: {!! $konu_anlatimi->title !!}
                            </p>
                        </div>
                        <div class="ps-3">
                            <svg class="flex-shrink-0 size-5" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m9 18 6-6-6-6"/></svg>
                        </div>
                    </div>
                </div>
            </a>
        @endforeach
    @else<div class="flex items-center w-full flex-col">
        <p class="text-center text-lg my-5 text-gray-600">Beğendiğin Gönderi Bulamadık</p>
        <a href="/" class="text-center text-blue-500">Ana Sayfaya Dön</a>
    </div>
    @endif
</x-general.layout>
