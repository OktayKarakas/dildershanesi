@props(['user_course','topics','topic_count','course'])
<!-- Features -->
@php
    $topicIds = $course->topics()->pluck('id')->toArray(); // Fetch all topic IDs associated with the current course

    $topicCount = count($topicIds);

    $stat = $user_course ? array_search($user_course->topic_id, $topicIds) : 0; // Find the index of the user's current topic ID within $topicIds, or set to 0 if not found
    $is_course_completed = $user_course ? $user_course->isCompleted : false;

    if (!$is_course_completed && $topicCount > 0) {
        $percentage = ($stat / ($topicCount)) * 100; // Calculate percentage based on the index and count of topics (-1 to account for 0-based index)
    } else {
        $percentage = $is_course_completed ? 100 : 0; // Set percentage to 100% if the course is completed, otherwise set it to 0
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
