CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS musician (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS genre_musician (
	genre_id INTEGER REFERENCES genre(id),
	musician_id INTEGER REFERENCES musician(id),
	CONSTRAINT pk_genre_musician  PRIMARY KEY (genre_id, musician_id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS musician_album (
	musician_id INTEGER REFERENCES musician(id),
	album_id INTEGER REFERENCES album(id),
	CONSTRAINT pk_musician_album PRIMARY KEY (musician_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	name VARCHAR(60) NOT NULL,
	duration TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS track_collection (
	track_id INTEGER REFERENCES track(id),
	collection_id INTEGER REFERENCES collection(id),
	CONSTRAINT pk_track_collection PRIMARY KEY (track_id, collection_id)
);


