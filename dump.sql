--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text,
    price real,
    age_type integer,
    gender integer,
    color integer,
    images text[],
    brand integer,
    slug text,
    CONSTRAINT products_age_type_check CHECK (((age_type >= 0) AND (age_type <= 1))),
    CONSTRAINT products_brand_check CHECK (((brand >= 0) AND (brand <= 5))),
    CONSTRAINT products_color_check CHECK (((color >= 0) AND (color <= 12))),
    CONSTRAINT products_gender_check CHECK (((gender >= 0) AND (gender <= 2))),
    CONSTRAINT products_price_check CHECK ((price > (0)::double precision))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(100),
    tel_nr character varying(10),
    country character varying(50),
    city character varying(50),
    address character varying(200),
    zip_code character varying(10)
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    stars integer NOT NULL,
    comment character varying(255),
    product_id integer
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO postgres;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, email, password, first_name, last_name) FROM stdin;
1	john@gmail.com	$2b$10$PBdl8FgK92SmWHvnYfz5cet2LEgVg7WquiXlJzSon1/b8MjR1VHDO	John	John
2	sdfds@asd.com	$2b$10$8Lt57D3x55.uPZiro2xNj.M3bbJ8Yxu4ilCptNluMSfpja4J2fxFG	ss	df
3	jjj@jj.com	$2b$10$Jo4S3PCORQms5waNhxpIoe2WVnY1wEqiXkySOQeydH6eXyiw66UD.	jjj	jjj
4	dssd@as.com	$2b$10$fff3GamwvoIBUGr4hcUWJOmLN/lmnqTwhSmfsxwb5vaZ/qjhmTGuG	fsd	sdf
5	sdf@fsgs.com	$2b$10$TaCr3eM0APQuYwn6Bzw/lewSYh5l688SVMltN2X.cGDtXq9LzEFn.	fad	gsfgsaf
6	asfa@ada.com	$2b$10$CeBYxaxr6I46b3GC659epOTk4aWAwSFLSXMD2YnklU8zowoL5pdZq	sdf	sdfs
7	sfgs@scda.com	$2b$10$CI49Dxcxz2fzK1ZPlbWLL.oyAp.UORh5wA8/HqeRUksJcM4dlCyZK	sgf	dfds
8	dg@dfs.vom	$2b$10$31yGbG.Q6DSuoJnrq7.qIut7eRXSIS8xhGfpT3.uXyMlmFptIwRMy	dg	dfg
9	alex@yahoo.com	$2b$10$jGi2TScEfe0G8RMwRguXXeEyDN40xI7hGP1lHvmuJLSXIMvBHGPd2	das	asd
10	johnny@gmail.com	$2b$10$evhXIO.8.BIv95VsnptjEu2GVIFk2EtUBietcNiTSqlQAWsIkb94u	sdf	Jddf
11	johnuy@gmail.com	$2b$10$fKETj8Db//a/XqSLXXWrXuep5rF/JbyyCZZc.PCk4j8Bx3j0jZvdC	sdf	Jddf
12	johnuuy@gmail.com	$2b$10$jnYglMHkz3/85lCapoW7cu6cdjhSwrhQ9oX1GLWHHlvtdt40vKsSe	sdf	Jddf
13	johnuuuy@gmail.com	$2b$10$6O4ey18dtqq1c92hM4VaHOjo6t.5awHXygXlmmSyCphyfFlTxjCMi	sdf	Jddf
14	johnut@gmail.com	$2b$10$3jO1h1syBCApfI9L8xxlmOqsesC2IVLTOaDcL8ixRFtDLjbRzc/yS	sdf	Jddf
15	bob@gmail.com	$2b$10$kkJii/IDj.cU9WkCLiy1bugoFNuoyZdByQ/VTRbPVoX.b95S17Q.O	Bob	Bob
16	alexalex@yahoo.com	$2b$10$5uBPK/1CXLFkkdibX7QjD.Z7VXC3pdmB35aF84HUzV5WyfcN2IKUa	sws	sw
17	demo@demo.com	$2b$10$MlloXxl8Bk9aRiETaiakEudFUTnYoWCyQ2q.By0pAjt6/TRUbp8CG	Demo	Demo
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, age_type, gender, color, images, brand, slug) FROM stdin;
1	ADIDAS Pantofi Sport ADI2000	619.99	0	0	2	{https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/GV9/GV9544/images/thumbs_900/GV9544_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/GV9/GV9544/images/thumbs_900/GV9544_1_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/GV9/GV9544/images/thumbs_900/GV9544_2_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/GV9/GV9544/images/thumbs_900/GV9544_3_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/GV9/GV9544/images/thumbs_900/GV9544_4_900_900px.jpg.webp}	1	adidas-pantofi-sport-adi2000
2	NIKE Pantofi Sport Nike Air Huarache Premium	749.99	0	0	2	{https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DV0/DV0486-100/images/thumbs_900/DV0486-100_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DV0/DV0486-100/images/thumbs_900/DV0486-100_1_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DV0/DV0486-100/images/thumbs_900/DV0486-100_2_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DV0/DV0486-100/images/thumbs_900/DV0486-100_3_900_900px.jpg.webp}	0	nike-pantofi-sport-nike-air-huarache-premium
4	ADIDAS Pantofi Sport NITEBALL	729.99	0	1	0	{https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FZ5/FZ5741/images/thumbs_900/FZ5741_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FZ5/FZ5741/images/thumbs_900/FZ5741_1_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FZ5/FZ5741/images/thumbs_900/FZ5741_2_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FZ5/FZ5741/images/thumbs_900/FZ5741_3_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FZ5/FZ5741/images/thumbs_900/FZ5741_4_900_900px.jpg.webp}	1	adidas-pantofi-sport-niteball
5	ADIDAS Pantofi Sport ZX 22 BOO	729.99	0	0	3	{https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/HP2/HP2769/images/thumbs_900/HP2769_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/HP2/HP2769/images/thumbs_900/HP2769_1_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/HP2/HP2769/images/thumbs_900/HP2769_2_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/HP2/HP2769/images/thumbs_900/HP2769_3_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/HP2/HP2769/images/thumbs_900/HP2769_4_900_900px.jpg.webp}	1	adidas-pantofi-sport-zx-22-boo
6	NIKE Pantofi Sport NIKE DUNK LOW NH	629.99	0	0	2	{https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2654-200/images/thumbs_900/DX2654-200_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2654-200/images/thumbs_900/DX2654-200_1_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2654-200/images/thumbs_900/DX2654-200_2_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2654-200/images/thumbs_900/DX2654-200_3_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2654-200/images/thumbs_900/DX2654-200_4_900_900px.jpg.webp}	0	nike-pantofi-sport-nike-dunk-low-nh
7	NIKE Pantofi Sport NIKE AIR FORCE 1 '07	799.99	0	0	2	{https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2666-100/images/thumbs_900/DX2666-100_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2666-100/images/thumbs_900/DX2666-100_1_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2666-100/images/thumbs_900/DX2666-100_2_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2666-100/images/thumbs_900/DX2666-100_3_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/DX2/DX2666-100/images/thumbs_900/DX2666-100_4_900_900px.jpg.webp}	0	nike-pantofi-sport-nike-air-force-1-07
8	NIKE Pantofi Sport AIR MAX 95	929.99	0	1	0	{https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FJ4/FJ4826-001/images/thumbs_900/FJ4826-001_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FJ4/FJ4826-001/images/thumbs_900/FJ4826-001_1_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FJ4/FJ4826-001/images/thumbs_900/FJ4826-001_2_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FJ4/FJ4826-001/images/thumbs_900/FJ4826-001_3_900_900px.jpg.webp,https://www.buzzsneakers.ro/files/thumbs/files/images/slike-proizvoda/media/FJ4/FJ4826-001/images/thumbs_900/FJ4826-001_4_900_900px.jpg.webp}	0	nike-pantofi-sport-air-max-95
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, user_id, name, tel_nr, country, city, address, zip_code) FROM stdin;
1	13	\N	\N	\N	\N	\N	\N
2	14	\N	\N	\N	\N	\N	\N
3	15	Bob Bob	08889	ew	asuhgm	\N	7765
4	16	sws sw	\N	vsd	\N	\N	2423
5	17	Demo Demo	099876	ddf	hfgjh	jdsj	000
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, name, stars, comment, product_id) FROM stdin;
1	Bob Bob	5		5
2	Bob Bob	5		5
3	Bob Bo	5		5
4	Bob Bob	3	fwe	5
5	Bob Bob	4	fccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv	5
6	Bob Bob	1	hgdgffgh	5
7	Bob Bob	2	4	5
8	Bob Bob	4	5	5
9	Demo Demo	2	hf	5
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 17, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_id_seq', 5, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 9, true);


--
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: products uniq_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT uniq_name UNIQUE (name, slug);


--
-- Name: profiles profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.accounts(id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

