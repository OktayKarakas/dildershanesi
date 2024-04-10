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
</script>
