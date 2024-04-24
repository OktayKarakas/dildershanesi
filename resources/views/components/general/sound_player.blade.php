<div class="flex items-center" id="word_sound_player">
    <div class="relative rounded-full overflow-hidden bg-gray-200 w-12 h-12 mr-4">
        <button id="playButton" class="absolute inset-0 flex items-center justify-center w-full h-full text-gray-700 transition-colors duration-300 focus:outline-none focus:ring-2 focus:ring-gray-600 focus:ring-opacity-50">
            <svg id="playIcon" xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2" viewBox="0 0 20 20" fill="currentColor">
                <path d="M5 4v12l10-6z" />
            </svg>
            <svg id="pauseIcon" xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 hidden" viewBox="0 0 20 20" fill="currentColor">
                <path d="M5 4h3v12H5V4zm7 0h3v12h-3V4z" />
            </svg>
        </button>
    </div>
    <p class="text-gray-600">Listen to the audio</p>
</div>

<script>

    const audio = document.createElement('audio');
    const playButton = document.getElementById('playButton');
    const playIcon = document.getElementById('playIcon');
    const pauseIcon = document.getElementById('pauseIcon');

    function setAudio(currentWordSound){
        let baseUrl = "{{ url('/') }}"; // Laravel's base URL
        let audioUrl = baseUrl + '/' + currentWordSound; // Construct the full URL
        audio.src = audioUrl;
    }


    playButton.addEventListener('click', () => {
        if (audio.paused) {
            audio.play();
            playIcon.classList.add('hidden');
            pauseIcon.classList.remove('hidden');
        } else {
            audio.pause();
            playIcon.classList.remove('hidden');
            pauseIcon.classList.add('hidden');
        }
    });

    audio.addEventListener('ended', () => {
        playIcon.classList.remove('hidden');
        pauseIcon.classList.add('hidden');
    });
</script>


