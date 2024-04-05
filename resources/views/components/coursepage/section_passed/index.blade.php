@props(['title', 'excerpt'])
<!-- Card -->
<div class="size-full bg-green-700 shadow-lg rounded-lg p-5">
    <div class="flex items-center gap-x-4 mb-3">
        <div
            class="inline-flex justify-center items-center size-[62px] rounded-full border-4 border-green-500 bg-green-900">
            <svg xmlns="http://www.w3.org/2000/svg" class="text-green-500" width="32" height="32" viewBox="0 0 1024 1024">
                <path fill="currentColor"
                      d="M912 190h-69.9c-9.8 0-19.1 4.5-25.1 12.2L404.7 724.5L207 474a32 32 0 0 0-25.1-12.2H112c-6.7 0-10.4 7.7-6.3 12.9l273.9 347c12.8 16.2 37.4 16.2 50.3 0l488.4-618.9c4.1-5.1.4-12.8-6.3-12.8"/>
            </svg>
        </div>
        <div class="flex-shrink-0 break-words max-w-[75%]">
            <h3 class="block text-lg font-semibold text-white">{{$title}}</h3>
        </div>
    </div>
    <p class="text-gray-600 text-white">{{$excerpt}}</p>
</div>
<!-- End Card -->
