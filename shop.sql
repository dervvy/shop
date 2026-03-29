--
-- PostgreSQL database dump
--

\restrict c93WY5UURgCKUKcFiddj6rhCfyNpJ6YqWgW0r7YAja6ct6I3cabTUeZvdlRekgW

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-29 14:43:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16413)
-- Name: manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manufacturer (
    id integer NOT NULL,
    name character varying(100),
    country character varying(100),
    contact_person character varying(100),
    phone character varying(50)
);


ALTER TABLE public.manufacturer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16412)
-- Name: manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manufacturer_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 219
-- Name: manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manufacturer_id_seq OWNED BY public.manufacturer.id;


--
-- TOC entry 222 (class 1259 OID 16421)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(100),
    size character varying(50),
    weight numeric,
    manufacturer_id integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16420)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 4760 (class 2604 OID 16416)
-- Name: manufacturer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer ALTER COLUMN id SET DEFAULT nextval('public.manufacturer_id_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 16424)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 4915 (class 0 OID 16413)
-- Dependencies: 220
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manufacturer (id, name, country, contact_person, phone) FROM stdin;
6	Apple	США	Tim Cook	+1 800 2752273
7	Samsung	Южная Корея	Lee Jae-yong	+82 2 2255 0114
8	Xiaomi	Китай	Lei Jun	+86 400 100 5678
9	Sony	Япония	Kenichiro Yoshida	+81 3 6748 2111
\.


--
-- TOC entry 4917 (class 0 OID 16421)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, size, weight, manufacturer_id) FROM stdin;
6	MacBook Air M2	13.6	1.24	6
7	Samsung Galaxy S23	6.1	0.19	7
8	Samsung QLED 4K TV	55	18	7
9	Mi 12	6.28	0.18	8
10	Redmi Note 12	6.67	0.19	8
11	Bravia OLED TV	65	24	9
5	iPhone 15 Pro	6.1	0.2	6
\.


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 219
-- Name: manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manufacturer_id_seq', 11, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 12, true);


--
-- TOC entry 4763 (class 2606 OID 16419)
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);


--
-- TOC entry 4765 (class 2606 OID 16429)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4766 (class 2606 OID 16430)
-- Name: product product_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturer(id);


-- Completed on 2026-03-29 14:43:09

--
-- PostgreSQL database dump complete
--

\unrestrict c93WY5UURgCKUKcFiddj6rhCfyNpJ6YqWgW0r7YAja6ct6I3cabTUeZvdlRekgW

