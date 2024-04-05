@props(['title', 'excerpt'])
<!-- Card -->
<div class="size-full bg-gray-200 shadow-lg rounded-lg p-5">
    <div class="flex items-center gap-x-4 mb-3">
        <div
            class="inline-flex justify-center items-center size-[62px] rounded-full border-4 border-blue-50 bg-gray-300">
            <svg xmlns="http://www.w3.org/2000/svg" class="text-gray-500" width="32" height="32"
                viewBox="0 0 20 20">
                <path fill="currentColor"
                    d="M2.93 17.07A10 10 0 1 1 17.07 2.93A10 10 0 0 1 2.93 17.07m1.41-1.41A8 8 0 1 0 15.66 4.34A8 8 0 0 0 4.34 15.66m9.9-8.49L11.41 10l2.83 2.83l-1.41 1.41L10 11.41l-2.83 2.83l-1.41-1.41L8.59 10L5.76 7.17l1.41-1.41L10 8.59l2.83-2.83z" />
            </svg>
        </div>
        <div class="flex-shrink-0 break-words max-w-[75%]">
            <h3 class="block text-lg font-semibold text-gray-800">{{$title}}</h3>
        </div>
    </div>
    <p class="text-gray-600">{{$excerpt}}</p>
</div>
<!-- End Card -->
