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
    galaxy_id SERIAL NOT NULL,
    name character varying NOT NULL,
    galaxy_type numeric,
    black_hole_in_the_middle boolean,
    radius int,
    UNIQUE (name)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id SERIAL NOT NULL,
    galaxy_id integer NOT Null,
    name character varying NOT NULL,
    star_type text,
    age integer,
    UNIQUE (name)
);

ALTER TABLE public.star OWNER TO freecodecamp;

CREATE TABLE public.planet (
    planet_id SERIAL NOT Null,
    star_id integer NOT Null,
    name character varying NOT NULL,
    planet_type text,
    is_vita BOOLEAN,
    mass integer,
    UNIQUE (name)
);

ALTER TABLE public.planet OWNER TO freecodecamp;

CREATE TABLE public.moon (
    moon_id SERIAL NOT Null,
    planet_id integer NOT Null,
    name character varying NOT NULL,
    moon_type text,
    mass integer,
    UNIQUE (name)
);

ALTER TABLE public.moon OWNER TO freecodecamp;

CREATE TABLE public.satellite_station (
    satellite_station_id SERIAL NOT Null,
    planet_id integer NOT Null,
    name character varying NOT NULL,
    satellite_station_type text,
    number_of_crew_members integer,
    UNIQUE (name)
);

ALTER TABLE public.satellite_station OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: satellite_station satellite_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_station
    ADD CONSTRAINT satellite_station_pkey PRIMARY KEY (satellite_station_id);

--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--
-- Name: satellite_station satellite_station_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite_station
    ADD CONSTRAINT satellite_station_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


INSERT INTO public.galaxy (name, galaxy_type, black_hole_in_the_middle, radius) VALUES
    ('Milky way', 1, TRUE, 123),
    ('Coffee road', 3, FALSE, 2345),
    ('Tea bag', 2, FALSE, 5783),
    ('Matcha cup', 1, TRUE, 14223),
    ('Yogurt pack', 3, FALSE, 24223),
    ('Juice glass', 2, FALSE, 5783443);

INSERT INTO public.star (name, star_type, age, galaxy_id) VALUES
    ('Sun', 1, 23, 1),
    ('AlfaCentaurus', 3, 2345, 1),
    ('Marius', 2, 5349, 4),
    ('Aldebaraan', 1, 423, 1),
    ('Yogius', 3, 2425, 2),
    ('Skywalkerus', 2, 578344, 3);

INSERT INTO public.planet (name, planet_type, is_vita, mass, star_id) VALUES
    ('Earth', 1, TRUE, 123, 1),
    ('Mars', 3, FALSE, 2345, 1),
    ('Venera', 2, FALSE, 5783, 1),
    ('Tatooin', 1, TRUE, 14223, 5),
    ('Nemira', 3, FALSE, 24223, 1),
    ('Jupyter', 2, FALSE, 5783443, 1),
    ('Uranus', 1, TRUE, 123, 1),
    ('Dune', 3, FALSE, 2345, 6),
    ('Plerius', 2, FALSE, 5783, 5),
    ('Fremius', 1, TRUE, 14223, 6),
    ('Saturn', 3, FALSE, 24223, 1),
    ('Pogius', 2, FALSE, 5783443, 5);

INSERT INTO public.moon (name, moon_type, mass, planet_id) VALUES
    ('Moon', 1, 123, 1),
    ('Uranus_2', 3, 2345, 1),
    ('Porius_2', 2, 5783, 1),
    ('Jupyter_3', 1, 14223, 5),
    ('Pogius', 3, 24223, 1),
    ('Regius', 2, 5783443, 1),
    ('Detrius', 1, 123, 1),
    ('Farius', 3, 2345, 6),
    ('Grechius', 2, 5783, 5),
    ('Prometheus', 1, 14223, 6),
    ('Normanis', 3, 24223, 1),
    ('Poferius_2', 2, 5783, 1),
    ('Jupyteter_3', 1, 14223, 5),
    ('Poregius', 3, 24223, 1),
    ('Regegius', 2, 5783443, 1),
    ('Detarius', 1, 123, 1),
    ('Fakorius', 3, 2345, 6),
    ('Grerechius', 2, 5783, 5),
    ('Protheus', 1, 14223, 6),
    ('Vadederis', 2, 5783443, 5);

INSERT INTO public.satellite_station (name, satellite_station_type, number_of_crew_members, planet_id) VALUES
    ('Mir', 1, 4, 1),
    ('MKS', 1, 6, 1),
    ('DeathStar', 2, 5783, 4);
--
-- PostgreSQL database dump complete
--

