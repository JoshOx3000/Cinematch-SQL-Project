-- Indexes to speed up queries on frequently searched field and join columns

-- Index for look up email
CREATE NONCLUSTERED INDEX IX_User_Email 
ON Users(Email)
;

-- Index for finding movies by title
CREATE NONCLUSTERED INDEX IX_Movie_Title
ON Movies(Title)
;

-- Index to speed up joins between Watch_History and User/Movies
CREATE NONCLUSTERED INDEX IX_WatchHistory_UserID_MovieID
ON Watch_History(UserID, MovieID)
;

-- Index for rating look up based on MovieID
CREATE NONCLUSTERED INDEX IX_Ratings_MovieID
ON Ratings(MovieID)
;

-- Index for genre searche(s)
CREATE NONCLUSTERED INDEX IX_MovieGenres_GenreID
ON Movie_Genres(GenreID)
;




