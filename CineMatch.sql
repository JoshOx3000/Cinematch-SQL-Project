-- Creation of Database
CREATE DATABASE CineMatch;

Use cinematch;


-- Creation of Tables

-- Creation of Users Table
CREATE TABLE Users(
	UserID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email NVARCHAR(100) UNIQUE NOT NULL,
	DateJoined DATE NOT NULL DEFAULT GETDATE(),
	SubscriptionType VARCHAR(50) CHECK (SubscriptionType IN ('Basic', 'Standard', 'Premium')),
	Country VARCHAR(50)

);

-- Creation of Movies Table
CREATE TABLE Movies(
	MovieID INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(200) NOT NULL,
	ReleaseYear INT,
	DurationMinutes INT,
	Description VARCHAR(150),
	ContentType VARCHAR(20) CHECK(ContentType IN('Movies', 'Series'))
);

-- Creation of Actor Table
CREATE TABLE Actors(
	ActorID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Birthdate DATE
);


-- Creation of Movie_Actors(Many to Many)
CREATE TABLE Movie_Actors(
	MovieID INT,
	ActorID INT,
	RoleName VARCHAR(100),
	PRIMARY KEY (MovieID, ActorID),
	FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
	FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
);

-- Creation of Genre Table
CREATE TABLE Genres(
	GenreID INT IDENTITY(1,1) PRIMARY KEY,
	GenreName VARCHAR(50) UNIQUE NOT NULL
);

-- Creation of Movie_Genre Table
CREATE TABLE Movie_Genres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Creation of Watch_History Table
CREATE TABLE Watch_History (
    WatchID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    MovieID INT,
    WatchDateTime DATETIME DEFAULT GETDATE(),
    CompletionPercent DECIMAL(5,2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Creation of Ratings Table
CREATE TABLE Ratings (
    RatingID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    MovieID INT,
    RatingValue INT CHECK (RatingValue BETWEEN 1 AND 5),
    ReviewText NVARCHAR(MAX),
    ReviewDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Creation of Recommendations Table
CREATE TABLE Recommendations (
    RecommendationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Reason NVARCHAR(200),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);




-- Insert of Dummy Data

-- Insert of  Users Dummy Data
INSERT INTO Users (FirstName, LastName, Email, DateJoined, SubscriptionType, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '2024-01-15', 'Premium', 'USA'),
('Emma', 'Smith', 'emma.smith@example.com', '2024-02-10', 'Standard', 'UK'),
('Liam', 'Brown', 'liam.brown@example.com', '2024-03-05', 'Basic', 'Canada'),
('Sophia', 'Taylor', 'sophia.taylor@example.com', '2024-04-01', 'Premium', 'Australia'),
('Noah', 'Wilson', 'noah.wilson@example.com', '2024-04-15', 'Standard', 'USA');

-- Insert of Movies Dummy Data 
INSERT INTO Movies (Title, ReleaseYear, DurationMinutes, Description, ContentType)
VALUES
('The Great Heist', 2022, 120, 'A thrilling heist film.', 'Movies'),
('Space Beyond', 2023, 145, 'Sci-fi epic exploring deep space.', 'Movies'),
('Family Bonds', 2021, 95, 'Heartwarming family drama.', 'Movies'),
('Legends of Valor', 2020, 180, 'Fantasy adventure series.', 'Series'),
('Mystery Lane', 2023, 40, 'Crime-solving drama series.', 'Series');

-- Insert of Actors Dummy Data 
INSERT INTO Actors (FirstName, LastName, Birthdate)
VALUES
('Robert', 'Downey', '1965-04-04'),
('Scarlett', 'Johansson', '1984-11-22'),
('Chris', 'Evans', '1981-06-13'),
('Emma', 'Watson', '1990-04-15'),
('Tom', 'Holland', '1996-06-01');

-- Insert of Movie_Actors Dummy Data 
INSERT INTO Movie_Actors (MovieID, ActorID, RoleName)
VALUES
(1, 1, 'Mastermind'),
(1, 2, 'Accomplice'),
(2, 3, 'Commander'),
(2, 4, 'Scientist'),
(3, 5, 'Son'),
(4, 3, 'Hero'),
(4, 4, 'Mage'),
(5, 2, 'Detective');

-- Insert of Genre Dummy Data 
INSERT INTO Genres (GenreName)
VALUES
('Action'),
('Drama'),
('Comedy'),
('Sci-Fi'),
('Fantasy'),
('Crime');

-- Insert of Movie_Genres Dummy Data 
INSERT INTO Movie_Genres (MovieID, GenreID)
VALUES
(1, 1), -- Action
(1, 6), -- Crime
(2, 4), -- Sci-Fi
(3, 2), -- Drama
(4, 1), -- Action
(4, 5), -- Fantasy
(5, 6); -- Crime

-- Insert of Watch_History Dummy Data
INSERT INTO Watch_History (UserID, MovieID, WatchDateTime, CompletionPercent)
VALUES
(1, 1, '2024-05-01 20:15:00', 100.00),
(2, 2, '2024-05-03 19:30:00', 85.50),
(3, 3, '2024-05-05 21:00:00', 100.00),
(4, 4, '2024-05-07 18:45:00', 60.00),
(5, 5, '2024-05-09 22:10:00', 95.00);

-- Insert of Ratings Dummy Data 
INSERT INTO Ratings (UserID, MovieID, RatingValue, ReviewText, ReviewDate)
VALUES
(1, 1, 5, 'Amazing plot and acting!', '2024-05-02'),
(2, 2, 4, 'Great visuals but a bit long.', '2024-05-04'),
(3, 3, 3, 'Average, expected more.', '2024-05-06'),
(4, 4, 5, 'Loved the fantasy elements.', '2024-05-08'),
(5, 5, 4, 'Very engaging mystery.', '2024-05-10');

-- Insert of Recommendations Dummy Data 
INSERT INTO Recommendations (UserID, MovieID, Reason)
VALUES
(1, 2, 'Based on your love for sci-fi.'),
(2, 4, 'You enjoyed action-packed films.'),
(3, 5, 'You liked crime dramas.'),
(4, 1, 'You watched similar heist films.'),
(5, 3, 'You enjoyed heartfelt dramas.');


-- Quality check to ensure all data inserted properly

SELECT *
FROM Users
; -- data inserted properly

SELECT *
FROM Movies
;

SELECT *
FROM actors
;

SELECT *
FROM Movie_Actors
;

SELECT *
FROM Genres
;

SELECT *
FROM Movie_Genres
;

SELECT *
FROM Watch_History
;

SELECT *
FROM Ratings
;

SELECT *
FROM Recommendations

-- All table are filled properly- Passed Quality Check.