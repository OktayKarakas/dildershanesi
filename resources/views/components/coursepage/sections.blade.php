@props(['topics', 'user_course'])

<div class="max-w-[85rem] px-4 py-10 sm:px-6 lg:px-8 lg:py-14 mx-auto">
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 items-center gap-6 md:gap-10">
        @php
            $topicCount = count($topics);
            $userTopicId = $user_course ? $user_course->topic_id : 1;
            $userTopicId = max(1, min($userTopicId, $topicCount));
        @endphp

        @foreach ($topics as $topic)
            @php
                $course_slug = request()->route('slug');
                $isCurrentTopic = $topic->id === $userTopicId;
                $isTopicPassed = $topic->id < $userTopicId;
                $isCourseCompleted = $user_course->isCompleted ?? false;
                $topic_general = $topic->isGrammar ? 'grammar' : ($topic->isWord ? 'word' : 'quiz');
                $link = "/languages/$course_slug/$topic_general/$topic->slug"
            @endphp

            @if($isTopicPassed || $isCourseCompleted)
                <a href={{$link}}>
                    <x-coursepage.section_passed.index :title="$topic->title" :excerpt="$topic->excerpt"/>
                </a>
            @elseif($isCurrentTopic)
                <a href={{$link}}>
                    <x-coursepage.section_current.index :title="$topic->title" :excerpt="$topic->excerpt"/>
                </a>
            @else
                <x-coursepage.section_locked.index :title="$topic->title" :excerpt="$topic->excerpt"/>
            @endif
        @endforeach
    </div>
</div>
