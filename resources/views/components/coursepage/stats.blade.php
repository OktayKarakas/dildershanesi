@props(['topics', 'user_course'])
<!-- Features -->
@php
    $topicCount = count($topics) + 1;
    $stat = $user_course ? $user_course->topic_id : 0;
    $is_course_completed = $user_course->isCompleted ?? false;

    if (!$is_course_completed) {
        // Ensure $topicCount is greater than 0 and $stat is not 1 to avoid division by zero or incorrect calculation
        if ($topicCount > 0 && $stat !== 1) {
            $percentage = ($stat / $topicCount) * 100;
        } else {
            $percentage = 0; // Set percentage to 0 if $topicCount is zero or if $stat is 1 to avoid division by zero or incorrect calculation
        }
    } else {
        $percentage = 100; // Set percentage to 100% if the course is completed
    }
@endphp
<div class="max-w-[85rem] mx-auto px-4 sm:px-6 lg:px-8 pt-24 pb-10">
    <!-- Stats -->
    <h1 class="block font-bold text-gray-800 text-2xl md:text-3xl lg:text-4xl text-center">
        Kursta İlerleme Durumun
    </h1>
    <div class="text-center">
        <p class="mt-2 sm:mt-3 text-4xl sm:text-6xl font-bold text-yellow-400">{{round($percentage,2)}}%</p>
    </div>
    <!-- End Stats -->
</div>
<!-- End Features -->
