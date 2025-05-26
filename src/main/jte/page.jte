@import com.example.MovieProjectApp.Movie
@import java.util.List

@param List<Movie> movies
@param String highlightGenre
@param boolean currentYear = false);
<head>
    <meta charset="UTF-8">
    <title>Список фільмів</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #999;
            padding: 8px 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .highlight {
            background-color: #ffffcc;
            font-weight: bold;
        }
        .no-movies {
            color: gray;
            font-style: italic;
        }
        .footer {
            margin-top: 30px;
            font-size: 0.9em;
            color: #555;
        }
        .info-box {
            border: 1px solid #ccc;
            padding: 15px;
            background-color: #f9f9f9;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h1>Список фільмів</h1>

@if(movies.isEmpty())
    <p class="no-movies">На жаль, фільмів для відображення немає.</p>
@else
    <p>Знайдено ${movies.size()} фільмів. Жанр "${highlightGenre}" виділено.</p>
    <table>
        <thead>
        <tr>
            <th>Назва</th>
            <th>Жанр</th>
            <th>Рік</th>
        </tr>
        </thead>
        <tbody>
        @for(Movie movie : movies)
            <tr class="${movie.getGenre().equals(highlightGenre) ? "highlight" : ""}">
                <td>${movie.getTitle()}</td>
                <td>${movie.getGenre()}</td>
                <td>${movie.getYear()}</td>
            </tr>
        @endfor
        </tbody>
    </table>
@endif

---

<h2>Демонстрація виклику шаблонів</h2>

@template.MovieCard(
movieTitle = "The Green Mile",
movieGenre = "Drama",
movieYear = 1999
)

@template.MovieCard(
movieTitle = "Spider-Man: Into the Spider-Verse",
movieGenre = "Animation"
)

---

<h2>Демонстрація Varargs</h2>

<h3>Улюблені жанри:</h3>
<ul>
    @template.genreList("Action", "Drama", "Sci-Fi", "Comedy")
</ul>

---

<h2>Демонстрація Content</h2>

<div class="info-box">
    <h3>Інформаційний блок:</h3>
    <p>Це <strong>додатковий контент</strong>, який передається в шаблон.</p>
    <p>Він може містити будь-який HTML або текст.</p>
</div>

---

<h2>Демонстрація Variables</h2>

@! var currentYear = java.time.Year.now().getValue();
<p class="footer">
    &copy; ${currentYear} Проект фільмів.
</p>

</body>