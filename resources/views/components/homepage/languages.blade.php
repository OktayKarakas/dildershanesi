<div class="max-w-[85rem] px-4 py-10 sm:px-6 lg:px-8 lg:py-14 mx-auto">
  <!-- Grid -->
  {{-- class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6" --}}
  <div>
      <!-- Card -->
      {{-- when activate col remove max-w and mx-auto --}}
      <div class="max-w-[800px] mx-auto group flex flex-col h-full bg-white border border-gray-200 shadow-sm rounded-xl">
         <x-homepage.language_card :background_image="asset('images/united-kingdom-flag.jpg')"
                                   :title="'İngilizce'"
                                   :excerpt="'İngilizce grammer ve kelimelerini sıfırdan zirveye kadar öğren.Özellikle <strong>YDT</strong> ve
        <strong>YÖKDİL</strong> sınavlarına uygun hazırlanmış müfredatla ingilizcenin hakimi ol.'"
                                   :slug="'english'"
         />
      </div>
      <!-- End Card -->
  </div>
  <!-- End Grid -->
</div>
