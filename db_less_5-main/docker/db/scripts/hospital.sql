CREATE TABLE "StationPersonell"
(
    "persnr"        integer PRIMARY KEY,
    "Total(Name)" integer,
    "WorksOn"     integer,
    "StatNr"      integer UNIQUE
);



CREATE TABLE "Station"
(
    "StatNr" integer PRIMARY KEY,
    "Name"   text
);



CREATE TABLE "CareGiver"
(
    "Qualification" varchar(255),
    "CareNr"        integer PRIMARY KEY
);



CREATE TABLE "Doctor"
(
    "Area"   varchar(255),
    "Rank"   varchar(255),
    "PersNr" integer PRIMARY KEY
);



CREATE TABLE "Room"
(
    "RoomNr" integer PRIMARY KEY,
    "#beds"  integer,
    "StatNr" integer UNIQUE
);



CREATE TABLE "Patient"
(
    "PatientNr"  integer PRIMARY KEY,
    "Name"       varchar(255),
    "Disease"    varchar(255),
    "RoomRented" integer UNIQUE,
    "AdmisTo"    varchar(255),
    "AdmisFrom"  varchar(255),
    "DocNr"      integer UNIQUE
);



ALTER TABLE "StationPersonell"
    ADD CONSTRAINT "StationPersonell_fk0" FOREIGN KEY ("WorksOn") REFERENCES "Station" ("StatNr");

ALTER TABLE "CareGiver"
    ADD FOREIGN KEY ("CareNr") REFERENCES "StationPersonell" ("persnr");

ALTER TABLE "Doctor"
    ADD CONSTRAINT "Doctor_fk0" FOREIGN KEY ("PersNr") REFERENCES "StationPersonell" ("persnr");

ALTER TABLE "Room"
    ADD CONSTRAINT "Room_fk0" FOREIGN KEY ("StatNr") REFERENCES "Station" ("StatNr");

ALTER TABLE "Patient"
    ADD CONSTRAINT "Patient_fk0" FOREIGN KEY ("RoomRented") REFERENCES "Room" ("RoomNr");







