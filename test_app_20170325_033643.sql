--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: test_app; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test_app WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE test_app OWNER TO postgres;

\connect test_app

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE data (
    id integer NOT NULL,
    text text,
    "order" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE data OWNER TO postgres;

--
-- Name: untitled_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE untitled_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE untitled_table_id_seq OWNER TO postgres;

--
-- Name: untitled_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE untitled_table_id_seq OWNED BY data.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data ALTER COLUMN id SET DEFAULT nextval('untitled_table_id_seq'::regclass);


--
-- Name: data_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_table_pkey PRIMARY KEY (id);


--
-- Name: order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "order" ON data USING btree ("order");


--
-- Name: public; Type: ACL; Schema: -; Owner: duwaynevandort
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM duwaynevandort;
GRANT ALL ON SCHEMA public TO duwaynevandort;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

