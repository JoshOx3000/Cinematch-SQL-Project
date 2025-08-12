-- CineMatch Triggers

-- Trigger used to Auto Recommend Similar Genre After rating
--  it will automatically generates a recommendation for them.
CREATE TRIGGER trg_AutoRecommend
ON Ratings
AFTER  INSERT 
AS
BEGIN
	INSERT INTO Recommendations(UserID, MovieID, Reason)
	SELECT
		i.UserID,
		mg.MovieID,
		'Recommend this movie because you like a movie in this genre'
	FROM inserted i
	JOIN Movie_Genres mg
		ON i.MovieID =mg.MovieID
	WHERE mg.MovieID <> i.MovieID
	AND NOT EXISTS(
		SELECT 1
		FROM Recommendations r
	    WHERE r.UserID = i.UserID
		AND r.MovieID = mg.MovieID
	);

END;

-- Trigger to prevent Duplicate Watch HIstory
CREATE TRIGGER trg_PreventDuplicateWatch
ON Watch_History
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO Watch_History (UserID, MovieID, WatchDateTime, CompletionPercent)
	SELECT
		i.UserID,
		i.MovieID,
		i.WatchDateTime,
		i.CompletionPercent
	FROM inserted i
	WHERE NOT EXISTS(
		SELECT 1
		FROM Watch_History wh
		WHERE wh.UserID = i.UserID AND wh.MovieID = i.MovieID
	);
END;