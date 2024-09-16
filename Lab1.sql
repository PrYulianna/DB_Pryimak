--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-17 00:45:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16416)
-- Name: Grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Grades" (
    "ID" bigint NOT NULL,
    "Value" bigint NOT NULL,
    "StudentsID" bigint NOT NULL
);


ALTER TABLE public."Grades" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16411)
-- Name: Students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Students" (
    "ID" bigint NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Surname" character varying(30) NOT NULL,
    "Patronymic" character varying(30) NOT NULL
);


ALTER TABLE public."Students" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16426)
-- Name: Students-subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Students-subjects" (
    "StudentsID" bigint NOT NULL,
    "SubjectsID" bigint NOT NULL,
    "ID_connected" bigint NOT NULL
);


ALTER TABLE public."Students-subjects" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16434)
-- Name: Subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subjects" (
    "ID" bigint NOT NULL,
    "GradesID" bigint NOT NULL,
    "Name" character varying(30) NOT NULL
);


ALTER TABLE public."Subjects" OWNER TO postgres;

--
-- TOC entry 4649 (class 2606 OID 16420)
-- Name: Grades Grades_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grades"
    ADD CONSTRAINT "Grades_pk" PRIMARY KEY ("ID");


--
-- TOC entry 4651 (class 2606 OID 32774)
-- Name: Students-subjects ID_ss; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Students-subjects"
    ADD CONSTRAINT "ID_ss" PRIMARY KEY ("ID_connected");


--
-- TOC entry 4647 (class 2606 OID 16415)
-- Name: Students Students_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "Students_pk" PRIMARY KEY ("ID");


--
-- TOC entry 4653 (class 2606 OID 16438)
-- Name: Subjects Subjects_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subjects"
    ADD CONSTRAINT "Subjects_pk" PRIMARY KEY ("ID");


--
-- TOC entry 4657 (class 2606 OID 16439)
-- Name: Subjects Grades-Subjects_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subjects"
    ADD CONSTRAINT "Grades-Subjects_fk" FOREIGN KEY ("GradesID") REFERENCES public."Grades"("ID");


--
-- TOC entry 4655 (class 2606 OID 16429)
-- Name: Students-subjects Students-Subjects_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Students-subjects"
    ADD CONSTRAINT "Students-Subjects_fk" FOREIGN KEY ("StudentsID") REFERENCES public."Students"("ID");


--
-- TOC entry 4654 (class 2606 OID 16421)
-- Name: Grades Students-grades_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Grades"
    ADD CONSTRAINT "Students-grades_fk" FOREIGN KEY ("StudentsID") REFERENCES public."Students"("ID");


--
-- TOC entry 4656 (class 2606 OID 32768)
-- Name: Students-subjects Subjects-Students_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Students-subjects"
    ADD CONSTRAINT "Subjects-Students_fk" FOREIGN KEY ("SubjectsID") REFERENCES public."Subjects"("ID") NOT VALID;


-- Completed on 2024-09-17 00:45:30

--
-- PostgreSQL database dump complete
--

