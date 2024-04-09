@props(["topic","course_name","topic_general"])
<div id="quiz-modal-container"
     class="fixed hidden top-0 inset-0 z-[80] flex items-center justify-center overflow-x-hidden overflow-y-auto">
    <div
        class="mt-7 opacity-100 w-full duration-500 mt-0 opacity-0 ease-out transition-all sm:max-w-lg sm:w-full m-3 sm:mx-auto">
        <div class="relative flex flex-col bg-white shadow-lg rounded-xl dark:bg-gray-800">
            <div class="absolute top-2 end-2">
                <button type="button" id="quiz-modal-close"
                        class="flex justify-center items-center size-7 text-sm font-semibold rounded-lg border border-transparent text-gray-800 hover:bg-gray-100 disabled:opacity-50 disabled:pointer-events-none dark:text-white dark:border-transparent dark:hover:bg-gray-700"
                        data-hs-overlay="#hs-task-created-alert">
                    <span class="sr-only">Close</span>
                    <svg class="flex-shrink-0 size-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round">
                        <path d="M18 6 6 18"/>
                        <path d="m6 6 12 12"/>
                    </svg>
                </button>
            </div>

            <div class="p-4 sm:p-10 text-center overflow-y-auto">
                <!-- Icon -->
                <span
                    class="mb-4 inline-flex justify-center items-center size-[46px] rounded-full border-4 border-green-50 bg-green-100 text-green-500 dark:bg-green-700 dark:border-green-600 dark:text-green-100">
          <svg class="flex-shrink-0 size-5" xmlns="http://www.w3.org/2000/svg" width="16" height="16"
               fill="currentColor" viewBox="0 0 16 16">
            <path
                d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
          </svg>
        </span>
                <!-- End Icon -->

                <h3 class="mb-2 text-xl font-bold text-gray-800 dark:text-gray-200">
                    Quiz Sonuçları
                </h3>
                <div class="text-gray-500 overflow-auto max-h-[250px]">
                    <p class="text-red-500 text-sm">Yanlış Sayısı : <span id="quiz-modal-wrong-number"></span></p>
                </div>

                <div class="mt-6 flex justify-between">
                    <a href="{{"/languages/$course_name/$topic_general/$topic->slug"}}"
                       id="blog-article-share-dropdown"
                       class="cursor-pointer flex items-center gap-x-2 text-sm text-gray-500 hover:text-gray-800">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
                            <path fill="currentColor" d="m14 7l-5 5l5 5z"/>
                        </svg>
                        Quizi Tekrar Et
                    </a>
                    <button
                        id="quiz-modal-next-button"
                        class="cursor-pointer flex items-center gap-x-2 text-sm text-gray-500 hover:text-gray-800">
                        İlerle
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24">
                            <path fill="currentColor" d="m10 17l5-5l-5-5z"/>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    let modal_container = document.getElementById("quiz-modal-container");
    let quiz_modal_wrong_number = document.getElementById("quiz-modal-wrong-number");

    document.getElementById("quiz-modal-close").addEventListener("click", function () {
        modal_container.classList.add("hidden");
    })

</script>

