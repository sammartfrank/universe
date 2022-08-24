--
-- PostgreSQL database dump
--
-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
SET
    statement_timeout = 0;

SET
    lock_timeout = 0;

SET
    idle_in_transaction_session_timeout = 0;

SET
    client_encoding = 'UTF8';

SET
    standard_conforming_strings = on;

SELECT
    pg_catalog.set_config('search_path', '', false);

SET
    check_function_bodies = false;

SET
    xmloption = content;

SET
    client_min_messages = warning;

SET
    row_security = off;

--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

\ connect universe
SET
    statement_timeout = 0;

SET
    lock_timeout = 0;

SET
    idle_in_transaction_session_timeout = 0;

SET
    client_encoding = 'UTF8';

SET
    standard_conforming_strings = on;

SELECT
    pg_catalog.set_config('search_path', '', false);

SET
    check_function_bodies = false;

SET
    xmloption = content;

SET
    client_min_messages = warning;

SET
    row_security = off;

SET
    default_tablespace = '';

SET
    default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    is_supermasive boolean NOT NULL
);

ALTER TABLE
    public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.black_hole_black_hole_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_of_stars integer NOT NULL,
    has_superblackhole_at_center boolean,
    description text,
    is_spherical boolean
);

ALTER TABLE
    public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    distance_to_its_planet_in_km integer NOT NULL,
    planet_id integer NOT NULL
);

ALTER TABLE
    public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.moon_moon_id_seq OWNER TO freecodecamp;

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
    description text,
    has_life boolean NOT NULL,
    distance_from_earth bigint NOT NULL,
    star_id integer NOT NULL,
    number_of_moons integer
);

ALTER TABLE
    public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    stage_of_life character varying NOT NULL,
    galaxy_id integer NOT NULL
);

ALTER TABLE
    public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.black_hole
ALTER COLUMN
    black_hole_id
SET
    DEFAULT nextval(
        'public.black_hole_black_hole_id_seq' :: regclass
    );

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.galaxy
ALTER COLUMN
    galaxy_id
SET
    DEFAULT nextval('public.galaxy_galaxy_id_seq' :: regclass);

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ALTER COLUMN
    moon_id
