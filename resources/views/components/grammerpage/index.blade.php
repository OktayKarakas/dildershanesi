@props(["konu","topic","title","body","sirasi","next_topic_slug","previous_topic_slug","previous_topic_general","isLast","topic_general"])
@php
    $isFirst = $sirasi <= 1;
    $course_name = request()->route('course_slug');
    $isWord = $topic_general === 'word';
    $isQuiz = $topic_general === 'quiz';
    $quizData = null;
    if ($isQuiz) {
        try {
            $quiz = $konu->quizes()->where('topic_id', $topic->id)->firstOrFail();

            $quizData = $quiz->Questions;
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            // Handle the exception here
            // For example, you can set $quizData to an empty array or null
            echo "<div class='text-center text-lg my-5'><p>Hata.</p><a href='/' class='text-blue-500'>Geri Gitmek İçin Tıkla</a></div>";
            return;
        }
    }
@endphp
@vite(['resources/js/components/grammarpage_index.js'])
<div class="max-w-3xl px-4 pt-6 lg:pt-10 pb-12 sm:px-6 lg:px-8 mx-auto">
    <div class="max-w-2xl">
        <!-- Avatar Media -->
        <div class="flex justify-between items-center mb-6">
            <div class="flex w-full sm:items-center gap-x-5 sm:gap-x-3">
                <div class="flex-shrink-0">
                    <img class="size-12 rounded-full"
                         src="https://plus.unsplash.com/premium_photo-1666433656515-77386ea16d5a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                         alt="Image Description">
                </div>

                <div class="grow">
                    <div class="flex justify-between items-center gap-x-2">
                        <div>
                            <!-- Tooltip -->
                            <div class="hs-tooltip inline-block [--trigger:hover] [--placement:bottom]">
                                <div class="hs-tooltip-toggle sm:mb-1 block text-start cursor-pointer">
                                    <span class="font-semibold text-gray-800">
                                        Oktay Karakaş
                                    </span>

                                    <!-- Dropdown Card -->
                                    <div
                                        class="hs-tooltip-content hs-tooltip-shown:opacity-100 hs-tooltip-shown:visible opacity-0 transition-opacity inline-block absolute invisible z-10 max-w-xs cursor-default bg-gray-900 divide-y divide-gray-700 shadow-lg rounded-xl"
                                        role="tooltip">
                                        <!-- Body -->
                                        <div class="p-4 sm:p-5">
                                            <div class="mb-2 flex w-full sm:items-center gap-x-5 sm:gap-x-3">
                                                <div class="flex-shrink-0">
                                                    <img class="size-8 rounded-full"
                                                         src="https://plus.unsplash.com/premium_photo-1666433656515-77386ea16d5a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                                                         alt="Image Description">
                                                </div>

                                                <div class="grow">
                                                    <p class="text-lg font-semibold text-gray-200">
                                                        Oktay Karakaş
                                                    </p>
                                                </div>
                                            </div>
                                            <p class="text-sm text-gray-400">
                                                Oktay is good at english.
                                            </p>
                                        </div>
                                        <!-- End Body -->

                                        <!-- Footer -->
                                        <div class="flex justify-between items-center px-4 py-3 sm:px-5">
                                        </div>
                                        <!-- End Footer -->
                                    </div>
                                    <!-- End Dropdown Card -->
                                </div>
                            </div>
                            <!-- End Tooltip -->

                            <ul class="text-xs text-gray-500">
                                <li
                                    class="inline-block relative pe-6 last:pe-0 last-of-type:before:hidden before:absolute before:top-1/2 before:end-2 before:-translate-y-1/2 before:size-1 before:bg-gray-300 before:rounded-full">
                                    8 min read
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Avatar Media -->

        <!-- Content -->
        <div class="space-y-5 md:space-y-8 break-words">
            {!! $title !!}<br>
            @if($isWord)
                <input hidden id="words" name="words" value="{{$body}}">
                <div id="word-card"
                     class="bg-white rounded-lg p-8 shadow-md max-w-md w-full flex flex-col items-center mx-auto">
                    <p id="word-asked" class="text-2xl font-semibold mb-4"></p>
                    <p id="times-repeated" class="text-gray-400 my-2">Tekrar sayısı : 0</p>
                    <input id="input-word-answer" name="input-word-answer" type="text"
                           class="border-gray-300 border rounded-md px-4 py-2 mb-4 w-full"
                           placeholder="Karşılığını giriniz.">
                    <p id="false-answer-p" class="text-red-400 my-5 hidden">Yanlış Cevap ! Tekrar Deneyin.</p>
                    <div class="flex gap-5 w-full justify-center">
                        <button type="button" id="word-hint"
                                class="self-end bg-yellow-500 text-sm text-white font-semibold py-2 px-4 rounded-md hover:bg-yellow-600 transition duration-300">
                            Bilmiyorum
                        </button>
                        <button id="submitBtn"
                                class="bg-green-500 text-white text-sm font-semibold py-2 px-4 rounded-md hover:bg-green-600 transition duration-300">
                            Gönder
                        </button>
                    </div>
                    <x-grammerpage.modal class="mt-5"/>
                </div>
            @elseif($isQuiz)
                {{--     phpstorm bug,dont care about error.           --}}
                <form id="quiz-form" x-data x-on:submit.prevent>
                    <input hidden id="quiz" name="quiz" value="{{$quizData}}">
                    <p id="quiz_question" class="text-center"></p>
                    <div id="button-container"></div>
                    <x-grammerpage.quiz_modal :topic="$topic" :course_name="$course_name" :topic_general="$topic_general" />
                </form>
            @else
                {!! $body !!}
            @endif


        </div>
        <!-- End Content -->
    </div>
