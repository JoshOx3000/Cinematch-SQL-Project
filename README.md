# Cinematch-SQL-Project
Database for a fictional streaming service that stores movies, series, actors, ratings, user watch history, and recommendations.


# 🎬 CineMatch SQL Database Project

CineMatch is a **movie recommendation and analytics database** built in **T-SQL**.  
It simulates a streaming service backend where users watch, rate, and receive recommendations for movies and series.  
The project demonstrates **database design, optimization, automation, and reporting** using **views, stored procedures, triggers, and indexes**.

---

## 📂 Project Structure

The repository is organized into separate SQL scripts for clarity:

| File Name | Description |
|-----------|-------------|
| `cinematch.sql` | Creates the database schema and populates it with dummy data |
| `cinematch_views.sql` | Contains SQL views for reporting and analytics |
| `cinematch_triggers.sql` | Automates actions such as recommendations and prevents duplicate watch entries |
| `cinematch_stored_procedures.sql` | Provides reusable stored procedures for operations like top-rated movies and adding ratings |

---

## 🛠 Features

### **Database Schema**
- **Users** – User profiles, subscription details, and countries  
- **Movies** – Titles, release years, durations, and type (Movie/Series)  
- **Actors** – Actor profiles and birthdates  
- **Genres** – Movie genres and many-to-many relationships  
- **Watch History** – Records of user watch activity and completion percentages  
- **Ratings** – User ratings and reviews  
- **Recommendations** – Suggested movies based on user preferences  

### **Automation**
- **Trigger: Auto Recommend After Rating** – Suggests similar genre movies after a user rates one  
- **Trigger: Prevent Duplicate Watch History** – Avoids inserting duplicate watch records  

### **Analytics & Reporting**
- **View: Most Watched Movies by Country with Average Ratings** – Tracks popularity and quality across countries  

### **Procedures**
- `GetTopRatedMovies` – Returns the top N highest-rated movies  
- `AddMovieRating` – Simplifies adding new ratings  

---

## 🗄 ERD (Entity-Relationship Diagram)

![CineMatch ERD](A_2D_Entity-Relationship_Diagram_(ERD)_depicts_the.png)

---

## 🚀 Getting Started

### 1️⃣ Setup Database
```sql
-- Run in SQL Server Management Studio (SSMS) or Azure Data Studio
:r .\cinematch.sql