SET
    DEFAULT nextval('public.moon_moon_id_seq' :: regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ALTER COLUMN
    planet_id
SET
    DEFAULT nextval('public.planet_planet_id_seq' :: regclass);

--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ALTER COLUMN
    star_id
SET
    DEFAULT nextval('public.star_star_id_seq' :: regclass);

--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.black_hole
VALUES
    (1, 'Big black', 'A scary black hole', true);

INSERT INTO
    public.black_hole
VALUES
    (
        2,
        'The darkest beast',
        'Unfathomable and out of description',
        true
    );

INSERT INTO
    public.black_hole
VALUES
    (3, 'Black lotus', 'To another dimention', true);

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.galaxy
VALUES
    (2, 'Hoags Object', 594883, NULL, NULL, NULL);

INSERT INTO
    public.galaxy
VALUES
    (4, 'Needle Galaxy', 49383, NULL, NULL, NULL);

INSERT INTO
    public.galaxy
VALUES
    (5, 'Sombrero Galaxy', 49382382, NULL, NULL, NULL);

INSERT INTO
    public.galaxy
VALUES
    (6, 'NOC4083', 4948444, NULL, NULL, NULL);

INSERT INTO
    public.galaxy
VALUES
    (1, 'Andromeda', 1500000, true, NULL, NULL);

INSERT INTO
    public.galaxy
VALUES
    (
        3,
        'Milky Way',
        4838392,
        true,
        'House of the Earth and the Solar System',
        false
    );

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.moon
VALUES
    (1, 'Luna', 'Earths only moon', 384000, 1);

INSERT INTO
    public.moon
VALUES
    (3, 'Phobos', 'A Moon', 4948, 4);

INSERT INTO
    public.moon
VALUES
    (4, 'Deimos', 'A Moon', 5000, 4);

INSERT INTO
    public.moon
VALUES
    (5, 'Europa', 'A moon', 5430, 5);

INSERT INTO
    public.moon
VALUES
    (6, 'Io', 'A moon', 4932, 5);

INSERT INTO
    public.moon
VALUES
    (7, 'Cassini', 'A moon', 49584, 5);

INSERT INTO
    public.moon
VALUES
    (8, 'Ganimedes', 'A moon', 59843, 5);

INSERT INTO
    public.moon
VALUES
    (9, 'Astaris', 'A moon', 49, 5);

INSERT INTO
    public.moon
VALUES
    (11, 'Ceres', 'A Moon', 4948, 4);

INSERT INTO
    public.moon
VALUES
    (12, 'Nifrua', 'A Moon', 5000, 4);

INSERT INTO
    public.moon
VALUES
    (13, 'Asia', 'A moon', 5430, 5);

INSERT INTO
    public.moon
VALUES
    (14, 'Akar', 'A moon', 4932, 5);

INSERT INTO
    public.moon
VALUES
    (15, 'Sharklen', 'A moon', 49584, 5);

INSERT INTO
    public.moon
VALUES
    (16, 'Timaru', 'A moon', 59843, 5);

INSERT INTO
    public.moon
VALUES
    (17, 'Antioqui', 'A moon', 49, 5);

INSERT INTO
    public.moon
VALUES
    (18, 'Ganimodos', 'A moonlet', 49, 6);

INSERT INTO
    public.moon
VALUES
    (19, 'Aspirilum', 'A moonacious', 69, 6);

INSERT INTO
    public.moon
VALUES
    (20, 'Astrum', 'A moonaque', 509894, 7);

INSERT INTO
    public.moon
VALUES
    (21, 'Wayru', 'A moont', 59303, 8);

INSERT INTO
    public.moon
VALUES
    (22, 'Camote', 'A mmoon', 4938, 8);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.planet
VALUES
    (1, 'Earth', 'Home of Human kind', true, 0, 1, 1);

INSERT INTO
    public.planet
VALUES
    (
        2,
        'Mercury',
        'Super hot inhabitable planet',
        false,
        77,
        1,
        0
    );

INSERT INTO
    public.planet
VALUES
    (
        3,
        'Venus',
        'Super gassy planet',
        false,
        61,
        1,
        0
    );

INSERT INTO
    public.planet
VALUES
    (4, 'Mars', 'Earths cousin', false, 34, 1, 2);

INSERT INTO
    public.planet
VALUES
    (
        5,
        'Jupiter',
        'The biggest of them all',
        false,
        779,
        1,
        59
    );

INSERT INTO
    public.planet
VALUES
    (
        6,
        'Saturn',
        'Super cold inhabitable planet',
        false,
        977,
        1,
        56
    );

INSERT INTO
    public.planet
VALUES
    (
        7,
        'Urano',
        'Super glassy and crystal planet',
        false,
        461,
        1,
        20
    );

INSERT INTO
    public.planet
VALUES
    (
        8,
        'Neptune',
        'Crazy planet made of waves',
        false,
        1034,
        1,
        22
    );

INSERT INTO
    public.planet
VALUES
    (
        9,
        'Pluto',
        'The last horizon',
        false,
        9779,
        1,
        19
    );

INSERT INTO
    public.planet
VALUES
    (10, 'Melmac', 'Alfs land', true, 999999, 2, 140);

INSERT INTO
    public.planet
VALUES
    (
        11,
        'Tatooine',
        'A desert barren land',
        true,
        94849484,
        3,
        49
    );

INSERT INTO
    public.planet
VALUES
    (
        12,
        'Zyrkon',
        'Barren and empty land',
        false,
        99484838,
        5,
        0
    );

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.star
VALUES
    (
        1,
        'Sun',
        'Center of the Solar system',
        1948,
        'Red giant',
        3
    );

INSERT INTO
    public.star
VALUES
    (
        2,
        'Aldebaran',
        'Lives in Tauro constellation',
        383928,
        'Red giant',
        2
    );

INSERT INTO
    public.star
VALUES
    (
        3,
        'Alpha Centauri',
        'Unique and proximate to the Sun',
        48939483,
        'Red dwarf',
        2
    );

INSERT INTO
    public.star
VALUES
    (
        4,
        'Ursa major',
        'The brightest star',
        48938292,
        'White dwarf',
        1
    );

INSERT INTO
    public.star
VALUES
    (
        5,
        'Lupus Major',
        'From the Wolf constellation',
        484393,
        'White giant',
        1
    );

INSERT INTO
    public.star
VALUES
    (
        6,
        'Camille star',
        'Camilas Star',
        4948233,
        'Supernovaed',
        4
    );

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.moon_moon_id_seq', 22, true);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.planet_planet_id_seq', 12, true);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.star_star_id_seq', 6, true);

--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.black_hole
ADD
    CONSTRAINT black_hole_name_key UNIQUE (name);

--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.black_hole
ADD
    CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);

--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.galaxy
ADD
    CONSTRAINT galaxy_name_key UNIQUE (name);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.galaxy
ADD
    CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_name_key UNIQUE (name);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_name_key UNIQUE (name);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_name_key UNIQUE (name);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- PostgreSQL database dump complete
--