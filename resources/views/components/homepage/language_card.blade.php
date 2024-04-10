@props(['background_image','title','excerpt','slug'])
<div class="h-52 bg-cover bg-center flex flex-col justify-center items-center rounded-t-xl"
     style="background-image: url('{{ $background_image }}')">
</div>
<div class="p-4 md:p-6">
              <span class="block mb-1 text-xs font-semibold uppercase text-blue-600">
                  Sıfırdan Zirveye
              </span>
    <h3 class="text-xl font-semibold text-gray-800">
        {{$title}}
    </h3>
    <p class="mt-3 text-gray-500">
        {!! $excerpt !!}
    </p>
</div>
<div class="mt-auto flex border-t border-gray-200 divide-x divide-gray-200">
    <a class="w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-medium rounded-es-xl bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none"
       href="/courses/languages/{{$slug}}">
        Kursa git
    </a>
</div>
