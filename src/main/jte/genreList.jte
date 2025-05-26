@param String... genres

{{-- Виводимо кожен жанр як елемент списку --}}
@for(String genre : genres)
    <li>${genre}</li>
@endfor