--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: gamedata; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gamedata (
    game_id integer NOT NULL,
    username character varying(22) NOT NULL,
    gameresult integer NOT NULL
);


ALTER TABLE public.gamedata OWNER TO freecodecamp;

--
-- Name: gamedata_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.gamedata_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gamedata_game_id_seq OWNER TO freecodecamp;

--
-- Name: gamedata_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.gamedata_game_id_seq OWNED BY public.gamedata.game_id;


--
-- Name: gamedata game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamedata ALTER COLUMN game_id SET DEFAULT nextval('public.gamedata_game_id_seq'::regclass);


--
-- Data for Name: gamedata; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gamedata VALUES (1, 'user_1729556754499', 310);
INSERT INTO public.gamedata VALUES (2, 'user_1729556754499', 669);
INSERT INTO public.gamedata VALUES (3, 'user_1729556754498', 606);
INSERT INTO public.gamedata VALUES (4, 'user_1729556754498', 782);
INSERT INTO public.gamedata VALUES (5, 'user_1729556754499', 9);
INSERT INTO public.gamedata VALUES (6, 'user_1729556754499', 244);
INSERT INTO public.gamedata VALUES (7, 'user_1729556754499', 904);


--
-- Name: gamedata_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.gamedata_game_id_seq', 7, true);


--
-- Name: gamedata gamedata_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamedata
    ADD CONSTRAINT gamedata_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

