-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Sat Dec 14 16:20:25 2013
-- 
;
--
-- Table: timers.
--
CREATE TABLE "timers" (
  "id" serial NOT NULL,
  "name" character varying(25),
  "duration_minutes" integer NOT NULL,
  "date_started" timestamp NOT NULL,
  "date_completed" timestamp,
  PRIMARY KEY ("id")
);

;
