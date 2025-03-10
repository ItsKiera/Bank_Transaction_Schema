--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    currency character varying(20) NOT NULL,
    status character varying(50) NOT NULL,
    overdraft_limit double precision NOT NULL,
    account_type character varying(50) NOT NULL,
    customer_id integer
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_id_seq OWNER TO postgres;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: customer_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_details (
    id integer NOT NULL,
    title character varying(20) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    date_of_birth date NOT NULL,
    street_number character varying(50) NOT NULL,
    street_name character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    postcode character varying(10) NOT NULL,
    country character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    email_address character varying(50) NOT NULL,
    national_insurance_number character varying(50) NOT NULL,
    branch_id integer
);


ALTER TABLE public.customer_details OWNER TO postgres;

--
-- Name: customer_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_details_id_seq OWNER TO postgres;

--
-- Name: customer_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_details_id_seq OWNED BY public.customer_details.id;


--
-- Name: customer_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_transaction (
    customer_id integer NOT NULL,
    transaction_id integer NOT NULL
);


ALTER TABLE public.customer_transaction OWNER TO postgres;

--
-- Name: local_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.local_branch (
    id integer NOT NULL,
    branch_name character varying(50) NOT NULL,
    street_number character varying(20) NOT NULL,
    street_name character varying(20) NOT NULL,
    city character varying(20) NOT NULL,
    "postcode " character varying(20) NOT NULL
);


ALTER TABLE public.local_branch OWNER TO postgres;

--
-- Name: local_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.local_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.local_branch_id_seq OWNER TO postgres;

--
-- Name: local_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.local_branch_id_seq OWNED BY public.local_branch.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    transaction_date timestamp without time zone NOT NULL,
    transaction_type character varying(20) NOT NULL,
    payment_method character varying(20) NOT NULL,
    reference_number integer NOT NULL,
    sender_id integer,
    receiver_id integer
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_id_seq OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: customer_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_details ALTER COLUMN id SET DEFAULT nextval('public.customer_details_id_seq'::regclass);


--
-- Name: local_branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local_branch ALTER COLUMN id SET DEFAULT nextval('public.local_branch_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, created_at, updated_at, currency, status, overdraft_limit, account_type, customer_id) FROM stdin;
1	2024-02-01 10:00:00	2024-02-10 12:00:00	USD	Active	500	Checking	1
2	2024-02-02 11:00:00	2024-02-11 14:00:00	USD	Active	1000	Savings	2
\.


--
-- Data for Name: customer_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_details (id, title, first_name, last_name, date_of_birth, street_number, street_name, city, postcode, country, phone_number, email_address, national_insurance_number, branch_id) FROM stdin;
1	Mr	John	Doe	1990-05-15	10	Elm St	New York	10001	USA	1234567890	john.doe@email.com	AB123456C	1
2	Ms	Jane	Smith	1985-08-22	20	Pine St	Los Angeles	90001	USA	0987654321	jane.smith@email.com	CD789012E	3
\.


--
-- Data for Name: customer_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_transaction (customer_id, transaction_id) FROM stdin;
1	1
1	2
2	3
\.


--
-- Data for Name: local_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.local_branch (id, branch_name, street_number, street_name, city, "postcode ") FROM stdin;
1	Downtown Branch	123	Main St	New York	10001
2	Uptown Branch	456	Broadway	New York	10002
3	Central Branch	789	Market St	Los Angeles	90001
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (id, transaction_date, transaction_type, payment_method, reference_number, sender_id, receiver_id) FROM stdin;
1	2024-02-15 09:30:00	Transfer	Bank Transfer	10001	1	2
2	2024-02-16 14:45:00	Deposit	Cash	10002	\N	1
3	2024-02-17 16:00:00	Withdrawal	ATM	10003	2	\N
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_id_seq', 1, false);


--
-- Name: customer_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_details_id_seq', 1, false);


--
-- Name: local_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.local_branch_id_seq', 1, false);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 1, false);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: customer_details customer_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_pkey PRIMARY KEY (id);


--
-- Name: customer_transaction customer_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_transaction
    ADD CONSTRAINT customer_transaction_pkey PRIMARY KEY (customer_id, transaction_id);


--
-- Name: local_branch local_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local_branch
    ADD CONSTRAINT local_branch_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: account account_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer_details(id);


--
-- Name: customer_details customer_details_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.local_branch(id);


--
-- Name: customer_transaction customer_transaction_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_transaction
    ADD CONSTRAINT customer_transaction_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer_details(id);


--
-- Name: customer_transaction customer_transaction_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_transaction
    ADD CONSTRAINT customer_transaction_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction(id);


--
-- Name: transaction transaction_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.account(id);


--
-- Name: transaction transaction_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.account(id);


--
-- PostgreSQL database dump complete
--

