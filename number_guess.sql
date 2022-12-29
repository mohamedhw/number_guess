--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guesses integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games integer,
    user_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (8, 11, 7);
INSERT INTO public.games VALUES (9, 81, 8);
INSERT INTO public.games VALUES (10, 190, 8);
INSERT INTO public.games VALUES (11, 383, 9);
INSERT INTO public.games VALUES (12, 541, 9);
INSERT INTO public.games VALUES (13, 292, 8);
INSERT INTO public.games VALUES (14, 688, 8);
INSERT INTO public.games VALUES (15, 209, 8);
INSERT INTO public.games VALUES (16, 335, 10);
INSERT INTO public.games VALUES (17, 311, 10);
INSERT INTO public.games VALUES (18, 537, 11);
INSERT INTO public.games VALUES (19, 208, 11);
INSERT INTO public.games VALUES (20, 803, 10);
INSERT INTO public.games VALUES (21, 830, 10);
INSERT INTO public.games VALUES (22, 704, 10);
INSERT INTO public.games VALUES (23, 881, 12);
INSERT INTO public.games VALUES (24, 911, 12);
INSERT INTO public.games VALUES (25, 461, 13);
INSERT INTO public.games VALUES (26, 241, 13);
INSERT INTO public.games VALUES (27, 760, 12);
INSERT INTO public.games VALUES (28, 40, 12);
INSERT INTO public.games VALUES (29, 542, 12);
INSERT INTO public.games VALUES (30, 381, 14);
INSERT INTO public.games VALUES (31, 564, 14);
INSERT INTO public.games VALUES (32, 636, 15);
INSERT INTO public.games VALUES (33, 245, 15);
INSERT INTO public.games VALUES (34, 322, 14);
INSERT INTO public.games VALUES (35, 551, 14);
INSERT INTO public.games VALUES (36, 790, 14);
INSERT INTO public.games VALUES (37, 318, 16);
INSERT INTO public.games VALUES (38, 414, 16);
INSERT INTO public.games VALUES (39, 481, 17);
INSERT INTO public.games VALUES (40, 872, 17);
INSERT INTO public.games VALUES (41, 468, 16);
INSERT INTO public.games VALUES (42, 871, 16);
INSERT INTO public.games VALUES (43, 111, 16);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('mo', NULL, 7);
INSERT INTO public.users VALUES ('user_1672273459780', NULL, 8);
INSERT INTO public.users VALUES ('user_1672273459779', NULL, 9);
INSERT INTO public.users VALUES ('user_1672273594371', NULL, 10);
INSERT INTO public.users VALUES ('user_1672273594370', NULL, 11);
INSERT INTO public.users VALUES ('user_1672273639654', NULL, 12);
INSERT INTO public.users VALUES ('user_1672273639653', NULL, 13);
INSERT INTO public.users VALUES ('user_1672273709961', NULL, 14);
INSERT INTO public.users VALUES ('user_1672273709960', NULL, 15);
INSERT INTO public.users VALUES ('user_1672273743166', NULL, 16);
INSERT INTO public.users VALUES ('user_1672273743165', NULL, 17);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 43, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_number_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_number_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


