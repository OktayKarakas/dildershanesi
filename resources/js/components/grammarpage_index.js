let words_json = (document.getElementById('words') ? document.getElementById('words').value : null) || null;
let words = null;
try {
    words = JSON.parse(words_json);
} catch (error) {
    words = null;
}
let currentIndex = 0
let wordKeys = words ? Object.keys(words) : null;
let askingForKeys = true;
let random_word = false;
let word_row = 0;

function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

// Display current word and wait for user input
function displayWord() {
    // Get current word and its translation
    let currentWordKey, currentWordValue;
    if (random_word && currentIndex === 0) {
        wordKeys = shuffleArray(wordKeys);
    }
    currentWordKey = wordKeys[currentIndex];
    currentWordValue = words[currentWordKey]["value"];

    // Display current word
    document.getElementById("word-asked").textContent = askingForKeys ? currentWordKey : currentWordValue;

    // Reset button color and card background to default when input field is focused
    document.getElementById("input-word-answer").addEventListener("focus", function () {
        document.getElementById("submitBtn").classList.remove("bg-red-500");
        document.getElementById("word-card").classList.remove("bg-red-300");
        document.getElementById("false-answer-p").classList.add("hidden");
    });

    document.getElementById("word-hint").addEventListener("click", function () {
        document.getElementById("input-word-answer").value = askingForKeys ? currentWordValue : currentWordKey;
    })

    document.getElementById("word-usage-modal-button").addEventListener("click", function () {
        document.getElementById("word-usage-modal-text").innerHTML = words[currentWordKey]["uses"];
    })

    document.getElementById("submitBtn").onclick = function () {
        const unSanitizedUserInput = document.getElementById("input-word-answer").value.trim();
        const userInput = unSanitizedUserInput.replace(/[<>&'"]/g, '');
        if ((askingForKeys && userInput === currentWordValue) || (!askingForKeys && userInput === currentWordKey)) {
            // If user input matches the translation
            // Change button color and clear input field
            document.getElementById("submitBtn").classList.remove("bg-red-500");
            document.getElementById("input-word-answer").value = "";

            // Go to the next word or toggle mode if finished
            if (currentIndex === wordKeys.length - 1) {
                // If finished all words, toggle mode
                askingForKeys = !askingForKeys;
                word_row++;
                if (word_row >= 2) {
                    random_word = true;
                }
                document.getElementById("times-repeated").textContent = "Tekrar Sayısı : " + word_row;

                if (word_row >= 4) {
                    document.getElementById("next_button").classList.remove("opacity-50", "cursor-not-allowed", "pointer-events-none");
                    document.getElementById("next_button").disabled = false;
                }
                currentIndex = 0;
            } else {
                // Go to the next word
                currentIndex++;
            }

            displayWord();
        } else {
            // If user input is incorrect
            // Change button color and card background to red, and show error message
            document.getElementById("submitBtn").classList.add("bg-red-500");
            document.getElementById("word-card").classList.add("bg-red-300");
            document.getElementById("false-answer-p").classList.remove("hidden");

            // You can add additional styling or effects here for incorrect input

            // Clear input field after submission
            document.getElementById("input-word-answer").value = "";
        }
    };
}

if (words) {
    displayWord();
}

document.getElementById('like_form').addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent form submission

    // Collect form data
    let formData = new FormData(this);

    // Send AJAX request
    fetch(this.action, {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': "{{ csrf_token() }}"
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text(); // Parse response body as text
        })
        .then(data => {
            // Handle response data as needed
            const responseObject = JSON.parse(data);
            console.log(responseObject);
        })
        .catch(error => {
            // Handle errors
            console.error('There was a problem with the fetch operation:', error);
        });
});

document.getElementById('next_form').addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent form submission

    // Collect form data
    let formData = new FormData(this);

    let formDataJSON = Object.fromEntries(formData.entries());

    // Send AJAX request
    fetch(this.action, {
        method: 'PATCH',
        body: JSON.stringify(formDataJSON),
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': "{{ csrf_token() }}"
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); // Parse response body as JSON
        })
        .then(data => {
            // Handle response data as needed
            // Redirect to the next topic URL
            window.location.href = data.redirect_link;
        })
        .catch(error => {
            // Handle errors
            console.error('There was a problem with the fetch operation:', error);
        });
});
