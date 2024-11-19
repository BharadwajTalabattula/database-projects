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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age integer,
    gravity integer,
    distance_from_earth numeric(3,1),
    description text,
    is_rotating boolean
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age integer,
    mass integer,
    diameter numeric(5,1),
    description text,
    is_galaxy boolean
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
    name character varying(40) NOT NULL,
    age integer,
    mass integer,
    diameter numeric(3,1),
    description text,
    is_sphericale boolean,
    planet_id integer
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
    name character varying(40) NOT NULL,
    age integer,
    mass integer,
    diameter numeric(5,1),
    description text,
    has_life boolean,
    star_id integer
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
    name character varying(40) NOT NULL,
    age integer,
    mass integer,
    diameter numeric(5,1),
    description text,
    has_life boolean,
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A*', 13000, 340000000, 26.0, 'A supermassive black hole at the center of the Milky Way galaxy.', true);
INSERT INTO public.blackhole VALUES (2, 'M87*', 7000, 550000000, 53.5, 'The black hole in the center of the Messier 87 galaxy, first one ever imaged.', true);
INSERT INTO public.blackhole VALUES (3, 'Cygnus X-1', 6000, 300000, 6.1, 'One of the strongest X-ray sources observed from Earth, part of a binary system.', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13510, 1500000000, 105.7, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 1230000000, 220.0, 'Nearest spiral galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 13720, 580000000, 60.0, 'Third-largest galaxy', true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 13250, 240000000, 980.0, 'A giant elliptical galaxy', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 12390, 800000000, 49.0, 'Large central bulge galaxy', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 13310, 160000000, 60.0, 'A face-on spiral galaxy', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 7348, 3.5, 'Earth’s only natural satellite, commonly known as the Moon.', true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4600, 107, 0.0, 'One of Mars’ moons, heavily cratered and irregularly shaped.', false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4600, 10, 0.0, 'The smaller and more distant moon of Mars.', false, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4600, 148190, 5.3, 'The largest moon in the Solar System, orbiting Jupiter.', true, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 4600, 107593, 4.8, 'A heavily cratered moon of Jupiter, second largest.', true, 3);
INSERT INTO public.moon VALUES (6, 'Io', 4600, 89320, 3.6, 'The most volcanically active body in the Solar System, orbiting Jupiter.', true, 3);
INSERT INTO public.moon VALUES (7, 'Europa', 4600, 48000, 3.1, 'A smooth, icy moon of Jupiter, possibly harboring a subsurface ocean.', true, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 4600, 134552, 5.2, 'Saturn’s largest moon, with a thick atmosphere and liquid methane lakes.', true, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4600, 1080, 0.5, 'An icy moon of Saturn, famous for its water geysers.', true, 4);
INSERT INTO public.moon VALUES (10, 'Mimas', 4600, 374, 0.4, 'A small moon of Saturn, known for its large crater.', true, 4);
INSERT INTO public.moon VALUES (11, 'Triton', 4600, 21400, 2.7, 'The largest moon of Neptune, with retrograde orbit.', true, 5);
INSERT INTO public.moon VALUES (12, 'Charon', 4600, 1580, 1.2, 'The largest moon of Pluto, part of a binary system with Pluto.', true, 6);
INSERT INTO public.moon VALUES (13, 'Oberon', 4600, 3015, 1.5, 'The second-largest moon of Uranus, heavily cratered.', true, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 4600, 3200, 1.6, 'The largest moon of Uranus, with deep fault canyons.', true, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 4600, 660, 0.5, 'A small Uranian moon, with a jumbled surface of ridges and valleys.', true, 7);
INSERT INTO public.moon VALUES (16, 'Proteus', 4500, 500, 0.4, 'A small moon of Neptune, irregularly shaped.', false, 5);
INSERT INTO public.moon VALUES (17, 'Nereid', 4500, 320, 0.3, 'A distant and eccentric moon of Neptune.', false, 5);
INSERT INTO public.moon VALUES (18, 'Phoebe', 4500, 830, 0.2, 'An irregular, retrograde moon of Saturn.', false, 4);
INSERT INTO public.moon VALUES (19, 'Hyperion', 4500, 560, 0.3, 'A sponge-like, irregular moon of Saturn.', false, 4);
INSERT INTO public.moon VALUES (20, 'Rhea', 4600, 2300, 1.5, 'The second-largest moon of Saturn, with a thin atmosphere.', true, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 5972, 12.7, 'planet with life', true, 6);
INSERT INTO public.planet VALUES (2, 'Mars', 4600, 641, 6.8, 'Red planet', false, 6);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4600, 1898000, 142.9, 'The largest planet', false, 6);
INSERT INTO public.planet VALUES (4, 'Saturn', 4600, 59568300, 120.5, 'A gas giant', false, 6);
INSERT INTO public.planet VALUES (5, 'Proxima b', 4500, 1200, 1.1, 'A potentially habitable planet', false, 1);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 4600, 1500, 1.2, 'A rocky planet', false, 5);
INSERT INTO public.planet VALUES (7, 'Kepler-452b', 6000, 5000, 15.5, 'Located in the habitable zone of its star', false, 2);
INSERT INTO public.planet VALUES (8, 'HD 189733b', 3000, 20000, 14.3, 'A blue color planet', false, 2);
INSERT INTO public.planet VALUES (9, 'Betelgeuse I', 1000, 150000, 100.2, 'planet orbiting around the star Betelgeuse', false, 3);
INSERT INTO public.planet VALUES (10, 'Betelgeuse II', 1000, 200000, 95.6, 'A planet in Betelgeuse system', false, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 8000, 700, 0.9, 'A Earth sized planet', false, 4);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-if', 8000, 1000, 1.0, 'A planet near to TRAPPIST-1 star', false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima', 4500, 123, 0.2, 'The closest star', false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 242, 202000, 1.7, 'The brightest star', false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000, 17000000, 887.0, 'The red supergiant star', false, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 800, 21000000, 78.9, 'The blue supergiant star', false, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 4600, 1100000, 1.2, 'Part of the closest star system', false, 1);
INSERT INTO public.star VALUES (6, 'Sun', 4600, 1989000, 1.4, 'star in our solar system', true, 1);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

