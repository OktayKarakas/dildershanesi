@props(['topics', 'user_courses'])

<div class="max-w-[85rem] px-4 py-10 sm:px-6 lg:px-8 lg:py-14 mx-auto">
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 items-center gap-6 md:gap-10">
        @php
            $topicCount = count($topics);
            $userTopicId = $user_courses ? $user_courses->topic_id : 1;
            $userTopicId = max(1, min($userTopicId, $topicCount));
        @endphp

        @foreach ($topics as $topic)
            @php
                $isCurrentTopic = $topic->id === $userTopicId;
            @endphp

            @if ($isCurrentTopic)
                <a href={{"/courses/languages/{$topic->course_id}/{$topic->id}"}}><x-coursepage.section_current.index /></a>
            @else
                <x-coursepage.section_locked.index />
            @endif
        @endforeach
    </div>
</div>
