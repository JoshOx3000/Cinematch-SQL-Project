-- Cinematch Views

-- Views -- Most Watched Movies By Country with Average Ratings
CREATE VIEW vw_MostWatchedMoviesByCountry
AS
SELECT
	u.Country,
	m.Title,
	COUNT(wh.watchid) AS TotalWatches,
	AVG(r.RatingValue) AS AvgRating
FROM Watch_History wh
JOIN Users u 
	ON wh.UserID = u.UserID
JOIN Movies m
	ON wh.MovieID = m.MovieID
LEFT JOIN Ratings r
	ON m.MovieID = r.MovieID
GROUP BY u.Country, m.Title
;

-- Quality check

SELECT *
FROM vw_MostWatchedMoviesByCountry
ORDER BY Country, TotalWatches DESC
;