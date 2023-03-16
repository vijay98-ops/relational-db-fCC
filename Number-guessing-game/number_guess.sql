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
    user_id integer NOT NULL,
    guess integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3);
INSERT INTO public.games VALUES (1, 2);
INSERT INTO public.games VALUES (1, 6);
INSERT INTO public.games VALUES (2, 9);
INSERT INTO public.games VALUES (3, 111);
INSERT INTO public.games VALUES (3, 538);
INSERT INTO public.games VALUES (4, 545);
INSERT INTO public.games VALUES (4, 501);
INSERT INTO public.games VALUES (3, 985);
INSERT INTO public.games VALUES (3, 819);
INSERT INTO public.games VALUES (3, 483);
INSERT INTO public.games VALUES (5, 408);
INSERT INTO public.games VALUES (5, 333);
INSERT INTO public.games VALUES (6, 940);
INSERT INTO public.games VALUES (6, 853);
INSERT INTO public.games VALUES (5, 993);
INSERT INTO public.games VALUES (5, 551);
INSERT INTO public.games VALUES (5, 697);
INSERT INTO public.games VALUES (7, 11);
INSERT INTO public.games VALUES (8, 942);
INSERT INTO public.games VALUES (8, 196);
INSERT INTO public.games VALUES (9, 556);
INSERT INTO public.games VALUES (9, 512);
INSERT INTO public.games VALUES (8, 478);
INSERT INTO public.games VALUES (8, 962);
INSERT INTO public.games VALUES (8, 117);
INSERT INTO public.games VALUES (10, 410);
INSERT INTO public.games VALUES (10, 953);
INSERT INTO public.games VALUES (11, 51);
INSERT INTO public.games VALUES (11, 475);
INSERT INTO public.games VALUES (10, 890);
INSERT INTO public.games VALUES (10, 450);
INSERT INTO public.games VALUES (10, 345);
INSERT INTO public.games VALUES (7, 14);
INSERT INTO public.games VALUES (12, 318);
INSERT INTO public.games VALUES (12, 967);
INSERT INTO public.games VALUES (13, 478);
INSERT INTO public.games VALUES (13, 542);
INSERT INTO public.games VALUES (12, 559);
INSERT INTO public.games VALUES (12, 637);
INSERT INTO public.games VALUES (12, 392);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'bijay');
INSERT INTO public.users VALUES (2, 'binay');
INSERT INTO public.users VALUES (3, 'user_1678958169684');
INSERT INTO public.users VALUES (4, 'user_1678958169683');
INSERT INTO public.users VALUES (5, 'user_1678958241362');
INSERT INTO public.users VALUES (6, 'user_1678958241361');
INSERT INTO public.users VALUES (7, 'bibek');
INSERT INTO public.users VALUES (8, 'user_1678960131252');
INSERT INTO public.users VALUES (9, 'user_1678960131251');
INSERT INTO public.users VALUES (10, 'user_1678960213895');
INSERT INTO public.users VALUES (11, 'user_1678960213894');
INSERT INTO public.users VALUES (12, 'user_1678961308754');
INSERT INTO public.users VALUES (13, 'user_1678961308753');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 13, true);


--
-- PostgreSQL database dump complete
--

