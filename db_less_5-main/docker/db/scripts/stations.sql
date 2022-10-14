CREATE TABLE "City"
(
    "city_name" varchar PRIMARY KEY,
    "region"    varchar
);



CREATE TABLE "Station"
(
    "station_name" text PRIMARY KEY,
    "#tracks"      integer,
    "city_name"    text,
    "region"       text

);



CREATE TABLE "Train"
(
    "train_nr"      integer PRIMARY KEY,
    "length"        integer,
    "start_station" text,
    "end_station"   text
);



CREATE TABLE "Connected"
(
    "train_nr"      integer,
    "begin_station" varchar UNIQUE,
    "to_station"    varchar UNIQUE,
    "departure"     varchar,
    "arrival"       varchar
);



ALTER TABLE "Station"
    ADD FOREIGN KEY ("city_name") REFERENCES "City" ("city_name");

ALTER TABLE "Train"
    ADD FOREIGN KEY ("start_station") REFERENCES "Station" ("station_name");
ALTER TABLE "Train"
    ADD FOREIGN KEY ("end_station") REFERENCES "Station" ("station_name");

ALTER TABLE "Connected"
    ADD FOREIGN KEY ("train_nr") REFERENCES "Train" ("train_nr");
ALTER TABLE "Connected"
    ADD FOREIGN KEY ("begin_station") REFERENCES "Station" ("station_name");
ALTER TABLE "Connected"
    ADD FOREIGN KEY ("to_station") REFERENCES "Station" ("station_name");





