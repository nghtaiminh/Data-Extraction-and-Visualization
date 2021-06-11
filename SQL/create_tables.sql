DROP TABLE IF EXISTS PlayedSongs;
DROP TABLE IF EXISTS Time;
DROP TABLE IF EXISTS Artists;
DROP TABLE IF EXISTS AudioFeatures;
DROP TABLE IF EXISTS Songs;

-- CREATE TABLES
-- Create Songs Table (Demension Table)
CREATE TABLE Songs (
	song_id TEXT PRIMARY KEY,
	song_name TEXT NOT NULL,
	artist_id TEXT NOT NULL,
	album_id TEXT NOT NULL,
	duration_ms INTEGER NOT NULL,
	popularity SMALLINT,
	external_urls TEXT 
);

-- Create Artists Table (Demension Table)
CREATE TABLE Artists (
	artist_id TEXT PRIMARY KEY,
	artist_name TEXT NOT NULL,
	followers INTEGER,
	popularity SMALLINT,
	external_urls TEXT
);

-- Create Time Table (Demension Table)
CREATE TABLE Time (
	start_time TIMESTAMP PRIMARY KEY,
	time TEXT NOT NULL,
	day SMALLINT NOT NULL,
	month SMALLINT NOT NULL,
	year SMALLINT NOT NULL,
	weekday SMALLINT NOT NULL
);

-- Create AudioFeatures Table (Demension Table)
CREATE TABLE AudioFeatures (
	song_id TEXT PRIMARY KEY,
	dancibility NUMERIC(4, 3) NOT NULL,
	energy NUMERIC(7, 3) NOT NULL,
	loudness NUMERIC(7, 3) NOT NULL,
	speechiness NUMERIC(7, 3) NOT NULL,
	acousticness NUMERIC(7, 3) NOT NULL,
	instrulmentalness NUMERIC(7, 3) NOT NULL,
	liveness NUMERIC(7, 3) NOT NULL,
	valance NUMERIC(7, 3) NOT NULL,
	tempo NUMERIC(7, 3) NOT NULL,
	FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

-- Create PlayedSong Table (Fact Table)
CREATE TABLE PlayedSongs (
	played_song_id TEXT PRIMARY KEY,
	song_id TEXT NOT NULL,
	song_name TEXT NOT NULL,
	artist_id TEXT NOT NULL,
	played_at TIMESTAMP NOT NULL,
	FOREIGN KEY (song_id) REFERENCES Songs(song_id),
	FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
	FOREIGN KEY (played_at) REFERENCES Time(start_time)
);
