--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-12 13:17:10

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 255 (class 1255 OID 16402)
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 248 (class 1259 OID 24577)
-- Name: api_authentication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_authentication (
    auth_id integer NOT NULL,
    user_id integer NOT NULL,
    api_key character varying(256) NOT NULL,
    device_name character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    expires_at timestamp without time zone
);


ALTER TABLE public.api_authentication OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 24576)
-- Name: api_authentication_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_authentication_auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.api_authentication_auth_id_seq OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 247
-- Name: api_authentication_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_authentication_auth_id_seq OWNED BY public.api_authentication.auth_id;


--
-- TOC entry 236 (class 1259 OID 16532)
-- Name: camera_command_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camera_command_logs (
    log_id integer NOT NULL,
    camera_id integer NOT NULL,
    command_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.camera_command_logs OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16531)
-- Name: camera_command_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.camera_command_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.camera_command_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 235
-- Name: camera_command_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.camera_command_logs_log_id_seq OWNED BY public.camera_command_logs.log_id;


--
-- TOC entry 234 (class 1259 OID 16518)
-- Name: camera_commands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camera_commands (
    command_id integer NOT NULL,
    camera_id integer NOT NULL,
    command_name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.camera_commands OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16517)
-- Name: camera_commands_command_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.camera_commands_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.camera_commands_command_id_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 233
-- Name: camera_commands_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.camera_commands_command_id_seq OWNED BY public.camera_commands.command_id;


--
-- TOC entry 228 (class 1259 OID 16454)
-- Name: camera_snaps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.camera_snaps (
    snap_id integer NOT NULL,
    camera_id integer NOT NULL,
    image_url text NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.camera_snaps OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16453)
-- Name: camera_snaps_snap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.camera_snaps_snap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.camera_snaps_snap_id_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 227
-- Name: camera_snaps_snap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.camera_snaps_snap_id_seq OWNED BY public.camera_snaps.snap_id;


--
-- TOC entry 222 (class 1259 OID 16417)
-- Name: cameras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cameras (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    room_id integer NOT NULL,
    value character varying NOT NULL,
    color bigint NOT NULL,
    index integer NOT NULL,
    token character varying(66)
);


ALTER TABLE public.cameras OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16416)
-- Name: cameras_camera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cameras_camera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cameras_camera_id_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 221
-- Name: cameras_camera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cameras_camera_id_seq OWNED BY public.cameras.id;


--
-- TOC entry 252 (class 1259 OID 24601)
-- Name: general_command_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.general_command_logs (
    log_id integer NOT NULL,
    command_id integer NOT NULL,
    executed_by_user_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.general_command_logs OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 24600)
-- Name: general_command_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.general_command_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.general_command_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 251
-- Name: general_command_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.general_command_logs_log_id_seq OWNED BY public.general_command_logs.log_id;


--
-- TOC entry 250 (class 1259 OID 24592)
-- Name: general_commands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.general_commands (
    command_id integer NOT NULL,
    command_name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.general_commands OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 24591)
-- Name: general_commands_command_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.general_commands_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.general_commands_command_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 249
-- Name: general_commands_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.general_commands_command_id_seq OWNED BY public.general_commands.command_id;


--
-- TOC entry 220 (class 1259 OID 16405)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    user_id integer NOT NULL,
    index integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16404)
-- Name: rooms_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_room_id_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 219
-- Name: rooms_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_room_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 240 (class 1259 OID 16564)
-- Name: sensor_command_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_command_logs (
    log_id integer NOT NULL,
    sensor_id integer NOT NULL,
    command_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sensor_command_logs OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16563)
-- Name: sensor_command_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensor_command_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensor_command_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 239
-- Name: sensor_command_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensor_command_logs_log_id_seq OWNED BY public.sensor_command_logs.log_id;


--
-- TOC entry 238 (class 1259 OID 16550)
-- Name: sensor_commands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_commands (
    command_id integer NOT NULL,
    sensor_id integer NOT NULL,
    command_name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.sensor_commands OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16549)
-- Name: sensor_commands_command_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensor_commands_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensor_commands_command_id_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 237
-- Name: sensor_commands_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensor_commands_command_id_seq OWNED BY public.sensor_commands.command_id;


--
-- TOC entry 230 (class 1259 OID 16469)
-- Name: sensor_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_logs (
    log_id integer NOT NULL,
    sensor_id integer NOT NULL,
    reading double precision NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sensor_logs OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16468)