</div>
<!-- End Blog Article -->

<!-- Sticky Share Group -->
<div class="sticky bottom-6 inset-x-0 text-center">
    <div class="inline-block bg-white shadow-md rounded-full py-3 px-4">
        <div class="flex items-center gap-x-1.5">

            <!-- Button -->
            <div class="relative inline-flex">

                <a href="{{$isFirst ? "/courses/languages/$course_name" : "/languages/english/$previous_topic_general/$previous_topic_slug"}}"
                   id="blog-article-share-dropdown"
                   class="cursor-pointer flex items-center gap-x-2 text-sm text-gray-500 hover:text-gray-800">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
                        <path fill="currentColor" d="m14 7l-5 5l5 5z"/>
                    </svg>
                    Geri
                </a>
            </div>

            <div class="block h-3 border-e border-gray-300 mx-3"></div>
            <!-- Button -->
            <div class="hs-tooltip inline-block">
                <form id="like_form" method="POST">
                    @csrf
                    <button type="submit"
                            class="hs-tooltip-toggle flex items-center gap-x-2 text-sm text-gray-500 hover:text-gray-800">
                        <svg class="flex-shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24"
                             height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                            <path
                                d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/>
                        </svg>

                    </button>
                </form>
            </div>
            <!-- Button -->

            <div class="block h-3 border-e border-gray-300 mx-3"></div>

            <!-- Button -->
            <div class="hs-tooltip inline-block">
                <button type="button"
                        class="hs-tooltip-toggle flex items-center gap-x-2 text-sm text-gray-500 hover:text-gray-800">
                    <svg class="flex-shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                         stroke-linecap="round" stroke-linejoin="round">
                        <path d="m3 21 1.9-5.7a8.5 8.5 0 1 1 3.8 3.8z"/>
                    </svg>
                </button>
            </div>
            <!-- Button -->

            <div class="block h-3 border-e border-gray-300 mx-3"></div>

            <!-- Button -->
            <div class="relative inline-flex">
                <form id="next_form" method="post">
                    @method('PATCH')
                    @csrf
                    <input hidden name="isLast" value="{{$isLast}}">
                    <button
                        id="next_button"
                        class="cursor-pointer flex items-center gap-x-2 text-sm text-gray-500 hover:text-gray-800  {{$isWord ? "opacity-50 cursor-not-allowed pointer-events-none" : ""}}" {{$isWord ? "disabled" : ""}}>
                        İleri
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
                            <path fill="currentColor" d="m10 17l5-5l-5-5z"/>
                        </svg>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- End Sticky Share Group -->
