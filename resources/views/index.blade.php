<x-general.layout>
    <div class="lg:mt-12 md:mt-10 mt-8"></div>
    <x-homepage.hero/>
    <div class="mt-20"></div>
    <x-homepage.feature_one/>
    <div class="mt-20"></div>
    <h1 class="block text-3xl font-bold text-gray-800 sm:text-4xl lg:text-6xl lg:leading-tight text-center"
        id="kurslarımız_title">
        Kurslarımız</h1>
    <div>
        <form method="GET" id="form-anchor" class="w-full flex items-center"
              action="{{ url()->current() }}#form-anchor">
            <div class="mx-auto">
                <input name="search" placeholder="Kurs Ara"
                       class="mt-5 mx-auto w-64 px-4 py-2 text-base border border-gray-300 rounded-lg focus:outline-none focus:border-blue-500"/>
                <div class="flex flex-col my-2 gap-2 sm:my-0 sm:gap-0 sm:inline-block">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Ara</button>
                    <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Sıfırla</button>
                </div>
            </div>
        </form>
    </div>
    <x-homepage.languages :courses="$courses"/>
    <div class="mx-12">
        {{ $courses->appends(['search' => request('search')])->fragment('form-anchor')->links() }}
    </div>
</x-general.layout>

<script>
    document.getElementById('reset-search').addEventListener('click', function () {
        document.getElementById('search-input').value = '';
        document.getElementById('search-form').submit();
    });
</script>
