@import com.example.MovieProjectApp.Movie
@param Movie movie

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Деталі фільму</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .movie-details {
            border: 1px solid #ccc;
            padding: 20px;
            max-width: 400px;
            margin-top: 20px;
        }
        .movie-details p {
            margin: 5px 0;
        }
        .back-link {
            display: block;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>Деталі фільму</h1>

@if(movie != null)
    <div class="movie-details">
        <p><strong>Назва:</strong> ${movie.getTitle()}</p>
        <p><strong>Жанр:</strong> ${movie.getGenre()}</p>
        <p><strong>Рік:</strong> ${movie.getYear()}</p>
    </div>
@else
    <p>Фільм не знайдено або не вказано достатньо параметрів.</p>
@endif

<a href="/" class="back-link">Повернутися до списку фільмів</a>
</body>
</html>