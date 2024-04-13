<x-general.layout>
    <div class="mx-4 my-4">
        <h2 class="text-lg font-bold">Kurs Oluştur</h2>
        <form id="course_create_form" method="post">
            @csrf
            <div class="my-2">
                <label for="kurs_title">Kurs Başlığı</label>
                <input name="kurs_title" id="course_title" placeholder="Kurs Başlığını Giriniz.."/>
            </div>
            <div class="my-2">
                <label for="course_excerpt">Kurs Açıklaması</label>
                <input name="course_excerpt" id="course_excerpt" placeholder="Kurs Açıklamasını Giriniz.."/>
            </div>
            <div class="my-2">
                <label for="course_slug">Kurs Slug</label>
                <input name="course_slug" id="course_slug" placeholder="Kurs Slug Giriniz.."/>
            </div>
            <button class="p-2 bg-blue-500">Kurs Oluştur</button>
        </form>
    </div>
    <div class="mx-4 my-4">
        <h2 class="text-lg font-bold">Topic Oluştur</h2>
        <form id="topic_create_form" method="post">
            @csrf
            <div class="my-2">

                <label for="topic_course_id">Ait Olduğu Kurs</label>
                <select name="topic_course_id" id="topic_course_id">
                    @foreach($courses as $course)
                        <option value="{{$course->id}}">{{$course->title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="my-2">
                <label for="topic_title">Topic Başlığı</label>
                <input name="topic_title" id="topic_title" placeholder="Topic Başlığını Giriniz.."/>
            </div>
            <x-general.sound_player :audio_link="'audio/english/voice.wav'" />
            <div class="my-2">
                <label for="topic_excerpt">Topic Açıklaması</label>
                <input name="topic_excerpt" id="topic_excerpt" placeholder="Topic Açıklamasını Giriniz.."/>
            </div>
            <div class="my-2">
                <label for="topic_slug">Kurs Slug</label>
                <input name="topic_slug" id="topic_slug" placeholder="Topic Slug Giriniz.."/>
            </div>
            <div class="my-4 flex flex-row gap-x-2">
                <input type="radio" id="topic_isGrammar" name="topic_general" value="grammar">
                <label for="html">Grammar</label><br>
                <input type="radio" id="topic_isWord" name="topic_general" value="word">
                <label for="css">Word</label><br>
                <input type="radio" id="topic_isQuiz" name="topic_general" value="quiz">
                <label for="javascript">Quiz</label>
            </div>
            <button class="p-2 bg-blue-500">Topic Oluştur</button>
        </form>
    </div>
    <div class="mx-4 my-4">
        <h2 class="text-lg font-bold">Konu Anlatimi Oluştur</h2>
        <form id="konu_anlatimi_create_form" method="post">
            @csrf
            <div class="my-2">

                <label for="konu_anlatimi_course_id">Ait Olduğu Kurs</label>
                <select name="konu_anlatimi_course_id" id="konu_anlatimi_course_id">
                    @foreach($courses as $course)
                        <option value="{{$course->id}}">{{$course->title}}</option>
                    @endforeach
                </select>
                <label for="konu_anlatimi_topic_id">Ait Olduğu Topic</label>
                <select name="konu_anlatimi_topic_id" id="konu_anlatimi_topic_id">
                    @foreach($topics as $topic)
                        <option value="{{$topic->id}}">{{$topic->title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="my-2">
                <label for="konu_anlatimi_title">Konu Anlatımı Başlığı</label>
                <input name="konu_anlatimi_title" id="konu_anlatimi_title"
                       placeholder="Konu Anlatımı Başlığını Giriniz.."/>
            </div>
            <div class="my-2">

                <label for="konu_anlatimi_body">Konu Anlatımı Body</label>
                <p>Word ise aşağıdaki gibi değilse normal giriniz.Html tagleri hesaba katılacaktir.</p>
                <textarea class="resize-horizontal resize-vertical w-full h-32 border rounded-md p-2"
                          name="konu_anlatimi_body" id="konu_anlatimi_body"
                          placeholder="Topic Açıklamasını Giriniz..">{
  "key1": {
    "value": "value1",
    "uses": "test"
  },
  "key2": {
    "value": "value2",
    "uses": "example"
  },
  "key3": {
    "value": "value3",
    "uses": "sample"
  }
}</textarea>
            </div>
            <div class="my-2">
                <label for="sirasi">Konu Anlatim Sirasi</label>
                <input name="sirasi" type="number" id="sirasi" placeholder="Konu Anlatim Sirasi Giriniz.."/>
            </div>
            <button class="p-2 bg-blue-500">Topic Oluştur</button>
        </form>
    </div>
    <div class="mx-4 my-4">
        <h2 class="text-lg font-bold">Quiz Oluştur</h2>
        <form id="quiz_create_form" method="post">
            @csrf
            <div class="my-2">

                <label for="quiz_topic_id">Ait Olduğu Topic</label>
                <select name="quiz_topic_id" id="quiz_topic_id">
                    @foreach($topics as $topic)
                        <option value="{{$topic->id}}">{{$topic->title}}</option>
                    @endforeach
                </select>
                <label for="quiz_konu_anlatimi_id">Ait Olduğu Konu Anlatımı</label>
                <select name="quiz_konu_anlatimi_id" id="quiz_konu_anlatimi_id">
                    @foreach($konu_anlatimlari as $anlatim)
                        <option value="{{$anlatim->id}}">{{$anlatim->title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="my-2">
                <label for="quiz_isEnd_checkbox">Sonuncu Mu</label>
                <input name="quiz_isEnd_checkbox" type="checkbox" id="quiz_isEnd_checkbox"/>
            </div>
            <button class="p-2 bg-blue-500">Quiz Oluştur</button>
        </form>
    </div>
    <div class="mx-4 my-4">
        <h2 class="text-lg font-bold">Soru Oluştur</h2>
        <form id="quiz_question_create_form" method="post">
            @csrf
            <div class="my-2">

                <label for="quiz_quesstion_quiz_id">Ait Olduğu Quiz</label>
                <select name="quiz_id" id="quiz_id">
                    @foreach($quizler as $quiz)
                        <option value="{{$quiz->id}}">{{$quiz->id}}</option>
                    @endforeach
                </select>
            </div>
            <div class="my-5">
                <p>Question Yapısı</p>
                <textarea class="resize-horizontal resize-vertical w-full h-32 border rounded-md p-2"
                          name="question_body" id="question_body"
                          placeholder="Question Giriniz..">
{
  "key1": "value",
   "key2": "value2",
  "correct_answer": "key1",
  "title": "test"
}
</textarea>
            </div>
            <div class="my-2">
                <select name="quiz_question_type" id="quiz_question_type">
                    <option value="multipleChoice">Multiple Choice</option>
                    <option value="trueFalse">True False</option>
                    <option value="clickComplete">Click Complete</option>
                </select>
            </div>
            <button class="p-2 bg-blue-500">Question Oluştur</button>
        </form>
    </div>
</x-general.layout>

<script>
    document.getElementById("course_create_form").addEventListener("submit", function (e) {
        e.preventDefault();
        fetch('/admin/create/course', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // Set content type if needed
                'X-CSRF-TOKEN': '{{ csrf_token() }}' // Using Laravel's csrf_token() function to get CSRF token
            },
            body: JSON.stringify({
                kurs_title: document.getElementById("course_title").value,
                course_excerpt: document.getElementById("course_excerpt").value,
                course_slug: document.getElementById("course_slug").value
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Handle success response
                console.log('Success:', data);
                // Redirect or show success message
                window.location.reload()
            })
            .catch(error => {
                // Handle error
                console.error('Error:', error);
                // Show error message to the user
            });
    })

    document.getElementById("topic_create_form").addEventListener("submit", function (e) {
        e.preventDefault();
        fetch('/admin/create/topic', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // Set content type if needed
                'X-CSRF-TOKEN': '{{ csrf_token() }}' // Using Laravel's csrf_token() function to get CSRF token
            },
            body: JSON.stringify({
                topic_course_id: document.getElementById("topic_course_id").value,
                topic_title: document.getElementById("topic_title").value,
                topic_excerpt: document.getElementById("topic_excerpt").value,
                topic_slug: document.getElementById("topic_slug").value,
                topic_general: document.querySelector('input[name="topic_general"]:checked').value
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Handle success response
                // Redirect or show success message
                window.location.reload()
            })
            .catch(error => {
                // Handle error
                console.error('Error:', error);
                // Show error message to the user
            });
    })

    document.getElementById("konu_anlatimi_create_form").addEventListener("submit", function (e) {
        e.preventDefault();
        fetch('/admin/create/konu_anlatimi', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
                konu_anlatimi_course_id: document.getElementById("konu_anlatimi_course_id").value,
                konu_anlatimi_topic_id: document.getElementById("konu_anlatimi_topic_id").value,
                konu_anlatimi_title: document.getElementById("konu_anlatimi_title").value,
                konu_anlatimi_body: document.getElementById("konu_anlatimi_body").value,
                sirasi: document.getElementById("sirasi").value
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Success:', data);
                window.location.reload();
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });

    document.getElementById("quiz_create_form").addEventListener("submit", function (e) {
        e.preventDefault();
        fetch('/admin/create/quiz', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
                quiz_topic_id: document.getElementById("quiz_topic_id").value,
                quiz_konu_anlatimi_id: document.getElementById("quiz_konu_anlatimi_id").value,
                quiz_isEnd_checkbox: document.getElementById("quiz_isEnd_checkbox").checked
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Success:', data);
                window.location.reload();
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });

    document.getElementById("quiz_question_create_form").addEventListener("submit", function (e) {
        e.preventDefault();
        fetch('/admin/create/quiz_question', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({
                quiz_id: document.getElementById("quiz_id").value,
                question_body: document.getElementById("question_body").value,
                quiz_question_type: document.getElementById("quiz_question_type").value
            })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Success:', data);
                window.location.reload();
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });

</script>
