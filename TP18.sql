-- TP Uniones y Funciones de Agregacion

-- Micro desafío - Paso 1:

SELECT series.title AS titulo,genres.name AS genero FROM movies_db.series
INNER JOIN movies_db.genres ON series.genre_id = genres.id;

-- 2
SELECT episodes.title AS titulo,actors.first_name AS "nombre del actor",actors.last_name AS "apellido del actor" FROM movies_db.actor_episode
INNER JOIN movies_db.actors ON actor_episode.actor_id = actors.id
INNER JOIN movies_db.episodes ON actor_episode.episode_id = episodes.id;


-- Microdesafio - Paso 2
SELECT DISTINCT actors.first_name AS "nombre del actor", actors.last_name AS "apellido del actor" FROM movies_db.actor_movie
INNER JOIN movies_db.movies ON movies.id = actor_movie.movie_id
INNER JOIN movies_db.actors ON actors.id = actor_movie.actor_id
WHERE movies.title LIKE 'La Guerra de las galaxias%';


-- Microdesafio - Paso 3
SELECT movies.title, COALESCE(genres.name, 'no tiene genero') AS genre FROM movies_db.movies
LEFT JOIN movies_db.genres ON movies.genre_id = genres.id;


-- Microdesafio - Paso 4
SELECT title AS Título,(to_days(end_date) - to_days(release_date)) AS Duracion FROM movies_db.series;


-- Microdesafio - Paso 5
-- 1
SELECT * FROM movies_db.actors
WHERE LENGTH(first_name) > 6
ORDER BY first_name;

-- 2
SELECT COUNT(id) AS 'Cantidad de episodios' FROM movies_db.episodes;

-- 3
SELECT series.title,COUNT(seasons.serie_id) FROM movies_db.seasons
INNER JOIN movies_db.series ON series.id = seasons.serie_id
GROUP BY seasons.serie_id;

-- 4
SELECT genres.name,COUNT(movies.genre_id) FROM movies_db.movies
INNER JOIN movies_db.genres ON genres.id = movies.genre_id
GROUP BY movies.genre_id
HAVING COUNT(movies.genre_id) >= 3;
