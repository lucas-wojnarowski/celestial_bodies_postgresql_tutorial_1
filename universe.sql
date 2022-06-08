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
    name character varying(50),
    description text,
    number_of_stars_in_millions integer,
    diameter_in_light_years integer NOT NULL,
    age_in_millions_of_years numeric(6,1),
    is_spiral boolean,
    has_confirmed_life boolean
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
    name character varying(50) NOT NULL,
    orbital_period_in_days double precision,
    planet_id integer,
    mass_in_earths double precision
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
    name character varying(50) NOT NULL,
    orbital_period_in_days integer,
    star_id integer,
    mass_in_earths double precision
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    by_mass boolean
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_jt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types_jt (
    planet_id integer,
    planet_types_id integer,
    planet_types_jt_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.planet_types_jt OWNER TO freecodecamp;

--
-- Name: planet_types_jt_planet_types_jt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_jt_planet_types_jt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_jt_planet_types_jt_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_jt_planet_types_jt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_jt_planet_types_jt_id_seq OWNED BY public.planet_types_jt.planet_types_jt_id;


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    description text,
    age_in_millions_of_years numeric(6,1),
    temperature_in_kelvins integer NOT NULL,
    rotation_in_days integer,
    is_a_red_dwarf boolean,
    has_discovered_exoplanets boolean,
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: planet_types_jt planet_types_jt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types_jt ALTER COLUMN planet_types_jt_id SET DEFAULT nextval('public.planet_types_jt_planet_types_jt_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'barred spiral galaxy with diameter of about 220,000 ly approximately 2.5 million light-years (770 kiloparsecs) from Earth and the nearest large galaxy to the Milky Way.', 1000000, 220000, 10010.0, true, false);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The Milky Way[a] is the galaxy that includes our Solar System', 400000, 185000, 13610.0, true, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'The Large Magellanic Cloud (LMC), or Nubecula Major is a satellite galaxy of the Milky Way.', 30000, 14000, 1101.0, false, false);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'The Black Eye Galaxy (also called Sleeping Beauty Galaxy or Evil Eye Galaxy and designated Messier 64, M64, or NGC 4826) is a relatively isolated[7] spiral galaxy 17 million light-years away in the mildly northern constellation of Coma Berenices.', 100000, 52962, 13280.0, true, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'The Small Magellanic Cloud (SMC), or Nubecula Minor, is a dwarf galaxy near the Milky Way.', 3000, 7000, 65000.0, false, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'The Sombrero Galaxy (also known as Messier Object 104, M104 or NGC 4594) is a peculiar galaxy of unclear classification[5] in the constellation borders of Virgo and Corvus, being about 9.55 megaparsecs (31.1 million light-years)[2] from our galaxy, within the local supercluster.', 100000, 50000, 13520.0, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 0.318, 4, 1.784);
INSERT INTO public.moon VALUES (1, 'Moon', 28, 3, 0.0123);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.262, 4, 0.247);
INSERT INTO public.moon VALUES (4, 'Europa', 3.551, 5, 0.008);
INSERT INTO public.moon VALUES (5, 'Ganymede', 7.154, 5, 0.025);
INSERT INTO public.moon VALUES (6, 'Io', 1.769, 5, 0.015);
INSERT INTO public.moon VALUES (7, 'Callisto', 16.689, 5, 0.018);
INSERT INTO public.moon VALUES (8, 'Carme', 693.17, 5, 1.5997e-08);
INSERT INTO public.moon VALUES (9, 'Amalthea', 0.498, 5, 1.1998e-06);
INSERT INTO public.moon VALUES (10, 'Adrastea', 0.298, 5, 3.1961e-09);
INSERT INTO public.moon VALUES (11, 'Thebe', 0.674, 5, 1.3002e-07);
INSERT INTO public.moon VALUES (12, 'Dia', 287, 5, 0.012);
INSERT INTO public.moon VALUES (13, 'Himalia', 248, 5, 1.5997e-06);
INSERT INTO public.moon VALUES (14, 'Elara', 258.65, 5, 1.4567984e-10);
INSERT INTO public.moon VALUES (15, 'Ananke', 623.59, 5, 5.0189834e-12);
INSERT INTO public.moon VALUES (16, 'Callirrhoe', 787.43, 5, 1.4555052e-13);
INSERT INTO public.moon VALUES (17, 'Titania', 8.706, 6, 0.000569);
INSERT INTO public.moon VALUES (18, 'Miranda', 1.413479, 6, 1.071667e-05);
INSERT INTO public.moon VALUES (19, 'Oberon', 13.463234, 6, 0.00051507032);
INSERT INTO public.moon VALUES (20, 'Umbriel', 4.144, 6, 0.00021349631);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 88, 1, 0.055);
INSERT INTO public.planet VALUES (2, 'Venus', 225, 1, 0.815);
INSERT INTO public.planet VALUES (3, 'Earth', 365, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 687, 1, 0.107);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4380, 1, 317.8);
INSERT INTO public.planet VALUES (6, 'Saturn', 10585, 1, 95.16);
INSERT INTO public.planet VALUES (7, 'Uranus', 30660, 1, 14.54);
INSERT INTO public.planet VALUES (8, 'Neptune', 60225, 1, 17.15);
INSERT INTO public.planet VALUES (9, 'Andromedae B', 185, 2, 1525.44);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 11, 3, 1.173);
INSERT INTO public.planet VALUES (11, 'Gilese 832 c', 36, 4, 5.4);
INSERT INTO public.planet VALUES (12, 'Tau Celi e', 162, 6, 3.93);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Gas Giant', true);
INSERT INTO public.planet_types VALUES (2, 'Super-Earth', true);
INSERT INTO public.planet_types VALUES (3, 'Neptune-like', true);
INSERT INTO public.planet_types VALUES (4, 'Terrestrial', true);


