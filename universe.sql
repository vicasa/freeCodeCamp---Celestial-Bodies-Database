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
-- Name: distance_unit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance_unit (
    distance_unit_id integer NOT NULL,
    symbol character varying NOT NULL,
    name character varying
);


ALTER TABLE public.distance_unit OWNER TO freecodecamp;

--
-- Name: distance_unit_distance_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_unit_distance_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_unit_distance_unit_id_seq OWNER TO freecodecamp;

--
-- Name: distance_unit_distance_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_unit_distance_unit_id_seq OWNED BY public.distance_unit.distance_unit_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_earth_in_ly integer,
    diametar_in_ly integer,
    is_spiral boolean
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
-- Name: mass_unit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mass_unit (
    mass_unit_id integer NOT NULL,
    symbol character varying NOT NULL,
    name character varying
);


ALTER TABLE public.mass_unit OWNER TO freecodecamp;

--
-- Name: mass_unit_mass_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mass_unit_mass_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mass_unit_mass_unit_id_seq OWNER TO freecodecamp;

--
-- Name: mass_unit_mass_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mass_unit_mass_unit_id_seq OWNED BY public.mass_unit.mass_unit_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    radius_rel_earth numeric(5,3),
    distance_from_planet_in_km integer
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
    name character varying NOT NULL,
    planet_type_id integer,
    star_id integer,
    has_ring boolean,
    distance_from_star_in_au numeric(5,2),
    mass_number numeric(6,2),
    mass_unit_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric(7,2),
    temperature_in_k integer,
    distance_unit_id integer
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
-- Name: distance_unit distance_unit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_unit ALTER COLUMN distance_unit_id SET DEFAULT nextval('public.distance_unit_distance_unit_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mass_unit mass_unit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mass_unit ALTER COLUMN mass_unit_id SET DEFAULT nextval('public.mass_unit_mass_unit_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: distance_unit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distance_unit VALUES (2, 'ly', 'light years');
INSERT INTO public.distance_unit VALUES (1, 'AU', 'astronomical unit');
INSERT INTO public.distance_unit VALUES (3, 'km', 'kilometar');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26000, 87400, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2500000, 152000, true);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, ' Backward Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', NULL, NULL, NULL);


--
-- Data for Name: mass_unit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mass_unit VALUES (1, 'Jupiter', NULL);
INSERT INTO public.mass_unit VALUES (2, 'Sun', NULL);
INSERT INTO public.mass_unit VALUES (3, 'Earth', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 5, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 5, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Phoebe', 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Calypso', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Cordelia', 7, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Ophelia', 7, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Triton', 8, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4, 1, false, 0.40, 0.06, 3);
INSERT INTO public.planet VALUES (2, 'Venus', 4, 1, false, 0.70, 0.81, 3);
INSERT INTO public.planet VALUES (3, 'Earth', 4, 1, false, 1.00, 1.00, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 1, true, 5.20, 318.00, 3);
INSERT INTO public.planet VALUES (5, 'Mars', 4, 1, false, 1.50, 0.11, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1, true, 9.50, 95.16, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 1, true, 19.20, 14.50, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 1, true, 30.00, 17.15, 3);
INSERT INTO public.planet VALUES (9, '11 Ursae Minoris b', 1, 2, NULL, 1.50, 14.74, 1);
INSERT INTO public.planet VALUES (10, '55 Cancri e', 3, 3, NULL, 0.02, 7.99, 3);
INSERT INTO public.planet VALUES (11, '14 Andromedae e', 1, 4, NULL, 0.83, 4.80, 1);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 e', 4, 5, NULL, 0.03, 0.69, 3);
INSERT INTO public.planet VALUES (13, 'OGLE-2005-BLG-390L b', 2, 6, NULL, 2.60, 5.50, 3);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Gas giants', 'Gas giants are planets the size of Saturn or Jupiter, the largest planet in our solar system, or much, much larger. ');
INSERT INTO public.planet_type VALUES (2, 'Neptunian planets', 'Neptunian planets are similar in size to Neptune or Uranus in our solar system. They likely have a mixture of interior compositions, but all will have hydrogen and helium-dominated outer atmospheres and rocky cores.');
INSERT INTO public.planet_type VALUES (3, 'Super-Earths', 'Super-Earths are typically terrestrial planets that may or may not have atmospheres. They are more massive than Earth, but lighter than Neptune.');
INSERT INTO public.planet_type VALUES (4, 'Terrestrial planets', 'Terrestrial planets are Earth sized and smaller, composed of rock, silicate, water or carbon.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, 5500, 1);
INSERT INTO public.star VALUES (2, '11 Ursae Minoris', 1, 400.00, NULL, 2);
INSERT INTO public.star VALUES (3, '55 Cancri', 1, 41.00, NULL, 2);
INSERT INTO public.star VALUES (4, '14 Andromedae', 1, 246.00, NULL, 2);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1 e', 1, 41.00, NULL, 2);
INSERT INTO public.star VALUES (6, 'OGLE-2005-BLG-390L', 1, 21526.00, NULL, 2);


--
-- Name: distance_unit_distance_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_unit_distance_unit_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mass_unit_mass_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mass_unit_mass_unit_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: distance_unit distance_unit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_unit
    ADD CONSTRAINT distance_unit_name_key UNIQUE (name);


--
-- Name: distance_unit distance_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_unit
    ADD CONSTRAINT distance_unit_pkey PRIMARY KEY (distance_unit_id);


--
-- Name: distance_unit distance_unit_symbol_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance_unit
    ADD CONSTRAINT distance_unit_symbol_key UNIQUE (symbol);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mass_unit mass_unit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mass_unit
    ADD CONSTRAINT mass_unit_name_key UNIQUE (name);


--
-- Name: mass_unit mass_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mass_unit
    ADD CONSTRAINT mass_unit_pkey PRIMARY KEY (mass_unit_id);


--
-- Name: mass_unit mass_unit_symbol_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mass_unit
    ADD CONSTRAINT mass_unit_symbol_key UNIQUE (symbol);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unoque; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unoque UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_mass_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_mass_unit_id_fkey FOREIGN KEY (mass_unit_id) REFERENCES public.mass_unit(mass_unit_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_distance_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_unit_id_fkey FOREIGN KEY (distance_unit_id) REFERENCES public.distance_unit(distance_unit_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


