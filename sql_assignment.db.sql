BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "writers" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT,
	"address"	TEXT,
	"birth_date"	TEXT,
	"education_level"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "genres" (
	"id"	INTEGER NOT NULL,
	"name"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "books_genre" (
	"id"	INTEGER NOT NULL,
	"book_id"	INTEGER NOT NULL,
	"genre_id"	INTEGER NOT NULL,
	FOREIGN KEY("genre_id") REFERENCES "genres"("id"),
	FOREIGN KEY("book_id") REFERENCES "books"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "books" (
	"id"	INTEGER NOT NULL,
	"writer_id"	INTEGER NOT NULL,
	"name"	TEXT,
	"publish_date"	TEXT,
	"price"	REAL,
	"description"	TEXT,
	FOREIGN KEY("writer_id") REFERENCES "writers"("id"),
	PRIMARY KEY("id" AUTOINCREMENT),
	UNIQUE("id","writer_id","name")
);
COMMIT;