--
-- Data for Name: planet_types_jt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types_jt VALUES (1, 4, 1, 'Mercury mass');
INSERT INTO public.planet_types_jt VALUES (2, 4, 2, 'Venus mass');
INSERT INTO public.planet_types_jt VALUES (5, 1, 3, 'Jupiter mass');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the center of the Solar System.', 4603.0, 5778, 27, false, true, 2);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 'Alpha Andromedae (α Andromedae, abbreviated Alpha And or α And), officially named Alpheratz /ælˈfɪəræts/,[12][13] is 97 light-years from the Sun and is the brightest star in the constellation of Andromeda when Beta Andromedae undergoes its periodical dimming.', 60.0, 13000, 2, false, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Alpha Centauri is a gravitationally bound system of the closest stars and exoplanets to our Solar System at 4.37 light-years (1.34 parsecs) from the Sun.', 4853.0, 5790, 36, true, true, 2);
INSERT INTO public.star VALUES (4, 'Gliese 832', 'Gliese 832 (Gl 832 or GJ 832) is a red dwarf of spectral type M2V in the southern constellation Grus.[12] The apparent visual magnitude of 8.66[2] means that it is too faint to be seen with the naked eye.', 9240.0, 3620, 45, true, true, 2);
INSERT INTO public.star VALUES (5, 'Groombridge 1618', 'Groombridge 1618 is a star in the northern constellation Ursa Major. With an apparent visual magnitude of +6.6, it lies at or below the threshold of stars visible to the naked eye for an average observer.', 6600.0, 3970, 1, true, false, 2);
INSERT INTO public.star VALUES (6, 'Tau Ceti', 'Tau Ceti, Latinized from τ Ceti, is a single star in the constellation Cetus that is spectrally similar to the Sun, although it has only about 78% of the Sun mass.', 7630.0, 5344, 34, false, false, 2);


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
-- Name: planet_types_jt_planet_types_jt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_jt_planet_types_jt_id_seq', 3, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 4, true);


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
-- Name: planet_types_jt planet_types_jt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types_jt
    ADD CONSTRAINT planet_types_jt_name_key UNIQUE (name);


--
-- Name: planet_types_jt planet_types_jt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types_jt
    ADD CONSTRAINT planet_types_jt_pkey PRIMARY KEY (planet_types_jt_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: planet_types_jt planet_types_jt_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types_jt
    ADD CONSTRAINT planet_types_jt_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_types_jt planet_types_jt_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types_jt
    ADD CONSTRAINT planet_types_jt_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

