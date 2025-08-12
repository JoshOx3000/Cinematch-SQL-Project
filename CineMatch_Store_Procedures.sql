-- Cinematch Store Procedures

use CineMatch;

CREATE PROCEDURE GetTopRatedMovies
	@TopR INT
AS
BEGIN
	SELECT
	    TOP(@TopR) m.Title,
		AVG(r.RatingValue) AS AvgRating
	FROM Movies m
	JOIN Ratings r 
		ON m.MovieID = r.MovieID
	GROUP BY m.Title
	ORDER BY AvgRating DESC;
END;
;

-- Quality test- test store procedure with an example
EXEC GetTopRatedMovies @TopR = 5; -- Passed Test


-- Add a new rating

CREATE PROCEDURE AddMovieRating
	@UserID INT,
	@MovieID INT,
	@RatingValue INT,
	@ReviewText VARCHAR(MAX)
AS
BEGIN
	INSERT INTO Ratings(UserID, MovieID, RatingValue, ReviewText)
	VALUES
		(@UserID, @MovieID, @RatingValue, @ReviewText);
END
;

-- Quality check - test AddMovieRating Store Procedure for example
EXEC AddMovieRating @UserID = 1, @MovieID = 2, @RatingValue = 5, @ReviewText = 'Great Movie!';

SELECT *
FROM Ratings
; -- passed test 