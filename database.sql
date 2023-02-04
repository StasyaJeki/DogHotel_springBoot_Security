--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    id integer NOT NULL,
    date_in date NOT NULL,
    date_out date NOT NULL,
    category_id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    id integer NOT NULL,
    text character varying(300),
    grade integer,
    user_id integer,
    booking_id integer,
    CONSTRAINT rating_grade_check CHECK (((grade >= 1) AND (grade <= 5)))
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- Name: rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rating ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_role_id_seq OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying(255) NOT NULL,
    enabled boolean,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (id, date_in, date_out, category_id, user_id, name) FROM stdin;
144	2023-01-11	2023-01-12	1	87	Tuz
143	2023-01-04	2023-01-05	1	1	Jeki
133	2023-01-03	2023-01-05	3	70	Lora
128	2023-01-05	2023-01-26	3	1	Jeki
112	2023-01-05	2023-01-02	3	2	Muha
114	2023-01-01	2023-01-05	1	2	Lenya
124	2023-01-02	2023-01-03	3	67	Belka
117	2023-01-01	2023-01-12	3	1	Jeki
113	2023-01-03	2023-01-05	1	2	Lenya
132	2023-01-03	2023-01-04	1	1	Jeki
131	2023-01-04	2023-01-24	2	1	Jeki
126	2023-01-03	2023-01-12	2	1	Sova
122	2023-01-02	2023-01-05	1	66	Bobik
123	2023-01-02	2023-01-12	1	67	Belka
104	2023-01-01	2023-01-22	1	58	Lev
137	2023-01-11	2023-01-26	3	78	Timurka
119	2023-01-01	2023-01-25	3	1	Sova
142	2023-01-12	2023-01-14	2	1	Jeki
138	2023-01-05	2023-01-18	3	78	Timurka
141	2023-01-04	2023-01-05	2	80	Tuzik
110	2023-01-01	2023-01-15	3	2	Muha
103	2023-01-05	2023-01-06	2	58	Lev
129	2023-01-04	2023-01-26	3	1	Sova
105	2023-01-01	2023-01-22	2	59	Muhtar
118	2023-01-01	2023-01-02	3	1	Jeki
120	2023-01-18	2023-01-26	3	1	Jeki
121	2023-01-05	2023-01-26	3	1	Sova
107	2022-01-03	2023-01-21	2	2	Muha
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, price) FROM stdin;
3	VIP	500
2	SUITE	200
1	STANDARD	100
\.


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rating (id, text, grade, user_id, booking_id) FROM stdin;
4	╨г╨╢╨░╤Б╨╜╨╛!!!	1	1	120
5	╨г╨╢╨░╤Б╨╜╨╛!!!	1	1	103
7	╨Ю╤В╨╗╨╕╤З╨╜╨╛	5	66	122
8	╨в╨░╨║ ╤Б╨╡╨▒╨╡...	5	67	123
9	╤Л╤Л	1	67	124
13	╤О╤Е╤Г!!!!	5	1	117
14	╨╜╨╛╤А╨╝	3	1	118
15		1	1	117
17	....╨┐╨╡╤З╨░╨╗╤М	1	78	137
18	╨б╨г╨Я╨Х╨а ╨Я╨г╨Я╨Х╨а!!!!:))5+++	5	1	120
19	╨С╨╡╨╡╨╡╨╡...	2	80	141
20	╨Ы╤Г╤З╤И╨╕╨╣ ╨╛╤В╨╡╨╗╤М=)	5	1	143
21	╨Я╤С╤Б ╨┤╨╛╨▓╨╛╨╗╨╡╨╜	5	87	144
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, name) FROM stdin;
2	USER
1	ADMIN
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, email, enabled, first_name, last_name, password) FROM stdin;
1	admin@ru	f	Nastassia	Novikova	$2a$10$HGQyPzGZz7HReWSRg6cjT.64k5NR59BFQSqAgm4sZVCV7VbhKru0y
2	stasya@ru	f	Nastya	Krolikova	$2a$10$HGQyPzGZz7HReWSRg6cjT.64k5NR59BFQSqAgm4sZVCV7VbhKru0y
54	1111@ru	f	Nastassia	Novikava	$2a$10$7bTlGI8kd7oBMqpJ01E1xOo5E7uSvhcBOIifE7XRBHRzTJsuDx0sG
55	mama@ru	f	Mahha	Tumberg	$2a$10$YF4YLs3GjZ/539HoJbimWuPJ2INAvTVaVox4RACuAiXHw3g9PlW4C
56	rabom@ry	f	Rama	Hohter	$2a$10$GzwEq8iOUF80CxoVfuH2BepbhNPZnz1iemC8D27818CgfjbQKtZ1O
57	sara@ru	f	Sara	Nuhet	$2a$10$Q6hOlVJLFM8IfMw475GVjODZL5ZmgQiyafPypSt.K5TrmIj8bdVyK
58	roki@ru	f	Roki	Mutu	$2a$10$X/OpDqh.rVTWjkkypnEXgukzzvm8J.CdScjVnIO5ODUrQg2G3ySNe
59	tamuna@ru	f	Tamuna	Lodure	$2a$10$gxlCHpgp/2cn27cRd1gPJOSDV.kJ2r0cUcC1B.YT0vOWjiMh/j5qi
61	polya11@ru	f	Tuluma	Histor	$2a$10$6bDkRUG.iti7fFn22xtP6OXYqWz/B94egTqhLeqUAcKYRSATjbqsu
62	martiha@ru	f	Marta	Kukuna	$2a$10$9mJ3/TpPXRBD2NLpiuv98egPqbNx3EgJr2QuQ9uBBJ9uwa5CoolZ2
66	wena@ru	f	Wenya	Kisof	$2a$10$Y7VKufXF0biHz12j7yAK6uchrRLro52.rOrDPavb7mOC.SAnOQu2.
67	luna@ru	f	Lunina	Mio	$2a$10$6GBYO49vtkDCzfemlXqU0exxclv5pwCyQcfnGzYRJN6KX49Ot5eoq
68	henor@ru	f	Hena	Mijer	$2a$10$tcO1LdUF1NQNUHhdLljm8eC8wx02SznHl7gsLrRvroUV48/qxndoG
69	pupa@ru	f	Pupina	Huran	$2a$10$9KGplFXiy2a/MBYEO0J8jOcPaXpxTx/hfJgZTt53s2F86kNBOpo/e
70	tutu@ru	f	Tutu	Bene	$2a$10$WekibToXBxCJ/LJPNF44aeDWjfpSYF0WQrtE7TrsLej28af5545i2
71	meron@ru	f	Mira	Boko	1313
72	dima@ru	f	Dima	Konor	$2a$10$7XzB9eeHF/57oblmWViIU.N7DlHlZP8UhrQ0Z63WzS.3/c.0F4wv.
74	toto@ru	f	Namuna	Koko	$2a$10$14lf3LdBYWP7gMNyv5PN.O31XQDSUEXp8wMRo2xrP0iP6dE.6C9GW
77	robo@ru	f	Roba	Rut	$2a$10$pCJPgmDnUw3T1wfz7Sax0.3MVfvTXnlOX.Y.BfYkJeDgcHfLozQ9y
78	roro@ru	f	Roma	Lower	$2a$10$rSUSRCx9d5jCrK7nGJ1JOeQB4PryISOkuMQqfwkpi4dYNhGuD9ifa
79	riki@ru	f	Riki	Martin	$2a$10$ORfQpQ.pEOvXpjXyOvxEwuhvNnwRFXTUO5oQIdloTdxqn56sgSJDC
80	sem@ru	f	Sem	Gurev	$2a$10$.PZ60pfYjaeY02exhHQhxumzDasMx2u8ShL4tzz6BToGlVSTqck2O
81	romio@ru	f	Roma	Rebok	$2a$10$Ylums/va3L974I4wfNeI5eCX3KlMTyqC06DQ15iqh1GFMOuFKkJ/G
87	romiono@ru	f	Romano	Reboki	$2a$10$0RSiEHa7cDooOO4uLDmGju5wMAAHwQn9goJR0upa7OjZJPLIxQjua
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_roles (user_id, role_id) FROM stdin;
1	1
\.


--
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_id_seq', 144, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 10, true);


--
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rating_id_seq', 21, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 5, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 87, true);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: roles_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_name_uindex ON public.roles USING btree (name);


--
-- Name: users_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_uindex ON public.users USING btree (email);


--
-- Name: booking booking_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE SET NULL;


--
-- Name: booking booking_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- Name: users_roles fk2o0jvgh89lemvvo17cbqvdxaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: booking fk7udbel7q86k041591kj6lfmvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fk7udbel7q86k041591kj6lfmvw FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: booking fk7vcip04fp617nnprquypt7i86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fk7vcip04fp617nnprquypt7i86 FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: users_roles fkj6m8fwv7oqv74fcehir1a9ffy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES public.roles(role_id);


--
-- Name: rating rating_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(id) ON DELETE SET NULL;


--
-- Name: rating rating_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

