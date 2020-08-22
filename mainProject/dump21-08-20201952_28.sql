--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE techacademy;




--
-- Drop roles
--

DROP ROLE postgres;
DROP ROLE techacademy;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE techacademy;
ALTER ROLE techacademy WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5183fa386be9abaeebe6e8b8f5e5ee246';






--
-- Database creation
--

CREATE DATABASE techacademy WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect techacademy

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_ratinguser; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE account_ratinguser (
    id integer NOT NULL,
    point numeric(2,1) NOT NULL,
    owner_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE account_ratinguser OWNER TO techacademy;

--
-- Name: account_ratinguser_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE account_ratinguser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_ratinguser_id_seq OWNER TO techacademy;

--
-- Name: account_ratinguser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE account_ratinguser_id_seq OWNED BY account_ratinguser.id;


--
-- Name: account_student; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE account_student (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    level_id integer NOT NULL,
    last_month_id integer NOT NULL
);


ALTER TABLE account_student OWNER TO techacademy;

--
-- Name: account_teacher; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE account_teacher (
    user_id integer NOT NULL
);


ALTER TABLE account_teacher OWNER TO techacademy;

--
-- Name: account_user; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE account_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    bio text,
    profile_img character varying(100) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE account_user OWNER TO techacademy;

--
-- Name: account_user_groups; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE account_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE account_user_groups OWNER TO techacademy;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE account_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_user_groups_id_seq OWNER TO techacademy;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE account_user_groups_id_seq OWNED BY account_user_groups.id;


--
-- Name: account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE account_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_user_id_seq OWNER TO techacademy;

--
-- Name: account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE account_user_id_seq OWNED BY account_user.id;


--
-- Name: account_user_user_permissions; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE account_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE account_user_user_permissions OWNER TO techacademy;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE account_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_user_user_permissions_id_seq OWNER TO techacademy;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE account_user_user_permissions_id_seq OWNED BY account_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE auth_group OWNER TO techacademy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO techacademy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO techacademy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO techacademy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO techacademy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO techacademy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: core_comment; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_comment (
    id integer NOT NULL,
    text text NOT NULL,
    commented_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE core_comment OWNER TO techacademy;

--
-- Name: core_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_comment_id_seq OWNER TO techacademy;

--
-- Name: core_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_comment_id_seq OWNED BY core_comment.id;


--
-- Name: core_group; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_group (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    current_month_id integer NOT NULL,
    session_id integer NOT NULL,
    teacher_id integer NOT NULL
);


ALTER TABLE core_group OWNER TO techacademy;

--
-- Name: core_group_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_group_id_seq OWNER TO techacademy;

--
-- Name: core_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_group_id_seq OWNED BY core_group.id;


--
-- Name: core_level; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_level (
    id integer NOT NULL,
    title character varying(50) NOT NULL
);


ALTER TABLE core_level OWNER TO techacademy;

--
-- Name: core_level_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_level_id_seq OWNER TO techacademy;

--
-- Name: core_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_level_id_seq OWNED BY core_level.id;


--
-- Name: core_month; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_month (
    id integer NOT NULL,
    title integer NOT NULL
);


ALTER TABLE core_month OWNER TO techacademy;

--
-- Name: core_month_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_month_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_month_id_seq OWNER TO techacademy;

--
-- Name: core_month_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_month_id_seq OWNED BY core_month.id;


--
-- Name: core_project; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_project (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    image character varying(100) NOT NULL,
    link character varying(200) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE core_project OWNER TO techacademy;

--
-- Name: core_project_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_project_id_seq OWNER TO techacademy;

--
-- Name: core_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_project_id_seq OWNED BY core_project.id;


--
-- Name: core_session; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_session (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE core_session OWNER TO techacademy;

--
-- Name: core_session_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_session_id_seq OWNER TO techacademy;

--
-- Name: core_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_session_id_seq OWNED BY core_session.id;


--
-- Name: core_subject; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_subject (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    month_id integer NOT NULL,
    session_id integer NOT NULL
);


ALTER TABLE core_subject OWNER TO techacademy;

--
-- Name: core_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_subject_id_seq OWNER TO techacademy;

--
-- Name: core_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_subject_id_seq OWNED BY core_subject.id;


--
-- Name: core_usersocialmedialink; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE core_usersocialmedialink (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    url character varying(200) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE core_usersocialmedialink OWNER TO techacademy;

--
-- Name: core_usersocialmedialink_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE core_usersocialmedialink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_usersocialmedialink_id_seq OWNER TO techacademy;

--
-- Name: core_usersocialmedialink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE core_usersocialmedialink_id_seq OWNED BY core_usersocialmedialink.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO techacademy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO techacademy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO techacademy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO techacademy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO techacademy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO techacademy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO techacademy;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE easy_thumbnails_source OWNER TO techacademy;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_source_id_seq OWNER TO techacademy;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE easy_thumbnails_thumbnail OWNER TO techacademy;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnail_id_seq OWNER TO techacademy;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE easy_thumbnails_thumbnaildimensions OWNER TO techacademy;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnaildimensions_id_seq OWNER TO techacademy;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: jet_bookmark; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE jet_bookmark (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    title character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_bookmark_user_check CHECK (("user" >= 0))
);


ALTER TABLE jet_bookmark OWNER TO techacademy;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE jet_bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jet_bookmark_id_seq OWNER TO techacademy;

--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE jet_bookmark_id_seq OWNED BY jet_bookmark.id;


--
-- Name: jet_pinnedapplication; Type: TABLE; Schema: public; Owner: techacademy
--

CREATE TABLE jet_pinnedapplication (
    id integer NOT NULL,
    app_label character varying(255) NOT NULL,
    "user" integer NOT NULL,
    date_add timestamp with time zone NOT NULL,
    CONSTRAINT jet_pinnedapplication_user_check CHECK (("user" >= 0))
);


ALTER TABLE jet_pinnedapplication OWNER TO techacademy;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: techacademy
--

CREATE SEQUENCE jet_pinnedapplication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jet_pinnedapplication_id_seq OWNER TO techacademy;

--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: techacademy
--

ALTER SEQUENCE jet_pinnedapplication_id_seq OWNED BY jet_pinnedapplication.id;


--
-- Name: account_ratinguser id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_ratinguser ALTER COLUMN id SET DEFAULT nextval('account_ratinguser_id_seq'::regclass);


--
-- Name: account_user id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user ALTER COLUMN id SET DEFAULT nextval('account_user_id_seq'::regclass);


--
-- Name: account_user_groups id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_groups ALTER COLUMN id SET DEFAULT nextval('account_user_groups_id_seq'::regclass);


--
-- Name: account_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('account_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: core_comment id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_comment ALTER COLUMN id SET DEFAULT nextval('core_comment_id_seq'::regclass);


--
-- Name: core_group id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_group ALTER COLUMN id SET DEFAULT nextval('core_group_id_seq'::regclass);


--
-- Name: core_level id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_level ALTER COLUMN id SET DEFAULT nextval('core_level_id_seq'::regclass);


--
-- Name: core_month id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_month ALTER COLUMN id SET DEFAULT nextval('core_month_id_seq'::regclass);


--
-- Name: core_project id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_project ALTER COLUMN id SET DEFAULT nextval('core_project_id_seq'::regclass);


--
-- Name: core_session id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_session ALTER COLUMN id SET DEFAULT nextval('core_session_id_seq'::regclass);


--
-- Name: core_subject id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_subject ALTER COLUMN id SET DEFAULT nextval('core_subject_id_seq'::regclass);


--
-- Name: core_usersocialmedialink id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_usersocialmedialink ALTER COLUMN id SET DEFAULT nextval('core_usersocialmedialink_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: easy_thumbnails_source id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnail id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnaildimensions id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: jet_bookmark id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY jet_bookmark ALTER COLUMN id SET DEFAULT nextval('jet_bookmark_id_seq'::regclass);


--
-- Name: jet_pinnedapplication id; Type: DEFAULT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY jet_pinnedapplication ALTER COLUMN id SET DEFAULT nextval('jet_pinnedapplication_id_seq'::regclass);


--
-- Data for Name: account_ratinguser; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY account_ratinguser (id, point, owner_id, user_id) FROM stdin;
2	3.0	2	3
3	3.0	4	2
1	4.0	2	2
\.


--
-- Name: account_ratinguser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('account_ratinguser_id_seq', 3, true);


--
-- Data for Name: account_student; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY account_student (user_id, group_id, level_id, last_month_id) FROM stdin;
2	1	1	4
3	2	2	3
6	1	2	4
\.


--
-- Data for Name: account_teacher; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY account_teacher (user_id) FROM stdin;
4
5
\.


--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY account_user (id, password, last_login, is_superuser, first_name, last_name, email, bio, profile_img, date_joined, is_staff, is_active) FROM stdin;
3	pbkdf2_sha256$180000$Yiu3Q0uK6yyW$OK1uowfk69USMYKGJqPgbLYlgLNVZuPWY7Z+foqPNS8=	\N	f	Murad	Memmedli	murad@gmail.com	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	profile-pictures/student-2.jpg	2020-08-14 16:11:18.522852+00	t	t
6	pbkdf2_sha256$180000$iUwZ7ajUmDeW$G0x0o0OL1TDuaQkef2oOxEYYxNNz5zr8YYn6Iap9vHY=	\N	f	Sara	Ahmedova	sara@gmail.com	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	profile-pictures/student-girl.jpg	2020-08-14 16:32:29.049886+00	t	t
5	pbkdf2_sha256$180000$t4zTNHstIyEy$l779Fz5hCvzfR60ytVyAnro7wVUk1QBAu5ScOfWdYoY=	\N	f	Idris	Shabanli	idris@gmail.com			2020-08-14 16:19:57.735456+00	t	t
4	pbkdf2_sha256$180000$KJyUy0DL2hBA$nA+Q/RBS6ltcBif0xuTD6RuaxapMNiQFuYhhTCUt4Y4=	2020-08-15 12:16:28.981207+00	f	Xeyal	Yediyarov	xeyal@gmail.com			2020-08-14 16:12:04.589513+00	t	t
1	pbkdf2_sha256$180000$g42j7kzAcwb6$lD9YmYVVzCGyl9/cgHXzjHhey6R267ECtilJVUcU1o0=	2020-08-20 12:06:22.150158+00	t			admin@gmail.com	\N		2020-08-14 16:09:37.79502+00	t	t
2	pbkdf2_sha256$180000$DMdRIB1XOqtw$G+iqf81yo6a0PjABTpHfraxZ6eYYM+D5XIYXb3gsRhg=	2020-08-15 12:15:21.77655+00	f	Ruhid	Shukurlu	ruhidshukurlu@gmail.com	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containingLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing	profile-pictures/2.jpg	2020-08-14 16:10:33.272661+00	t	t
\.


--
-- Data for Name: account_user_groups; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY account_user_groups (id, user_id, group_id) FROM stdin;
1	4	2
2	2	1
3	3	1
4	6	1
5	5	2
\.


--
-- Name: account_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('account_user_groups_id_seq', 5, true);


--
-- Name: account_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('account_user_id_seq', 6, true);


--
-- Data for Name: account_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY account_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('account_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY auth_group (id, name) FROM stdin;
2	teacher
1	student
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	65
2	1	66
3	1	67
4	1	68
5	1	73
6	1	42
7	1	74
8	1	44
9	1	75
11	1	76
12	1	48
14	2	69
15	2	70
16	2	72
17	2	42
18	2	44
19	2	48
20	2	82
21	2	84
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 21, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add bookmark	1	add_bookmark
2	Can change bookmark	1	change_bookmark
3	Can delete bookmark	1	delete_bookmark
4	Can view bookmark	1	view_bookmark
5	Can add pinned application	2	add_pinnedapplication
6	Can change pinned application	2	change_pinnedapplication
7	Can delete pinned application	2	delete_pinnedapplication
8	Can view pinned application	2	view_pinnedapplication
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add source	8	add_source
30	Can change source	8	change_source
31	Can delete source	8	delete_source
32	Can view source	8	view_source
33	Can add thumbnail	9	add_thumbnail
34	Can change thumbnail	9	change_thumbnail
35	Can delete thumbnail	9	delete_thumbnail
36	Can view thumbnail	9	view_thumbnail
37	Can add thumbnail dimensions	10	add_thumbnaildimensions
38	Can change thumbnail dimensions	10	change_thumbnaildimensions
39	Can delete thumbnail dimensions	10	delete_thumbnaildimensions
40	Can view thumbnail dimensions	10	view_thumbnaildimensions
41	Can add user	11	add_user
42	Can change user	11	change_user
43	Can delete user	11	delete_user
44	Can view user	11	view_user
45	Can add Student	12	add_student
46	Can change Student	12	change_student
47	Can delete Student	12	delete_student
48	Can view Student	12	view_student
49	Can add Teacher	13	add_teacher
50	Can change Teacher	13	change_teacher
51	Can delete Teacher	13	delete_teacher
52	Can view Teacher	13	view_teacher
53	Can add Rating User	14	add_ratinguser
54	Can change Rating User	14	change_ratinguser
55	Can delete Rating User	14	delete_ratinguser
56	Can view Rating User	14	view_ratinguser
57	Can add Month	15	add_month
58	Can change Month	15	change_month
59	Can delete Month	15	delete_month
60	Can view Month	15	view_month
61	Can add Session	16	add_session
62	Can change Session	16	change_session
63	Can delete Session	16	delete_session
64	Can view Session	16	view_session
65	Can add UserSocialMediaLink	17	add_usersocialmedialink
66	Can change UserSocialMediaLink	17	change_usersocialmedialink
67	Can delete UserSocialMediaLink	17	delete_usersocialmedialink
68	Can view UserSocialMediaLink	17	view_usersocialmedialink
69	Can add Subject	18	add_subject
70	Can change Subject	18	change_subject
71	Can delete Subject	18	delete_subject
72	Can view Subject	18	view_subject
73	Can add Project	19	add_project
74	Can change Project	19	change_project
75	Can delete Project	19	delete_project
76	Can view Project	19	view_project
77	Can add Level	20	add_level
78	Can change Level	20	change_level
79	Can delete Level	20	delete_level
80	Can view Level	20	view_level
81	Can add Group	21	add_group
82	Can change Group	21	change_group
83	Can delete Group	21	delete_group
84	Can view Group	21	view_group
85	Can add Comment	22	add_comment
86	Can change Comment	22	change_comment
87	Can delete Comment	22	delete_comment
88	Can view Comment	22	view_comment
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('auth_permission_id_seq', 88, true);


--
-- Data for Name: core_comment; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_comment (id, text, commented_at, updated_at, author_id, student_id) FROM stdin;
\.


--
-- Name: core_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_comment_id_seq', 1, false);


--
-- Data for Name: core_group; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_group (id, name, start_date, end_date, current_month_id, session_id, teacher_id) FROM stdin;
1	Alligator	2020-02-03	2020-07-10	4	1	4
2	TireX	2020-06-08	2020-08-19	2	1	5
3	Docker	2020-05-13	2020-08-19	3	5	5
\.


--
-- Name: core_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_group_id_seq', 3, true);


--
-- Data for Name: core_level; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_level (id, title) FROM stdin;
1	Juniour Front-end
2	Juniour Backend Developer
3	Juniour React Developer
4	Python Developer
\.


--
-- Name: core_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_level_id_seq', 4, true);


--
-- Data for Name: core_month; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_month (id, title) FROM stdin;
1	1
2	2
3	3
4	4
\.


--
-- Name: core_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_month_id_seq', 4, true);


--
-- Data for Name: core_project; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_project (id, name, image, link, student_id) FROM stdin;
1	Memory Game	project-photos/memory-game.png	https://github.com/ruhinshukurlu/Memory-Game	2
2	Word Game	project-photos/20200815_103917.png	https://github.com/ruhinshukurlu/Word-Game	2
\.


--
-- Name: core_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_project_id_seq', 2, true);


--
-- Data for Name: core_session; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_session (id, name) FROM stdin;
2	QA Automation
1	Full Stack Development
4	Backend Development
3	Frontend Development
5	React Js
\.


--
-- Name: core_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_session_id_seq', 5, true);


--
-- Data for Name: core_subject; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_subject (id, title, month_id, session_id) FROM stdin;
1	Html	1	1
2	Css	1	1
3	Javascript	1	1
4	Jquery	1	1
5	Responsive Design	1	1
6	Python	2	1
7	Python Sets vs Dictionary	2	1
8	Python Strings	2	1
9	Python Flow Control	2	1
10	Python functions	2	1
11	Python Files	3	1
12	Python exception	3	1
13	Python Data Structures	2	1
14	Python Object & Class	3	1
15	Python Generators, iterator, decorators	3	1
16	TDD - Test Driven Development	3	1
17	Database	3	1
18	Relationships in Database Design	3	1
19	Django	4	1
20	Django Creating Views	4	1
21	Template filters and tags in Django	4	1
22	Understanding Django ORM	4	1
23	Relationships	4	1
24	Working Django forms	4	1
\.


--
-- Name: core_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_subject_id_seq', 24, true);


--
-- Data for Name: core_usersocialmedialink; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY core_usersocialmedialink (id, name, url, user_id) FROM stdin;
1	facebook	https://www.facebook.com/	2
2	github	https://github.com/	2
3	linkedin	https://www.linkedin.com/	2
\.


--
-- Name: core_usersocialmedialink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('core_usersocialmedialink_id_seq', 3, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-08-14 16:10:33.36104+00	2	ruhidshukurlu@gmail.com	1	[{"added": {}}]	11	1
2	2020-08-14 16:10:38.697273+00	2	ruhidshukurlu@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	11	1
3	2020-08-14 16:11:18.607903+00	3	murad@gmail.com	1	[{"added": {}}]	11	1
4	2020-08-14 16:11:22.880265+00	3	murad@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	11	1
5	2020-08-14 16:12:04.676553+00	4	xeyal@gmail.com	1	[{"added": {}}]	11	1
6	2020-08-14 16:12:08.777326+00	4	xeyal@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	11	1
7	2020-08-14 16:12:36.687918+00	1	1 month	1	[{"added": {}}]	15	1
8	2020-08-14 16:12:41.455051+00	2	2 month	1	[{"added": {}}]	15	1
9	2020-08-14 16:12:46.146273+00	3	3 month	1	[{"added": {}}]	15	1
10	2020-08-14 16:12:51.194476+00	4	4 month	1	[{"added": {}}]	15	1
11	2020-08-14 16:13:14.687632+00	1	Juniour Front-end	1	[{"added": {}}]	20	1
12	2020-08-14 16:13:41.877701+00	2	Juniour Backend Developer	1	[{"added": {}}]	20	1
13	2020-08-14 16:17:39.712389+00	1	Web Development	1	[{"added": {}}]	16	1
14	2020-08-14 16:17:51.738039+00	2	QA Automation	1	[{"added": {}}]	16	1
15	2020-08-14 16:18:15.469158+00	4	xeyal@gmail.com	1	[{"added": {}}]	13	1
16	2020-08-14 16:19:06.339733+00	1	Alligator	1	[{"added": {}}]	21	1
17	2020-08-14 16:19:57.823523+00	5	idris@gmail.com	1	[{"added": {}}]	11	1
18	2020-08-14 16:20:02.533186+00	5	idris@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	11	1
19	2020-08-14 16:20:12.659097+00	5	idris@gmail.com	1	[{"added": {}}]	13	1
20	2020-08-14 16:20:57.982051+00	2	TireX	1	[{"added": {}}]	21	1
21	2020-08-14 16:22:03.11785+00	2	ruhidshukurlu@gmail.com	1	[{"added": {}}]	12	1
22	2020-08-14 16:22:16.40463+00	3	murad@gmail.com	1	[{"added": {}}]	12	1
23	2020-08-14 16:25:15.147797+00	1	Memory Game	1	[{"added": {}}]	19	1
24	2020-08-14 16:25:54.897696+00	1	Html	1	[{"added": {}}]	18	1
25	2020-08-14 16:26:02.349171+00	2	Css	1	[{"added": {}}]	18	1
26	2020-08-14 16:26:18.159121+00	3	Javascript	1	[{"added": {}}]	18	1
27	2020-08-14 16:26:27.782504+00	4	Jquery	1	[{"added": {}}]	18	1
28	2020-08-14 16:26:50.477172+00	5	Responsive Design	1	[{"added": {}}]	18	1
29	2020-08-14 16:31:43.252894+00	2	ruhidshukurlu@gmail.com	2	[{"changed": {"fields": ["Profile Image"]}}]	11	1
30	2020-08-14 16:31:54.21335+00	3	murad@gmail.com	2	[{"changed": {"fields": ["Profile Image"]}}]	11	1
31	2020-08-14 16:32:29.139693+00	6	sara@gmail.com	1	[{"added": {}}]	11	1
32	2020-08-14 16:32:35.682567+00	6	sara@gmail.com	2	[{"changed": {"fields": ["Is staff"]}}]	11	1
33	2020-08-14 16:32:55.939409+00	6	sara@gmail.com	1	[{"added": {}}]	12	1
34	2020-08-14 16:52:02.786125+00	2	ruhidshukurlu@gmail.com	2	[{"changed": {"fields": ["User bio"]}}]	11	1
35	2020-08-14 16:55:03.975259+00	2	ruhidshukurlu@gmail.com	2	[{"changed": {"fields": ["User bio"]}}]	11	1
36	2020-08-14 17:01:12.993933+00	4	xeyal@gmail.com	2	[{"changed": {"fields": ["Last name"]}}]	11	1
37	2020-08-14 17:01:19.878526+00	4	xeyal@gmail.com	2	[{"changed": {"fields": ["Last name"]}}]	11	1
38	2020-08-14 20:03:06.161533+00	6	sara@gmail.com	2	[{"changed": {"fields": ["User bio"]}}]	11	1
39	2020-08-14 20:03:12.997542+00	3	murad@gmail.com	2	[{"changed": {"fields": ["User bio"]}}]	11	1
40	2020-08-15 05:40:20.121086+00	6	Python	1	[{"added": {}}]	18	1
41	2020-08-15 05:41:59.834887+00	7	Python Sets vs Dictionary	1	[{"added": {}}]	18	1
42	2020-08-15 05:42:23.326621+00	8	Python Strings	1	[{"added": {}}]	18	1
43	2020-08-15 05:42:49.225932+00	9	Python Flow Control	1	[{"added": {}}]	18	1
44	2020-08-15 05:43:20.401647+00	10	Python functions	1	[{"added": {}}]	18	1
45	2020-08-15 05:43:40.706986+00	11	Python Files	1	[{"added": {}}]	18	1
46	2020-08-15 05:44:07.063308+00	12	Python exception	1	[{"added": {}}]	18	1
47	2020-08-15 05:44:23.369655+00	13	Python Data Structures	1	[{"added": {}}]	18	1
48	2020-08-15 05:44:47.546122+00	14	Python Object & Class	1	[{"added": {}}]	18	1
49	2020-08-15 05:45:29.014641+00	15	Python Generators, iterator, decorators	1	[{"added": {}}]	18	1
50	2020-08-15 05:45:55.458514+00	16	TDD - Test Driven Development	1	[{"added": {}}]	18	1
51	2020-08-15 05:46:21.69393+00	17	Database	1	[{"added": {}}]	18	1
52	2020-08-15 05:46:50.019229+00	18	Relationships in Database Design	1	[{"added": {}}]	18	1
53	2020-08-15 05:47:13.917659+00	19	Django	1	[{"added": {}}]	18	1
54	2020-08-15 05:48:02.541359+00	20	Django Creating Views	1	[{"added": {}}]	18	1
55	2020-08-15 05:48:36.127996+00	21	Template filters and tags in Django	1	[{"added": {}}]	18	1
56	2020-08-15 05:49:01.002743+00	22	Understanding Django ORM	1	[{"added": {}}]	18	1
57	2020-08-15 05:49:34.272006+00	23	Relationships	1	[{"added": {}}]	18	1
58	2020-08-15 05:52:24.331709+00	24	Working Django forms	1	[{"added": {}}]	18	1
59	2020-08-15 06:41:29.971911+00	2	Word Game	1	[{"added": {}}]	19	1
60	2020-08-15 06:59:55.000169+00	1	student	1	[{"added": {}}]	5	1
61	2020-08-15 07:04:12.711581+00	2	teacher	1	[{"added": {}}]	5	1
62	2020-08-15 07:04:30.541381+00	4	xeyal@gmail.com	2	[{"changed": {"fields": ["Groups"]}}]	11	1
63	2020-08-15 07:04:35.709001+00	2	ruhidshukurlu@gmail.com	2	[{"changed": {"fields": ["Groups"]}}]	11	1
64	2020-08-15 07:04:42.825807+00	3	murad@gmail.com	2	[{"changed": {"fields": ["Groups"]}}]	11	1
65	2020-08-15 07:04:51.873659+00	6	sara@gmail.com	2	[{"changed": {"fields": ["Groups"]}}]	11	1
66	2020-08-15 07:05:05.118776+00	5	idris@gmail.com	2	[{"changed": {"fields": ["Groups"]}}]	11	1
67	2020-08-15 07:17:34.398569+00	1	facebook	1	[{"added": {}}]	17	2
68	2020-08-15 07:18:47.72989+00	1	student	2	[{"changed": {"fields": ["Permissions"]}}]	5	1
69	2020-08-15 07:19:43.576679+00	2	ruhidshukurlu@gmail.com	2	[]	11	2
70	2020-08-15 07:20:19.937764+00	2	github	1	[{"added": {}}]	17	2
71	2020-08-15 07:20:57.674754+00	3	linkedin	1	[{"added": {}}]	17	2
72	2020-08-15 07:21:34.653647+00	2	ruhidshukurlu@gmail.com	2	[]	11	2
73	2020-08-15 10:54:53.145839+00	1	Full Stack Development	2	[{"changed": {"fields": ["Session Name"]}}]	16	1
74	2020-08-15 10:55:58.489263+00	3	Front-end Development	1	[{"added": {}}]	16	1
75	2020-08-15 10:56:09.968583+00	4	Backend Development	1	[{"added": {}}]	16	1
76	2020-08-15 10:56:16.273971+00	3	Frontend Development	2	[{"changed": {"fields": ["Session Name"]}}]	16	1
77	2020-08-15 10:56:30.034017+00	5	React Js	1	[{"added": {}}]	16	1
78	2020-08-15 11:03:39.864096+00	3	Juniour React Developer	1	[{"added": {}}]	20	1
79	2020-08-15 11:03:52.109601+00	4	Python Developer	1	[{"added": {}}]	20	1
80	2020-08-15 11:38:28.498907+00	3	Docker	1	[{"added": {}}]	21	1
81	2020-08-15 12:15:41.963363+00	2	ruhidshukurlu@gmail.com	2	[]	11	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 81, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	jet	bookmark
2	jet	pinnedapplication
3	admin	logentry
4	auth	permission
5	auth	group
6	contenttypes	contenttype
7	sessions	session
8	easy_thumbnails	source
9	easy_thumbnails	thumbnail
10	easy_thumbnails	thumbnaildimensions
11	account	user
12	account	student
13	account	teacher
14	account	ratinguser
15	core	month
16	core	session
17	core	usersocialmedialink
18	core	subject
19	core	project
20	core	level
21	core	group
22	core	comment
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('django_content_type_id_seq', 22, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-08-14 16:08:49.606785+00
2	contenttypes	0002_remove_content_type_name	2020-08-14 16:08:49.614331+00
3	auth	0001_initial	2020-08-14 16:08:49.632098+00
4	auth	0002_alter_permission_name_max_length	2020-08-14 16:08:49.648146+00
5	auth	0003_alter_user_email_max_length	2020-08-14 16:08:49.652962+00
6	auth	0004_alter_user_username_opts	2020-08-14 16:08:49.658046+00
7	auth	0005_alter_user_last_login_null	2020-08-14 16:08:49.662635+00
8	auth	0006_require_contenttypes_0002	2020-08-14 16:08:49.664712+00
9	auth	0007_alter_validators_add_error_messages	2020-08-14 16:08:49.669794+00
10	auth	0008_alter_user_username_max_length	2020-08-14 16:08:49.674131+00
11	auth	0009_alter_user_last_name_max_length	2020-08-14 16:08:49.6786+00
12	auth	0010_alter_group_name_max_length	2020-08-14 16:08:49.683592+00
13	auth	0011_update_proxy_permissions	2020-08-14 16:08:49.688453+00
14	account	0001_initial	2020-08-14 16:08:49.715617+00
15	core	0001_initial	2020-08-14 16:08:49.790036+00
16	core	0002_auto_20200814_1047	2020-08-14 16:08:49.83902+00
17	account	0002_student_group	2020-08-14 16:08:49.850965+00
18	account	0003_auto_20200813_1158	2020-08-14 16:08:49.908286+00
19	account	0004_student_level	2020-08-14 16:08:49.926755+00
20	account	0005_student_last_month	2020-08-14 16:08:49.944963+00
21	admin	0001_initial	2020-08-14 16:08:49.961458+00
22	admin	0002_logentry_remove_auto_add	2020-08-14 16:08:49.975885+00
23	admin	0003_logentry_add_action_flag_choices	2020-08-14 16:08:49.984951+00
24	easy_thumbnails	0001_initial	2020-08-14 16:08:49.998577+00
25	easy_thumbnails	0002_thumbnaildimensions	2020-08-14 16:08:50.040138+00
26	jet	0001_initial	2020-08-14 16:08:50.085096+00
27	jet	0002_delete_userdashboardmodule	2020-08-14 16:08:50.09764+00
28	sessions	0001_initial	2020-08-14 16:08:50.116113+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('django_migrations_id_seq', 28, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
dnf0cnyaabfhot2qu2ohej03ob1043fh	MGQzYzk0ZGMzMmJkYmRiY2NiYmRjNmQ1ZDc2YjU1NGIxMzYyODVmYzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjOGE0MmNjNDgwZmVkYTFjMGM0ZTdkMDZmYmEwYTI1NDhiMjI5N2QwIn0=	2020-08-29 09:55:30.440326+00
1kf31vj91kb3xk3oe4y871xc94x4c5mf	MGM4ZDM2Mzc0OTMwYTU3OTg1NWRjZDFhOWEwMjc0ZmE4NjlkMzQyZTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOGRkYzI3YjA1NzNkMDRhMGE1NzE2YTE4MjI0ZmU0MDliN2NmZjI0In0=	2020-08-29 12:16:28.982649+00
5nr7aq8f5bz81z2vcftzjlmpubevt4ei	ZjBlNjBlYWMwYmNhNWI1ODk5N2FhYTliZjkxMzIyYmVkZmNiOTJhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZGQxMWFmOTZiMDJkZGQ4YTEyZjdmZjU3ODM3YzFlOWRhMTkxOTg2In0=	2020-09-03 12:06:22.152003+00
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	project-photos/memory-game.png	2020-08-15 06:00:33.250272+00
2	f9bde26a1556cd667f742bd34ec7c55e	project-photos/20200815_103917.png	2020-08-15 06:42:59.689528+00
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 2, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	d26becbf46ac48eda79c7a39a13a02dd	project-photos/memory-game.png.100x100_q85_crop.jpg	2020-08-14 16:45:47.428545+00	1
2	d26becbf46ac48eda79c7a39a13a02dd	project-photos/memory-game.png.100x100_q85.jpg	2020-08-15 06:00:33.254455+00	1
3	d26becbf46ac48eda79c7a39a13a02dd	project-photos/20200815_103917.png.100x100_q85_crop.png	2020-08-15 06:42:59.693817+00	2
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 3, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: jet_bookmark; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY jet_bookmark (id, url, title, "user", date_add) FROM stdin;
\.


--
-- Name: jet_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('jet_bookmark_id_seq', 1, false);


--
-- Data for Name: jet_pinnedapplication; Type: TABLE DATA; Schema: public; Owner: techacademy
--

COPY jet_pinnedapplication (id, app_label, "user", date_add) FROM stdin;
\.


--
-- Name: jet_pinnedapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: techacademy
--

SELECT pg_catalog.setval('jet_pinnedapplication_id_seq', 1, false);


--
-- Name: account_ratinguser account_ratinguser_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_ratinguser
    ADD CONSTRAINT account_ratinguser_pkey PRIMARY KEY (id);


--
-- Name: account_student account_student_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_student
    ADD CONSTRAINT account_student_pkey PRIMARY KEY (user_id);


--
-- Name: account_teacher account_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_teacher
    ADD CONSTRAINT account_teacher_pkey PRIMARY KEY (user_id);


--
-- Name: account_user account_user_email_key; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user
    ADD CONSTRAINT account_user_email_key UNIQUE (email);


--
-- Name: account_user_groups account_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_groups
    ADD CONSTRAINT account_user_groups_pkey PRIMARY KEY (id);


--
-- Name: account_user_groups account_user_groups_user_id_group_id_4d09af3e_uniq; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_group_id_4d09af3e_uniq UNIQUE (user_id, group_id);


--
-- Name: account_user account_user_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user
    ADD CONSTRAINT account_user_pkey PRIMARY KEY (id);


--
-- Name: account_user_user_permissions account_user_user_permis_user_id_permission_id_48bdd28b_uniq; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_user_permissions
    ADD CONSTRAINT account_user_user_permis_user_id_permission_id_48bdd28b_uniq UNIQUE (user_id, permission_id);


--
-- Name: account_user_user_permissions account_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_user_permissions
    ADD CONSTRAINT account_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_comment core_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_comment
    ADD CONSTRAINT core_comment_pkey PRIMARY KEY (id);


--
-- Name: core_group core_group_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_group
    ADD CONSTRAINT core_group_pkey PRIMARY KEY (id);


--
-- Name: core_level core_level_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_level
    ADD CONSTRAINT core_level_pkey PRIMARY KEY (id);


--
-- Name: core_month core_month_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_month
    ADD CONSTRAINT core_month_pkey PRIMARY KEY (id);


--
-- Name: core_project core_project_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_project
    ADD CONSTRAINT core_project_pkey PRIMARY KEY (id);


--
-- Name: core_session core_session_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_session
    ADD CONSTRAINT core_session_pkey PRIMARY KEY (id);


--
-- Name: core_subject core_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_subject
    ADD CONSTRAINT core_subject_pkey PRIMARY KEY (id);


--
-- Name: core_usersocialmedialink core_usersocialmedialink_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_usersocialmedialink
    ADD CONSTRAINT core_usersocialmedialink_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_storage_hash_name_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_name_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: jet_bookmark jet_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY jet_bookmark
    ADD CONSTRAINT jet_bookmark_pkey PRIMARY KEY (id);


--
-- Name: jet_pinnedapplication jet_pinnedapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY jet_pinnedapplication
    ADD CONSTRAINT jet_pinnedapplication_pkey PRIMARY KEY (id);


--
-- Name: account_ratinguser_owner_id_43e74d51; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_ratinguser_owner_id_43e74d51 ON account_ratinguser USING btree (owner_id);


--
-- Name: account_ratinguser_user_id_1a549d3d; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_ratinguser_user_id_1a549d3d ON account_ratinguser USING btree (user_id);


--
-- Name: account_student_group_id_9d046584; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_student_group_id_9d046584 ON account_student USING btree (group_id);


--
-- Name: account_student_last_month_id_9439eb3b; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_student_last_month_id_9439eb3b ON account_student USING btree (last_month_id);


--
-- Name: account_student_level_id_8764454a; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_student_level_id_8764454a ON account_student USING btree (level_id);


--
-- Name: account_user_email_0bd7c421_like; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_user_email_0bd7c421_like ON account_user USING btree (email varchar_pattern_ops);


--
-- Name: account_user_groups_group_id_6c71f749; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_user_groups_group_id_6c71f749 ON account_user_groups USING btree (group_id);


--
-- Name: account_user_groups_user_id_14345e7b; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_user_groups_user_id_14345e7b ON account_user_groups USING btree (user_id);


--
-- Name: account_user_user_permissions_permission_id_66c44191; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_user_user_permissions_permission_id_66c44191 ON account_user_user_permissions USING btree (permission_id);


--
-- Name: account_user_user_permissions_user_id_cc42d270; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX account_user_user_permissions_user_id_cc42d270 ON account_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: core_comment_author_id_f7066c5e; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_comment_author_id_f7066c5e ON core_comment USING btree (author_id);


--
-- Name: core_comment_student_id_0fca0f5e; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_comment_student_id_0fca0f5e ON core_comment USING btree (student_id);


--
-- Name: core_group_current_month_id_6ac07044; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_group_current_month_id_6ac07044 ON core_group USING btree (current_month_id);


--
-- Name: core_group_session_id_e654143e; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_group_session_id_e654143e ON core_group USING btree (session_id);


--
-- Name: core_group_teacher_id_fe81a8cb; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_group_teacher_id_fe81a8cb ON core_group USING btree (teacher_id);


--
-- Name: core_project_student_id_0916b988; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_project_student_id_0916b988 ON core_project USING btree (student_id);


--
-- Name: core_subject_month_id_5f86bdec; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_subject_month_id_5f86bdec ON core_subject USING btree (month_id);


--
-- Name: core_subject_session_id_07fbeeb1; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_subject_session_id_07fbeeb1 ON core_subject USING btree (session_id);


--
-- Name: core_usersocialmedialink_user_id_db89c1ba; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX core_usersocialmedialink_user_id_db89c1ba ON core_usersocialmedialink USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_name_5fe0edc6; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6 ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31 ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_source_id_5b57bc77; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_thumbnail_source_id_5b57bc77 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: techacademy
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: account_ratinguser account_ratinguser_owner_id_43e74d51_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_ratinguser
    ADD CONSTRAINT account_ratinguser_owner_id_43e74d51_fk_account_user_id FOREIGN KEY (owner_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_ratinguser account_ratinguser_user_id_1a549d3d_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_ratinguser
    ADD CONSTRAINT account_ratinguser_user_id_1a549d3d_fk_account_user_id FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_student account_student_group_id_9d046584_fk_core_group_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_student
    ADD CONSTRAINT account_student_group_id_9d046584_fk_core_group_id FOREIGN KEY (group_id) REFERENCES core_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_student account_student_last_month_id_9439eb3b_fk_core_month_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_student
    ADD CONSTRAINT account_student_last_month_id_9439eb3b_fk_core_month_id FOREIGN KEY (last_month_id) REFERENCES core_month(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_student account_student_level_id_8764454a_fk_core_level_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_student
    ADD CONSTRAINT account_student_level_id_8764454a_fk_core_level_id FOREIGN KEY (level_id) REFERENCES core_level(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_student account_student_user_id_cbbf6595_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_student
    ADD CONSTRAINT account_student_user_id_cbbf6595_fk_account_user_id FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_teacher account_teacher_user_id_d5e250bb_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_teacher
    ADD CONSTRAINT account_teacher_user_id_d5e250bb_fk_account_user_id FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups account_user_groups_group_id_6c71f749_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_groups
    ADD CONSTRAINT account_user_groups_group_id_6c71f749_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups account_user_groups_user_id_14345e7b_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_14345e7b_fk_account_user_id FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_permission_id_66c44191_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_permission_id_66c44191_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_user_id_cc42d270_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_user_id_cc42d270_fk_account_u FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_author_id_f7066c5e_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_comment
    ADD CONSTRAINT core_comment_author_id_f7066c5e_fk_account_user_id FOREIGN KEY (author_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_student_id_0fca0f5e_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_comment
    ADD CONSTRAINT core_comment_student_id_0fca0f5e_fk_account_user_id FOREIGN KEY (student_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_group core_group_current_month_id_6ac07044_fk_core_month_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_group
    ADD CONSTRAINT core_group_current_month_id_6ac07044_fk_core_month_id FOREIGN KEY (current_month_id) REFERENCES core_month(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_group core_group_session_id_e654143e_fk_core_session_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_group
    ADD CONSTRAINT core_group_session_id_e654143e_fk_core_session_id FOREIGN KEY (session_id) REFERENCES core_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_group core_group_teacher_id_fe81a8cb_fk_account_teacher_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_group
    ADD CONSTRAINT core_group_teacher_id_fe81a8cb_fk_account_teacher_user_id FOREIGN KEY (teacher_id) REFERENCES account_teacher(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_project core_project_student_id_0916b988_fk_account_student_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_project
    ADD CONSTRAINT core_project_student_id_0916b988_fk_account_student_user_id FOREIGN KEY (student_id) REFERENCES account_student(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_subject core_subject_month_id_5f86bdec_fk_core_month_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_subject
    ADD CONSTRAINT core_subject_month_id_5f86bdec_fk_core_month_id FOREIGN KEY (month_id) REFERENCES core_month(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_subject core_subject_session_id_07fbeeb1_fk_core_session_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_subject
    ADD CONSTRAINT core_subject_session_id_07fbeeb1_fk_core_session_id FOREIGN KEY (session_id) REFERENCES core_session(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_usersocialmedialink core_usersocialmedialink_user_id_db89c1ba_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY core_usersocialmedialink
    ADD CONSTRAINT core_usersocialmedialink_user_id_db89c1ba_fk_account_user_id FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_account_user_id FOREIGN KEY (user_id) REFERENCES account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: techacademy
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

