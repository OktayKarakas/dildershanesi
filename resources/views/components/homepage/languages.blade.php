<div class="max-w-[85rem] px-4 py-10 sm:px-6 lg:px-8 lg:py-14 mx-auto">
  <!-- Grid -->
  {{-- class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6" --}}
  <div>
      <!-- Card -->
      {{-- when activate col remove max-w and mx-auto --}}
      <div class="max-w-[800px] mx-auto group flex flex-col h-full bg-white border border-gray-200 shadow-sm rounded-xl">
          <div class="h-52 bg-cover bg-center flex flex-col justify-center items-center rounded-t-xl"
              style="background-image: url('{{ asset('images/united-kingdom-flag.jpg') }}');">
          </div>
          <div class="p-4 md:p-6">
              <span class="block mb-1 text-xs font-semibold uppercase text-blue-600">
                  Sıfırdan Zirveye
              </span>
              <h3 class="text-xl font-semibold text-gray-800">
                  İngilizce
              </h3>
              <p class="mt-3 text-gray-500">
                  İngilizce grammer ve kelimelerini sıfırdan zirveye kadar öğren.Özellikle <strong>YDT</strong> ve
                  <strong>YÖKDİL</strong> sınavlarına uygun hazırlanmış müfredatla ingilizcenin hakimi ol.
              </p>
          </div>
          <div class="mt-auto flex border-t border-gray-200 divide-x divide-gray-200">
              <a class="w-full py-3 px-4 inline-flex justify-center items-center gap-x-2 text-sm font-medium rounded-es-xl bg-white text-gray-800 shadow-sm hover:bg-gray-50 disabled:opacity-50 disabled:pointer-events-none"
                  href="/courses/languages/english">
                  Kursa git
              </a>
          </div>
      </div>
      <!-- End Card -->
  </div>
  <!-- End Grid -->
</div>
