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
    name character varying(255) NOT NULL,
    description text,
    is_spiral boolean NOT NULL,
    number_of_stars integer NOT NULL,
    discovered_by character varying(255)
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius numeric NOT NULL,
    has_water boolean NOT NULL,
    discovered_year integer
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
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    diameter integer NOT NULL,
    has_life boolean NOT NULL,
    atmosphere_composition text
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    capacity integer NOT NULL,
    is_active boolean NOT NULL,
    purpose text
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer NOT NULL,
    mass numeric NOT NULL,
    is_visible boolean NOT NULL,
    color character varying(30),
    star_id integer NOT NULL,
    name character varying(60)
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
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 1000000000, 'Ancient Astronomers');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', true, 1200000000, 'Edwin Hubble');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Known for its shape', true, 800000000, 'Pierre Méchain');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting galaxy', true, 500000000, 'Charles Messier');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Smaller spiral galaxy', true, 400000000, 'Unknown');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring galaxy', false, 100000000, 'Unknown');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 'Moon', 1, 1737.4, true, -4000);
INSERT INTO public.moon VALUES (42, 'Phobos', 2, 11.1, false, 1877);
INSERT INTO public.moon VALUES (43, 'Deimos', 2, 6.2, false, 1877);
INSERT INTO public.moon VALUES (44, 'Europa', 3, 1560.8, true, 1610);
INSERT INTO public.moon VALUES (45, 'Ganymede', 3, 2634.1, true, 1610);
INSERT INTO public.moon VALUES (46, 'Callisto', 3, 2410.3, true, 1610);
INSERT INTO public.moon VALUES (47, 'Proxima Moon 1', 4, 1000, false, 2030);
INSERT INTO public.moon VALUES (48, 'Betelgeuse I-A', 5, 2000, false, 2025);
INSERT INTO public.moon VALUES (49, 'Betelgeuse II-A', 6, 1500, false, 2025);
INSERT INTO public.moon VALUES (50, 'Rigel A-A', 7, 1800, false, 2030);
INSERT INTO public.moon VALUES (51, 'Rigel B-A', 8, 1700, false, 2030);
INSERT INTO public.moon VALUES (52, 'Polaris I-A', 9, 1200, false, 2028);
INSERT INTO public.moon VALUES (53, 'Polaris II-A', 10, 1300, false, 2028);
INSERT INTO public.moon VALUES (54, 'Vega I-A', 11, 1400, false, 2032);
INSERT INTO public.moon VALUES (55, 'Vega II-A', 12, 1500, false, 2032);
INSERT INTO public.moon VALUES (56, 'Europa Moon 1', 4, 800, false, 2040);
INSERT INTO public.moon VALUES (57, 'Ganymede Moon 1', 5, 600, true, 2042);
INSERT INTO public.moon VALUES (58, 'Callisto Moon 1', 6, 700, true, 2045);
INSERT INTO public.moon VALUES (59, 'Jupiter Moon X', 3, 1500, true, 2047);
INSERT INTO public.moon VALUES (60, 'Mars Moon X', 2, 500, false, 2048);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, 12742, true, 'Nitrogen, Oxygen');
INSERT INTO public.planet VALUES ('Mars', 2, 1, 6779, false, 'Carbon Dioxide');
INSERT INTO public.planet VALUES ('Jupiter', 3, 1, 139820, false, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES ('Proxima b', 4, 2, 12000, false, 'Unknown');
INSERT INTO public.planet VALUES ('Betelgeuse I', 5, 3, 15000, false, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES ('Betelgeuse II', 6, 3, 18000, false, 'Carbon Dioxide');
INSERT INTO public.planet VALUES ('Rigel A', 7, 4, 20000, false, 'Hydrogen');
INSERT INTO public.planet VALUES ('Rigel B', 8, 4, 25000, false, 'Helium');
INSERT INTO public.planet VALUES ('Polaris I', 9, 5, 30000, false, 'Methane');
INSERT INTO public.planet VALUES ('Polaris II', 10, 5, 35000, false, 'Ammonia');
INSERT INTO public.planet VALUES ('Vega I', 11, 6, 40000, false, 'Hydrogen, Helium');
INSERT INTO public.planet VALUES ('Vega II', 12, 6, 45000, false, 'Unknown');


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'ISS', 1, 6, true, 'Research and observation');
INSERT INTO public.space_station VALUES (2, 'Mars Base Alpha', 2, 50, true, 'Exploration and colonization');
INSERT INTO public.space_station VALUES (3, 'Europa Research Outpost', 4, 20, true, 'Ice and water analysis');
INSERT INTO public.space_station VALUES (4, 'Ganymede Colony', 5, 100, false, 'Abandoned habitat');
INSERT INTO public.space_station VALUES (5, 'Callisto Mining Facility', 6, 80, true, 'Mining resources');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 12742, true, 'Nitrogen, Oxygen', 1, 'Earth');
INSERT INTO public.star VALUES (1, 6779, false, 'Carbon Dioxide', 2, 'Mars');
INSERT INTO public.star VALUES (1, 139820, false, 'Hydrogen, Helium', 3, 'Jupiter');
INSERT INTO public.star VALUES (2, 12000, false, 'Unknown', 4, 'Proxima b');
INSERT INTO public.star VALUES (3, 15000, false, 'Hydrogen, Helium', 5, 'Betelgeuse I');
INSERT INTO public.star VALUES (3, 18000, false, 'Carbon Dioxide', 6, 'Betelgeuse II');
INSERT INTO public.star VALUES (4, 20000, false, 'Hydrogen', 7, 'Rigel A');
INSERT INTO public.star VALUES (4, 25000, false, 'Helium', 8, 'Rigel B');
INSERT INTO public.star VALUES (5, 30000, false, 'Methane', 9, 'Polaris I');
INSERT INTO public.star VALUES (5, 35000, false, 'Ammonia', 10, 'Polaris II');
INSERT INTO public.star VALUES (6, 40000, false, 'Hydrogen, Helium', 11, 'Vega I');
INSERT INTO public.star VALUES (6, 45000, false, 'Unknown', 12, 'Vega II');
INSERT INTO public.star VALUES (1, 1989000000000000000000000000000, true, 'Yellow', 13, 'Sun');
INSERT INTO public.star VALUES (1, 4018000000000000000000000000000, true, 'Blue-White', 14, 'Sirius');
INSERT INTO public.star VALUES (2, 36000000000000000000000000000000, true, 'Red', 15, 'Betelgeuse');
INSERT INTO public.star VALUES (2, 21000000000000000000000000000000, true, 'Blue', 16, 'Rigel');
INSERT INTO public.star VALUES (3, 6000000000000000000000000000000, true, 'Yellow', 17, 'Polaris');
INSERT INTO public.star VALUES (4, 2100000000000000000000000000000, true, 'Blue-White', 18, 'Vega');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_station_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


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
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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
-- Name: space_station space_station_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

