# sql-exercises
This repository includes structured exercises using the Review and Music databases to practice various SQL concepts, including queries, joins, transactions, stored procedures, and advanced techniques.

## Music Database
### Simple SQL Queries
1. Retrieve all albums (Albums) by a specific artist (Artists).
2. Find all tracks (Tracks) longer than 5 minutes.
3. Get all albums released in 1995.
4. Retrieve a list of all genres (Genres) ordered alphabetically.

### SQL Queries for Joins
1. Create a report of all tracks and their corresponding album names.
2. Find the total duration of tracks grouped by album.
3. Retrieve all tracks with their artist name and album title.

### Aggregations and Advanced Queries
1. Find the top 5 longest tracks in the Tracks table.
2. Calculate the total duration of tracks for each genre.
3. Create a report of the number of albums each artist has released.
4. Find all artists who have not released an album.

### Transactions
1. Insert a new artist and album into the Artists and Albums tables, rolling back if an error occurs.
2. Update the name of an album and commit the changes only if successful.
3. Delete all tracks of a specific album and rollback in case of issues.

## Review Database
### SQL Queries for Joins
1. Create a report of all students and their total credits (JumlahSks) by joining the Mahasiswa and Sks tables
2. Retrieve the names of students and their credits for records where JumlahSks exceeds 15.
3. Find students and the cities they live in for students with credits between 10 and 20.

### SQL Queries for Aggregations
1. Calculate the average credits (JumlahSks) for all students.
2. Find the total credits per student (Nim) with a sum greater than 20.
3. Count the number of students in each city from the Mahasiswa table.

### Transactions
1. Insert a new student record into the Mahasiswa table and a related entry in the Sks table. Rollback if any error occurs.
2. Update the Nama of a student in the Mahasiswa table and commit the changes only if successful.
3. Delete records for a student and rollback in case of failure.

### Views
1. Create a view (vw_mahasiswa_sks) to display students along with their total credits (JumlahSks).
2. Query the view to find students with credits greater than 15.
3. Drop the view when no longer needed.