-- Name: sensor_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensor_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensor_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 229
-- Name: sensor_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensor_logs_log_id_seq OWNED BY public.sensor_logs.log_id;


--
-- TOC entry 254 (class 1259 OID 24619)
-- Name: sensor_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_types (
    type_id integer NOT NULL,
    type_name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.sensor_types OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 24618)
-- Name: sensor_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensor_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensor_types_type_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 253
-- Name: sensor_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensor_types_type_id_seq OWNED BY public.sensor_types.type_id;


--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: sensors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensors (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    room_id integer NOT NULL,
    type_id integer NOT NULL,
    value integer NOT NULL,
    index integer NOT NULL,
    color bigint NOT NULL,
    token character varying(66)
);


ALTER TABLE public.sensors OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16428)
-- Name: sensors_sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensors_sensor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensors_sensor_id_seq OWNER TO postgres;

--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 223
-- Name: sensors_sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensors_sensor_id_seq OWNED BY public.sensors.id;


--
-- TOC entry 244 (class 1259 OID 16596)
-- Name: switch_command_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.switch_command_logs (
    log_id integer NOT NULL,
    switch_id integer NOT NULL,
    command_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.switch_command_logs OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16595)
-- Name: switch_command_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.switch_command_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.switch_command_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 243
-- Name: switch_command_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.switch_command_logs_log_id_seq OWNED BY public.switch_command_logs.log_id;


--
-- TOC entry 242 (class 1259 OID 16582)
-- Name: switch_commands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.switch_commands (
    command_id integer NOT NULL,
    switch_id integer NOT NULL,
    command_name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.switch_commands OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16581)
-- Name: switch_commands_command_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.switch_commands_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.switch_commands_command_id_seq OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 241
-- Name: switch_commands_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.switch_commands_command_id_seq OWNED BY public.switch_commands.command_id;


--
-- TOC entry 232 (class 1259 OID 16482)
-- Name: switch_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.switch_logs (
    log_id integer NOT NULL,
    switch_id integer NOT NULL,
    state boolean NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.switch_logs OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16481)
-- Name: switch_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.switch_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.switch_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 231
-- Name: switch_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.switch_logs_log_id_seq OWNED BY public.switch_logs.log_id;


--
-- TOC entry 226 (class 1259 OID 16442)
-- Name: switches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.switches (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    room_id integer NOT NULL,
    color bigint NOT NULL,
    icon_code integer NOT NULL,
    icon_family character varying NOT NULL,
    index integer NOT NULL,
    type integer NOT NULL,
    value smallint NOT NULL,
    token character varying(66)
);


ALTER TABLE public.switches OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16615)
-- Name: switches_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.switches_schedule (
    schedule_id integer NOT NULL,
    switch_id integer NOT NULL,
    command_id integer NOT NULL,
    scheduled_time timestamp without time zone NOT NULL,
    is_recurring boolean DEFAULT false,
    recurrence_interval interval
);


ALTER TABLE public.switches_schedule OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16614)
-- Name: switches_schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.switches_schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.switches_schedule_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 245
-- Name: switches_schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.switches_schedule_schedule_id_seq OWNED BY public.switches_schedule.schedule_id;


--
-- TOC entry 225 (class 1259 OID 16441)
-- Name: switches_switch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.switches_switch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.switches_switch_id_seq OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 225
-- Name: switches_switch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.switches_switch_id_seq OWNED BY public.switches.id;


--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    hashed_password text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.id;


