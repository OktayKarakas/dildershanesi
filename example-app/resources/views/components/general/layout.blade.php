<!DOCTYPE html>
<html lang="en">

<head>
    <html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @vite('resources/css/app.css')
    @vite('resources/js/app.js')
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<script>
    document.documentElement.classList.remove('dark')
</script>
<x-general.navbar />
<body class="pt-[70px]">
    {{ $slot }}
</body>
<footer class="mt-10">
    <x-general.footer />
</footer>




</html>
