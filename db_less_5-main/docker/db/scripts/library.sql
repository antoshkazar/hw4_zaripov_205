CREATE TABLE "Reader"
(
    "reader_id"  integer PRIMARY KEY ,
    "name"       text,
    "surname"    text,
    "birth_date" date,
    address      text
);



CREATE TABLE "Copy.of.book"
(
    "copy_id"  integer,
    "ISBN"     integer,
    "position" integer,
    PRIMARY KEY ("copy_id", "ISBN")
);



CREATE TABLE "Category"
(
    "category_name" text PRIMARY KEY,
    "parent_name"   text
);



CREATE TABLE "Book"
(
    "ISBN"   integer PRIMARY KEY,
    "year"   integer,
    "name"   varchar(255),
    "pages"  integer,
    "author" varchar(255)
);



CREATE TABLE "Publisher"
(
    "publisher_name" text PRIMARY KEY,
    address          text
);



CREATE TABLE "Takes"
(
    "reader_id"   integer,
    "copy_id"     integer,
    "ISBN"        integer,
    "return_date" date,
    PRIMARY KEY ("reader_id", "ISBN", "copy_id")
);

ALTER TABLE "Book"
    ADD COLUMN "publishing_company" text;
ALTER TABLE "Book"
    ADD FOREIGN KEY ("publishing_company") REFERENCES "Publisher" ("publisher_name");

ALTER TABLE "Copy.of.book"
    ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Category"
    ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "Takes"
    ADD CONSTRAINT "Takes_fk0" FOREIGN KEY ("copy_id", "ISBN") REFERENCES "Copy.of.book" ("copy_id", "ISBN");
ALTER TABLE "Takes"
    ADD CONSTRAINT "Takes_fk3" FOREIGN KEY ("reader_id") REFERENCES "Reader" ("reader_id");









