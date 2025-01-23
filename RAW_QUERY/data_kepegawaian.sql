--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.6

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

--
-- Name: enum_education_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_education_level AS ENUM (
    'TK',
    'SD',
    'SMP',
    'SMA',
    'Strata 1',
    'Strata 2',
    'Doktor',
    'Profesor'
);


ALTER TYPE public.enum_education_level OWNER TO postgres;

--
-- Name: enum_employee_family_relation_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employee_family_relation_status AS ENUM (
    'Suami',
    'Istri',
    'Anak',
    'Anak Sambung'
);


ALTER TYPE public.enum_employee_family_relation_status OWNER TO postgres;

--
-- Name: enum_employee_family_religion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employee_family_religion AS ENUM (
    'Islam',
    'Katolik',
    'Buddha',
    'Protestan',
    'Konghucu'
);


ALTER TYPE public.enum_employee_family_religion OWNER TO postgres;

--
-- Name: enum_employee_profile_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_employee_profile_gender AS ENUM (
    'Laki-laki',
    'Perempuan'
);


ALTER TYPE public.enum_employee_profile_gender OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255),
    level public.enum_education_level,
    description character varying(255) NOT NULL,
    created_by character varying(225) NOT NULL,
    updated_by character varying(225) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.education OWNER TO postgres;

--
-- Name: education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.education_id_seq OWNER TO postgres;

--
-- Name: education_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_id_seq OWNED BY public.education.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    nik character varying(255),
    name character varying(255),
    is_active boolean,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_family (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(225),
    identifier character varying(225),
    job character varying(255),
    place_of_birth character varying(255),
    date_of_birth timestamp with time zone,
    religion public.enum_employee_family_religion,
    is_life boolean,
    is_divorced boolean,
    relation_status public.enum_employee_family_relation_status,
    created_by character varying(225),
    updated_by character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.employee_family OWNER TO postgres;

--
-- Name: employee_family_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_family_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_family_id_seq OWNER TO postgres;

--
-- Name: employee_family_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_family_id_seq OWNED BY public.employee_family.id;


--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_id_seq OWNER TO postgres;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: employee_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_profile (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    place_of_birth character varying(255),
    date_of_birth timestamp with time zone,
    gender public.enum_employee_profile_gender,
    is_married boolean,
    prof_pict character varying(225),
    created_by character varying(225),
    updated_by character varying(225),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.employee_profile OWNER TO postgres;

--
-- Name: employee_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_profile_id_seq OWNER TO postgres;

--
-- Name: employee_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_profile_id_seq OWNED BY public.employee_profile.id;


--
-- Name: education id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education ALTER COLUMN id SET DEFAULT nextval('public.education_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: employee_family id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family ALTER COLUMN id SET DEFAULT nextval('public.employee_family_id_seq'::regclass);


--
-- Name: employee_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile ALTER COLUMN id SET DEFAULT nextval('public.employee_profile_id_seq'::regclass);


--
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.education (id, employee_id, name, level, description, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	Universitas Negeri Jakarta	Strata 1	Sarjana	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
2	2	Universitas Gunadarma	Strata 2	Sarjana	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
3	3	Universitas Udayana	Doktor	Doktor	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
4	4	SMA Negeri 2 Rusia	SMA	Sekolah Menengah Atas	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, nik, name, is_active, start_date, end_date, created_by, updated_by, created_at, updated_at) FROM stdin;
1	12341	Jeka Saragih	t	2020-01-01 00:00:00+07	2025-12-31 00:00:00+07	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
2	12342	Suwardi	t	2021-05-15 00:00:00+07	2025-05-14 00:00:00+07	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
3	12343	Arthur Morgan	f	2019-06-10 00:00:00+07	2025-06-09 00:00:00+07	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
4	12344	Khabib Nurmagomedov	t	2022-03-25 00:00:00+07	2026-03-24 00:00:00+07	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
\.


--
-- Data for Name: employee_family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_family (id, employee_id, name, identifier, job, place_of_birth, date_of_birth, religion, is_life, is_divorced, relation_status, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	Siti Ropeah	54321	Guru	Jakarta	1985-05-20 00:00:00+07	Katolik	t	f	Istri	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
2	2	Laura	98765	PNS	Bali	1990-03-15 00:00:00+07	Katolik	t	f	Istri	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
3	3	Luna Maya	11234	PNS	Bogor	1992-07-25 00:00:00+07	Buddha	t	f	Istri	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
4	4	Rayanthi	33456	Artist	Jakarta	1988-11-30 00:00:00+07	Protestan	t	f	Istri	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
5	4	Suryanti	44567	Pilot	Dagestan	1998-08-12 00:00:00+07	Protestan	t	f	Anak	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
\.


--
-- Data for Name: employee_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_profile (id, employee_id, place_of_birth, date_of_birth, gender, is_married, prof_pict, created_by, updated_by, created_at, updated_at) FROM stdin;
1	1	Medan	1985-05-20 00:00:00+07	Laki-laki	t	jeka_pic.jpg	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
2	2	Magetan	1982-02-10 00:00:00+07	Laki-laki	t	suwardi_pic.jpg	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
3	3	Saint Dennis	1815-02-25 00:00:00+06:42:04	Laki-laki	t	Arthur_pic.jpg	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
4	4	Dagestan	1988-08-12 00:00:00+07	Laki-laki	t	Khabib_pic.jpg	admin	admin	2025-01-22 00:00:00+07	2025-01-22 00:00:00+07
\.


--
-- Name: education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_id_seq', 16, true);


--
-- Name: employee_family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_family_id_seq', 10, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 16, true);


--
-- Name: employee_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_profile_id_seq', 15, true);


--
-- Name: education education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- Name: employee_family employee_family_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: employee_profile employee_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_pkey PRIMARY KEY (id);


--
-- Name: education education_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: employee_family employee_family_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: employee_profile employee_profile_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

