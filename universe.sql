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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type numeric,
    black_hole_in_the_middle boolean,
    radius integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    moon_type text,
    mass integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying NOT NULL,
    planet_type text,
    is_vita boolean,
    mass integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite_station (
    satellite_station_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    satellite_station_type text,
    number_of_crew_members integer
);


ALTER TABLE public.satellite_station OWNER TO freecodecamp;

--
-- Name: satellite_station_satellite_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_station_satellite_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_station_satellite_station_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_station_satellite_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_station_satellite_station_id_seq OWNED BY public.satellite_station.satellite_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    star_type text,
    age integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite_station satellite_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_station ALTER COLUMN satellite_station_id SET DEFAULT nextval('public.satellite_station_satellite_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 1, true, 123);
INSERT INTO public.galaxy VALUES (2, 'Coffee road', 3, false, 2345);
INSERT INTO public.galaxy VALUES (3, 'Tea bag', 2, false, 5783);
INSERT INTO public.galaxy VALUES (4, 'Matcha cup', 1, true, 14223);
INSERT INTO public.galaxy VALUES (5, 'Yogurt pack', 3, false, 24223);
INSERT INTO public.galaxy VALUES (6, 'Juice glass', 2, false, 5783443);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', '1', 123);
INSERT INTO public.moon VALUES (2, 1, 'Uranus_2', '3', 2345);
INSERT INTO public.moon VALUES (3, 1, 'Porius_2', '2', 5783);
INSERT INTO public.moon VALUES (4, 5, 'Jupyter_3', '1', 14223);
INSERT INTO public.moon VALUES (5, 1, 'Pogius', '3', 24223);
INSERT INTO public.moon VALUES (6, 1, 'Regius', '2', 5783443);
INSERT INTO public.moon VALUES (7, 1, 'Detrius', '1', 123);
INSERT INTO public.moon VALUES (8, 6, 'Farius', '3', 2345);
INSERT INTO public.moon VALUES (9, 5, 'Grechius', '2', 5783);
INSERT INTO public.moon VALUES (10, 6, 'Prometheus', '1', 14223);
INSERT INTO public.moon VALUES (11, 1, 'Normanis', '3', 24223);
INSERT INTO public.moon VALUES (12, 1, 'Poferius_2', '2', 5783);
INSERT INTO public.moon VALUES (13, 5, 'Jupyteter_3', '1', 14223);
INSERT INTO public.moon VALUES (14, 1, 'Poregius', '3', 24223);
INSERT INTO public.moon VALUES (15, 1, 'Regegius', '2', 5783443);
INSERT INTO public.moon VALUES (16, 1, 'Detarius', '1', 123);
INSERT INTO public.moon VALUES (17, 6, 'Fakorius', '3', 2345);
INSERT INTO public.moon VALUES (18, 5, 'Grerechius', '2', 5783);
INSERT INTO public.moon VALUES (19, 6, 'Protheus', '1', 14223);
INSERT INTO public.moon VALUES (20, 5, 'Vadederis', '2', 5783443);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', '1', true, 123);
INSERT INTO public.planet VALUES (2, 1, 'Mars', '3', false, 2345);
INSERT INTO public.planet VALUES (3, 1, 'Venera', '2', false, 5783);
INSERT INTO public.planet VALUES (4, 5, 'Tatooin', '1', true, 14223);
INSERT INTO public.planet VALUES (5, 1, 'Nemira', '3', false, 24223);
INSERT INTO public.planet VALUES (6, 1, 'Jupyter', '2', false, 5783443);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', '1', true, 123);
INSERT INTO public.planet VALUES (8, 6, 'Dune', '3', false, 2345);
INSERT INTO public.planet VALUES (9, 5, 'Plerius', '2', false, 5783);
INSERT INTO public.planet VALUES (10, 6, 'Fremius', '1', true, 14223);
INSERT INTO public.planet VALUES (11, 1, 'Saturn', '3', false, 24223);
INSERT INTO public.planet VALUES (12, 5, 'Pogius', '2', false, 5783443);


--
-- Data for Name: satellite_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite_station VALUES (1, 1, 'Mir', '1', 4);
INSERT INTO public.satellite_station VALUES (2, 1, 'MKS', '1', 6);
INSERT INTO public.satellite_station VALUES (3, 4, 'DeathStar', '2', 5783);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', '1', 23);
INSERT INTO public.star VALUES (2, 1, 'AlfaCentaurus', '3', 2345);
INSERT INTO public.star VALUES (3, 4, 'Marius', '2', 5349);
INSERT INTO public.star VALUES (4, 1, 'Aldebaraan', '1', 423);
INSERT INTO public.star VALUES (5, 2, 'Yogius', '3', 2425);
INSERT INTO public.star VALUES (6, 3, 'Skywalkerus', '2', 578344);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_station_satellite_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_station_satellite_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite_station satellite_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_station
    ADD CONSTRAINT satellite_station_name_key UNIQUE (name);


--
-- Name: satellite_station satellite_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_station
    ADD CONSTRAINT satellite_station_pkey PRIMARY KEY (satellite_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite_station satellite_station_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_station
    ADD CONSTRAINT satellite_station_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