--
-- TOC entry 4757 (class 2604 OID 24580)
-- Name: api_authentication auth_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_authentication ALTER COLUMN auth_id SET DEFAULT nextval('public.api_authentication_auth_id_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16535)
-- Name: camera_command_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_command_logs ALTER COLUMN log_id SET DEFAULT nextval('public.camera_command_logs_log_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 16521)
-- Name: camera_commands command_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_commands ALTER COLUMN command_id SET DEFAULT nextval('public.camera_commands_command_id_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16457)
-- Name: camera_snaps snap_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_snaps ALTER COLUMN snap_id SET DEFAULT nextval('public.camera_snaps_snap_id_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 16420)
-- Name: cameras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras ALTER COLUMN id SET DEFAULT nextval('public.cameras_camera_id_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 24604)
-- Name: general_command_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_command_logs ALTER COLUMN log_id SET DEFAULT nextval('public.general_command_logs_log_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 24595)
-- Name: general_commands command_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_commands ALTER COLUMN command_id SET DEFAULT nextval('public.general_commands_command_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16408)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_room_id_seq'::regclass);


--
-- TOC entry 4750 (class 2604 OID 16567)
-- Name: sensor_command_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_command_logs ALTER COLUMN log_id SET DEFAULT nextval('public.sensor_command_logs_log_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16553)
-- Name: sensor_commands command_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_commands ALTER COLUMN command_id SET DEFAULT nextval('public.sensor_commands_command_id_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16472)
-- Name: sensor_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_logs ALTER COLUMN log_id SET DEFAULT nextval('public.sensor_logs_log_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 24622)
-- Name: sensor_types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_types ALTER COLUMN type_id SET DEFAULT nextval('public.sensor_types_type_id_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 16432)
-- Name: sensors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensors ALTER COLUMN id SET DEFAULT nextval('public.sensors_sensor_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16599)
-- Name: switch_command_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_command_logs ALTER COLUMN log_id SET DEFAULT nextval('public.switch_command_logs_log_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 16585)
-- Name: switch_commands command_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_commands ALTER COLUMN command_id SET DEFAULT nextval('public.switch_commands_command_id_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 16485)
-- Name: switch_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_logs ALTER COLUMN log_id SET DEFAULT nextval('public.switch_logs_log_id_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16445)
-- Name: switches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switches ALTER COLUMN id SET DEFAULT nextval('public.switches_switch_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 16618)
-- Name: switches_schedule schedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switches_schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.switches_schedule_schedule_id_seq'::regclass);


--
-- TOC entry 4732 (class 2604 OID 16393)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 5001 (class 0 OID 24577)
-- Dependencies: 248
-- Data for Name: api_authentication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_authentication (auth_id, user_id, api_key, device_name, created_at, expires_at) FROM stdin;
\.


--
-- TOC entry 4989 (class 0 OID 16532)
-- Dependencies: 236
-- Data for Name: camera_command_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.camera_command_logs (log_id, camera_id, command_id, "timestamp") FROM stdin;
\.


--
-- TOC entry 4987 (class 0 OID 16518)
-- Dependencies: 234
-- Data for Name: camera_commands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.camera_commands (command_id, camera_id, command_name, description) FROM stdin;
\.


--
-- TOC entry 4981 (class 0 OID 16454)
-- Dependencies: 228
-- Data for Name: camera_snaps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.camera_snaps (snap_id, camera_id, image_url, "timestamp") FROM stdin;
\.


--
-- TOC entry 4975 (class 0 OID 16417)
-- Dependencies: 222
-- Data for Name: cameras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cameras (id, name, room_id, value, color, index, token) FROM stdin;
\.


--
-- TOC entry 5005 (class 0 OID 24601)
-- Dependencies: 252
-- Data for Name: general_command_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.general_command_logs (log_id, command_id, executed_by_user_id, "timestamp") FROM stdin;
\.


--
-- TOC entry 5003 (class 0 OID 24592)
-- Dependencies: 250
-- Data for Name: general_commands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.general_commands (command_id, command_name, description) FROM stdin;
\.


--
-- TOC entry 4973 (class 0 OID 16405)
-- Dependencies: 220
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, name, user_id, index) FROM stdin;
2	living room user1	5	0
4	kitchen	10	2
5	reading room	10	3
6	room 5	10	4
7	room 4	10	5
1	living room	10	1
3	bedroom1	10	0
999999	empty	999999	0
\.


--
-- TOC entry 4993 (class 0 OID 16564)
-- Dependencies: 240
-- Data for Name: sensor_command_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_command_logs (log_id, sensor_id, command_id, "timestamp") FROM stdin;
\.


--
-- TOC entry 4991 (class 0 OID 16550)
-- Dependencies: 238
-- Data for Name: sensor_commands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_commands (command_id, sensor_id, command_name, description) FROM stdin;
\.


--
-- TOC entry 4983 (class 0 OID 16469)
-- Dependencies: 230
-- Data for Name: sensor_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_logs (log_id, sensor_id, reading, "timestamp") FROM stdin;
\.


--
-- TOC entry 5007 (class 0 OID 24619)
-- Dependencies: 254
-- Data for Name: sensor_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_types (type_id, type_name, description) FROM stdin;
2	Motion	motion
1	Temperature	tempo
0	Power	power
\.


--
-- TOC entry 4977 (class 0 OID 16429)
-- Dependencies: 224
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensors (id, type, name, room_id, type_id, value, index, color, token) FROM stdin;
10006	powertype	Temp Sensor	5	1	2138	2	4293467747	dJVprAAXkMXWuPjqgDSPL5E47COsCt3ERyT5Z39g5qprYQvsoB19PS7FIERxOzpj
\.


--
-- TOC entry 4997 (class 0 OID 16596)
-- Dependencies: 244
-- Data for Name: switch_command_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.switch_command_logs (log_id, switch_id, command_id, "timestamp") FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 16582)
-- Dependencies: 242
-- Data for Name: switch_commands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.switch_commands (command_id, switch_id, command_name, description) FROM stdin;
\.


--
-- TOC entry 4985 (class 0 OID 16482)
-- Dependencies: 232
-- Data for Name: switch_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.switch_logs (log_id, switch_id, state, "timestamp") FROM stdin;
\.


--
-- TOC entry 4979 (class 0 OID 16442)
-- Dependencies: 226
-- Data for Name: switches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.switches (id, name, room_id, color, icon_code, icon_family, index, type, value, token) FROM stdin;
10003	lock	3	4278190080	58235	MaterialIcons	0	0	1	7sqqT6fmGod1homFZcYRbr3zZwsH5ZVKt8GrBUdEP2EHQTzCBWpRY9XaOZW59MFj
10002	lamp2	3	4294901760	58235	MaterialIcons	1	1	100	ArZKdemKTrHQps0qixC9RvK2eeqRiStYAcMV1rQjQgKoFrbwxP8ZFMWlFRtIHDLj
10005	fan	3	4280391411	58235	MaterialIcons	2	0	1	WCroiTmkIBkQyF9iioQbIybuw3Xhh8IaxUg4aR2GPjEmO5kUVdpbBED8GAoIY43L
10004	lamp3	3	4280391411	58235	MaterialIcons	3	0	1	McORX2KVsyh2YP7Sk0uiUMvUOzUJGAeGG8Ti7Mr0GHMFd0AdSuCyBOp4SKg1q4qm
10009	Heater	1	4293467747	57444	MaterialIcons	0	0	1	0WCraIZE3kItl8hPAXsql8fWuTJHdHj7r4MZo4Ja43rLh2r0GWoFOqWiAa0Kii67
\.


--
-- TOC entry 4999 (class 0 OID 16615)
-- Dependencies: 246
-- Data for Name: switches_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.switches_schedule (schedule_id, switch_id, command_id, scheduled_time, is_recurring, recurrence_interval) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, hashed_password, created_at, updated_at) FROM stdin;
5	user1	user1@HCS.com	$2a$10$qP0Gp15/gEdNPJ9.5nVHHOop0A4VSKPXAVH1pn890UOU9Tt.TQx9S	2024-12-24 04:15:03.083126	2024-12-24 04:15:03.083126
9	user2	user2@HCS.com	$2a$10$NSLYZ8jcS0ikZGPSZgIxQu84iTtDHyUjEkpUuUIjnUQzWfpvPoGJO	2024-12-24 04:28:42.501392	2024-12-24 04:28:42.501392
11	user3	user3@HCS.com	$2a$10$w6ouDCzC6ZphEGsD6HBn/e6L8lPKT9oqS0Dy7WjqkuX7InQyNmZEm	2024-12-25 10:37:13.610928	2024-12-25 10:37:13.610928
999999	empty	empty@HCS.com	$2a$10$Yd6.JAJNAdUVfloL6WyIsO9cL5UqLcbFvrYVbxOXLvWl90EDHT/ZS	2024-12-25 10:38:10.978973	2025-01-01 04:33:17.184237
10	John	admin@HCS.com	$2a$10$hkSJ7hbA.wg8maGAwQTIdudkQqJ.f3LucZrLBAAtu4siX.ASlR/JK	2024-12-25 10:30:43.469545	2025-01-09 11:24:08.475058
\.


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 247
-- Name: api_authentication_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_authentication_auth_id_seq', 1, false);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 235
-- Name: camera_command_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.camera_command_logs_log_id_seq', 1, false);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 233
-- Name: camera_commands_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.camera_commands_command_id_seq', 1, false);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 227
-- Name: camera_snaps_snap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.camera_snaps_snap_id_seq', 1, false);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 221
-- Name: cameras_camera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cameras_camera_id_seq', 1, false);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 251
-- Name: general_command_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.general_command_logs_log_id_seq', 1, false);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 249
-- Name: general_commands_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.general_commands_command_id_seq', 1, false);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 219
-- Name: rooms_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_room_id_seq', 17, true);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 239
-- Name: sensor_command_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensor_command_logs_log_id_seq', 1, false);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 237
-- Name: sensor_commands_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensor_commands_command_id_seq', 1, false);


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 229
-- Name: sensor_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensor_logs_log_id_seq', 1, false);


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 253
-- Name: sensor_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensor_types_type_id_seq', 1, false);


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 223
-- Name: sensors_sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensors_sensor_id_seq', 1, false);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 243
-- Name: switch_command_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.switch_command_logs_log_id_seq', 1, false);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 241
-- Name: switch_commands_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.switch_commands_command_id_seq', 1, false);


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 231
-- Name: switch_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.switch_logs_log_id_seq', 1, false);


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 245
-- Name: switches_schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.switches_schedule_schedule_id_seq', 1, false);


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 225
-- Name: switches_switch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.switches_switch_id_seq', 5, true);


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);


--
-- TOC entry 4796 (class 2606 OID 24585)
-- Name: api_authentication api_authentication_api_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_authentication
    ADD CONSTRAINT api_authentication_api_key_key UNIQUE (api_key);


--
-- TOC entry 4798 (class 2606 OID 24583)
-- Name: api_authentication api_authentication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_authentication
    ADD CONSTRAINT api_authentication_pkey PRIMARY KEY (auth_id);


--
-- TOC entry 4784 (class 2606 OID 16538)
-- Name: camera_command_logs camera_command_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_command_logs
    ADD CONSTRAINT camera_command_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4782 (class 2606 OID 16525)
-- Name: camera_commands camera_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_commands
    ADD CONSTRAINT camera_commands_pkey PRIMARY KEY (command_id);


--
-- TOC entry 4776 (class 2606 OID 16462)
-- Name: camera_snaps camera_snaps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_snaps
    ADD CONSTRAINT camera_snaps_pkey PRIMARY KEY (snap_id);


--
-- TOC entry 4770 (class 2606 OID 16422)
-- Name: cameras cameras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT cameras_pkey PRIMARY KEY (id);


--
-- TOC entry 4802 (class 2606 OID 24607)
-- Name: general_command_logs general_command_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_command_logs
    ADD CONSTRAINT general_command_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4800 (class 2606 OID 24599)
-- Name: general_commands general_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_commands
    ADD CONSTRAINT general_commands_pkey PRIMARY KEY (command_id);


--
-- TOC entry 4768 (class 2606 OID 16410)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4788 (class 2606 OID 16570)
-- Name: sensor_command_logs sensor_command_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_command_logs
    ADD CONSTRAINT sensor_command_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4786 (class 2606 OID 16557)
-- Name: sensor_commands sensor_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_commands
    ADD CONSTRAINT sensor_commands_pkey PRIMARY KEY (command_id);


--
-- TOC entry 4778 (class 2606 OID 16475)
-- Name: sensor_logs sensor_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_logs
    ADD CONSTRAINT sensor_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4804 (class 2606 OID 24626)
-- Name: sensor_types sensor_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_types
    ADD CONSTRAINT sensor_types_pkey PRIMARY KEY (type_id);


--
-- TOC entry 4772 (class 2606 OID 16435)
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- TOC entry 4792 (class 2606 OID 16602)
-- Name: switch_command_logs switch_command_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_command_logs
    ADD CONSTRAINT switch_command_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4790 (class 2606 OID 16589)
-- Name: switch_commands switch_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_commands
    ADD CONSTRAINT switch_commands_pkey PRIMARY KEY (command_id);


--
-- TOC entry 4780 (class 2606 OID 16488)
-- Name: switch_logs switch_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_logs
    ADD CONSTRAINT switch_logs_pkey PRIMARY KEY (log_id);


--
-- TOC entry 4774 (class 2606 OID 16447)
-- Name: switches switches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switches
    ADD CONSTRAINT switches_pkey PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2606 OID 16621)
-- Name: switches_schedule switches_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switches_schedule
    ADD CONSTRAINT switches_schedule_pkey PRIMARY KEY (schedule_id);


--
-- TOC entry 4764 (class 2606 OID 16401)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4766 (class 2606 OID 16399)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2620 OID 16403)
-- Name: users set_updated_at; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- TOC entry 4821 (class 2606 OID 24586)
-- Name: api_authentication api_authentication_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_authentication
    ADD CONSTRAINT api_authentication_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4813 (class 2606 OID 16539)
-- Name: camera_command_logs camera_command_logs_camera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_command_logs
    ADD CONSTRAINT camera_command_logs_camera_id_fkey FOREIGN KEY (camera_id) REFERENCES public.cameras(id) ON DELETE CASCADE;


--
-- TOC entry 4814 (class 2606 OID 16544)
-- Name: camera_command_logs camera_command_logs_command_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_command_logs
    ADD CONSTRAINT camera_command_logs_command_id_fkey FOREIGN KEY (command_id) REFERENCES public.camera_commands(command_id) ON DELETE CASCADE;


--
-- TOC entry 4810 (class 2606 OID 16463)
-- Name: camera_snaps camera_snaps_camera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.camera_snaps
    ADD CONSTRAINT camera_snaps_camera_id_fkey FOREIGN KEY (camera_id) REFERENCES public.cameras(id) ON DELETE CASCADE;


--
-- TOC entry 4806 (class 2606 OID 16423)
-- Name: cameras cameras_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cameras
    ADD CONSTRAINT cameras_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE CASCADE;


--
-- TOC entry 4822 (class 2606 OID 24608)
-- Name: general_command_logs general_command_logs_command_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_command_logs
    ADD CONSTRAINT general_command_logs_command_id_fkey FOREIGN KEY (command_id) REFERENCES public.general_commands(command_id) ON DELETE CASCADE;


--
-- TOC entry 4823 (class 2606 OID 24613)
-- Name: general_command_logs general_command_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_command_logs
    ADD CONSTRAINT general_command_logs_user_id_fkey FOREIGN KEY (executed_by_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4805 (class 2606 OID 16411)
-- Name: rooms rooms_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4815 (class 2606 OID 16576)
-- Name: sensor_command_logs sensor_command_logs_command_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_command_logs
    ADD CONSTRAINT sensor_command_logs_command_id_fkey FOREIGN KEY (command_id) REFERENCES public.sensor_commands(command_id) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 16571)
-- Name: sensor_command_logs sensor_command_logs_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_command_logs
    ADD CONSTRAINT sensor_command_logs_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES public.sensors(id) ON DELETE CASCADE;


--
-- TOC entry 4811 (class 2606 OID 16476)
-- Name: sensor_logs sensor_logs_sensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_logs
    ADD CONSTRAINT sensor_logs_sensor_id_fkey FOREIGN KEY (sensor_id) REFERENCES public.sensors(id) ON DELETE CASCADE;


--
-- TOC entry 4807 (class 2606 OID 16436)
-- Name: sensors sensors_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE CASCADE;


--
-- TOC entry 4808 (class 2606 OID 24627)
-- Name: sensors sensors_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.sensor_types(type_id) ON DELETE SET NULL;


--
-- TOC entry 4817 (class 2606 OID 16608)
-- Name: switch_command_logs switch_command_logs_command_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_command_logs
    ADD CONSTRAINT switch_command_logs_command_id_fkey FOREIGN KEY (command_id) REFERENCES public.switch_commands(command_id) ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 16603)
-- Name: switch_command_logs switch_command_logs_switch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_command_logs
    ADD CONSTRAINT switch_command_logs_switch_id_fkey FOREIGN KEY (switch_id) REFERENCES public.switches(id) ON DELETE CASCADE;


--
-- TOC entry 4812 (class 2606 OID 16489)
-- Name: switch_logs switch_logs_switch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switch_logs
    ADD CONSTRAINT switch_logs_switch_id_fkey FOREIGN KEY (switch_id) REFERENCES public.switches(id) ON DELETE CASCADE;


--
-- TOC entry 4809 (class 2606 OID 16448)
-- Name: switches switches_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switches
    ADD CONSTRAINT switches_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 16627)
-- Name: switches_schedule switches_schedule_command_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switches_schedule
    ADD CONSTRAINT switches_schedule_command_id_fkey FOREIGN KEY (command_id) REFERENCES public.switch_commands(command_id) ON DELETE CASCADE;


--
-- TOC entry 4820 (class 2606 OID 16622)
-- Name: switches_schedule switches_schedule_switch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.switches_schedule
    ADD CONSTRAINT switches_schedule_switch_id_fkey FOREIGN KEY (switch_id) REFERENCES public.switches(id) ON DELETE CASCADE;


-- Completed on 2025-01-12 13:17:10

--
-- PostgreSQL database dump complete
--

