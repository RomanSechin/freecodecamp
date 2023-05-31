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
    name character varying(30),
    diameter_parsec integer NOT NULL,
    distance_from_earth integer NOT NULL,
    objects_count integer NOT NULL,
    closest_galaxy_id integer NOT NULL,
    description text
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
-- Name: junction_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction_table (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    junction_table_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.junction_table OWNER TO freecodecamp;

--
-- Name: junction_table_junction_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.junction_table_junction_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.junction_table_junction_table_id_seq OWNER TO freecodecamp;

--
-- Name: junction_table_junction_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.junction_table_junction_table_id_seq OWNED BY public.junction_table.junction_table_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    diameter_in_km integer NOT NULL,
    distance_to_planet_km integer NOT NULL,
    color character varying(30),
    has_life boolean,
    planet_id integer NOT NULL
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
    name character varying(30),
    diameter_in_km integer NOT NULL,
    distance_to_star_km integer NOT NULL,
    moon_count integer NOT NULL,
    star_id integer NOT NULL,
    color character varying(20),
    has_life boolean
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    diameter_in_km integer NOT NULL,
    distance_to_glx_center_parsec integer NOT NULL,
    planets_count numeric,
    galaxy_id integer
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
-- Name: junction_table junction_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table ALTER COLUMN junction_table_id SET DEFAULT nextval('public.junction_table_junction_table_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy_01', 23, 52353, 23423452, 2, 'Test galaxy number one');
INSERT INTO public.galaxy VALUES (2, 'galaxy_02', 43, 56353, 23423999, 1, 'Test galaxy number two');
INSERT INTO public.galaxy VALUES (3, 'galaxy_03', 143, 56433, 23453999, 4, 'Test galaxy number three');
INSERT INTO public.galaxy VALUES (4, 'galaxy_04', 543, 543356433, 98345399, 3, 'Test galaxy number four');
INSERT INTO public.galaxy VALUES (5, 'galaxy_05', 843, 111356433, 1838172369, 4, 'Test galaxy number five');
INSERT INTO public.galaxy VALUES (6, 'galaxy_06', 943, 222356433, 2138172369, 5, 'Test galaxy number six');


--
-- Data for Name: junction_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction_table VALUES (1, 1, 1, 2, 2, 'jun_01');
INSERT INTO public.junction_table VALUES (1, 2, 1, 3, 3, 'jun_01');
INSERT INTO public.junction_table VALUES (2, 2, 1, 6, 4, 'jun_01');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'moon_01', 123, 42342123, 'Yellow', false, 1);
INSERT INTO public.moon VALUES (3, 'moon_02', 223, 65742123, 'Green', false, 1);
INSERT INTO public.moon VALUES (4, 'moon_03', 323, 62345123, 'Cyan', false, 2);
INSERT INTO public.moon VALUES (5, 'moon_04', 212, 5325123, 'Yello', false, 2);
INSERT INTO public.moon VALUES (6, 'moon_05', 512, 9878273, 'Yellow', false, 3);
INSERT INTO public.moon VALUES (7, 'moon_06', 212, 98348273, 'Yellow', false, 3);
INSERT INTO public.moon VALUES (8, 'moon_07', 212, 98348273, 'Yellow', false, 3);
INSERT INTO public.moon VALUES (9, 'moon_08', 212, 98348273, 'Yellow', false, 4);
INSERT INTO public.moon VALUES (10, 'moon_08', 212, 98348273, 'Yellow', false, 4);
INSERT INTO public.moon VALUES (11, 'moon_09', 212, 98348273, 'Yellow', false, 1);
INSERT INTO public.moon VALUES (12, 'moon_10', 212, 348273, 'Yellow', false, 2);
INSERT INTO public.moon VALUES (13, 'moon_11', 212, 348273, 'Yellow', false, 2);
INSERT INTO public.moon VALUES (14, 'moon_12', 22, 3473, 'Yellow', false, 3);
INSERT INTO public.moon VALUES (15, 'moon_13', 22, 3473, 'Yellow', false, 4);
INSERT INTO public.moon VALUES (16, 'moon_14', 22, 3473, 'Yellow', false, 5);
INSERT INTO public.moon VALUES (17, 'moon_15', 22, 3473, 'Yellow', false, 5);
INSERT INTO public.moon VALUES (18, 'moon_16', 22, 3473, 'Yellow', false, 1);
INSERT INTO public.moon VALUES (19, 'moon_17', 22, 3473, 'Yellow', false, 1);
INSERT INTO public.moon VALUES (20, 'moon_18', 22, 3473, 'Yellow', false, 2);
INSERT INTO public.moon VALUES (21, 'moon_19', 22, 3473, 'Yellow', false, 3);
INSERT INTO public.moon VALUES (22, 'moon_20', 22, 3473, 'Yellow', false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Planet_01', 12345, 234253452, 2, 1, 'Red', false);
INSERT INTO public.planet VALUES (3, 'Planet_02', 72345, 298743452, 5, 2, 'Green', false);
INSERT INTO public.planet VALUES (4, 'Planet_03', 74345, 29986852, 1, 3, 'White', true);
INSERT INTO public.planet VALUES (5, 'Planet_04', 4345, 53986852, 67, 4, 'Blue', false);
INSERT INTO public.planet VALUES (1, 'Planet_00', 11111, 299999992, 1, 3, 'White', true);
INSERT INTO public.planet VALUES (6, 'Planet_05', 4345, 53986852, 67, 5, 'Blue', false);
INSERT INTO public.planet VALUES (7, 'Planet_06', 4345, 53986852, 67, 4, 'Blue', false);
INSERT INTO public.planet VALUES (8, 'Planet_07', 4345, 53986852, 67, 5, 'Blue', false);
INSERT INTO public.planet VALUES (9, 'Planet_08', 435, 53986852, 67, 2, 'Blue', false);
INSERT INTO public.planet VALUES (10, 'Planet_09', 1435, 53986852, 67, 3, 'Blue', false);
INSERT INTO public.planet VALUES (11, 'Planet_10', 1435, 53986852, 67, 4, 'Blue', false);
INSERT INTO public.planet VALUES (12, 'Planet_11', 1435, 53986852, 67, 3, 'Blue', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Star_01', 12345, 23, 78, 1);
INSERT INTO public.star VALUES (3, 'Star_02', 22345, 13, 178, 1);
INSERT INTO public.star VALUES (4, 'Star_03', 32345, 43, 17, 1);
INSERT INTO public.star VALUES (1, 'Star_03', 32345, 43, 17, 1);
INSERT INTO public.star VALUES (5, 'Star_04', 2345, 143, 7, 1);
INSERT INTO public.star VALUES (6, 'Star_05', 235, 13, 7, 2);
INSERT INTO public.star VALUES (7, 'Star_06', 25, 1, 7, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: junction_table_junction_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junction_table_junction_table_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junction_table junction_table_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_id_unique UNIQUE (junction_table_id);


--
-- Name: junction_table junction_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_pkey PRIMARY KEY (junction_table_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: junction_table junction_table_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: junction_table junction_table_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: junction_table junction_table_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: junction_table junction_table_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey2; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey2 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

