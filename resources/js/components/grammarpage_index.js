let words_json = (document.getElementById('words') ? document.getElementById('words').value : null) || null;
let words = null;
let quiz_json = (document.getElementById('quiz') ? document.getElementById('quiz').value : null) || null;
let quiz_questions = null;
let quiz_index = 0
let current_question = null
let wrong_quiz_answer_number = 0;

function createItemElement(data, index) {
    const button = document.createElement('button');
    button.className = 'w-full my-4 flex flex-col text-gray-800 border shadow-sm rounded-xl hover:shadow-md transition dark:bg-slate-900 dark:border-gray-800';
    button.setAttribute('id', `multichoice_${index}`);
    button.setAttribute('value', `${data}`);
    button.setAttribute('href', '#');
    button.setAttribute('type', 'button');

    const innerHtml = `
                <div class="p-4 md:p-5">
                    <div class="flex justify-between items-center">
                        <div class="flex items-center">
                            <div class="ms-3">
                                <h3 class="font-semibold">${data}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            `;
    button.innerHTML = innerHtml;

    return button;
}


if (quiz_json) {
    function displayQuiz() {
        try {
            quiz_questions = JSON.parse(quiz_json);
            current_question = JSON.parse(quiz_questions[quiz_index].question)
        } catch (error) {
            quiz_questions = null;
            current_question = null;
        }

        if (quiz_index === quiz_questions?.length || !quiz_questions) {
            modal_container.classList.remove('hidden');
            quiz_modal_wrong_number.textContent = wrong_quiz_answer_number.toString();
            const next_form = document.getElementById("next_form");
            document.getElementById("quiz-modal-next-button").addEventListener("click",function(){
                next_form.dispatchEvent(new Event('submit'));
            })
            return;
        }
        let quiz_question_keys = current_question ? Object.keys(current_question) : null;
        document.getElementById('quiz_question').textContent = current_question["title"]
        const current_question_answer = current_question[current_question["correct_answer"]]
        let container = document.getElementById("button-container")
        container.innerHTML = ""
        for (let i = 0; i < quiz_question_keys.length - 2; i++) {
            const itemElement = createItemElement(current_question[quiz_question_keys[i]], i)
            itemElement.addEventListener('click', function () {
                let value = document.getElementById(`multichoice_${i}`).value
                if (current_question_answer === value) {
                    quiz_index++
                    document.getElementById(`multichoice_${i}`).classList.remove('text-gray-800')
                    document.getElementById(`multichoice_${i}`).classList.add('bg-green-500','text-white')
                    displayQuiz()
                } else {
                    wrong_quiz_answer_number++;
                    document.getElementById(`multichoice_${i}`).classList.remove('text-gray-800')
                    document.getElementById(`multichoice_${i}`).classList.add('bg-red-500','text-white')
                }
            });
            container.appendChild(itemElement)
        }
    }

    displayQuiz()
}


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
    let course_id = document.getElementById("course_id_like_form").value
    let topic_id = document.getElementById("topic_id_like_form").value
    let konu_anlatimi_id = document.getElementById("konu_anlatimi_id_like_form").value
    let csrfToken = document.getElementById("csrf_token_like_form").value

    // Send AJAX request
    fetch("/user/create/bookmark", {
        method: 'POST',
        body: JSON.stringify({
            course_id,
            topic_id,
            konu_anlatimi_id
        }),
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': csrfToken
        },
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text(); // Parse response body as text
        })
        .then(data => {
            // Handle response data as needed
            window.location.reload()
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
