<x-general.layout>
    <div class="lg:mt-12 md:mt-10 mt-8"></div>
    <x-homepage.hero />
    <div class="mt-20"></div>
    <x-homepage.feature_one />
    <div class="mt-20"></div>
    <h1 class="block text-3xl font-bold text-gray-800 sm:text-4xl lg:text-6xl lg:leading-tight text-center" id="kurslarımız_title">
        Kurslarımız</h1>
    <x-homepage.languages :courses="$courses" />
</x-general.layout>
