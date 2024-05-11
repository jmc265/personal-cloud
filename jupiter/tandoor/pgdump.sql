--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE djangouser;
ALTER ROLE djangouser WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md58217f2755b0a2a65ab46ff9cfc42d265';






\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.22
-- Dumped by pg_dump version 11.22

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.22
-- Dumped by pg_dump version 11.22

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
-- Name: djangodb; Type: DATABASE; Schema: -; Owner: djangouser
--

CREATE DATABASE djangodb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE djangodb OWNER TO djangouser;

\connect djangodb

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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO djangouser;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO djangouser;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO djangouser;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO djangouser;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO djangouser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO djangouser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO djangouser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO djangouser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO djangouser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO djangouser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO djangouser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO djangouser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO djangouser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO djangouser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO djangouser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO djangouser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO djangouser;

--
-- Name: cookbook_automation; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_automation (
    id integer NOT NULL,
    type character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    param_1 character varying(128),
    param_2 character varying(128),
    param_3 character varying(128),
    disabled boolean NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.cookbook_automation OWNER TO djangouser;

--
-- Name: cookbook_automation_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_automation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_automation_id_seq OWNER TO djangouser;

--
-- Name: cookbook_automation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_automation_id_seq OWNED BY public.cookbook_automation.id;


--
-- Name: cookbook_bookmarkletimport; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_bookmarkletimport (
    id integer NOT NULL,
    html text NOT NULL,
    url character varying(256),
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_bookmarkletimport OWNER TO djangouser;

--
-- Name: cookbook_bookmarkletimport_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_bookmarkletimport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_bookmarkletimport_id_seq OWNER TO djangouser;

--
-- Name: cookbook_bookmarkletimport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_bookmarkletimport_id_seq OWNED BY public.cookbook_bookmarkletimport.id;


--
-- Name: cookbook_comment; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_comment (
    id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.cookbook_comment OWNER TO djangouser;

--
-- Name: cookbook_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_comment_id_seq OWNER TO djangouser;

--
-- Name: cookbook_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_comment_id_seq OWNED BY public.cookbook_comment.id;


--
-- Name: cookbook_cooklog; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_cooklog (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    rating integer,
    servings integer NOT NULL,
    created_by_id integer NOT NULL,
    recipe_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_cooklog OWNER TO djangouser;

--
-- Name: cookbook_cooklog_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_cooklog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_cooklog_id_seq OWNER TO djangouser;

--
-- Name: cookbook_cooklog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_cooklog_id_seq OWNED BY public.cookbook_cooklog.id;


--
-- Name: cookbook_customfilter; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_customfilter (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    type character varying(128) NOT NULL,
    search text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_customfilter OWNER TO djangouser;

--
-- Name: cookbook_customfilter_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_customfilter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_customfilter_id_seq OWNER TO djangouser;

--
-- Name: cookbook_customfilter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_customfilter_id_seq OWNED BY public.cookbook_customfilter.id;


--
-- Name: cookbook_customfilter_shared; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_customfilter_shared (
    id integer NOT NULL,
    customfilter_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_customfilter_shared OWNER TO djangouser;

--
-- Name: cookbook_customfilter_shared_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_customfilter_shared_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_customfilter_shared_id_seq OWNER TO djangouser;

--
-- Name: cookbook_customfilter_shared_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_customfilter_shared_id_seq OWNED BY public.cookbook_customfilter_shared.id;


--
-- Name: cookbook_exportlog; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_exportlog (
    id integer NOT NULL,
    type character varying(32) NOT NULL,
    running boolean NOT NULL,
    msg text NOT NULL,
    total_recipes integer NOT NULL,
    exported_recipes integer NOT NULL,
    cache_duration integer NOT NULL,
    possibly_not_expired boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_exportlog OWNER TO djangouser;

--
-- Name: cookbook_exportlog_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_exportlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_exportlog_id_seq OWNER TO djangouser;

--
-- Name: cookbook_exportlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_exportlog_id_seq OWNED BY public.cookbook_exportlog.id;


--
-- Name: cookbook_food; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_food (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    recipe_id integer,
    description text NOT NULL,
    supermarket_category_id integer,
    ignore_shopping boolean NOT NULL,
    space_id integer NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    path character varying(255) NOT NULL,
    substitute_children boolean NOT NULL,
    substitute_siblings boolean NOT NULL,
    plural_name character varying(128),
    fdc_id character varying(128),
    open_data_slug character varying(128),
    preferred_shopping_unit_id integer,
    preferred_unit_id integer,
    properties_food_amount numeric(16,2) NOT NULL,
    properties_food_unit_id integer,
    url character varying(1024),
    CONSTRAINT cookbook_food_depth_check CHECK ((depth >= 0)),
    CONSTRAINT cookbook_food_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.cookbook_food OWNER TO djangouser;

--
-- Name: cookbook_food_child_inherit_fields; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_food_child_inherit_fields (
    id integer NOT NULL,
    food_id integer NOT NULL,
    foodinheritfield_id integer NOT NULL
);


ALTER TABLE public.cookbook_food_child_inherit_fields OWNER TO djangouser;

--
-- Name: cookbook_food_child_inherit_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_food_child_inherit_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_food_child_inherit_fields_id_seq OWNER TO djangouser;

--
-- Name: cookbook_food_child_inherit_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_food_child_inherit_fields_id_seq OWNED BY public.cookbook_food_child_inherit_fields.id;


--
-- Name: cookbook_food_inherit_fields; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_food_inherit_fields (
    id integer NOT NULL,
    food_id integer NOT NULL,
    foodinheritfield_id integer NOT NULL
);


ALTER TABLE public.cookbook_food_inherit_fields OWNER TO djangouser;

--
-- Name: cookbook_food_inherit_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_food_inherit_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_food_inherit_fields_id_seq OWNER TO djangouser;

--
-- Name: cookbook_food_inherit_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_food_inherit_fields_id_seq OWNED BY public.cookbook_food_inherit_fields.id;


--
-- Name: cookbook_food_onhand_users; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_food_onhand_users (
    id integer NOT NULL,
    food_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_food_onhand_users OWNER TO djangouser;

--
-- Name: cookbook_food_onhand_users_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_food_onhand_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_food_onhand_users_id_seq OWNER TO djangouser;

--
-- Name: cookbook_food_onhand_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_food_onhand_users_id_seq OWNED BY public.cookbook_food_onhand_users.id;


--
-- Name: cookbook_foodproperty; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_foodproperty (
    id integer NOT NULL,
    food_id integer NOT NULL,
    property_id integer NOT NULL
);


ALTER TABLE public.cookbook_foodproperty OWNER TO djangouser;

--
-- Name: cookbook_food_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

ALTER TABLE public.cookbook_foodproperty ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cookbook_food_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cookbook_food_substitute; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_food_substitute (
    id integer NOT NULL,
    from_food_id integer NOT NULL,
    to_food_id integer NOT NULL
);


ALTER TABLE public.cookbook_food_substitute OWNER TO djangouser;

--
-- Name: cookbook_food_substitute_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_food_substitute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_food_substitute_id_seq OWNER TO djangouser;

--
-- Name: cookbook_food_substitute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_food_substitute_id_seq OWNED BY public.cookbook_food_substitute.id;


--
-- Name: cookbook_foodinheritfield; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_foodinheritfield (
    id integer NOT NULL,
    field character varying(32) NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.cookbook_foodinheritfield OWNER TO djangouser;

--
-- Name: cookbook_foodinheritfield_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_foodinheritfield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_foodinheritfield_id_seq OWNER TO djangouser;

--
-- Name: cookbook_foodinheritfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_foodinheritfield_id_seq OWNED BY public.cookbook_foodinheritfield.id;


--
-- Name: cookbook_importlog; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_importlog (
    id integer NOT NULL,
    type character varying(32) NOT NULL,
    running boolean NOT NULL,
    msg text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    keyword_id integer,
    space_id integer NOT NULL,
    imported_recipes integer NOT NULL,
    total_recipes integer NOT NULL
);


ALTER TABLE public.cookbook_importlog OWNER TO djangouser;

--
-- Name: cookbook_importlog_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_importlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_importlog_id_seq OWNER TO djangouser;

--
-- Name: cookbook_importlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_importlog_id_seq OWNED BY public.cookbook_importlog.id;


--
-- Name: cookbook_ingredient; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_ingredient (
    id integer NOT NULL,
    amount numeric(32,16) NOT NULL,
    unit_id integer,
    food_id integer,
    note character varying(256),
    "order" integer NOT NULL,
    is_header boolean NOT NULL,
    no_amount boolean NOT NULL,
    space_id integer NOT NULL,
    original_text character varying(512),
    always_use_plural_food boolean NOT NULL,
    always_use_plural_unit boolean NOT NULL
);


ALTER TABLE public.cookbook_ingredient OWNER TO djangouser;

--
-- Name: cookbook_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_ingredient_id_seq OWNER TO djangouser;

--
-- Name: cookbook_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_ingredient_id_seq OWNED BY public.cookbook_food.id;


--
-- Name: cookbook_invitelink; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_invitelink (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    valid_until date NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    used_by_id integer,
    group_id integer NOT NULL,
    space_id integer NOT NULL,
    email character varying(254) NOT NULL,
    reusable boolean NOT NULL,
    internal_note text
);


ALTER TABLE public.cookbook_invitelink OWNER TO djangouser;

--
-- Name: cookbook_invitelink_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_invitelink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_invitelink_id_seq OWNER TO djangouser;

--
-- Name: cookbook_invitelink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_invitelink_id_seq OWNED BY public.cookbook_invitelink.id;


--
-- Name: cookbook_keyword; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_keyword (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    icon character varying(16),
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    space_id integer NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    path character varying(255) NOT NULL,
    CONSTRAINT cookbook_keyword_depth_check CHECK ((depth >= 0)),
    CONSTRAINT cookbook_keyword_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.cookbook_keyword OWNER TO djangouser;

--
-- Name: cookbook_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_keyword_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_keyword_id_seq OWNER TO djangouser;

--
-- Name: cookbook_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_keyword_id_seq OWNED BY public.cookbook_keyword.id;


--
-- Name: cookbook_mealplan; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_mealplan (
    id integer NOT NULL,
    note text NOT NULL,
    date date NOT NULL,
    recipe_id integer,
    created_by_id integer NOT NULL,
    title character varying(64) NOT NULL,
    meal_type_id integer NOT NULL,
    servings numeric(8,4) NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_mealplan OWNER TO djangouser;

--
-- Name: cookbook_mealplan_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_mealplan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_mealplan_id_seq OWNER TO djangouser;

--
-- Name: cookbook_mealplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_mealplan_id_seq OWNED BY public.cookbook_mealplan.id;


--
-- Name: cookbook_mealplan_shared; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_mealplan_shared (
    id integer NOT NULL,
    mealplan_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_mealplan_shared OWNER TO djangouser;

--
-- Name: cookbook_mealplan_shared_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_mealplan_shared_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_mealplan_shared_id_seq OWNER TO djangouser;

--
-- Name: cookbook_mealplan_shared_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_mealplan_shared_id_seq OWNED BY public.cookbook_mealplan_shared.id;


--
-- Name: cookbook_mealtype; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_mealtype (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    "order" integer NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL,
    color character varying(7),
    icon character varying(16),
    "default" boolean NOT NULL
);


ALTER TABLE public.cookbook_mealtype OWNER TO djangouser;

--
-- Name: cookbook_mealtype_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_mealtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_mealtype_id_seq OWNER TO djangouser;

--
-- Name: cookbook_mealtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_mealtype_id_seq OWNED BY public.cookbook_mealtype.id;


--
-- Name: cookbook_nutritioninformation; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_nutritioninformation (
    id integer NOT NULL,
    fats numeric(32,16) NOT NULL,
    carbohydrates numeric(32,16) NOT NULL,
    proteins numeric(32,16) NOT NULL,
    calories numeric(32,16) NOT NULL,
    source character varying(512),
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_nutritioninformation OWNER TO djangouser;

--
-- Name: cookbook_nutritioninformation_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_nutritioninformation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_nutritioninformation_id_seq OWNER TO djangouser;

--
-- Name: cookbook_nutritioninformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_nutritioninformation_id_seq OWNED BY public.cookbook_nutritioninformation.id;


--
-- Name: cookbook_property; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_property (
    id integer NOT NULL,
    property_amount numeric(32,4) NOT NULL,
    property_type_id integer NOT NULL,
    space_id integer NOT NULL,
    import_food_id integer
);


ALTER TABLE public.cookbook_property OWNER TO djangouser;

--
-- Name: cookbook_property_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

ALTER TABLE public.cookbook_property ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cookbook_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cookbook_propertytype; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_propertytype (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    unit character varying(64),
    icon character varying(16),
    description character varying(512),
    category character varying(64),
    open_data_slug character varying(128),
    space_id integer NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.cookbook_propertytype OWNER TO djangouser;

--
-- Name: cookbook_propertytype_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

ALTER TABLE public.cookbook_propertytype ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cookbook_propertytype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cookbook_recipe; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipe (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    file_uid character varying(256) NOT NULL,
    file_path character varying(512) NOT NULL,
    link character varying(512),
    working_time integer NOT NULL,
    internal boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    storage_id integer,
    image character varying(100),
    waiting_time integer NOT NULL,
    cors_link character varying(1024),
    nutrition_id integer,
    servings integer NOT NULL,
    description character varying(512),
    servings_text character varying(32) NOT NULL,
    space_id integer NOT NULL,
    desc_search_vector tsvector,
    name_search_vector tsvector,
    source_url character varying(1024),
    show_ingredient_overview boolean NOT NULL,
    private boolean NOT NULL
);


ALTER TABLE public.cookbook_recipe OWNER TO djangouser;

--
-- Name: cookbook_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipe_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipe_id_seq OWNED BY public.cookbook_recipe.id;


--
-- Name: cookbook_recipe_keywords; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipe_keywords (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    keyword_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipe_keywords OWNER TO djangouser;

--
-- Name: cookbook_recipe_keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipe_keywords_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipe_keywords_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipe_keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipe_keywords_id_seq OWNED BY public.cookbook_recipe_keywords.id;


--
-- Name: cookbook_recipe_properties; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipe_properties (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    property_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipe_properties OWNER TO djangouser;

--
-- Name: cookbook_recipe_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

ALTER TABLE public.cookbook_recipe_properties ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cookbook_recipe_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cookbook_recipe_shared; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipe_shared (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipe_shared OWNER TO djangouser;

--
-- Name: cookbook_recipe_shared_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipe_shared_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipe_shared_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipe_shared_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipe_shared_id_seq OWNED BY public.cookbook_recipe_shared.id;


--
-- Name: cookbook_recipe_steps; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipe_steps (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    step_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipe_steps OWNER TO djangouser;

--
-- Name: cookbook_recipe_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipe_steps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipe_steps_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipe_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipe_steps_id_seq OWNED BY public.cookbook_recipe_steps.id;


--
-- Name: cookbook_recipebook; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipebook (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    created_by_id integer NOT NULL,
    description text NOT NULL,
    icon character varying(16),
    space_id integer NOT NULL,
    filter_id integer
);


ALTER TABLE public.cookbook_recipebook OWNER TO djangouser;

--
-- Name: cookbook_recipebook_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipebook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipebook_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipebook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipebook_id_seq OWNED BY public.cookbook_recipebook.id;


--
-- Name: cookbook_recipebook_shared; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipebook_shared (
    id integer NOT NULL,
    recipebook_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipebook_shared OWNER TO djangouser;

--
-- Name: cookbook_recipebook_shared_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipebook_shared_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipebook_shared_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipebook_shared_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipebook_shared_id_seq OWNED BY public.cookbook_recipebook_shared.id;


--
-- Name: cookbook_recipebookentry; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipebookentry (
    id integer NOT NULL,
    book_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipebookentry OWNER TO djangouser;

--
-- Name: cookbook_recipebookentry_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipebookentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipebookentry_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipebookentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipebookentry_id_seq OWNED BY public.cookbook_recipebookentry.id;


--
-- Name: cookbook_recipeimport; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_recipeimport (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    file_uid character varying(256) NOT NULL,
    file_path character varying(512) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    storage_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_recipeimport OWNER TO djangouser;

--
-- Name: cookbook_recipeimport_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipeimport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipeimport_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipeimport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipeimport_id_seq OWNED BY public.cookbook_recipeimport.id;


--
-- Name: cookbook_recipeingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_recipeingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_recipeingredients_id_seq OWNER TO djangouser;

--
-- Name: cookbook_recipeingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_recipeingredients_id_seq OWNED BY public.cookbook_ingredient.id;


--
-- Name: cookbook_searchfields; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_searchfields (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    field character varying(64) NOT NULL
);


ALTER TABLE public.cookbook_searchfields OWNER TO djangouser;

--
-- Name: cookbook_searchfields_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_searchfields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_searchfields_id_seq OWNER TO djangouser;

--
-- Name: cookbook_searchfields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_searchfields_id_seq OWNED BY public.cookbook_searchfields.id;


--
-- Name: cookbook_searchpreference; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_searchpreference (
    user_id integer NOT NULL,
    search character varying(32) NOT NULL,
    lookup boolean NOT NULL,
    trigram_threshold numeric(3,2) NOT NULL
);


ALTER TABLE public.cookbook_searchpreference OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_fulltext; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_searchpreference_fulltext (
    id integer NOT NULL,
    searchpreference_id integer NOT NULL,
    searchfields_id integer NOT NULL
);


ALTER TABLE public.cookbook_searchpreference_fulltext OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_fulltext_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_searchpreference_fulltext_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_searchpreference_fulltext_id_seq OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_fulltext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_searchpreference_fulltext_id_seq OWNED BY public.cookbook_searchpreference_fulltext.id;


--
-- Name: cookbook_searchpreference_icontains; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_searchpreference_icontains (
    id integer NOT NULL,
    searchpreference_id integer NOT NULL,
    searchfields_id integer NOT NULL
);


ALTER TABLE public.cookbook_searchpreference_icontains OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_icontains_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_searchpreference_icontains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_searchpreference_icontains_id_seq OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_icontains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_searchpreference_icontains_id_seq OWNED BY public.cookbook_searchpreference_icontains.id;


--
-- Name: cookbook_searchpreference_istartswith; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_searchpreference_istartswith (
    id integer NOT NULL,
    searchpreference_id integer NOT NULL,
    searchfields_id integer NOT NULL
);


ALTER TABLE public.cookbook_searchpreference_istartswith OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_istartswith_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_searchpreference_istartswith_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_searchpreference_istartswith_id_seq OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_istartswith_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_searchpreference_istartswith_id_seq OWNED BY public.cookbook_searchpreference_istartswith.id;


--
-- Name: cookbook_searchpreference_trigram; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_searchpreference_trigram (
    id integer NOT NULL,
    searchpreference_id integer NOT NULL,
    searchfields_id integer NOT NULL
);


ALTER TABLE public.cookbook_searchpreference_trigram OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_trigram_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_searchpreference_trigram_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_searchpreference_trigram_id_seq OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_trigram_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_searchpreference_trigram_id_seq OWNED BY public.cookbook_searchpreference_trigram.id;


--
-- Name: cookbook_searchpreference_unaccent; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_searchpreference_unaccent (
    id integer NOT NULL,
    searchpreference_id integer NOT NULL,
    searchfields_id integer NOT NULL
);


ALTER TABLE public.cookbook_searchpreference_unaccent OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_unaccent_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_searchpreference_unaccent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_searchpreference_unaccent_id_seq OWNER TO djangouser;

--
-- Name: cookbook_searchpreference_unaccent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_searchpreference_unaccent_id_seq OWNED BY public.cookbook_searchpreference_unaccent.id;


--
-- Name: cookbook_sharelink; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_sharelink (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    recipe_id integer NOT NULL,
    space_id integer NOT NULL,
    request_count integer NOT NULL,
    abuse_blocked boolean NOT NULL
);


ALTER TABLE public.cookbook_sharelink OWNER TO djangouser;

--
-- Name: cookbook_sharelink_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_sharelink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_sharelink_id_seq OWNER TO djangouser;

--
-- Name: cookbook_sharelink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_sharelink_id_seq OWNED BY public.cookbook_sharelink.id;


--
-- Name: cookbook_shoppinglist; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_shoppinglist (
    id integer NOT NULL,
    uuid uuid NOT NULL,
    note text,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    finished boolean NOT NULL,
    supermarket_id integer,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_shoppinglist OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_entries; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_shoppinglist_entries (
    id integer NOT NULL,
    shoppinglist_id integer NOT NULL,
    shoppinglistentry_id integer NOT NULL
);


ALTER TABLE public.cookbook_shoppinglist_entries OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_shoppinglist_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_shoppinglist_entries_id_seq OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_shoppinglist_entries_id_seq OWNED BY public.cookbook_shoppinglist_entries.id;


--
-- Name: cookbook_shoppinglist_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_shoppinglist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_shoppinglist_id_seq OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_shoppinglist_id_seq OWNED BY public.cookbook_shoppinglist.id;


--
-- Name: cookbook_shoppinglist_recipes; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_shoppinglist_recipes (
    id integer NOT NULL,
    shoppinglist_id integer NOT NULL,
    shoppinglistrecipe_id integer NOT NULL
);


ALTER TABLE public.cookbook_shoppinglist_recipes OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_shoppinglist_recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_shoppinglist_recipes_id_seq OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_shoppinglist_recipes_id_seq OWNED BY public.cookbook_shoppinglist_recipes.id;


--
-- Name: cookbook_shoppinglist_shared; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_shoppinglist_shared (
    id integer NOT NULL,
    shoppinglist_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_shoppinglist_shared OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_shared_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_shoppinglist_shared_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_shoppinglist_shared_id_seq OWNER TO djangouser;

--
-- Name: cookbook_shoppinglist_shared_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_shoppinglist_shared_id_seq OWNED BY public.cookbook_shoppinglist_shared.id;


--
-- Name: cookbook_shoppinglistentry; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_shoppinglistentry (
    id integer NOT NULL,
    amount numeric(32,16) NOT NULL,
    "order" integer NOT NULL,
    checked boolean NOT NULL,
    food_id integer NOT NULL,
    list_recipe_id integer,
    unit_id integer,
    completed_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL,
    ingredient_id integer,
    delay_until timestamp with time zone
);


ALTER TABLE public.cookbook_shoppinglistentry OWNER TO djangouser;

--
-- Name: cookbook_shoppinglistentry_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_shoppinglistentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_shoppinglistentry_id_seq OWNER TO djangouser;

--
-- Name: cookbook_shoppinglistentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_shoppinglistentry_id_seq OWNED BY public.cookbook_shoppinglistentry.id;


--
-- Name: cookbook_shoppinglistrecipe; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_shoppinglistrecipe (
    id integer NOT NULL,
    servings numeric(8,4) NOT NULL,
    recipe_id integer,
    mealplan_id integer,
    name character varying(32) NOT NULL
);


ALTER TABLE public.cookbook_shoppinglistrecipe OWNER TO djangouser;

--
-- Name: cookbook_shoppinglistrecipe_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_shoppinglistrecipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_shoppinglistrecipe_id_seq OWNER TO djangouser;

--
-- Name: cookbook_shoppinglistrecipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_shoppinglistrecipe_id_seq OWNED BY public.cookbook_shoppinglistrecipe.id;


--
-- Name: cookbook_space; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_space (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    message character varying(512) NOT NULL,
    created_by_id integer,
    max_recipes integer NOT NULL,
    max_users integer NOT NULL,
    demo boolean NOT NULL,
    max_file_storage_mb integer NOT NULL,
    allow_sharing boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    show_facet_count boolean NOT NULL,
    image_id integer,
    use_plural boolean NOT NULL,
    no_sharing_limit boolean NOT NULL,
    internal_note text
);


ALTER TABLE public.cookbook_space OWNER TO djangouser;

--
-- Name: cookbook_space_food_inherit; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_space_food_inherit (
    id integer NOT NULL,
    space_id integer NOT NULL,
    foodinheritfield_id integer NOT NULL
);


ALTER TABLE public.cookbook_space_food_inherit OWNER TO djangouser;

--
-- Name: cookbook_space_food_inherit_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_space_food_inherit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_space_food_inherit_id_seq OWNER TO djangouser;

--
-- Name: cookbook_space_food_inherit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_space_food_inherit_id_seq OWNED BY public.cookbook_space_food_inherit.id;


--
-- Name: cookbook_space_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_space_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_space_id_seq OWNER TO djangouser;

--
-- Name: cookbook_space_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_space_id_seq OWNED BY public.cookbook_space.id;


--
-- Name: cookbook_step; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_step (
    id integer NOT NULL,
    instruction text NOT NULL,
    "order" integer NOT NULL,
    name character varying(128) NOT NULL,
    "time" integer NOT NULL,
    show_as_header boolean NOT NULL,
    file_id integer,
    space_id integer NOT NULL,
    step_recipe_id integer,
    search_vector tsvector,
    show_ingredients_table boolean NOT NULL
);


ALTER TABLE public.cookbook_step OWNER TO djangouser;

--
-- Name: cookbook_step_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_step_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_step_id_seq OWNER TO djangouser;

--
-- Name: cookbook_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_step_id_seq OWNED BY public.cookbook_step.id;


--
-- Name: cookbook_step_ingredients; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_step_ingredients (
    id integer NOT NULL,
    step_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.cookbook_step_ingredients OWNER TO djangouser;

--
-- Name: cookbook_step_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_step_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_step_ingredients_id_seq OWNER TO djangouser;

--
-- Name: cookbook_step_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_step_ingredients_id_seq OWNED BY public.cookbook_step_ingredients.id;


--
-- Name: cookbook_storage; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_storage (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    method character varying(128) NOT NULL,
    username character varying(128),
    password character varying(128),
    token character varying(512),
    url character varying(200),
    created_by_id integer NOT NULL,
    path character varying(256) NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_storage OWNER TO djangouser;

--
-- Name: cookbook_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_storage_id_seq OWNER TO djangouser;

--
-- Name: cookbook_storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_storage_id_seq OWNED BY public.cookbook_storage.id;


--
-- Name: cookbook_supermarket; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_supermarket (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    space_id integer NOT NULL,
    open_data_slug character varying(128)
);


ALTER TABLE public.cookbook_supermarket OWNER TO djangouser;

--
-- Name: cookbook_supermarket_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_supermarket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_supermarket_id_seq OWNER TO djangouser;

--
-- Name: cookbook_supermarket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_supermarket_id_seq OWNED BY public.cookbook_supermarket.id;


--
-- Name: cookbook_supermarketcategory; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_supermarketcategory (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    space_id integer NOT NULL,
    open_data_slug character varying(128)
);


ALTER TABLE public.cookbook_supermarketcategory OWNER TO djangouser;

--
-- Name: cookbook_supermarketcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_supermarketcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_supermarketcategory_id_seq OWNER TO djangouser;

--
-- Name: cookbook_supermarketcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_supermarketcategory_id_seq OWNED BY public.cookbook_supermarketcategory.id;


--
-- Name: cookbook_supermarketcategoryrelation; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_supermarketcategoryrelation (
    id integer NOT NULL,
    "order" integer NOT NULL,
    category_id integer NOT NULL,
    supermarket_id integer NOT NULL
);


ALTER TABLE public.cookbook_supermarketcategoryrelation OWNER TO djangouser;

--
-- Name: cookbook_supermarketcategoryrelation_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_supermarketcategoryrelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_supermarketcategoryrelation_id_seq OWNER TO djangouser;

--
-- Name: cookbook_supermarketcategoryrelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_supermarketcategoryrelation_id_seq OWNED BY public.cookbook_supermarketcategoryrelation.id;


--
-- Name: cookbook_sync; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_sync (
    id integer NOT NULL,
    path character varying(512) NOT NULL,
    active boolean NOT NULL,
    last_checked timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    storage_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_sync OWNER TO djangouser;

--
-- Name: cookbook_sync_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_sync_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_sync_id_seq OWNER TO djangouser;

--
-- Name: cookbook_sync_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_sync_id_seq OWNED BY public.cookbook_sync.id;


--
-- Name: cookbook_synclog; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_synclog (
    id integer NOT NULL,
    status character varying(32) NOT NULL,
    msg text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    sync_id integer NOT NULL
);


ALTER TABLE public.cookbook_synclog OWNER TO djangouser;

--
-- Name: cookbook_synclog_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_synclog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_synclog_id_seq OWNER TO djangouser;

--
-- Name: cookbook_synclog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_synclog_id_seq OWNED BY public.cookbook_synclog.id;


--
-- Name: cookbook_telegrambot; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_telegrambot (
    id integer NOT NULL,
    token character varying(256) NOT NULL,
    name character varying(128) NOT NULL,
    chat_id character varying(128) NOT NULL,
    webhook_token uuid NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_telegrambot OWNER TO djangouser;

--
-- Name: cookbook_telegrambot_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_telegrambot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_telegrambot_id_seq OWNER TO djangouser;

--
-- Name: cookbook_telegrambot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_telegrambot_id_seq OWNED BY public.cookbook_telegrambot.id;


--
-- Name: cookbook_unit; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_unit (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    space_id integer NOT NULL,
    plural_name character varying(128),
    base_unit text,
    open_data_slug character varying(128)
);


ALTER TABLE public.cookbook_unit OWNER TO djangouser;

--
-- Name: cookbook_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_unit_id_seq OWNER TO djangouser;

--
-- Name: cookbook_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_unit_id_seq OWNED BY public.cookbook_unit.id;


--
-- Name: cookbook_unitconversion; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_unitconversion (
    id integer NOT NULL,
    base_amount numeric(32,16) NOT NULL,
    converted_amount numeric(32,16) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    open_data_slug character varying(128),
    base_unit_id integer NOT NULL,
    converted_unit_id integer NOT NULL,
    created_by_id integer NOT NULL,
    food_id integer,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_unitconversion OWNER TO djangouser;

--
-- Name: cookbook_unitconversion_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

ALTER TABLE public.cookbook_unitconversion ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cookbook_unitconversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cookbook_userfile; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_userfile (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    file character varying(100) NOT NULL,
    file_size_kb integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_userfile OWNER TO djangouser;

--
-- Name: cookbook_userfile_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_userfile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_userfile_id_seq OWNER TO djangouser;

--
-- Name: cookbook_userfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_userfile_id_seq OWNED BY public.cookbook_userfile.id;


--
-- Name: cookbook_userpreference; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_userpreference (
    theme character varying(128) NOT NULL,
    user_id integer NOT NULL,
    nav_color character varying(128) NOT NULL,
    default_unit character varying(32) NOT NULL,
    default_page character varying(64) NOT NULL,
    ingredient_decimals integer NOT NULL,
    comments boolean NOT NULL,
    shopping_auto_sync integer NOT NULL,
    use_fractions boolean NOT NULL,
    sticky_navbar boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    use_kj boolean NOT NULL,
    mealplan_autoadd_shopping boolean NOT NULL,
    mealplan_autoexclude_onhand boolean NOT NULL,
    mealplan_autoinclude_related boolean NOT NULL,
    default_delay numeric(8,4) NOT NULL,
    filter_to_supermarket boolean NOT NULL,
    shopping_recent_days integer NOT NULL,
    csv_delim character varying(2) NOT NULL,
    csv_prefix character varying(10) NOT NULL,
    shopping_add_onhand boolean NOT NULL,
    left_handed boolean NOT NULL,
    image_id integer,
    show_step_ingredients boolean NOT NULL,
    CONSTRAINT cookbook_userpreference_shopping_recent_days_check CHECK ((shopping_recent_days >= 0))
);


ALTER TABLE public.cookbook_userpreference OWNER TO djangouser;

--
-- Name: cookbook_userpreference_plan_share; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_userpreference_plan_share (
    id integer NOT NULL,
    userpreference_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_userpreference_plan_share OWNER TO djangouser;

--
-- Name: cookbook_userpreference_plan_share_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_userpreference_plan_share_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_userpreference_plan_share_id_seq OWNER TO djangouser;

--
-- Name: cookbook_userpreference_plan_share_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_userpreference_plan_share_id_seq OWNED BY public.cookbook_userpreference_plan_share.id;


--
-- Name: cookbook_userpreference_shopping_share; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_userpreference_shopping_share (
    id integer NOT NULL,
    userpreference_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.cookbook_userpreference_shopping_share OWNER TO djangouser;

--
-- Name: cookbook_userpreference_shopping_share_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_userpreference_shopping_share_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_userpreference_shopping_share_id_seq OWNER TO djangouser;

--
-- Name: cookbook_userpreference_shopping_share_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_userpreference_shopping_share_id_seq OWNED BY public.cookbook_userpreference_shopping_share.id;


--
-- Name: cookbook_userspace; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_userspace (
    id integer NOT NULL,
    active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    space_id integer NOT NULL,
    user_id integer NOT NULL,
    internal_note text,
    invite_link_id integer
);


ALTER TABLE public.cookbook_userspace OWNER TO djangouser;

--
-- Name: cookbook_userspace_groups; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_userspace_groups (
    id integer NOT NULL,
    userspace_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.cookbook_userspace_groups OWNER TO djangouser;

--
-- Name: cookbook_userspace_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_userspace_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_userspace_groups_id_seq OWNER TO djangouser;

--
-- Name: cookbook_userspace_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_userspace_groups_id_seq OWNED BY public.cookbook_userspace_groups.id;


--
-- Name: cookbook_userspace_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_userspace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_userspace_id_seq OWNER TO djangouser;

--
-- Name: cookbook_userspace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_userspace_id_seq OWNED BY public.cookbook_userspace.id;


--
-- Name: cookbook_viewlog; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.cookbook_viewlog (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer NOT NULL,
    recipe_id integer NOT NULL,
    space_id integer NOT NULL
);


ALTER TABLE public.cookbook_viewlog OWNER TO djangouser;

--
-- Name: cookbook_viewlog_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.cookbook_viewlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookbook_viewlog_id_seq OWNER TO djangouser;

--
-- Name: cookbook_viewlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.cookbook_viewlog_id_seq OWNED BY public.cookbook_viewlog.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO djangouser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO djangouser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO djangouser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO djangouser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO djangouser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO djangouser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO djangouser;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO djangouser;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO djangouser;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint,
    id_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO djangouser;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO djangouser;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.oauth2_provider_application (
    id bigint NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    algorithm character varying(5) NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO djangouser;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO djangouser;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    code_challenge character varying(128) NOT NULL,
    code_challenge_method character varying(10) NOT NULL,
    nonce character varying(255) NOT NULL,
    claims text NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO djangouser;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO djangouser;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_idtoken; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.oauth2_provider_idtoken (
    id bigint NOT NULL,
    jti uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    application_id bigint,
    user_id integer
);


ALTER TABLE public.oauth2_provider_idtoken OWNER TO djangouser;

--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.oauth2_provider_idtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_idtoken_id_seq OWNER TO djangouser;

--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.oauth2_provider_idtoken_id_seq OWNED BY public.oauth2_provider_idtoken.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO djangouser;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO djangouser;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO djangouser;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO djangouser;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO djangouser;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO djangouser;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO djangouser;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO djangouser;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: djangouser
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO djangouser;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: djangouser
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO djangouser;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: djangouser
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cookbook_automation id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_automation ALTER COLUMN id SET DEFAULT nextval('public.cookbook_automation_id_seq'::regclass);


--
-- Name: cookbook_bookmarkletimport id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_bookmarkletimport ALTER COLUMN id SET DEFAULT nextval('public.cookbook_bookmarkletimport_id_seq'::regclass);


--
-- Name: cookbook_comment id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_comment ALTER COLUMN id SET DEFAULT nextval('public.cookbook_comment_id_seq'::regclass);


--
-- Name: cookbook_cooklog id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_cooklog ALTER COLUMN id SET DEFAULT nextval('public.cookbook_cooklog_id_seq'::regclass);


--
-- Name: cookbook_customfilter id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter ALTER COLUMN id SET DEFAULT nextval('public.cookbook_customfilter_id_seq'::regclass);


--
-- Name: cookbook_customfilter_shared id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter_shared ALTER COLUMN id SET DEFAULT nextval('public.cookbook_customfilter_shared_id_seq'::regclass);


--
-- Name: cookbook_exportlog id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_exportlog ALTER COLUMN id SET DEFAULT nextval('public.cookbook_exportlog_id_seq'::regclass);


--
-- Name: cookbook_food id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food ALTER COLUMN id SET DEFAULT nextval('public.cookbook_ingredient_id_seq'::regclass);


--
-- Name: cookbook_food_child_inherit_fields id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_child_inherit_fields ALTER COLUMN id SET DEFAULT nextval('public.cookbook_food_child_inherit_fields_id_seq'::regclass);


--
-- Name: cookbook_food_inherit_fields id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_inherit_fields ALTER COLUMN id SET DEFAULT nextval('public.cookbook_food_inherit_fields_id_seq'::regclass);


--
-- Name: cookbook_food_onhand_users id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_onhand_users ALTER COLUMN id SET DEFAULT nextval('public.cookbook_food_onhand_users_id_seq'::regclass);


--
-- Name: cookbook_food_substitute id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_substitute ALTER COLUMN id SET DEFAULT nextval('public.cookbook_food_substitute_id_seq'::regclass);


--
-- Name: cookbook_foodinheritfield id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodinheritfield ALTER COLUMN id SET DEFAULT nextval('public.cookbook_foodinheritfield_id_seq'::regclass);


--
-- Name: cookbook_importlog id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_importlog ALTER COLUMN id SET DEFAULT nextval('public.cookbook_importlog_id_seq'::regclass);


--
-- Name: cookbook_ingredient id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_ingredient ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipeingredients_id_seq'::regclass);


--
-- Name: cookbook_invitelink id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_invitelink ALTER COLUMN id SET DEFAULT nextval('public.cookbook_invitelink_id_seq'::regclass);


--
-- Name: cookbook_keyword id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_keyword ALTER COLUMN id SET DEFAULT nextval('public.cookbook_keyword_id_seq'::regclass);


--
-- Name: cookbook_mealplan id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan ALTER COLUMN id SET DEFAULT nextval('public.cookbook_mealplan_id_seq'::regclass);


--
-- Name: cookbook_mealplan_shared id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan_shared ALTER COLUMN id SET DEFAULT nextval('public.cookbook_mealplan_shared_id_seq'::regclass);


--
-- Name: cookbook_mealtype id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealtype ALTER COLUMN id SET DEFAULT nextval('public.cookbook_mealtype_id_seq'::regclass);


--
-- Name: cookbook_nutritioninformation id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_nutritioninformation ALTER COLUMN id SET DEFAULT nextval('public.cookbook_nutritioninformation_id_seq'::regclass);


--
-- Name: cookbook_recipe id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipe_id_seq'::regclass);


--
-- Name: cookbook_recipe_keywords id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_keywords ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipe_keywords_id_seq'::regclass);


--
-- Name: cookbook_recipe_shared id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_shared ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipe_shared_id_seq'::regclass);


--
-- Name: cookbook_recipe_steps id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_steps ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipe_steps_id_seq'::regclass);


--
-- Name: cookbook_recipebook id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipebook_id_seq'::regclass);


--
-- Name: cookbook_recipebook_shared id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook_shared ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipebook_shared_id_seq'::regclass);


--
-- Name: cookbook_recipebookentry id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebookentry ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipebookentry_id_seq'::regclass);


--
-- Name: cookbook_recipeimport id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipeimport ALTER COLUMN id SET DEFAULT nextval('public.cookbook_recipeimport_id_seq'::regclass);


--
-- Name: cookbook_searchfields id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchfields ALTER COLUMN id SET DEFAULT nextval('public.cookbook_searchfields_id_seq'::regclass);


--
-- Name: cookbook_searchpreference_fulltext id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_fulltext ALTER COLUMN id SET DEFAULT nextval('public.cookbook_searchpreference_fulltext_id_seq'::regclass);


--
-- Name: cookbook_searchpreference_icontains id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_icontains ALTER COLUMN id SET DEFAULT nextval('public.cookbook_searchpreference_icontains_id_seq'::regclass);


--
-- Name: cookbook_searchpreference_istartswith id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_istartswith ALTER COLUMN id SET DEFAULT nextval('public.cookbook_searchpreference_istartswith_id_seq'::regclass);


--
-- Name: cookbook_searchpreference_trigram id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_trigram ALTER COLUMN id SET DEFAULT nextval('public.cookbook_searchpreference_trigram_id_seq'::regclass);


--
-- Name: cookbook_searchpreference_unaccent id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_unaccent ALTER COLUMN id SET DEFAULT nextval('public.cookbook_searchpreference_unaccent_id_seq'::regclass);


--
-- Name: cookbook_sharelink id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sharelink ALTER COLUMN id SET DEFAULT nextval('public.cookbook_sharelink_id_seq'::regclass);


--
-- Name: cookbook_shoppinglist id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist ALTER COLUMN id SET DEFAULT nextval('public.cookbook_shoppinglist_id_seq'::regclass);


--
-- Name: cookbook_shoppinglist_entries id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_entries ALTER COLUMN id SET DEFAULT nextval('public.cookbook_shoppinglist_entries_id_seq'::regclass);


--
-- Name: cookbook_shoppinglist_recipes id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_recipes ALTER COLUMN id SET DEFAULT nextval('public.cookbook_shoppinglist_recipes_id_seq'::regclass);


--
-- Name: cookbook_shoppinglist_shared id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_shared ALTER COLUMN id SET DEFAULT nextval('public.cookbook_shoppinglist_shared_id_seq'::regclass);


--
-- Name: cookbook_shoppinglistentry id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry ALTER COLUMN id SET DEFAULT nextval('public.cookbook_shoppinglistentry_id_seq'::regclass);


--
-- Name: cookbook_shoppinglistrecipe id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistrecipe ALTER COLUMN id SET DEFAULT nextval('public.cookbook_shoppinglistrecipe_id_seq'::regclass);


--
-- Name: cookbook_space id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space ALTER COLUMN id SET DEFAULT nextval('public.cookbook_space_id_seq'::regclass);


--
-- Name: cookbook_space_food_inherit id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space_food_inherit ALTER COLUMN id SET DEFAULT nextval('public.cookbook_space_food_inherit_id_seq'::regclass);


--
-- Name: cookbook_step id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step ALTER COLUMN id SET DEFAULT nextval('public.cookbook_step_id_seq'::regclass);


--
-- Name: cookbook_step_ingredients id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step_ingredients ALTER COLUMN id SET DEFAULT nextval('public.cookbook_step_ingredients_id_seq'::regclass);


--
-- Name: cookbook_storage id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_storage ALTER COLUMN id SET DEFAULT nextval('public.cookbook_storage_id_seq'::regclass);


--
-- Name: cookbook_supermarket id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarket ALTER COLUMN id SET DEFAULT nextval('public.cookbook_supermarket_id_seq'::regclass);


--
-- Name: cookbook_supermarketcategory id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategory ALTER COLUMN id SET DEFAULT nextval('public.cookbook_supermarketcategory_id_seq'::regclass);


--
-- Name: cookbook_supermarketcategoryrelation id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategoryrelation ALTER COLUMN id SET DEFAULT nextval('public.cookbook_supermarketcategoryrelation_id_seq'::regclass);


--
-- Name: cookbook_sync id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sync ALTER COLUMN id SET DEFAULT nextval('public.cookbook_sync_id_seq'::regclass);


--
-- Name: cookbook_synclog id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_synclog ALTER COLUMN id SET DEFAULT nextval('public.cookbook_synclog_id_seq'::regclass);


--
-- Name: cookbook_telegrambot id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_telegrambot ALTER COLUMN id SET DEFAULT nextval('public.cookbook_telegrambot_id_seq'::regclass);


--
-- Name: cookbook_unit id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unit ALTER COLUMN id SET DEFAULT nextval('public.cookbook_unit_id_seq'::regclass);


--
-- Name: cookbook_userfile id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userfile ALTER COLUMN id SET DEFAULT nextval('public.cookbook_userfile_id_seq'::regclass);


--
-- Name: cookbook_userpreference_plan_share id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_plan_share ALTER COLUMN id SET DEFAULT nextval('public.cookbook_userpreference_plan_share_id_seq'::regclass);


--
-- Name: cookbook_userpreference_shopping_share id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_shopping_share ALTER COLUMN id SET DEFAULT nextval('public.cookbook_userpreference_shopping_share_id_seq'::regclass);


--
-- Name: cookbook_userspace id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace ALTER COLUMN id SET DEFAULT nextval('public.cookbook_userspace_id_seq'::regclass);


--
-- Name: cookbook_userspace_groups id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace_groups ALTER COLUMN id SET DEFAULT nextval('public.cookbook_userspace_groups_id_seq'::regclass);


--
-- Name: cookbook_viewlog id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_viewlog ALTER COLUMN id SET DEFAULT nextval('public.cookbook_viewlog_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_idtoken id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_idtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_idtoken_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	katharineredhead@hotmail.co.uk	f	t	2
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_group (id, name) FROM stdin;
1	guest
2	user
3	admin
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add Token	8	add_token
30	Can change Token	8	change_token
31	Can delete Token	8	delete_token
32	Can view Token	8	view_token
33	Can add token	9	add_tokenproxy
34	Can change token	9	change_tokenproxy
35	Can delete token	9	delete_tokenproxy
36	Can view token	9	view_tokenproxy
37	Can add email address	10	add_emailaddress
38	Can change email address	10	change_emailaddress
39	Can delete email address	10	delete_emailaddress
40	Can view email address	10	view_emailaddress
41	Can add email confirmation	11	add_emailconfirmation
42	Can change email confirmation	11	change_emailconfirmation
43	Can delete email confirmation	11	delete_emailconfirmation
44	Can view email confirmation	11	view_emailconfirmation
45	Can add social account	12	add_socialaccount
46	Can change social account	12	change_socialaccount
47	Can delete social account	12	delete_socialaccount
48	Can view social account	12	view_socialaccount
49	Can add social application	13	add_socialapp
50	Can change social application	13	change_socialapp
51	Can delete social application	13	delete_socialapp
52	Can view social application	13	view_socialapp
53	Can add social application token	14	add_socialtoken
54	Can change social application token	14	change_socialtoken
55	Can delete social application token	14	delete_socialtoken
56	Can view social application token	14	view_socialtoken
57	Can add keyword	15	add_keyword
58	Can change keyword	15	change_keyword
59	Can delete keyword	15	delete_keyword
60	Can view keyword	15	view_keyword
61	Can add recipe	16	add_recipe
62	Can change recipe	16	change_recipe
63	Can delete recipe	16	delete_recipe
64	Can view recipe	16	view_recipe
65	Can add storage	17	add_storage
66	Can change storage	17	change_storage
67	Can delete storage	17	delete_storage
68	Can view storage	17	view_storage
69	Can add sync	18	add_sync
70	Can change sync	18	change_sync
71	Can delete sync	18	delete_sync
72	Can view sync	18	view_sync
73	Can add sync log	19	add_synclog
74	Can change sync log	19	change_synclog
75	Can delete sync log	19	delete_synclog
76	Can view sync log	19	view_synclog
77	Can add recipe import	20	add_recipeimport
78	Can change recipe import	20	change_recipeimport
79	Can delete recipe import	20	delete_recipeimport
80	Can view recipe import	20	view_recipeimport
81	Can add comment	21	add_comment
82	Can change comment	21	change_comment
83	Can delete comment	21	delete_comment
84	Can view comment	21	view_comment
85	Can add recipe book	22	add_recipebook
86	Can change recipe book	22	change_recipebook
87	Can delete recipe book	22	delete_recipebook
88	Can view recipe book	22	view_recipebook
89	Can add recipe book entry	23	add_recipebookentry
90	Can change recipe book entry	23	change_recipebookentry
91	Can delete recipe book entry	23	delete_recipebookentry
92	Can view recipe book entry	23	view_recipebookentry
93	Can add meal plan	24	add_mealplan
94	Can change meal plan	24	change_mealplan
95	Can delete meal plan	24	delete_mealplan
96	Can view meal plan	24	view_mealplan
97	Can add unit	25	add_unit
98	Can change unit	25	change_unit
99	Can delete unit	25	delete_unit
100	Can view unit	25	view_unit
101	Can add user preference	26	add_userpreference
102	Can change user preference	26	change_userpreference
103	Can delete user preference	26	delete_userpreference
104	Can view user preference	26	view_userpreference
105	Can add cook log	27	add_cooklog
106	Can change cook log	27	change_cooklog
107	Can delete cook log	27	delete_cooklog
108	Can view cook log	27	view_cooklog
109	Can add view log	28	add_viewlog
110	Can change view log	28	change_viewlog
111	Can delete view log	28	delete_viewlog
112	Can view view log	28	view_viewlog
113	Can add meal type	29	add_mealtype
114	Can change meal type	29	change_mealtype
115	Can delete meal type	29	delete_mealtype
116	Can view meal type	29	view_mealtype
117	Can add share link	30	add_sharelink
118	Can change share link	30	change_sharelink
119	Can delete share link	30	delete_sharelink
120	Can view share link	30	view_sharelink
121	Can add food	31	add_food
122	Can change food	31	change_food
123	Can delete food	31	delete_food
124	Can view food	31	view_food
125	Can add ingredient	32	add_ingredient
126	Can change ingredient	32	change_ingredient
127	Can delete ingredient	32	delete_ingredient
128	Can view ingredient	32	view_ingredient
129	Can add step	33	add_step
130	Can change step	33	change_step
131	Can delete step	33	delete_step
132	Can view step	33	view_step
133	Can add shopping list recipe	34	add_shoppinglistrecipe
134	Can change shopping list recipe	34	change_shoppinglistrecipe
135	Can delete shopping list recipe	34	delete_shoppinglistrecipe
136	Can view shopping list recipe	34	view_shoppinglistrecipe
137	Can add shopping list entry	35	add_shoppinglistentry
138	Can change shopping list entry	35	change_shoppinglistentry
139	Can delete shopping list entry	35	delete_shoppinglistentry
140	Can view shopping list entry	35	view_shoppinglistentry
141	Can add shopping list	36	add_shoppinglist
142	Can change shopping list	36	change_shoppinglist
143	Can delete shopping list	36	delete_shoppinglist
144	Can view shopping list	36	view_shoppinglist
145	Can add invite link	37	add_invitelink
146	Can change invite link	37	change_invitelink
147	Can delete invite link	37	delete_invitelink
148	Can view invite link	37	view_invitelink
149	Can add space	38	add_space
150	Can change space	38	change_space
151	Can delete space	38	delete_space
152	Can view space	38	view_space
153	Can add nutrition information	39	add_nutritioninformation
154	Can change nutrition information	39	change_nutritioninformation
155	Can delete nutrition information	39	delete_nutritioninformation
156	Can view nutrition information	39	view_nutritioninformation
157	Can add supermarket	40	add_supermarket
158	Can change supermarket	40	change_supermarket
159	Can delete supermarket	40	delete_supermarket
160	Can view supermarket	40	view_supermarket
161	Can add supermarket category	41	add_supermarketcategory
162	Can change supermarket category	41	change_supermarketcategory
163	Can delete supermarket category	41	delete_supermarketcategory
164	Can view supermarket category	41	view_supermarketcategory
165	Can add supermarket category relation	42	add_supermarketcategoryrelation
166	Can change supermarket category relation	42	change_supermarketcategoryrelation
167	Can delete supermarket category relation	42	delete_supermarketcategoryrelation
168	Can view supermarket category relation	42	view_supermarketcategoryrelation
169	Can add import log	43	add_importlog
170	Can change import log	43	change_importlog
171	Can delete import log	43	delete_importlog
172	Can view import log	43	view_importlog
173	Can add telegram bot	44	add_telegrambot
174	Can change telegram bot	44	change_telegrambot
175	Can delete telegram bot	44	delete_telegrambot
176	Can view telegram bot	44	view_telegrambot
177	Can add bookmarklet import	45	add_bookmarkletimport
178	Can change bookmarklet import	45	change_bookmarkletimport
179	Can delete bookmarklet import	45	delete_bookmarkletimport
180	Can view bookmarklet import	45	view_bookmarkletimport
181	Can add user file	46	add_userfile
182	Can change user file	46	change_userfile
183	Can delete user file	46	delete_userfile
184	Can view user file	46	view_userfile
185	Can add search fields	47	add_searchfields
186	Can change search fields	47	change_searchfields
187	Can delete search fields	47	delete_searchfields
188	Can view search fields	47	view_searchfields
189	Can add search preference	48	add_searchpreference
190	Can change search preference	48	change_searchpreference
191	Can delete search preference	48	delete_searchpreference
192	Can view search preference	48	view_searchpreference
193	Can add automation	49	add_automation
194	Can change automation	49	change_automation
195	Can delete automation	49	delete_automation
196	Can view automation	49	view_automation
197	Can add food inherit field	50	add_foodinheritfield
198	Can change food inherit field	50	change_foodinheritfield
199	Can delete food inherit field	50	delete_foodinheritfield
200	Can view food inherit field	50	view_foodinheritfield
201	Can add export log	51	add_exportlog
202	Can change export log	51	change_exportlog
203	Can delete export log	51	delete_exportlog
204	Can view export log	51	view_exportlog
205	Can add custom filter	52	add_customfilter
206	Can change custom filter	52	change_customfilter
207	Can delete custom filter	52	delete_customfilter
208	Can view custom filter	52	view_customfilter
209	Can add user space	53	add_userspace
210	Can change user space	53	change_userspace
211	Can delete user space	53	delete_userspace
212	Can view user space	53	view_userspace
213	Can add application	54	add_application
214	Can change application	54	change_application
215	Can delete application	54	delete_application
216	Can view application	54	view_application
217	Can add access token	55	add_accesstoken
218	Can change access token	55	change_accesstoken
219	Can delete access token	55	delete_accesstoken
220	Can view access token	55	view_accesstoken
221	Can add grant	56	add_grant
222	Can change grant	56	change_grant
223	Can delete grant	56	delete_grant
224	Can view grant	56	view_grant
225	Can add refresh token	57	add_refreshtoken
226	Can change refresh token	57	change_refreshtoken
227	Can delete refresh token	57	delete_refreshtoken
228	Can view refresh token	57	view_refreshtoken
229	Can add id token	58	add_idtoken
230	Can change id token	58	change_idtoken
231	Can delete id token	58	delete_idtoken
232	Can view id token	58	view_idtoken
233	Can add property	59	add_property
234	Can change property	59	change_property
235	Can delete property	59	delete_property
236	Can view property	59	view_property
237	Can add property type	60	add_propertytype
238	Can change property type	60	change_propertytype
239	Can delete property type	60	delete_propertytype
240	Can view property type	60	view_propertytype
241	Can add unit conversion	61	add_unitconversion
242	Can change unit conversion	61	change_unitconversion
243	Can delete unit conversion	61	delete_unitconversion
244	Can view unit conversion	61	view_unitconversion
245	Can add food property	62	add_foodproperty
246	Can change food property	62	change_foodproperty
247	Can delete food property	62	delete_foodproperty
248	Can view food property	62	view_foodproperty
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$320000$Mi432Dv8YK91W79EDV4zsU$ZGkkL+ZFHKxNay2gB+nvCP2SXGQdXHM5rwdkf7g8L2Y=	2022-08-10 17:12:12.335195+00	f	Kcross			katharineredhead@hotmail.co.uk	f	t	2022-03-24 21:46:21.193631+00
1	pbkdf2_sha256$390000$65MpD8E0EiMG8cFMoiev3V$ECxfNiPElqzzp1Fwh6LnSNWeFFsAamWHyj2912EgA0I=	2023-11-09 19:35:35.330571+00	t	apollo				t	t	2022-03-14 10:15:08.133959+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	3
2	2	3
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
4af7fdbb20230a40e1ba12c492ffa22efc129abc	2022-03-14 10:15:24.565169+00	1
8f2c0c44dbafb9c165da4f8eab2c9fe68c6f986d	2022-03-24 21:47:36.352815+00	2
\.


--
-- Data for Name: cookbook_automation; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_automation (id, type, name, description, param_1, param_2, param_3, disabled, updated_at, created_at, created_by_id, space_id, "order") FROM stdin;
\.


--
-- Data for Name: cookbook_bookmarkletimport; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_bookmarkletimport (id, html, url, created_at, created_by_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_comment; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_comment (id, text, created_at, updated_at, created_by_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: cookbook_cooklog; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_cooklog (id, created_at, rating, servings, created_by_id, recipe_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_customfilter; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_customfilter (id, name, type, search, created_at, created_by_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_customfilter_shared; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_customfilter_shared (id, customfilter_id, user_id) FROM stdin;
\.


--
-- Data for Name: cookbook_exportlog; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_exportlog (id, type, running, msg, total_recipes, exported_recipes, cache_duration, possibly_not_expired, created_at, created_by_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_food; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_food (id, name, recipe_id, description, supermarket_category_id, ignore_shopping, space_id, depth, numchild, path, substitute_children, substitute_siblings, plural_name, fdc_id, open_data_slug, preferred_shopping_unit_id, preferred_unit_id, properties_food_amount, properties_food_unit_id, url) FROM stdin;
41	potato	\N		\N	f	1	1	0	0015	f	f	\N	\N	\N	\N	\N	100.00	\N	
42	cauliflower	\N		\N	f	1	1	0	0016	f	f	\N	\N	\N	\N	\N	100.00	\N	
43	ground tumeric	\N		\N	f	1	1	0	0017	f	f	\N	\N	\N	\N	\N	100.00	\N	
39	vegetable oil	\N		\N	f	1	1	0	0013	f	f	\N	\N	\N	\N	\N	100.00	\N	
67	shallots	\N		\N	f	1	1	0	001V	f	f	\N	\N	\N	\N	\N	100.00	\N	
48	3 cm piece of ginger	\N		\N	f	1	1	0	001C	f	f	\N	\N	\N	\N	\N	100.00	\N	
50	low-salt soy sauce	\N		\N	f	1	1	0	001E	f	f	\N	\N	\N	\N	\N	100.00	\N	
53	120 g salmon fillets	\N		\N	f	1	1	0	001H	f	f	\N	\N	\N	\N	\N	100.00	\N	
54	sesame seeds	\N		\N	f	1	1	0	001I	f	f	\N	\N	\N	\N	\N	100.00	\N	
84	Mexican Spice	\N		\N	f	1	1	0	002C	f	f	\N	\N	\N	\N	\N	100.00	\N	
19	freshly grated parmesan	\N		\N	f	1	1	0	000J	f	f	\N	\N	\N	\N	\N	100.00	\N	
10	clove	\N		\N	f	1	1	0	000A	f	f	\N	\N	\N	\N	\N	100.00	\N	
90	Baby Leaves	\N		\N	f	1	1	0	002I	f	f	\N	\N	\N	\N	\N	100.00	\N	
3	tomato nut pesto	\N		\N	f	1	1	0	0003	f	f	\N	\N	\N	\N	\N	100.00	\N	
16	olive oil	\N		\N	f	1	1	0	000G	f	f	\N	\N	\N	\N	\N	100.00	\N	
5	paste	\N		\N	f	1	1	0	0005	f	f	\N	\N	\N	\N	\N	100.00	\N	
1	cheese	\N		\N	f	1	1	0	0001	f	f	\N	\N	\N	\N	\N	100.00	\N	
75	milk	\N		\N	f	1	1	0	0023	f	f	\N	\N	\N	\N	\N	100.00	\N	
11	of lamb	\N		\N	f	1	1	0	000B	f	f	\N	\N	\N	\N	\N	100.00	\N	
4	stock mix	\N		\N	f	1	1	0	0004	f	f	\N	\N	\N	\N	\N	100.00	\N	
15	sticks	\N		\N	f	1	1	0	000F	f	f	\N	\N	\N	\N	\N	100.00	\N	
12	onions	\N		\N	f	1	1	0	000C	f	f	\N	\N	\N	\N	\N	100.00	\N	
18	low-sodium chicken or vegetable stock	\N		\N	f	1	1	0	000I	f	f	\N	\N	\N	\N	\N	100.00	\N	
80	Chorizo Stick	\N		\N	f	1	1	0	0028	f	f	\N	\N	\N	\N	\N	100.00	\N	
30	fast-action dried yeast	\N		\N	f	1	1	0	000U	f	f	\N	\N	\N	\N	\N	100.00	\N	
46	sugar	\N		\N	f	1	1	0	001A	f	f	\N	\N	\N	\N	\N	100.00	\N	
13	chopped oregano	\N		\N	f	1	1	0	000D	f	f	\N	\N	\N	\N	\N	100.00	\N	
23	dried mint	\N		\N	f	1	1	0	000N	f	f	\N	\N	\N	\N	\N	100.00	\N	
26	sweet paprika	\N		\N	f	1	1	0	000Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
28	cloves	\N		\N	f	1	1	0	000S	f	f	\N	\N	\N	\N	\N	100.00	\N	
31	golden caster sugar	\N		\N	f	1	1	0	000V	f	f	\N	\N	\N	\N	\N	100.00	\N	
33	yogurt	\N		\N	f	1	1	0	000X	f	f	\N	\N	\N	\N	\N	100.00	\N	
34	small bunch mint	\N		\N	f	1	1	0	000Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
35	juice ½ lemon	\N		\N	f	1	1	0	000Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
36	or round lettuce	\N		\N	f	1	1	0	0010	f	f	\N	\N	\N	\N	\N	100.00	\N	
38	metal skewers	\N		\N	f	1	1	0	0012	f	f	\N	\N	\N	\N	\N	100.00	\N	
86	Super Soft Tortilla with Whole Wheat	\N		\N	f	1	1	0	002E	f	f	\N	\N	\N	\N	\N	100.00	\N	
98	tomato purée	\N		\N	f	1	1	0	002Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
72	mozzarella	\N		\N	f	1	1	0	0020	f	f	\N	\N	\N	\N	\N	100.00	\N	
95	stock cube	\N		\N	f	1	1	0	002N	f	f	\N	\N	\N	\N	\N	100.00	\N	
91	oil	\N		\N	f	1	1	0	002J	f	f	\N	\N	\N	\N	\N	100.00	\N	
45	salt	\N		\N	f	1	1	0	0019	f	f	\N	\N	\N	\N	\N	100.00	\N	
57	gnocchi	\N		\N	f	1	1	0	001L	f	f	\N	\N	\N	\N	\N	100.00	\N	
62	fettuccine	\N		\N	f	1	1	0	001Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
63	cloves garlic	\N		\N	f	1	1	0	001R	f	f	\N	\N	\N	\N	\N	100.00	\N	
64	sage leaves	\N		\N	f	1	1	0	001S	f	f	\N	\N	\N	\N	\N	100.00	\N	
47	of garlic	\N		\N	f	1	1	0	001B	f	f	\N	\N	\N	\N	\N	100.00	\N	
66	Parmigiano Reggiano	\N		\N	f	1	1	0	001U	f	f	\N	\N	\N	\N	\N	100.00	\N	
68	butternut squash, peeled, seeds removed and cut into 2cm cubes	\N		\N	f	1	1	0	001W	f	f	\N	\N	\N	\N	\N	100.00	\N	
69	handful of sage leaves	\N		\N	f	1	1	0	001X	f	f	\N	\N	\N	\N	\N	100.00	\N	
70	spinach	\N		\N	f	1	1	0	001Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
71	sheets	\N		\N	f	1	1	0	001Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
76	mascarpone	\N		\N	f	1	1	0	0024	f	f	\N	\N	\N	\N	\N	100.00	\N	
77	(or vegetarian alternative)	\N		\N	f	1	1	0	0025	f	f	\N	\N	\N	\N	\N	100.00	\N	
78	grating of nutmeg	\N		\N	f	1	1	0	0026	f	f	\N	\N	\N	\N	\N	100.00	\N	
92	tsp hot chilli powder	\N		\N	f	1	1	0	002K	f	f	\N	\N	\N	\N	\N	100.00	\N	
93	paprika	\N		\N	f	1	1	0	002L	f	f	\N	\N	\N	\N	\N	100.00	\N	
94	minced beef	\N		\N	f	1	1	0	002M	f	f	\N	\N	\N	\N	\N	100.00	\N	
97	dried marjoram	\N		\N	f	1	1	0	002P	f	f	\N	\N	\N	\N	\N	100.00	\N	
99	red kidney beans	\N		\N	f	1	1	0	002R	f	f	\N	\N	\N	\N	\N	100.00	\N	
100	plain boiled long grain rice	\N		\N	f	1	1	0	002S	f	f	\N	\N	\N	\N	\N	100.00	\N	
101	soured cream	\N		\N	f	1	1	0	002T	f	f	\N	\N	\N	\N	\N	100.00	\N	
65	lemon juice	\N		\N	f	1	1	0	001T	f	f	\N	\N	\N	\N	\N	100.00	\N	
7	basil	\N		\N	f	1	1	0	0007	f	f	\N	\N	\N	\N	\N	100.00	\N	
88	Mature Cheddar Cheese	\N		\N	f	1	1	0	002G	f	f	\N	\N	\N	\N	\N	100.00	\N	
49	lime	\N		\N	f	1	1	0	001D	f	f	\N	\N	\N	\N	\N	100.00	\N	
79	Green Pepper	\N		\N	f	1	1	0	0027	f	f	\N	\N	\N	\N	\N	100.00	\N	
44	chilli powder	\N		\N	f	1	1	0	0018	f	f	\N	\N	\N	\N	\N	100.00	\N	
74	flour	\N		\N	f	1	1	0	0022	f	f	\N	\N	\N	\N	\N	100.00	\N	
29	white bread flour	\N		\N	f	1	1	0	000T	f	f	\N	\N	\N	\N	\N	100.00	\N	
55	beetroot	\N		\N	f	1	1	0	001J	f	f	\N	\N	\N	\N	\N	100.00	\N	
25	coriander	\N		\N	f	1	1	0	000P	f	f	\N	\N	\N	\N	\N	100.00	\N	
22	dried oregano	\N		\N	f	1	1	0	000M	f	f	\N	\N	\N	\N	\N	100.00	\N	
96	chopped tomatoes	\N		\N	f	1	1	0	002O	f	f	\N	\N	\N	\N	\N	100.00	\N	
83	Tomato Puree	\N		\N	f	1	1	0	002B	f	f	\N	\N	\N	\N	\N	100.00	\N	
21	garlic clove	\N		\N	f	1	1	0	000L	f	f	\N	\N	\N	\N	\N	100.00	\N	
61	butternut squash	\N		\N	f	1	1	0	001P	f	f	\N	\N	\N	\N	\N	100.00	\N	
14	ground cinnamon	\N		\N	f	1	1	0	000E	f	f	\N	\N	\N	\N	\N	100.00	\N	
58	basil pesto	\N		\N	f	1	1	0	001M	f	f	\N	\N	\N	\N	\N	100.00	\N	
60	butter	\N		\N	f	1	1	0	001O	f	f	\N	\N	\N	\N	\N	100.00	\N	
9	pepper	\N		\N	f	1	1	0	0009	f	f	\N	\N	\N	\N	\N	100.00	\N	
27	zest and juice 1 lemon	\N		\N	f	1	1	0	000R	f	f	\N	\N	\N	\N	\N	100.00	\N	
40	cumin seeds	\N		\N	f	1	1	0	0014	f	f	\N	\N	\N	\N	\N	100.00	\N	
82	Flat Leaf Parsley	\N		\N	f	1	1	0	002A	f	f	\N	\N	\N	\N	\N	100.00	\N	
85	Water	\N		\N	f	1	1	0	002D	f	f	\N	\N	\N	\N	\N	100.00	\N	
51	runny honey	\N		\N	f	1	1	0	001F	f	f	\N	\N	\N	\N	\N	100.00	\N	
87	Creme Fraiche	\N		\N	f	1	1	0	002F	f	f	\N	\N	\N	\N	\N	100.00	\N	
37	tomatoes	\N		\N	f	1	1	0	0011	f	f	\N	\N	\N	\N	\N	100.00	\N	
6	orzo	\N		\N	f	1	1	0	0006	f	f	\N	\N	\N	\N	\N	100.00	\N	
32	cucumber	\N		\N	f	1	1	0	000W	f	f	\N	\N	\N	\N	\N	100.00	\N	
73	nuts	\N		\N	f	1	1	0	0021	f	f	\N	\N	\N	\N	\N	100.00	\N	
56	balsamic vinegar	\N		\N	f	1	1	0	001K	f	f	\N	\N	\N	\N	\N	100.00	\N	
24	ground cumin	\N		\N	f	1	1	0	000O	f	f	\N	\N	\N	\N	\N	100.00	\N	
17	chopped tomato	\N		\N	f	1	1	0	000H	f	f	\N	\N	\N	\N	\N	100.00	\N	
81	Black Beans	\N		\N	f	1	1	0	0029	f	f	\N	\N	\N	\N	\N	100.00	\N	
8	onion	\N		\N	f	1	1	0	0008	f	f	\N	\N	\N	\N	\N	100.00	\N	
20	red onion	\N		\N	f	1	1	0	000K	f	f	\N	\N	\N	\N	\N	100.00	\N	
103	(mixture of red and yellow)	\N		\N	f	1	1	0	002V	f	f	\N	\N	\N	\N	\N	100.00	\N	
105	dried red chilli flakes	\N		\N	f	1	1	0	002X	f	f	\N	\N	\N	\N	\N	100.00	\N	
106	red wine vinegar	\N		\N	f	1	1	0	002Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
108	pints boiling water	\N		\N	f	1	1	0	0030	f	f	\N	\N	\N	\N	\N	100.00	\N	
109	sea salt and freshly ground black pepper	\N		\N	f	1	1	0	0031	f	f	\N	\N	\N	\N	\N	100.00	\N	
121	olive oil,	\N		\N	f	1	1	0	003D	f	f	\N	\N	\N	\N	\N	100.00	\N	
122	lime zest	\N		\N	f	1	1	0	003E	f	f	\N	\N	\N	\N	\N	100.00	\N	
123	fresh lime juice	\N		\N	f	1	1	0	003F	f	f	\N	\N	\N	\N	\N	100.00	\N	
124	garlic,	\N		\N	f	1	1	0	003G	f	f	\N	\N	\N	\N	\N	100.00	\N	
125	Salt and freshly ground black pepper,	\N		\N	f	1	1	0	003H	f	f	\N	\N	\N	\N	\N	100.00	\N	
126	Zico Coconut Water	\N		\N	f	1	1	0	003I	f	f	\N	\N	\N	\N	\N	100.00	\N	
127	canned coconut milk	\N		\N	f	1	1	0	003J	f	f	\N	\N	\N	\N	\N	100.00	\N	
128	jasmine rice,	\N		\N	f	1	1	0	003K	f	f	\N	\N	\N	\N	\N	100.00	\N	
129	mango,	\N		\N	f	1	1	0	003L	f	f	\N	\N	\N	\N	\N	100.00	\N	
130	chopped red bell pepper	\N		\N	f	1	1	0	003M	f	f	\N	\N	\N	\N	\N	100.00	\N	
131	chopped fresh cilantro	\N		\N	f	1	1	0	003N	f	f	\N	\N	\N	\N	\N	100.00	\N	
132	chopped red onion,	\N		\N	f	1	1	0	003O	f	f	\N	\N	\N	\N	\N	100.00	\N	
133	avocado,	\N		\N	f	1	1	0	003P	f	f	\N	\N	\N	\N	\N	100.00	\N	
134	Salt and pepper,	\N		\N	f	1	1	0	003Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
136	squash	\N		\N	f	1	1	0	003S	f	f	\N	\N	\N	\N	\N	100.00	\N	
137	mild curry paste	\N		\N	f	1	1	0	003T	f	f	\N	\N	\N	\N	\N	100.00	\N	
139	chickpeas	\N		\N	f	1	1	0	003V	f	f	\N	\N	\N	\N	\N	100.00	\N	
140	fat-free Greek yogurt	\N		\N	f	1	1	0	003W	f	f	\N	\N	\N	\N	\N	100.00	\N	
141	small handful coriander	\N		\N	f	1	1	0	003X	f	f	\N	\N	\N	\N	\N	100.00	\N	
142	penne	\N		\N	f	1	1	0	003Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
144	english mustard	\N		\N	f	1	1	0	0040	f	f	\N	\N	\N	\N	\N	100.00	\N	
145	potatoes	\N		\N	f	1	1	0	0041	f	f	\N	\N	\N	\N	\N	100.00	\N	
146	fennel seed	\N		\N	f	1	1	0	0042	f	f	\N	\N	\N	\N	\N	100.00	\N	
147	fillets	\N		\N	f	1	1	0	0043	f	f	\N	\N	\N	\N	\N	100.00	\N	
148	zest ½ lemon	\N		\N	f	1	1	0	0044	f	f	\N	\N	\N	\N	\N	100.00	\N	
149	crème fraîche	\N		\N	f	1	1	0	0045	f	f	\N	\N	\N	\N	\N	100.00	\N	
150	small handful basil	\N		\N	f	1	1	0	0046	f	f	\N	\N	\N	\N	\N	100.00	\N	
152	140g/5oz skinless salmon fillets	\N		\N	f	1	1	0	0048	f	f	\N	\N	\N	\N	\N	100.00	\N	
154	zest 1 lime	\N		\N	f	1	1	0	004A	f	f	\N	\N	\N	\N	\N	100.00	\N	
156	mayonnaise mixed with wasabi	\N		\N	f	1	1	0	004C	f	f	\N	\N	\N	\N	\N	100.00	\N	
157	maple syrup	\N		\N	f	1	1	0	004D	f	f	\N	\N	\N	\N	\N	100.00	\N	
158	pack thyme	\N		\N	f	1	1	0	004E	f	f	\N	\N	\N	\N	\N	100.00	\N	
159	swede (about 900g/2lb)	\N		\N	f	1	1	0	004F	f	f	\N	\N	\N	\N	\N	100.00	\N	
160	sausages	\N		\N	f	1	1	0	004G	f	f	\N	\N	\N	\N	\N	100.00	\N	
161	eating apples	\N		\N	f	1	1	0	004H	f	f	\N	\N	\N	\N	\N	100.00	\N	
162	cooked broccoli	\N		\N	f	1	1	0	004I	f	f	\N	\N	\N	\N	\N	100.00	\N	
165	kale	\N		\N	f	1	1	0	004L	f	f	\N	\N	\N	\N	\N	100.00	\N	
166	each smoked paprika and ground cumin	\N		\N	f	1	1	0	004M	f	f	\N	\N	\N	\N	\N	100.00	\N	
179	rogan josh paste	\N		\N	f	1	1	0	004Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
182	of fresh coriander	\N		\N	f	1	1	0	0052	f	f	\N	\N	\N	\N	\N	100.00	\N	
183	400 g tin chickpeas	\N		\N	f	1	1	0	0053	f	f	\N	\N	\N	\N	\N	100.00	\N	
184	tomatoes or 1 x 400g tin chopped tomatoes	\N		\N	f	1	1	0	0054	f	f	\N	\N	\N	\N	\N	100.00	\N	
185	400 ml tin light coconut milk	\N		\N	f	1	1	0	0055	f	f	\N	\N	\N	\N	\N	100.00	\N	
186	pre-washed spinach	\N		\N	f	1	1	0	0056	f	f	\N	\N	\N	\N	\N	100.00	\N	
187	Chicken	\N		\N	f	1	1	0	0057	f	f	\N	\N	\N	\N	\N	100.00	\N	
190	Halloumi	\N		\N	f	1	1	0	005A	f	f	\N	\N	\N	\N	\N	100.00	\N	
191	fresh chicken stock	\N		\N	f	1	1	0	005B	f	f	\N	\N	\N	\N	\N	100.00	\N	
164	fennel seeds	\N		\N	f	1	1	0	004K	f	f	\N	\N	\N	\N	\N	100.00	\N	
177	thyme	\N		\N	f	1	1	0	004X	f	f	\N	\N	\N	\N	\N	100.00	\N	
111	Parmesan	\N		\N	f	1	1	0	0033	f	f	\N	\N	\N	\N	\N	100.00	\N	
151	sweet potato	\N		\N	f	1	1	0	0047	f	f	\N	\N	\N	\N	\N	100.00	\N	
135	basmati rice	\N		\N	f	1	1	0	003R	f	f	\N	\N	\N	\N	\N	100.00	\N	
192	roughly chopped fresh root ginger	\N		\N	f	1	1	0	005C	f	f	\N	\N	\N	\N	\N	100.00	\N	
104	mushrooms	\N		\N	f	1	1	0	002W	f	f	\N	\N	\N	\N	\N	100.00	\N	
198	peas	\N		\N	f	1	1	0	005I	f	f	\N	\N	\N	\N	\N	100.00	\N	
167	lean pork mince	\N		\N	f	1	1	0	004N	f	f	\N	\N	\N	\N	\N	100.00	\N	
107	spaghetti	\N		\N	f	1	1	0	002Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
110	handful basil leaves	\N		\N	f	1	1	0	0032	f	f	\N	\N	\N	\N	\N	100.00	\N	
189	pasta	\N		\N	f	1	1	0	0059	f	f	\N	\N	\N	\N	\N	100.00	\N	
114	mince	\N		\N	f	1	1	0	0036	f	f	\N	\N	\N	\N	\N	100.00	\N	
181	of ginger	\N		\N	f	1	1	0	0051	f	f	\N	\N	\N	\N	\N	100.00	\N	
180	red chilli	\N		\N	f	1	1	0	0050	f	f	\N	\N	\N	\N	\N	100.00	\N	
178	egg	\N		\N	f	1	1	0	004Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
169	barbecue sauce	\N		\N	f	1	1	0	004P	f	f	\N	\N	\N	\N	\N	100.00	\N	
176	leeks	\N		\N	f	1	1	0	004W	f	f	\N	\N	\N	\N	\N	100.00	\N	
200	salt and freshly ground black pepper	\N		\N	f	1	1	0	005K	f	f	\N	\N	\N	\N	\N	100.00	\N	
172	shells	\N		\N	f	1	1	0	004S	f	f	\N	\N	\N	\N	\N	100.00	\N	
193	five-spice powder	\N		\N	f	1	1	0	005D	f	f	\N	\N	\N	\N	\N	100.00	\N	
153	thumbnail-size piece ginger	\N		\N	f	1	1	0	0049	f	f	\N	\N	\N	\N	\N	100.00	\N	
163	chilli flakes	\N		\N	f	1	1	0	004J	f	f	\N	\N	\N	\N	\N	100.00	\N	
170	black bean	\N		\N	f	1	1	0	004Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
171	small bunch coriander	\N		\N	f	1	1	0	004R	f	f	\N	\N	\N	\N	\N	100.00	\N	
174	lettuce	\N		\N	f	1	1	0	004U	f	f	\N	\N	\N	\N	\N	100.00	\N	
175	soured cream, to serve	\N		\N	f	1	1	0	004V	f	f	\N	\N	\N	\N	\N	100.00	\N	
115	garlic	\N		\N	f	1	1	0	0037	f	f	\N	\N	\N	\N	\N	100.00	\N	
197	carrot	\N		\N	f	1	1	0	005H	f	f	\N	\N	\N	\N	\N	100.00	\N	
188	Asparagus	\N		\N	f	1	1	0	0058	f	f	\N	\N	\N	\N	\N	100.00	\N	
194	anise	\N		\N	f	1	1	0	005E	f	f	\N	\N	\N	\N	\N	100.00	\N	
195	light soy sauce	\N		\N	f	1	1	0	005F	f	f	\N	\N	\N	\N	\N	100.00	\N	
102	chorizo	\N		\N	f	1	1	0	002U	f	f	\N	\N	\N	\N	\N	100.00	\N	
201	peanut butter	\N		\N	f	1	1	0	005L	f	f	\N	\N	\N	\N	\N	100.00	\N	
138	stock	\N		\N	f	1	1	0	003U	f	f	\N	\N	\N	\N	\N	100.00	\N	
143	plain flour	\N		\N	f	1	1	0	003Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
116	raisins	\N		\N	f	1	1	0	0038	f	f	\N	\N	\N	\N	\N	100.00	\N	
117	a small bunch flat-leaf parsley	\N		\N	f	1	1	0	0039	f	f	\N	\N	\N	\N	\N	100.00	\N	
118	feta	\N		\N	f	1	1	0	003A	f	f	\N	\N	\N	\N	\N	100.00	\N	
119	to serve mint leaves	\N		\N	f	1	1	0	003B	f	f	\N	\N	\N	\N	\N	100.00	\N	
112	courgettes	\N		\N	f	1	1	0	0034	f	f	\N	\N	\N	\N	\N	100.00	\N	
196	chicken breasts	\N		\N	f	1	1	0	005G	f	f	\N	\N	\N	\N	\N	100.00	\N	
113	extra-virgin olive oil	\N		\N	f	1	1	0	0035	f	f	\N	\N	\N	\N	\N	100.00	\N	
168	passata	\N		\N	f	1	1	0	004O	f	f	\N	\N	\N	\N	\N	100.00	\N	
207	chilli	\N		\N	f	1	1	0	005R	f	f	\N	\N	\N	\N	\N	100.00	\N	
222	Diced Sweet Potato	\N		\N	f	1	1	0	0066	f	f	\N	\N	\N	\N	\N	100.00	\N	
223	Baby Plum Tomatoes	\N		\N	f	1	1	0	0067	f	f	\N	\N	\N	\N	\N	100.00	\N	
224	Dried Thyme	\N		\N	f	1	1	0	0068	f	f	\N	\N	\N	\N	\N	100.00	\N	
226	Chicken Stock Powder	\N		\N	f	1	1	0	006A	f	f	\N	\N	\N	\N	\N	100.00	\N	
227	Cider Vinegar	\N		\N	f	1	1	0	006B	f	f	\N	\N	\N	\N	\N	100.00	\N	
228	Baby Spinach	\N		\N	f	1	1	0	006C	f	f	\N	\N	\N	\N	\N	100.00	\N	
229	Grated Hard Italian Style Cheese	\N		\N	f	1	1	0	006D	f	f	\N	\N	\N	\N	\N	100.00	\N	
230	Chives	\N		\N	f	1	1	0	006E	f	f	\N	\N	\N	\N	\N	100.00	\N	
231	Pasta Water	\N		\N	f	1	1	0	006F	f	f	\N	\N	\N	\N	\N	100.00	\N	
232	What you will need:	\N		\N	f	1	1	0	006G	f	f	\N	\N	\N	\N	\N	100.00	\N	
235	onion ; chopped	\N		\N	f	1	1	0	006J	f	f	\N	\N	\N	\N	\N	100.00	\N	
236	small button mushroom sliced	\N		\N	f	1	1	0	006K	f	f	\N	\N	\N	\N	\N	100.00	\N	
239	long grain rice	\N		\N	f	1	1	0	006N	f	f	\N	\N	\N	\N	\N	100.00	\N	
241	for each person	\N		\N	f	1	1	0	006P	f	f	\N	\N	\N	\N	\N	100.00	\N	
242	of chicken stock	\N		\N	f	1	1	0	006Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
243	breast fillets	\N		\N	f	1	1	0	006R	f	f	\N	\N	\N	\N	\N	100.00	\N	
245	9 inches of chorizo (spicy or not	\N		\N	f	1	1	0	006T	f	f	\N	\N	\N	\N	\N	100.00	\N	
246	4 shallots (or one red onion) chopped finely	\N		\N	f	1	1	0	006U	f	f	\N	\N	\N	\N	\N	100.00	\N	
247	glass of 50/50 white Vermouth and white wine	\N		\N	f	1	1	0	006V	f	f	\N	\N	\N	\N	\N	100.00	\N	
248	butter and a few tablespoons of olive oil	\N		\N	f	1	1	0	006W	f	f	\N	\N	\N	\N	\N	100.00	\N	
249	of freshly grated Parmesan cheese	\N		\N	f	1	1	0	006X	f	f	\N	\N	\N	\N	\N	100.00	\N	
268	pine nuts	\N		\N	f	1	1	0	007G	f	f	\N	\N	\N	\N	\N	100.00	\N	
233	breasts cut into strips	\N		\N	f	1	1	0	006H	f	f	\N	\N	\N	\N	\N	100.00	\N	
234	Salt and pepper	\N		\N	f	1	1	0	006I	f	f	\N	\N	\N	\N	\N	100.00	\N	
238	curry power	\N		\N	f	1	1	0	006M	f	f	\N	\N	\N	\N	\N	100.00	\N	
205	finely grated garlic	\N		\N	f	1	1	0	005P	f	f	\N	\N	\N	\N	\N	100.00	\N	
240	frozen peas	\N		\N	f	1	1	0	006O	f	f	\N	\N	\N	\N	\N	100.00	\N	
262	ginger	\N		\N	f	1	1	0	007A	f	f	\N	\N	\N	\N	\N	100.00	\N	
263	medium curry powder	\N		\N	f	1	1	0	007B	f	f	\N	\N	\N	\N	\N	100.00	\N	
259	chicken stock cube	\N		\N	f	1	1	0	0077	f	f	\N	\N	\N	\N	\N	100.00	\N	
213	Rendang Paste	\N		\N	f	1	1	0	005X	f	f	\N	\N	\N	\N	\N	100.00	\N	
266	small bunch of coriander	\N		\N	f	1	1	0	007E	f	f	\N	\N	\N	\N	\N	100.00	\N	
250	roughly chopped coriander	\N		\N	f	1	1	0	006Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
251	lime juice	\N		\N	f	1	1	0	006Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
252	garlic powder	\N		\N	f	1	1	0	0070	f	f	\N	\N	\N	\N	\N	100.00	\N	
253	onion salt	\N		\N	f	1	1	0	0071	f	f	\N	\N	\N	\N	\N	100.00	\N	
237	mild chilli power	\N		\N	f	1	1	0	006L	f	f	\N	\N	\N	\N	\N	100.00	\N	
283	dried chilli flakes	\N		\N	f	1	1	0	007V	f	f	\N	\N	\N	\N	\N	100.00	\N	
173	avocado	\N		\N	f	1	1	0	004T	f	f	\N	\N	\N	\N	\N	100.00	\N	
255	vegetable stock cube	\N		\N	f	1	1	0	0073	f	f	\N	\N	\N	\N	\N	100.00	\N	
267	SALAD	\N		\N	f	1	1	0	007F	f	f	\N	\N	\N	\N	\N	100.00	\N	
256	Soft cheese	\N		\N	f	1	1	0	0074	f	f	\N	\N	\N	\N	\N	100.00	\N	
269	chicory	\N		\N	f	1	1	0	007H	f	f	\N	\N	\N	\N	\N	100.00	\N	
204	rice wine vinegar	\N		\N	f	1	1	0	005O	f	f	\N	\N	\N	\N	\N	100.00	\N	
203	soy sauce	\N		\N	f	1	1	0	005N	f	f	\N	\N	\N	\N	\N	100.00	\N	
278	free-range egg	\N		\N	f	1	1	0	007Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
258	sun-dried tomato pesto	\N		\N	f	1	1	0	0076	f	f	\N	\N	\N	\N	\N	100.00	\N	
270	clementines	\N		\N	f	1	1	0	007I	f	f	\N	\N	\N	\N	\N	100.00	\N	
271	of fresh mint	\N		\N	f	1	1	0	007J	f	f	\N	\N	\N	\N	\N	100.00	\N	
272	Manchego cheese	\N		\N	f	1	1	0	007K	f	f	\N	\N	\N	\N	\N	100.00	\N	
273	sherry vinegar	\N		\N	f	1	1	0	007L	f	f	\N	\N	\N	\N	\N	100.00	\N	
202	toasted sesame oil	\N		\N	f	1	1	0	005M	f	f	\N	\N	\N	\N	\N	100.00	\N	
279	tablespoons fat-free natural yoghurt	\N		\N	f	1	1	0	007R	f	f	\N	\N	\N	\N	\N	100.00	\N	
257	parsley	\N		\N	f	1	1	0	0075	f	f	\N	\N	\N	\N	\N	100.00	\N	
281	mustard	\N		\N	f	1	1	0	007T	f	f	\N	\N	\N	\N	\N	100.00	\N	
275	dried penne	\N		\N	f	1	1	0	007N	f	f	\N	\N	\N	\N	\N	100.00	\N	
276	Iberico chorizo	\N		\N	f	1	1	0	007O	f	f	\N	\N	\N	\N	\N	100.00	\N	
277	of fresh rosemary	\N		\N	f	1	1	0	007P	f	f	\N	\N	\N	\N	\N	100.00	\N	
274	extra virgin olive oil	\N		\N	f	1	1	0	007M	f	f	\N	\N	\N	\N	\N	100.00	\N	
2	chicken breast portions	\N		\N	f	1	1	0	0002	f	f	\N	\N	\N	\N	\N	100.00	\N	
280	linguine	\N		\N	f	1	1	0	007S	f	f	\N	\N	\N	\N	\N	100.00	\N	
284	Diced Butternut Squash	\N		\N	f	1	1	0	007W	f	f	\N	\N	\N	\N	\N	100.00	\N	
285	Curry Powder	\N		\N	f	1	1	0	007X	f	f	\N	\N	\N	\N	\N	100.00	\N	
286	Vine Tomatoes	\N		\N	f	1	1	0	007Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
287	Vegetable Stock Powder	\N		\N	f	1	1	0	007Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
211	Green Beans	\N		\N	f	1	1	0	005V	f	f	\N	\N	\N	\N	\N	100.00	\N	
288	Red Split Lentils	\N		\N	f	1	1	0	0080	f	f	\N	\N	\N	\N	\N	100.00	\N	
289	Plain Naan	\N		\N	f	1	1	0	0081	f	f	\N	\N	\N	\N	\N	100.00	\N	
290	Pumpkin Seeds	\N		\N	f	1	1	0	0082	f	f	\N	\N	\N	\N	\N	100.00	\N	
291	white onion	\N		\N	f	1	1	0	0083	f	f	\N	\N	\N	\N	\N	100.00	\N	
293	cup mushrooms	\N		\N	f	1	1	0	0085	f	f	\N	\N	\N	\N	\N	100.00	\N	
294	cooked chicken	\N		\N	f	1	1	0	0086	f	f	\N	\N	\N	\N	\N	100.00	\N	
216	Streaky Bacon Rasher	\N		\N	f	1	1	0	0060	f	f	\N	\N	\N	\N	\N	100.00	\N	
282	smoked paprika	\N		\N	f	1	1	0	007U	f	f	\N	\N	\N	\N	\N	100.00	\N	
254	rapeseed oil	\N		\N	f	1	1	0	0072	f	f	\N	\N	\N	\N	\N	100.00	\N	
215	Coconut Milk	\N		\N	f	1	1	0	005Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
217	Parmesan Cheese	\N		\N	f	1	1	0	0061	f	f	\N	\N	\N	\N	\N	100.00	\N	
218	Vegetable Stock Pot	\N		\N	f	1	1	0	0062	f	f	\N	\N	\N	\N	\N	100.00	\N	
219	Unsalted Butter	\N		\N	f	1	1	0	0063	f	f	\N	\N	\N	\N	\N	100.00	\N	
220	Risotto Rice	\N		\N	f	1	1	0	0064	f	f	\N	\N	\N	\N	\N	100.00	\N	
208	roasted peanuts	\N		\N	f	1	1	0	005S	f	f	\N	\N	\N	\N	\N	100.00	\N	
209	toasted sesame seeds	\N		\N	f	1	1	0	005T	f	f	\N	\N	\N	\N	\N	100.00	\N	
210	limes	\N		\N	f	1	1	0	005U	f	f	\N	\N	\N	\N	\N	100.00	\N	
212	Beef Steak Strips	\N		\N	f	1	1	0	005W	f	f	\N	\N	\N	\N	\N	100.00	\N	
89	Honey	\N		\N	f	1	1	0	002H	f	f	\N	\N	\N	\N	\N	100.00	\N	
214	Thai Garnish	\N		\N	f	1	1	0	005Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
221	Lemon	\N		\N	f	1	1	0	0065	f	f	\N	\N	\N	\N	\N	100.00	\N	
261	cinnamon sticks	\N		\N	f	1	1	0	0079	f	f	\N	\N	\N	\N	\N	100.00	\N	
260	lamb shoulder	\N		\N	f	1	1	0	0078	f	f	\N	\N	\N	\N	\N	100.00	\N	
264	ground coriander	\N		\N	f	1	1	0	007C	f	f	\N	\N	\N	\N	\N	100.00	\N	
155	spring onions	\N		\N	f	1	1	0	004B	f	f	\N	\N	\N	\N	\N	100.00	\N	
225	Bacon Lardons	\N		\N	f	1	1	0	0069	f	f	\N	\N	\N	\N	\N	100.00	\N	
292	green pesto	\N		\N	f	1	1	0	0084	f	f	\N	\N	\N	\N	\N	100.00	\N	
295	Gran Milano	\N		\N	f	1	1	0	0087	f	f	\N	\N	\N	\N	\N	100.00	\N	
299	boneless	\N		\N	f	1	1	0	008B	f	f	\N	\N	\N	\N	\N	100.00	\N	
339	rosemary sprigs	\N		\N	f	1	1	0	009F	f	f	\N	\N	\N	\N	\N	100.00	\N	
312	pomegranate seeds	\N		\N	f	1	1	0	008O	f	f	\N	\N	\N	\N	\N	100.00	\N	
298	light brown soft sugar	\N		\N	f	1	1	0	008A	f	f	\N	\N	\N	\N	\N	100.00	\N	
300	bunch coriander	\N		\N	f	1	1	0	008C	f	f	\N	\N	\N	\N	\N	100.00	\N	
301	tortilla chips and guacamole	\N		\N	f	1	1	0	008D	f	f	\N	\N	\N	\N	\N	100.00	\N	
304	and 1 yellow pepper	\N		\N	f	1	1	0	008G	f	f	\N	\N	\N	\N	\N	100.00	\N	
302	or 8-12 small flour tortillas	\N		\N	f	1	1	0	008E	f	f	\N	\N	\N	\N	\N	100.00	\N	
303	soured cream or crème fraîche	\N		\N	f	1	1	0	008F	f	f	\N	\N	\N	\N	\N	100.00	\N	
307	diced lamb	\N		\N	f	1	1	0	008J	f	f	\N	\N	\N	\N	\N	100.00	\N	
370	half fat creme fraiche	\N		\N	f	1	1	0	00AA	f	f	\N	\N	\N	\N	\N	100.00	\N	
309	ras-el-hanout spice mix	\N		\N	f	1	1	0	008L	f	f	\N	\N	\N	\N	\N	100.00	\N	
310	chickpea	\N		\N	f	1	1	0	008M	f	f	\N	\N	\N	\N	\N	100.00	\N	
311	apricot	\N		\N	f	1	1	0	008N	f	f	\N	\N	\N	\N	\N	100.00	\N	
325	cheddar	\N		\N	f	1	1	0	0091	f	f	\N	\N	\N	\N	\N	100.00	\N	
313	handfuls coriander	\N		\N	f	1	1	0	008P	f	f	\N	\N	\N	\N	\N	100.00	\N	
314	mixed root veg,	\N		\N	f	1	1	0	008Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
371	salted peanuts	\N		\N	f	1	1	0	00AB	f	f	\N	\N	\N	\N	\N	100.00	\N	
316	halloumi cheese	\N		\N	f	1	1	0	008S	f	f	\N	\N	\N	\N	\N	100.00	\N	
317	courgette,	\N		\N	f	1	1	0	008T	f	f	\N	\N	\N	\N	\N	100.00	\N	
318	eating apple	\N		\N	f	1	1	0	008U	f	f	\N	\N	\N	\N	\N	100.00	\N	
319	lamb's lettuce	\N		\N	f	1	1	0	008V	f	f	\N	\N	\N	\N	\N	100.00	\N	
320	quality green pesto	\N		\N	f	1	1	0	008W	f	f	\N	\N	\N	\N	\N	100.00	\N	
321	fusilli	\N		\N	f	1	1	0	008X	f	f	\N	\N	\N	\N	\N	100.00	\N	
322	a good pinch dried chilli flakes	\N		\N	f	1	1	0	008Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
323	tuna in olive oil	\N		\N	f	1	1	0	008Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
324	rosemary, needles chopped to make	\N		\N	f	1	1	0	0090	f	f	\N	\N	\N	\N	\N	100.00	\N	
326	couscous	\N		\N	f	1	1	0	0092	f	f	\N	\N	\N	\N	\N	100.00	\N	
384	pork	\N		\N	f	1	1	0	00AO	f	f	\N	\N	\N	\N	\N	100.00	\N	
327	low salt vegetable stock	\N		\N	f	1	1	0	0093	f	f	\N	\N	\N	\N	\N	100.00	\N	
383	pancetta	\N		\N	f	1	1	0	00AN	f	f	\N	\N	\N	\N	\N	100.00	\N	
329	or brown baguette	\N		\N	f	1	1	0	0095	f	f	\N	\N	\N	\N	\N	100.00	\N	
331	tomato	\N		\N	f	1	1	0	0097	f	f	\N	\N	\N	\N	\N	100.00	\N	
334	baguette	\N		\N	f	1	1	0	009A	f	f	\N	\N	\N	\N	\N	100.00	\N	
330	fresh green pesto	\N		\N	f	1	1	0	0096	f	f	\N	\N	\N	\N	\N	100.00	\N	
332	baby spinach leaves	\N		\N	f	1	1	0	0098	f	f	\N	\N	\N	\N	\N	100.00	\N	
333	salami	\N		\N	f	1	1	0	0099	f	f	\N	\N	\N	\N	\N	100.00	\N	
335	sprigs	\N		\N	f	1	1	0	009B	f	f	\N	\N	\N	\N	\N	100.00	\N	
363	eggs	\N		\N	f	1	1	0	00A3	f	f	\N	\N	\N	\N	\N	100.00	\N	
308	carrots	\N		\N	f	1	1	0	008K	f	f	\N	\N	\N	\N	\N	100.00	\N	
340	pork sausages	\N		\N	f	1	1	0	009G	f	f	\N	\N	\N	\N	\N	100.00	\N	
369	celery sticks	\N		\N	f	1	1	0	00A9	f	f	\N	\N	\N	\N	\N	100.00	\N	
341	piri-piri sauce or other mild chilli sauce	\N		\N	f	1	1	0	009H	f	f	\N	\N	\N	\N	\N	100.00	\N	
342	burger buns	\N		\N	f	1	1	0	009I	f	f	\N	\N	\N	\N	\N	100.00	\N	
343	lighter halloumi	\N		\N	f	1	1	0	009J	f	f	\N	\N	\N	\N	\N	100.00	\N	
344	white cabbage	\N		\N	f	1	1	0	009K	f	f	\N	\N	\N	\N	\N	100.00	\N	
345	mayonnaise	\N		\N	f	1	1	0	009L	f	f	\N	\N	\N	\N	\N	100.00	\N	
346	hummus	\N		\N	f	1	1	0	009M	f	f	\N	\N	\N	\N	\N	100.00	\N	
347	handful of rocket or 4- lettuce leaves	\N		\N	f	1	1	0	009N	f	f	\N	\N	\N	\N	\N	100.00	\N	
348	roasted red peppers from a jar	\N		\N	f	1	1	0	009O	f	f	\N	\N	\N	\N	\N	100.00	\N	
354	flatbreads	\N		\N	f	1	1	0	009U	f	f	\N	\N	\N	\N	\N	100.00	\N	
355	few pickled golden beetroot, diced	\N		\N	f	1	1	0	009V	f	f	\N	\N	\N	\N	\N	100.00	\N	
356	beet leaves or a bag of beet salad	\N		\N	f	1	1	0	009W	f	f	\N	\N	\N	\N	\N	100.00	\N	
364	red or green pepper	\N		\N	f	1	1	0	00A4	f	f	\N	\N	\N	\N	\N	100.00	\N	
365	chorizo sausage	\N		\N	f	1	1	0	00A5	f	f	\N	\N	\N	\N	\N	100.00	\N	
349	400g cans chickpeas	\N		\N	f	1	1	0	009P	f	f	\N	\N	\N	\N	\N	100.00	\N	
350	breadcrumb	\N		\N	f	1	1	0	009Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
351	tahini paste	\N		\N	f	1	1	0	009R	f	f	\N	\N	\N	\N	\N	100.00	\N	
352	150ml pots natural yogurt	\N		\N	f	1	1	0	009S	f	f	\N	\N	\N	\N	\N	100.00	\N	
353	pinch of sugar	\N		\N	f	1	1	0	009T	f	f	\N	\N	\N	\N	\N	100.00	\N	
357	tumeric	\N		\N	f	1	1	0	009X	f	f	\N	\N	\N	\N	\N	100.00	\N	
358	mild curry powder	\N		\N	f	1	1	0	009Y	f	f	\N	\N	\N	\N	\N	100.00	\N	
359	or vegetable stock	\N		\N	f	1	1	0	009Z	f	f	\N	\N	\N	\N	\N	100.00	\N	
360	aubergine	\N		\N	f	1	1	0	00A0	f	f	\N	\N	\N	\N	\N	100.00	\N	
361	small handful fresh basil	\N		\N	f	1	1	0	00A1	f	f	\N	\N	\N	\N	\N	100.00	\N	
362	freshly ground sea salt and black pepper	\N		\N	f	1	1	0	00A2	f	f	\N	\N	\N	\N	\N	100.00	\N	
366	clove garlic	\N		\N	f	1	1	0	00A6	f	f	\N	\N	\N	\N	\N	100.00	\N	
367	Gruyère, grated	\N		\N	f	1	1	0	00A7	f	f	\N	\N	\N	\N	\N	100.00	\N	
368	salt and freshly milled black pepper	\N		\N	f	1	1	0	00A8	f	f	\N	\N	\N	\N	\N	100.00	\N	
379	handful grated or shaved parmesan	\N		\N	f	1	1	0	00AJ	f	f	\N	\N	\N	\N	\N	100.00	\N	
382	stick	\N		\N	f	1	1	0	00AM	f	f	\N	\N	\N	\N	\N	100.00	\N	
375	handful fresh coriander	\N		\N	f	1	1	0	00AF	f	f	\N	\N	\N	\N	\N	100.00	\N	
372	deboned and skinless chicken thighs	\N		\N	f	1	1	0	00AC	f	f	\N	\N	\N	\N	\N	100.00	\N	
315	broccoli	\N		\N	f	1	1	0	008R	f	f	\N	\N	\N	\N	\N	100.00	\N	
374	red onions	\N		\N	f	1	1	0	00AE	f	f	\N	\N	\N	\N	\N	100.00	\N	
376	bread flour	\N		\N	f	1	1	0	00AG	f	f	\N	\N	\N	\N	\N	100.00	\N	
377	instant yeast	\N		\N	f	1	1	0	00AH	f	f	\N	\N	\N	\N	\N	100.00	\N	
378	handful fresh basil or dried	\N		\N	f	1	1	0	00AI	f	f	\N	\N	\N	\N	\N	100.00	\N	
305	pepper(s)	\N		\N	f	1	1	0	008H	f	f	\N	\N	\N	\N	\N	100.00	\N	
380	handful of cherry tomatoes	\N		\N	f	1	1	0	00AK	f	f	\N	\N	\N	\N	\N	100.00	\N	
381	handful of basil leaves	\N		\N	f	1	1	0	00AL	f	f	\N	\N	\N	\N	\N	100.00	\N	
336	400g cans chopped tomatoes	\N		\N	f	1	1	0	009C	f	f	\N	\N	\N	\N	\N	100.00	\N	
120	salmon fillets	\N		\N	f	1	1	0	003C	f	f	\N	\N	\N	\N	\N	100.00	\N	
328	pesto	\N		\N	f	1	1	0	0094	f	f	\N	\N	\N	\N	\N	100.00	\N	
385	white wine	\N		\N	f	1	1	0	00AP	f	f	\N	\N	\N	\N	\N	100.00	\N	
297	chipotle chilli paste	\N		\N	f	1	1	0	0089	f	f	\N	\N	\N	\N	\N	100.00	\N	
373	Thai green curry paste	\N		\N	f	1	1	0	00AD	f	f	\N	\N	\N	\N	\N	100.00	\N	
265	chicken thighs	\N		\N	f	1	1	0	007D	f	f	\N	\N	\N	\N	\N	100.00	\N	
337	brown sugar	\N		\N	f	1	1	0	009D	f	f	\N	\N	\N	\N	\N	100.00	\N	
452	can chopped tomato	\N		\N	f	1	1	0	00CK	f	f	\N	\N	\N	\N	\N	100.00	\N	
422	chipotle in adobo or 1 tsp chipotle paste	\N		\N	f	1	1	0	00BQ	f	f	\N	\N	\N	\N	\N	100.00	\N	
386	organic lemon	\N		\N	f	1	1	0	00AQ	f	f	\N	\N	\N	\N	\N	100.00	\N	
423	stock shot or cube	\N		\N	f	1	1	0	00BR	f	f	\N	\N	\N	\N	\N	100.00	\N	
424	cooked rice or tortillas, coriander, feta, lime wedges and chopped red onion, to serve	\N		\N	f	1	1	0	00BS	f	f	\N	\N	\N	\N	\N	100.00	\N	
453	tbsp mango chutney	\N		\N	f	1	1	0	00CL	f	f	\N	\N	\N	\N	\N	100.00	\N	
448	baby corn	\N		\N	f	1	1	0	00CG	f	f	\N	\N	\N	\N	\N	100.00	\N	
389	feta cheese	\N		\N	f	1	1	0	00AT	f	f	\N	\N	\N	\N	\N	100.00	\N	
390	tortillas	\N		\N	f	1	1	0	00AU	f	f	\N	\N	\N	\N	\N	100.00	\N	
421	oregano	\N		\N	f	1	1	0	00BP	f	f	\N	\N	\N	\N	\N	100.00	\N	
338	grated parmesan and ½ small bunch parsley	\N		\N	f	1	1	0	009E	f	f	\N	\N	\N	\N	\N	100.00	\N	
392	rosem	\N		\N	f	1	1	0	00AW	f	f	\N	\N	\N	\N	\N	100.00	\N	
393	natural yoghurt	\N		\N	f	1	1	0	00AX	f	f	\N	\N	\N	\N	\N	100.00	\N	
394	double cream	\N		\N	f	1	1	0	00AY	f	f	\N	\N	\N	\N	\N	100.00	\N	
395	tagliatelle	\N		\N	f	1	1	0	00AZ	f	f	\N	\N	\N	\N	\N	100.00	\N	
397	sugar-snap peas	\N		\N	f	1	1	0	00B1	f	f	\N	\N	\N	\N	\N	100.00	\N	
199	small handful fresh coriander leaves or Thai basil leaves	\N		\N	f	1	1	0	005J	f	f	\N	\N	\N	\N	\N	100.00	\N	
206	finely grated fresh ginger	\N		\N	f	1	1	0	005Q	f	f	\N	\N	\N	\N	\N	100.00	\N	
454	red lentil	\N		\N	f	1	1	0	00CM	f	f	\N	\N	\N	\N	\N	100.00	\N	
398	thighs	\N		\N	f	1	1	0	00B2	f	f	\N	\N	\N	\N	\N	100.00	\N	
399	bacon lardon or chopped bacon	\N		\N	f	1	1	0	00B3	f	f	\N	\N	\N	\N	\N	100.00	\N	
400	wine	\N		\N	f	1	1	0	00B4	f	f	\N	\N	\N	\N	\N	100.00	\N	
402	pea	\N		\N	f	1	1	0	00B6	f	f	\N	\N	\N	\N	\N	100.00	\N	
404	nut	\N		\N	f	1	1	0	00B8	f	f	\N	\N	\N	\N	\N	100.00	\N	
425	pieces on the bone	\N		\N	f	1	1	0	00BT	f	f	\N	\N	\N	\N	\N	100.00	\N	
426	bacon	\N		\N	f	1	1	0	00BU	f	f	\N	\N	\N	\N	\N	100.00	\N	
405	sundried tomato	\N		\N	f	1	1	0	00B9	f	f	\N	\N	\N	\N	\N	100.00	\N	
427	wine or cider vinegar	\N		\N	f	1	1	0	00BV	f	f	\N	\N	\N	\N	\N	100.00	\N	
406	self-raising flour	\N		\N	f	1	1	0	00BA	f	f	\N	\N	\N	\N	\N	100.00	\N	
443	can pineapple chunks	\N		\N	f	1	1	0	00CB	f	f	\N	\N	\N	\N	\N	100.00	\N	
444	each tomato ketchup	\N		\N	f	1	1	0	00CC	f	f	\N	\N	\N	\N	\N	100.00	\N	
401	leaves	\N		\N	f	1	1	0	00B5	f	f	\N	\N	\N	\N	\N	100.00	\N	
409	breasts (about 650g)	\N		\N	f	1	1	0	00BD	f	f	\N	\N	\N	\N	\N	100.00	\N	
410	ring	\N		\N	f	1	1	0	00BE	f	f	\N	\N	\N	\N	\N	100.00	\N	
413	7g sachets fast-action dried yeast	\N		\N	f	1	1	0	00BH	f	f	\N	\N	\N	\N	\N	100.00	\N	
407	vinegar	\N		\N	f	1	1	0	00BB	f	f	\N	\N	\N	\N	\N	100.00	\N	
408	bunch thyme	\N		\N	f	1	1	0	00BC	f	f	\N	\N	\N	\N	\N	100.00	\N	
428	double cream or crème fraîche	\N		\N	f	1	1	0	00BW	f	f	\N	\N	\N	\N	\N	100.00	\N	
411	charred lemon halves or wedges	\N		\N	f	1	1	0	00BF	f	f	\N	\N	\N	\N	\N	100.00	\N	
412	fine salt	\N		\N	f	1	1	0	00BG	f	f	\N	\N	\N	\N	\N	100.00	\N	
414	skinless chicken breasts	\N		\N	f	1	1	0	00BI	f	f	\N	\N	\N	\N	\N	100.00	\N	
415	tsp sweet smoked paprika	\N		\N	f	1	1	0	00BJ	f	f	\N	\N	\N	\N	\N	100.00	\N	
429	new potatoes	\N		\N	f	1	1	0	00BX	f	f	\N	\N	\N	\N	\N	100.00	\N	
416	cream	\N		\N	f	1	1	0	00BK	f	f	\N	\N	\N	\N	\N	100.00	\N	
417	or rigatoni pasta	\N		\N	f	1	1	0	00BL	f	f	\N	\N	\N	\N	\N	100.00	\N	
418	bunch of flat-leaf parsley	\N		\N	f	1	1	0	00BM	f	f	\N	\N	\N	\N	\N	100.00	\N	
419	grated parmesan or cheddar	\N		\N	f	1	1	0	00BN	f	f	\N	\N	\N	\N	\N	100.00	\N	
430	white mushrooms	\N		\N	f	1	1	0	00BY	f	f	\N	\N	\N	\N	\N	100.00	\N	
431	chopped herbs	\N		\N	f	1	1	0	00BZ	f	f	\N	\N	\N	\N	\N	100.00	\N	
387	egg tagliatelle	\N		\N	f	1	1	0	00AR	f	f	\N	\N	\N	\N	\N	100.00	\N	
388	chopped flatleaf parsley	\N		\N	f	1	1	0	00AS	f	f	\N	\N	\N	\N	\N	100.00	\N	
59	A handful of basil leaves	\N		\N	f	1	1	0	001N	f	f	\N	\N	\N	\N	\N	100.00	\N	
447	cooked rice	\N		\N	f	1	1	0	00CF	f	f	\N	\N	\N	\N	\N	100.00	\N	
432	bag dried red lentils	\N		\N	f	1	1	0	00C0	f	f	\N	\N	\N	\N	\N	100.00	\N	
433	each dried oregano and thyme	\N		\N	f	1	1	0	00C1	f	f	\N	\N	\N	\N	\N	100.00	\N	
391	vegetable stock	\N		\N	f	1	1	0	00AV	f	f	\N	\N	\N	\N	\N	100.00	\N	
434	parmesan or vegetarian cheese	\N		\N	f	1	1	0	00C2	f	f	\N	\N	\N	\N	\N	100.00	\N	
436	of onions and carrots	\N		\N	f	1	1	0	00C4	f	f	\N	\N	\N	\N	\N	100.00	\N	
437	celery	\N		\N	f	1	1	0	00C5	f	f	\N	\N	\N	\N	\N	100.00	\N	
420	sunflower oil	\N		\N	f	1	1	0	00BO	f	f	\N	\N	\N	\N	\N	100.00	\N	
306	garlic clove(s)	\N		\N	f	1	1	0	008I	f	f	\N	\N	\N	\N	\N	100.00	\N	
449	ground turmeric	\N		\N	f	1	1	0	00CH	f	f	\N	\N	\N	\N	\N	100.00	\N	
455	small pack coriander	\N		\N	f	1	1	0	00CN	f	f	\N	\N	\N	\N	\N	100.00	\N	
435	bay leaves	\N		\N	f	1	1	0	00C3	f	f	\N	\N	\N	\N	\N	100.00	\N	
438	few sprigs thyme	\N		\N	f	1	1	0	00C6	f	f	\N	\N	\N	\N	\N	100.00	\N	
439	can butter beans	\N		\N	f	1	1	0	00C7	f	f	\N	\N	\N	\N	\N	100.00	\N	
459	low-salt stock	\N		\N	f	1	1	0	00CR	f	f	\N	\N	\N	\N	\N	100.00	\N	
441	parmesan or vegetarian equivalent	\N		\N	f	1	1	0	00C9	f	f	\N	\N	\N	\N	\N	100.00	\N	
442	small pasta shapes	\N		\N	f	1	1	0	00CA	f	f	\N	\N	\N	\N	\N	100.00	\N	
403	small bunch basil	\N		\N	f	1	1	0	00B7	f	f	\N	\N	\N	\N	\N	100.00	\N	
445	and green pepper	\N		\N	f	1	1	0	00CD	f	f	\N	\N	\N	\N	\N	100.00	\N	
446	packs baby corn	\N		\N	f	1	1	0	00CE	f	f	\N	\N	\N	\N	\N	100.00	\N	
456	naan bread	\N		\N	f	1	1	0	00CO	f	f	\N	\N	\N	\N	\N	100.00	\N	
450	cayenne pepper	\N		\N	f	1	1	0	00CI	f	f	\N	\N	\N	\N	\N	100.00	\N	
451	butternut squash, peeled and cut into 2 cm	\N		\N	f	1	1	0	00CJ	f	f	\N	\N	\N	\N	\N	100.00	\N	
457	lamb meatballs	\N		\N	f	1	1	0	00CP	f	f	\N	\N	\N	\N	\N	100.00	\N	
458	rose harrisa	\N		\N	f	1	1	0	00CQ	f	f	\N	\N	\N	\N	\N	100.00	\N	
440	can chopped tomatoes	\N		\N	f	1	1	0	00C8	f	f	\N	\N	\N	\N	\N	100.00	\N	
460	400g can chickpeas	\N		\N	f	1	1	0	00CS	f	f	\N	\N	\N	\N	\N	100.00	\N	
461	small bunch of parsley	\N		\N	f	1	1	0	00CT	f	f	\N	\N	\N	\N	\N	100.00	\N	
462	bunch of mint	\N		\N	f	1	1	0	00CU	f	f	\N	\N	\N	\N	\N	100.00	\N	
463	chicken tikka masala paste	\N		\N	f	1	1	0	00CV	f	f	\N	\N	\N	\N	\N	100.00	\N	
464	mango chutney	\N		\N	f	1	1	0	00CW	f	f	\N	\N	\N	\N	\N	100.00	\N	
465	natural yogurt	\N		\N	f	1	1	0	00CX	f	f	\N	\N	\N	\N	\N	100.00	\N	
466	chopped coriander leaves	\N		\N	f	1	1	0	00CY	f	f	\N	\N	\N	\N	\N	100.00	\N	
470	sliced chillies	\N		\N	f	1	1	0	00D2	f	f	\N	\N	\N	\N	\N	100.00	\N	
471	lime wedges	\N		\N	f	1	1	0	00D3	f	f	\N	\N	\N	\N	\N	100.00	\N	
467	hot smoked paprika	\N		\N	f	1	1	0	00CZ	f	f	\N	\N	\N	\N	\N	100.00	\N	
468	½ tin black beans	\N		\N	f	1	1	0	00D0	f	f	\N	\N	\N	\N	\N	100.00	\N	
469	salted corn tortilla chips	\N		\N	f	1	1	0	00D1	f	f	\N	\N	\N	\N	\N	100.00	\N	
472	2 unit(s) Garlic Clove	\N		\N	f	1	1	0	00D4	f	f	\N	\N	\N	\N	\N	100.00	\N	
473	15 grams Honey	\N		\N	f	1	1	0	00D5	f	f	\N	\N	\N	\N	\N	100.00	\N	
474	10 grams Panko Breadcrumbs	\N		\N	f	1	1	0	00D6	f	f	\N	\N	\N	\N	\N	100.00	\N	
475	240 grams Pork Mince	\N		\N	f	1	1	0	00D7	f	f	\N	\N	\N	\N	\N	100.00	\N	
476	1 unit(s) Green Pepper	\N		\N	f	1	1	0	00D8	f	f	\N	\N	\N	\N	\N	100.00	\N	
477	1 unit(s) Onion	\N		\N	f	1	1	0	00D9	f	f	\N	\N	\N	\N	\N	100.00	\N	
478	2 nest(s) Egg Noodle Nest	\N		\N	f	1	1	0	00DA	f	f	\N	\N	\N	\N	\N	100.00	\N	
479	96 grams Hoisin Sauce	\N		\N	f	1	1	0	00DB	f	f	\N	\N	\N	\N	\N	100.00	\N	
480	15 milliliter(s) Soy Sauce	\N		\N	f	1	1	0	00DC	f	f	\N	\N	\N	\N	\N	100.00	\N	
481	5 grams Roasted White Sesame Seeds	\N		\N	f	1	1	0	00DD	f	f	\N	\N	\N	\N	\N	100.00	\N	
482	15 milliliter(s) Rice Vinegar	\N		\N	f	1	1	0	00DE	f	f	\N	\N	\N	\N	\N	100.00	\N	
483	1 tbsp Water for the Breadcrumbs	\N		\N	f	1	1	0	00DF	f	f	\N	\N	\N	\N	\N	100.00	\N	
484	¼ tsp Salt for the Meatballs	\N		\N	f	1	1	0	00DG	f	f	\N	\N	\N	\N	\N	100.00	\N	
485	50 milliliter(s) Water for the Sauce	\N		\N	f	1	1	0	00DH	f	f	\N	\N	\N	\N	\N	100.00	\N	
486	Breadcrumbs	\N		\N	f	1	1	0	00DI	f	f	\N	\N	\N	\N	\N	100.00	\N	
487	Pork mince	\N		\N	f	1	1	0	00DJ	f	f	\N	\N	\N	\N	\N	100.00	\N	
489	Hoisin sauce	\N		\N	f	1	1	0	00DL	f	f	\N	\N	\N	\N	\N	100.00	\N	
490	Roasted white seasame seeds	\N		\N	f	1	1	0	00DM	f	f	\N	\N	\N	\N	\N	100.00	\N	
491	Water for the meatballs	\N		\N	f	1	1	0	00DN	f	f	\N	\N	\N	\N	\N	100.00	\N	
493	1 unit(s) Bell Pepper	\N		\N	f	1	1	0	00DP	f	f	\N	\N	\N	\N	\N	100.00	\N	
494	80 grams Mangetout	\N		\N	f	1	1	0	00DQ	f	f	\N	\N	\N	\N	\N	100.00	\N	
495	1 unit(s) Spring Onion	\N		\N	f	1	1	0	00DR	f	f	\N	\N	\N	\N	\N	100.00	\N	
496	210 grams Diced Chicken Thigh	\N		\N	f	1	1	0	00DS	f	f	\N	\N	\N	\N	\N	100.00	\N	
497	10 grams Cornflour	\N		\N	f	1	1	0	00DT	f	f	\N	\N	\N	\N	\N	100.00	\N	
498	50 grams Ketjap Manis	\N		\N	f	1	1	0	00DU	f	f	\N	\N	\N	\N	\N	100.00	\N	
499	30 milliliter(s) Rice Vinegar	\N		\N	f	1	1	0	00DV	f	f	\N	\N	\N	\N	\N	100.00	\N	
500	2 tbsp Tomato Ketchup	\N		\N	f	1	1	0	00DW	f	f	\N	\N	\N	\N	\N	100.00	\N	
501	1 tsp Sugar for the Sauce	\N		\N	f	1	1	0	00DX	f	f	\N	\N	\N	\N	\N	100.00	\N	
502	75 milliliter(s) Water for the Sauce	\N		\N	f	1	1	0	00DY	f	f	\N	\N	\N	\N	\N	100.00	\N	
503	mangetout	\N		\N	f	1	1	0	00DZ	f	f	\N	\N	\N	\N	\N	100.00	\N	
504	diced chicken thighs	\N		\N	f	1	1	0	00E0	f	f	\N	\N	\N	\N	\N	100.00	\N	
505	cornflour	\N		\N	f	1	1	0	00E1	f	f	\N	\N	\N	\N	\N	100.00	\N	
488	Egg noodle nests	\N		\N	f	1	1	0	00DK	f	f	\N	\N	\N	\N	\N	100.00	\N	
506	Ketjap manis	\N		\N	f	1	1	0	00E2	f	f	\N	\N	\N	\N	\N	100.00	\N	
507	tomato ketchup	\N		\N	f	1	1	0	00E3	f	f	\N	\N	\N	\N	\N	100.00	\N	
508	100 grams Jasmine Rice	\N		\N	f	1	1	0	00E4	f	f	\N	\N	\N	\N	\N	100.00	\N	
509	1 unit(s) Butternut Squash	\N		\N	f	1	1	0	00E5	f	f	\N	\N	\N	\N	\N	100.00	\N	
510	1 sachet(s) Thai Style Spice Blend	\N		\N	f	1	1	0	00E6	f	f	\N	\N	\N	\N	\N	100.00	\N	
511	5 grams Black Sesame Seeds	\N		\N	f	1	1	0	00E7	f	f	\N	\N	\N	\N	\N	100.00	\N	
512	1 unit(s) Echalion Shallot	\N		\N	f	1	1	0	00E8	f	f	\N	\N	\N	\N	\N	100.00	\N	
513	1 unit(s) Garlic Clove	\N		\N	f	1	1	0	00E9	f	f	\N	\N	\N	\N	\N	100.00	\N	
514	½ unit(s) Lime	\N		\N	f	1	1	0	00EA	f	f	\N	\N	\N	\N	\N	100.00	\N	
515	45 grams Thai Green Curry Paste	\N		\N	f	1	1	0	00EB	f	f	\N	\N	\N	\N	\N	100.00	\N	
516	10 grams Vegetable Stock Paste	\N		\N	f	1	1	0	00EC	f	f	\N	\N	\N	\N	\N	100.00	\N	
517	200 milliliter(s) Coconut Milk	\N		\N	f	1	1	0	00ED	f	f	\N	\N	\N	\N	\N	100.00	\N	
518	120 grams Peas	\N		\N	f	1	1	0	00EE	f	f	\N	\N	\N	\N	\N	100.00	\N	
519	200 milliliter(s) Water for the Rice	\N		\N	f	1	1	0	00EF	f	f	\N	\N	\N	\N	\N	100.00	\N	
520	Jasmine rice	\N		\N	f	1	1	0	00EG	f	f	\N	\N	\N	\N	\N	100.00	\N	
521	Thai spice blend	\N		\N	f	1	1	0	00EH	f	f	\N	\N	\N	\N	\N	100.00	\N	
522	black sesame seeds	\N		\N	f	1	1	0	00EI	f	f	\N	\N	\N	\N	\N	100.00	\N	
523	Shallot	\N		\N	f	1	1	0	00EJ	f	f	\N	\N	\N	\N	\N	100.00	\N	
524	vegetable stock paste	\N		\N	f	1	1	0	00EK	f	f	\N	\N	\N	\N	\N	100.00	\N	
525	water for rice	\N		\N	f	1	1	0	00EL	f	f	\N	\N	\N	\N	\N	100.00	\N	
492	Water for the sauce	\N		\N	f	1	1	0	00DO	f	f	\N	\N	\N	\N	\N	100.00	\N	
52	groundnut oil	\N		\N	f	1	1	0	001G	f	f	\N	\N	\N	\N	\N	100.00	\N	
526	ciabatta	\N		\N	f	1	1	0	00EM	f	f	\N	\N	\N	\N	\N	100.00	\N	
296	garlic cloves	\N		\N	f	1	1	0	0088	f	f	\N	\N	\N	\N	\N	100.00	\N	
527	British free-range pork mince	\N		\N	f	1	1	0	00EN	f	f	\N	\N	\N	\N	\N	100.00	\N	
396	chicken stock	\N		\N	f	1	1	0	00B0	f	f	\N	\N	\N	\N	\N	100.00	\N	
244	peppers	\N		\N	f	1	1	0	006S	f	f	\N	\N	\N	\N	\N	100.00	\N	
528	sweet chilli sauce	\N		\N	f	1	1	0	00EO	f	f	\N	\N	\N	\N	\N	100.00	\N	
529	dark soy sauce	\N		\N	f	1	1	0	00EP	f	f	\N	\N	\N	\N	\N	100.00	\N	
530	Large handful of fresh coriander leaves	\N		\N	f	1	1	0	00EQ	f	f	\N	\N	\N	\N	\N	100.00	\N	
531	20 grams Chicken Stock Paste	\N		\N	f	1	1	0	00ER	f	f	\N	\N	\N	\N	\N	100.00	\N	
532	120 grams Bulgur Wheat	\N		\N	f	1	1	0	00ES	f	f	\N	\N	\N	\N	\N	100.00	\N	
533	80 grams Green Beans	\N		\N	f	1	1	0	00ET	f	f	\N	\N	\N	\N	\N	100.00	\N	
534	260 grams Diced Chicken Thigh	\N		\N	f	1	1	0	00EU	f	f	\N	\N	\N	\N	\N	100.00	\N	
535	30 grams Tomato Puree	\N		\N	f	1	1	0	00EV	f	f	\N	\N	\N	\N	\N	100.00	\N	
536	1 sachet(s) Roasted Spice and Herb Blend	\N		\N	f	1	1	0	00EW	f	f	\N	\N	\N	\N	\N	100.00	\N	
537	½ unit(s) Lemon	\N		\N	f	1	1	0	00EX	f	f	\N	\N	\N	\N	\N	100.00	\N	
538	240 milliliter(s) Water for the Bulgur	\N		\N	f	1	1	0	00EY	f	f	\N	\N	\N	\N	\N	100.00	\N	
539	½ tsp Sugar	\N		\N	f	1	1	0	00EZ	f	f	\N	\N	\N	\N	\N	100.00	\N	
540	100 milliliter(s) Water for the Sauce	\N		\N	f	1	1	0	00F0	f	f	\N	\N	\N	\N	\N	100.00	\N	
541	1 sachet(s) Indonesian Style Spice Mix	\N		\N	f	1	1	0	00F1	f	f	\N	\N	\N	\N	\N	100.00	\N	
542	25 grams Salted Peanuts	\N		\N	f	1	1	0	00F2	f	f	\N	\N	\N	\N	\N	100.00	\N	
543	150 grams Basmati Rice	\N		\N	f	1	1	0	00F3	f	f	\N	\N	\N	\N	\N	100.00	\N	
544	½ unit(s) Red Chilli	\N		\N	f	1	1	0	00F4	f	f	\N	\N	\N	\N	\N	100.00	\N	
545	240 grams Beef Mince	\N		\N	f	1	1	0	00F5	f	f	\N	\N	\N	\N	\N	100.00	\N	
546	25 milliliter(s) Soy Sauce	\N		\N	f	1	1	0	00F6	f	f	\N	\N	\N	\N	\N	100.00	\N	
547	1 unit(s) Pak Choi	\N		\N	f	1	1	0	00F7	f	f	\N	\N	\N	\N	\N	100.00	\N	
548	300 milliliter(s) Water for the Rice	\N		\N	f	1	1	0	00F8	f	f	\N	\N	\N	\N	\N	100.00	\N	
549	15 milliliter(s) Cider Vinegar	\N		\N	f	1	1	0	00F9	f	f	\N	\N	\N	\N	\N	100.00	\N	
550	20 grams Chipotle Paste	\N		\N	f	1	1	0	00FA	f	f	\N	\N	\N	\N	\N	100.00	\N	
551	60 grams Mature Cheddar Cheese	\N		\N	f	1	1	0	00FB	f	f	\N	\N	\N	\N	\N	100.00	\N	
552	½ carton(s) Black Beans	\N		\N	f	1	1	0	00FC	f	f	\N	\N	\N	\N	\N	100.00	\N	
553	1 unit(s) Carrot	\N		\N	f	1	1	0	00FD	f	f	\N	\N	\N	\N	\N	100.00	\N	
554	64 grams BBQ Sauce	\N		\N	f	1	1	0	00FE	f	f	\N	\N	\N	\N	\N	100.00	\N	
555	450 grams Potatoes	\N		\N	f	1	1	0	00FF	f	f	\N	\N	\N	\N	\N	100.00	\N	
556	100 milliliter(s) Water	\N		\N	f	1	1	0	00FG	f	f	\N	\N	\N	\N	\N	100.00	\N	
557	50 grams Hoisin Sauce	\N		\N	f	1	1	0	00FH	f	f	\N	\N	\N	\N	\N	100.00	\N	
558	6 unit(s) Plain Taco Tortilla	\N		\N	f	1	1	0	00FI	f	f	\N	\N	\N	\N	\N	100.00	\N	
559	250 grams Sweet Potato Fries	\N		\N	f	1	1	0	00FJ	f	f	\N	\N	\N	\N	\N	100.00	\N	
560	1 sachet(s) Ginger Puree	\N		\N	f	1	1	0	00FK	f	f	\N	\N	\N	\N	\N	100.00	\N	
561	½ unit(s) Cucumber	\N		\N	f	1	1	0	00FL	f	f	\N	\N	\N	\N	\N	100.00	\N	
562	1 unit(s) Chorizo Stick	\N		\N	f	1	1	0	00FM	f	f	\N	\N	\N	\N	\N	100.00	\N	
563	1 tin(s) Black Beans	\N		\N	f	1	1	0	00FN	f	f	\N	\N	\N	\N	\N	100.00	\N	
564	1 bunch(es) Flat Leaf Parsley	\N		\N	f	1	1	0	00FO	f	f	\N	\N	\N	\N	\N	100.00	\N	
565	1 unit(s) Lime	\N		\N	f	1	1	0	00FP	f	f	\N	\N	\N	\N	\N	100.00	\N	
566	¾ tsp Mexican Spice	\N		\N	f	1	1	0	00FQ	f	f	\N	\N	\N	\N	\N	100.00	\N	
567	125 milliliter(s) Water	\N		\N	f	1	1	0	00FR	f	f	\N	\N	\N	\N	\N	100.00	\N	
568	4 unit(s) Super Soft Tortilla with Whole Wheat	\N		\N	f	1	1	0	00FS	f	f	\N	\N	\N	\N	\N	100.00	\N	
569	1 pot(s) Creme Fraiche	\N		\N	f	1	1	0	00FT	f	f	\N	\N	\N	\N	\N	100.00	\N	
570	1 tbsp Honey	\N		\N	f	1	1	0	00FU	f	f	\N	\N	\N	\N	\N	100.00	\N	
571	1 bag(s) Baby Leaves	\N		\N	f	1	1	0	00FV	f	f	\N	\N	\N	\N	\N	100.00	\N	
572	1 tbsp Olive Oil	\N		\N	f	1	1	0	00FW	f	f	\N	\N	\N	\N	\N	100.00	\N	
573	1 pot(s) KNORR Vegetable Stock	\N		\N	f	1	1	0	00FX	f	f	\N	\N	\N	\N	\N	100.00	\N	
574	1 carton(s) Finely Chopped Tomatoes with Onion and Garlic	\N		\N	f	1	1	0	00FY	f	f	\N	\N	\N	\N	\N	100.00	\N	
575	1 pot(s) Tagine Garnish	\N		\N	f	1	1	0	00FZ	f	f	\N	\N	\N	\N	\N	100.00	\N	
576	1 sachet(s) Tagine Paste	\N		\N	f	1	1	0	00G0	f	f	\N	\N	\N	\N	\N	100.00	\N	
577	200 grams Lamb Mince	\N		\N	f	1	1	0	00G1	f	f	\N	\N	\N	\N	\N	100.00	\N	
578	120 grams Couscous	\N		\N	f	1	1	0	00G2	f	f	\N	\N	\N	\N	\N	100.00	\N	
579	1 unit(s) Courgette	\N		\N	f	1	1	0	00G3	f	f	\N	\N	\N	\N	\N	100.00	\N	
580	1 bunch(es) Coriander	\N		\N	f	1	1	0	00G4	f	f	\N	\N	\N	\N	\N	100.00	\N	
581	240 milliliter(s) Boiling Water	\N		\N	f	1	1	0	00G5	f	f	\N	\N	\N	\N	\N	100.00	\N	
582	green chilli	\N		\N	f	1	1	0	00G6	f	f	\N	\N	\N	\N	\N	100.00	\N	
583	obligatory backup jug of water	\N		\N	f	1	1	0	00G7	f	f	\N	\N	\N	\N	\N	100.00	\N	
584	handful of fresh coriander leaves	\N		\N	f	1	1	0	00G8	f	f	\N	\N	\N	\N	\N	100.00	\N	
\.


--
-- Data for Name: cookbook_food_child_inherit_fields; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_food_child_inherit_fields (id, food_id, foodinheritfield_id) FROM stdin;
\.


--
-- Data for Name: cookbook_food_inherit_fields; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_food_inherit_fields (id, food_id, foodinheritfield_id) FROM stdin;
\.


--
-- Data for Name: cookbook_food_onhand_users; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_food_onhand_users (id, food_id, user_id) FROM stdin;
1	1	1
2	4	1
3	5	1
4	6	1
5	7	1
6	8	1
7	10	1
14	25	1
15	24	1
17	234	1
18	89	1
19	237	1
20	238	1
21	203	1
\.


--
-- Data for Name: cookbook_food_substitute; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_food_substitute (id, from_food_id, to_food_id) FROM stdin;
\.


--
-- Data for Name: cookbook_foodinheritfield; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_foodinheritfield (id, field, name) FROM stdin;
1	supermarket_category	Supermarket Category
3	diet	Diet
4	substitute	Substitute
5	substitute_children	Substitute Children
6	substitute_siblings	Substitute Siblings
2	ignore_shopping	Ignore Shopping
\.


--
-- Data for Name: cookbook_foodproperty; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_foodproperty (id, food_id, property_id) FROM stdin;
\.


--
-- Data for Name: cookbook_importlog; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_importlog (id, type, running, msg, created_at, created_by_id, keyword_id, space_id, imported_recipes, total_recipes) FROM stdin;
\.


--
-- Data for Name: cookbook_ingredient; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_ingredient (id, amount, unit_id, food_id, note, "order", is_header, no_amount, space_id, original_text, always_use_plural_food, always_use_plural_unit) FROM stdin;
3	45.0000000000000000	1	258		2	f	f	1	45g sun-dried tomato nut pesto	f	f
7	5.0000000000000000	1	7		6	f	f	1	5g basil	f	f
8	1.0000000000000000	\N	20		7	f	f	1	1 red onion	f	f
9	1.0000000000000000	\N	9		8	f	f	1	1 red pepper	f	f
21	12.0000000000000000	\N	2	skinless chicken thighs	0	f	f	1	12 boneless, skinless chicken thighs	f	f
22	4.0000000000000000	6	16		0	f	f	1	4 tbsp olive oil	f	f
23	2.0000000000000000	7	22		0	f	f	1	2 tsp dried oregano	f	f
24	1.0000000000000000	7	23		0	f	f	1	1 tsp dried mint	f	f
25	1.0000000000000000	7	24		0	f	f	1	1 tsp ground cumin	f	f
26	1.0000000000000000	7	25		0	f	f	1	1 tsp coriander	f	f
27	1.0000000000000000	7	26		0	f	f	1	1 tsp sweet paprika	f	f
28	0.5000000000000000	7	14		0	f	f	1	½ tsp ground cinnamon	f	f
29	0.0000000000000000	\N	27	plus 1 lemon cut into wedges to serve	0	f	f	1	zest and juice 1 lemon, plus 1 lemon cut into wedges to serve	f	f
30	4.0000000000000000	4	28	crushed	0	f	f	1	4 garlic cloves, crushed	f	f
31	250.0000000000000000	1	29	strong	0	f	f	1	250g strong white bread flour	f	f
32	7.0000000000000000	1	30	sachet	0	f	f	1	7g sachet fast-action dried yeast	f	f
33	1.0000000000000000	7	31		0	f	f	1	1 tsp golden caster sugar	f	f
34	2.0000000000000000	7	16	plus a little for greasing	0	f	f	1	2 tsp olive oil, plus a little for greasing	f	f
35	0.5000000000000000	\N	32		0	f	f	1	½ cucumber	f	f
36	200.0000000000000000	1	33	Greek	0	f	f	1	200g Greek yogurt	f	f
37	0.0000000000000000	\N	34	finely chopped	0	f	f	1	small bunch mint, finely chopped	f	f
38	1.0000000000000000	10	21	crushed	0	f	f	1	1 small garlic clove, crushed	f	f
39	0.0000000000000000	\N	35		0	f	f	1	juice ½ lemon	f	f
40	1.0000000000000000	11	36		0	f	f	1	1 butter or round lettuce	f	f
41	4.0000000000000000	12	37	seeds removed, chopped	0	f	f	1	4 large tomatoes, seeds removed, chopped	f	f
42	1.0000000000000000	3	8	halved and thinly sliced	0	f	f	1	1 red onion, halved and thinly sliced	f	f
43	4.0000000000000000	13	38		0	f	f	1	4 long metal skewers	f	f
44	4.0000000000000000	6	39		0	f	f	1	\N	f	f
45	1.0000000000000000	7	40		1	f	f	1	\N	f	f
46	200.0000000000000000	1	41	cut into 2cm chunks	2	f	f	1	\N	f	f
47	500.0000000000000000	1	42	cut into florets	3	f	f	1	\N	f	f
48	0.2500000000000000	7	43		4	f	f	1	\N	f	f
49	0.2500000000000000	7	44		5	f	f	1	\N	f	f
50	1.0000000000000000	7	45		6	f	f	1	\N	f	f
51	1.0000000000000000	7	46		7	f	f	1	\N	f	f
52	1.0000000000000000	14	47		0	f	f	1	1 clove of garlic	f	f
53	1.0000000000000000	15	48		0	f	f	1	1 x 3 cm piece of ginger	f	f
54	1.0000000000000000	\N	49		0	f	f	1	1 lime	f	f
55	3.0000000000000000	16	50		0	f	f	1	3 tablespoons low-salt soy sauce	f	f
56	1.0000000000000000	17	51		0	f	f	1	1 tablepsoon runny honey	f	f
57	1.0000000000000000	18	52		0	f	f	1	1 teaspoon groundnut oil	f	f
58	2.0000000000000000	15	53	scaled, pin-boned, from sustainable sources	0	f	f	1	2 x 120 g salmon fillets , scaled, pin-boned, from sustainable sources	f	f
59	1.0000000000000000	19	54	optional	0	f	f	1	1 tablespoon sesame seeds , optional	f	f
65	1.0000000000000000	6	16		0	f	f	1	\N	f	f
66	60.0000000000000000	1	60		1	f	f	1	\N	f	f
67	0.5000000000000000	12	61	peeled and cut  into 1cm dice	2	f	f	1	\N	f	f
68	350.0000000000000000	1	62		3	f	f	1	\N	f	f
69	2.0000000000000000	15	67	finely chopped	4	f	f	1	\N	f	f
70	2.0000000000000000	15	63	finely chopped	5	f	f	1	\N	f	f
71	8.0000000000000000	12	64	shredded	6	f	f	1	\N	f	f
72	0.5000000000000000	\N	65		7	f	f	1	\N	f	f
73	25.0000000000000000	1	66		8	f	f	1	\N	f	f
74	1.0000000000000000	20	68	1.2kg prepared weight	0	f	f	1	1 medium butternut squash, peeled, seeds removed and cut into 2cm cubes (1.2kg prepared weight)	f	f
75	3.0000000000000000	4	28	unpeeled	0	f	f	1	3 garlic cloves, unpeeled	f	f
76	0.0000000000000000	\N	69		0	f	f	1	handful of sage leaves	f	f
77	1.0000000000000000	6	16	plus a litte extra	0	f	f	1	1 tbsp olive oil, plus a litte extra	f	f
78	600.0000000000000000	1	70	fresh	0	f	f	1	600g fresh spinach	f	f
79	12.0000000000000000	21	71	12-15	0	f	f	1	12-15 lasagne sheets	f	f
10	1.0000000000000000	\N	21		9	f	f	1	1 garlic clove	f	f
2	2.0000000000000000	\N	2		1	f	f	1	2 British chicken breast portions	f	f
4	11.0000000000000000	1	259		3	f	f	1	11g chicken stock mix	f	f
5	16.0000000000000000	1	83		4	f	f	1	16g tomato paste	f	f
6	150.0000000000000000	1	6		5	f	f	1	150g orzo	f	f
16	2.0000000000000000	6	16		5	f	f	1	2 tbsp olive oil	f	f
18	1.2000000000000000	9	391	hot	7	f	f	1	1.2l hot low-sodium chicken or vegetable stock	f	f
20	0.0000000000000000	\N	19	to serve	9	f	f	1	freshly grated parmesan, to serve	f	f
60	500.0000000000000000	1	55	rainbow	0	f	f	1	500g rainbow beetroot	f	f
11	1.0000000000000000	5	260		0	f	f	1	1kg shoulder of lamb	f	f
62	400.0000000000000000	1	57		2	f	f	1	400g gnocchi	f	f
13	1.0000000000000000	7	22		2	f	f	1	1 tbsp chopped oregano, or 1 tsp dried	f	f
15	2.0000000000000000	\N	261		4	f	f	1	2 cinnamon sticks, broken in half	f	f
63	2.0000000000000000	6	292		3	f	f	1	2 tbsp basil pesto	f	f
12	2.0000000000000000	\N	12	sliced	1	f	f	1	2 onions, sliced	f	f
61	1.0000000000000000	6	56		1	f	f	1	1 tbsp balsamic vinegar	f	f
17	400.0000000000000000	1	17	can	6	f	f	1	400g can chopped tomato	f	f
14	0.5000000000000000	7	14		3	f	f	1	½ tsp ground cinnamon	f	f
19	400.0000000000000000	1	6		8	f	f	1	400g orzo (see know-how below)	f	f
64	0.0000000000000000	\N	59		4	f	f	1	A handful of basil leaves	f	f
80	125.0000000000000000	1	72	ball	0	f	f	1	125g ball mozzarella, torn or cut into small pieces	f	f
81	40.0000000000000000	1	73	pine	0	f	f	1	40g pine nuts	f	f
82	70.0000000000000000	1	60		0	f	f	1	70g butter	f	f
83	70.0000000000000000	1	74		0	f	f	1	70g flour	f	f
84	800.0000000000000000	22	75		0	f	f	1	800ml milk	f	f
85	250.0000000000000000	1	76		0	f	f	1	250g mascarpone	f	f
86	50.0000000000000000	1	77	parmesan	0	f	f	1	50g parmesan (or vegetarian alternative), grated	f	f
87	0.0000000000000000	\N	78		0	f	f	1	grating of nutmeg	f	f
104	1.0000000000000000	12	8		0	f	f	1	1 large onion	f	f
105	1.0000000000000000	3	9		0	f	f	1	1 red pepper	f	f
106	2.0000000000000000	4	28		0	f	f	1	2 garlic cloves	f	f
107	1.0000000000000000	6	91		0	f	f	1	1 tbsp oil	f	f
108	1.0000000000000000	30	92	or 1 level tbsp if you only have mild	0	f	f	1	1 heaped tsp hot chilli powder (or 1 level tbsp if you only have mild)	f	f
109	1.0000000000000000	7	93		0	f	f	1	1 tsp paprika	f	f
110	1.0000000000000000	7	24		0	f	f	1	1 tsp ground cumin	f	f
111	500.0000000000000000	1	94	lean	0	f	f	1	500g lean minced beef	f	f
112	1.0000000000000000	31	95		0	f	f	1	1 beef stock cube	f	f
113	400.0000000000000000	1	96	can	0	f	f	1	400g can chopped tomatoes	f	f
114	0.5000000000000000	7	97		0	f	f	1	½ tsp dried marjoram	f	f
115	1.0000000000000000	7	46	or add a thumbnail-sized piece of dark chocolate along with the beans instead, see tip	0	f	f	1	1 tsp sugar (or add a thumbnail-sized piece of dark chocolate along with the beans instead, see tip)	f	f
116	2.0000000000000000	6	98		0	f	f	1	2 tbsp tomato purée	f	f
117	410.0000000000000000	1	99	can	0	f	f	1	410g can red kidney beans	f	f
118	0.0000000000000000	\N	100	to serve	0	f	f	1	plain boiled long grain rice , to serve	f	f
119	0.0000000000000000	\N	101	to serve	0	f	f	1	soured cream , to serve	f	f
120	150.0000000000000000	32	102	roughly chopped	0	f	f	1	150g/5½oz chorizo, roughly chopped	f	f
121	4.0000000000000000	4	28	finely chopped	0	f	f	1	4 garlic cloves, finely chopped	f	f
122	4.0000000000000000	33	103	halved, deseeded and roughly chopped	0	f	f	1	4 peppers (mixture of red and yellow), halved, deseeded and roughly chopped	f	f
123	160.0000000000000000	32	104	button	0	f	f	1	160g/5½oz button mushrooms, halved	f	f
124	400.0000000000000000	1	96	tin	0	f	f	1	400g tin chopped tomatoes	f	f
125	3.0000000000000000	6	98		0	f	f	1	3 tbsp tomato purée	f	f
126	1.0000000000000000	7	105		0	f	f	1	1 tsp dried red chilli flakes	f	f
127	2.0000000000000000	6	106		0	f	f	1	2 tbsp red wine vinegar	f	f
128	450.0000000000000000	34	107	broken in half	0	f	f	1	450g/1lb spaghetti, broken in half	f	f
129	1.0000000000000000	35	108		0	f	f	1	1 litre/1¾ pints boiling water	f	f
130	0.0000000000000000	\N	109		0	f	f	1	sea salt and freshly ground black pepper	f	f
131	1.0000000000000000	12	110	roughly chopped	0	f	f	1	1 large handful basil leaves, roughly chopped	f	f
132	30.0000000000000000	36	111	freshly grated	0	f	f	1	30g/1oz Parmesan, freshly grated	f	f
133	1.0000000000000000	5	11	shoulder	0	f	f	1	1kg shoulder of lamb	f	f
134	2.0000000000000000	\N	12	sliced	0	f	f	1	2 onions, sliced	f	f
135	1.0000000000000000	6	13	or 1 tsp dried	0	f	f	1	1 tbsp chopped oregano, or 1 tsp dried	f	f
136	0.5000000000000000	7	14		0	f	f	1	½ tsp ground cinnamon	f	f
137	2.0000000000000000	8	15	broken in half	0	f	f	1	2 cinnamon sticks, broken in half	f	f
138	2.0000000000000000	6	16		0	f	f	1	2 tbsp olive oil	f	f
139	400.0000000000000000	1	17	can	0	f	f	1	400g can chopped tomato	f	f
140	1.2000000000000000	9	18	hot	0	f	f	1	1.2l hot low-sodium chicken or vegetable stock	f	f
141	400.0000000000000000	1	6	see know-how below	0	f	f	1	400g orzo (see know-how below)	f	f
142	0.0000000000000000	\N	19	to serve	0	f	f	1	freshly grated parmesan, to serve	f	f
90	1.0000000000000000	\N	102		2	f	f	1	1 unit(s) Chorizo Stick	f	f
91	400.0000000000000000	24	81		3	f	f	1	1 tin(s) Black Beans	f	f
92	1.0000000000000000	25	82		4	f	f	1	1 bunch(es) Flat Leaf Parsley	f	f
93	1.0000000000000000	\N	49		5	f	f	1	1 unit(s) Lime	f	f
94	30.0000000000000000	1	83		6	f	f	1	30 grams Tomato Puree	f	f
95	0.7500000000000000	7	84		7	f	f	1	¾ tsp Mexican Spice	f	f
96	125.0000000000000000	22	85		8	f	f	1	125 milliliter(s) Water	f	f
97	4.0000000000000000	\N	86		9	f	f	1	4 unit(s) Super Soft Tortilla with Whole Wheat	f	f
98	1.0000000000000000	28	87		10	f	f	1	1 pot(s) Creme Fraiche	f	f
99	60.0000000000000000	26	325		11	f	f	1	60 grams Mature Cheddar Cheese	f	f
100	1.0000000000000000	6	89		12	f	f	1	1 tbsp Honey	f	f
101	0.5000000000000000	\N	32		13	f	f	1	½ unit(s) Cucumber	f	f
102	1.0000000000000000	29	90		14	f	f	1	1 bag(s) Baby Leaves	f	f
103	1.0000000000000000	6	16		15	f	f	1	1 tbsp Olive Oil	f	f
144	4.0000000000000000	6	113		1	f	f	1	4 tbsp extra-virgin olive oil	f	f
145	500.0000000000000000	1	114	lamb	2	f	f	1	500g lamb mince	f	f
146	1.0000000000000000	\N	8	finely chopped	3	f	f	1	1 onion, finely chopped	f	f
147	4.0000000000000000	37	115	finely chopped	4	f	f	1	4 cloves garlic, finely chopped	f	f
148	1.0000000000000000	7	14		5	f	f	1	1 tsp ground cinnamon	f	f
149	0.5000000000000000	7	22		6	f	f	1	½ tsp dried oregano	f	f
150	400.0000000000000000	1	96	tin	7	f	f	1	400g tin chopped tomatoes	f	f
151	100.0000000000000000	1	116		8	f	f	1	100g raisins	f	f
152	60.0000000000000000	1	73	pine	9	f	f	1	60g pine nuts, toasted	f	f
154	100.0000000000000000	1	118	crumbled	11	f	f	1	100g feta, crumbled	f	f
155	0.0000000000000000	\N	119		12	f	f	1	to serve mint leaves	f	f
143	6.0000000000000000	\N	112	halved lengthways	0	f	f	1	6 courgettes, halved lengthways	f	f
156	4.0000000000000000	38	120	6 oz	0	f	f	1	4 (6 oz) skinless salmon fillets	f	f
157	3.0000000000000000	39	121	plus more for grill	0	f	f	1	3 Tbsp olive oil, (plus more for grill)	f	f
158	2.0000000000000000	7	122		0	f	f	1	2 tsp lime zest	f	f
159	3.0000000000000000	39	123		0	f	f	1	3 Tbsp fresh lime juice	f	f
160	3.0000000000000000	37	124	crushed	0	f	f	1	3 cloves garlic, (crushed)	f	f
161	0.0000000000000000	\N	125	to taste	0	f	f	1	Salt and freshly ground black pepper, (to taste)	f	f
162	1.5000000000000000	40	126		0	f	f	1	1 1/2 cups Zico Coconut Water	f	f
163	1.2500000000000000	40	127		0	f	f	1	1 1/4 cups canned coconut milk	f	f
164	1.5000000000000000	40	128	rinsed well and drained well	0	f	f	1	1 1/2 cups jasmine rice, (rinsed well and drained well)	f	f
165	0.5000000000000000	7	45		0	f	f	1	1/2 tsp salt	f	f
166	1.0000000000000000	12	129	peeled and diced	0	f	f	1	1 large mango, (peeled and diced)	f	f
167	0.7500000000000000	41	130	(1/2 large)	0	f	f	1	3/4 cup chopped red bell pepper ((1/2 large))	f	f
168	0.2500000000000000	41	131		0	f	f	1	1/4 cup chopped fresh cilantro	f	f
169	0.3333333333333333	41	132	rinsed under water and drained	0	f	f	1	1/3 cup chopped red onion, (rinsed under water and drained)	f	f
170	1.0000000000000000	12	133	peeled and diced	0	f	f	1	1 large avocado, (peeled and diced)	f	f
171	1.0000000000000000	39	123		0	f	f	1	1 Tbsp fresh lime juice	f	f
172	1.0000000000000000	39	16		0	f	f	1	1 Tbsp olive oil	f	f
173	1.0000000000000000	39	126		0	f	f	1	1 Tbsp Zico Coconut Water	f	f
174	0.0000000000000000	\N	134	to taste	0	f	f	1	Salt and pepper, (to taste)	f	f
175	200.0000000000000000	1	135	brown	0	f	f	1	200g brown basmati rice	f	f
176	1.0000000000000000	6	16		0	f	f	1	1 tbsp olive oil	f	f
177	1.0000000000000000	42	136	diced	0	f	f	1	1 butternut squash, diced	f	f
178	1.0000000000000000	3	8	diced	0	f	f	1	1 red onion, diced	f	f
179	2.0000000000000000	6	137		0	f	f	1	2 tbsp mild curry paste	f	f
180	300.0000000000000000	22	138	vegetable	0	f	f	1	300ml vegetable stock	f	f
181	4.0000000000000000	12	37	roughly chopped	0	f	f	1	4 large tomatoes, roughly chopped	f	f
182	400.0000000000000000	1	139	can	0	f	f	1	400g can chickpeas, rinsed and drained	f	f
183	3.0000000000000000	6	140		0	f	f	1	3 tbsp fat-free Greek yogurt	f	f
184	0.0000000000000000	\N	141	chopped	0	f	f	1	small handful coriander, chopped	f	f
185	25.0000000000000000	1	60		0	f	f	1	\N	f	f
186	1.0000000000000000	\N	42		0	f	f	1	\N	f	f
187	200.0000000000000000	1	142		0	f	f	1	\N	f	f
188	25.0000000000000000	1	143		0	f	f	1	\N	f	f
189	300.0000000000000000	22	75	warmed	0	f	f	1	\N	f	f
190	1.0000000000000000	7	144		0	f	f	1	\N	f	f
191	200.0000000000000000	1	88		0	f	f	1	\N	f	f
192	40.0000000000000000	1	1	cheddar	0	f	f	1	40g cheddar cheese	f	f
193	2.0000000000000000	2	2		0	f	f	1	2 British chicken breast portions	f	f
194	45.0000000000000000	1	3	sun-dried	0	f	f	1	45g sun-dried tomato nut pesto	f	f
195	11.0000000000000000	1	4	chicken	0	f	f	1	11g chicken stock mix	f	f
196	16.0000000000000000	1	5	tomato	0	f	f	1	16g tomato paste	f	f
197	150.0000000000000000	1	6		0	f	f	1	150g orzo	f	f
198	5.0000000000000000	1	7		0	f	f	1	5g basil	f	f
199	1.0000000000000000	3	8		0	f	f	1	1 red onion	f	f
200	1.0000000000000000	3	9		0	f	f	1	1 red pepper	f	f
201	1.0000000000000000	4	10		0	f	f	1	1 garlic clove	f	f
202	4.0000000000000000	10	145	sliced	0	f	f	1	4 small potatoes, sliced	f	f
203	1.0000000000000000	6	16		0	f	f	1	1 tbsp olive oil	f	f
204	2.0000000000000000	7	146	lightly crushed	0	f	f	1	2 tsp fennel seed, lightly crushed	f	f
205	4.0000000000000000	\N	55	peeled and cut into wedges	0	f	f	1	4 beetroot, peeled and cut into wedges	f	f
206	4.0000000000000000	43	147		0	f	f	1	4 pollock fillets	f	f
207	0.0000000000000000	\N	148		0	f	f	1	zest ½ lemon	f	f
208	4.0000000000000000	6	149		0	f	f	1	4 tbsp crème fraîche	f	f
209	0.0000000000000000	\N	150	roughly chopped	0	f	f	1	small handful basil, roughly chopped	f	f
216	2.0000000000000000	6	156	optional	0	f	f	1	2 tbsp mayonnaise mixed with wasabi (optional)	f	f
217	1.0000000000000000	6	16		0	f	f	1	1 tbsp olive oil	f	f
218	2.0000000000000000	6	157		0	f	f	1	2 tbsp maple syrup	f	f
219	0.5000000000000000	10	158	leaves picked	0	f	f	1	½ small pack thyme , leaves picked	f	f
220	1.0000000000000000	7	40		0	f	f	1	1 tsp cumin seeds	f	f
221	2.0000000000000000	7	106		0	f	f	1	2 tsp red wine vinegar	f	f
222	1.0000000000000000	12	159	peeled and cut into 3cm/11/4in chunks	0	f	f	1	1 large swede (about 900g/2lb), peeled and cut into 3cm/11/4in chunks	f	f
223	2.0000000000000000	3	12	cut into wedges	0	f	f	1	2 red onions , cut into wedges	f	f
224	8.0000000000000000	45	160		0	f	f	1	8 pork sausages	f	f
225	3.0000000000000000	46	161	such as Granny Smith or Pink Lady, cut into wedges and cored	0	f	f	1	3 sharp eating apples , such as Granny Smith or Pink Lady, cut into wedges and cored	f	f
226	0.0000000000000000	\N	162	to serve	0	f	f	1	cooked broccoli , to serve	f	f
227	1.0000000000000000	6	16		0	f	f	1	1 tbsp olive oil	f	f
228	6.0000000000000000	45	160		0	f	f	1	6 pork sausages	f	f
229	1.0000000000000000	7	163		0	f	f	1	1 tsp chilli flakes	f	f
230	1.0000000000000000	7	164	optional	0	f	f	1	1 tsp fennel seeds (optional)	f	f
231	500.0000000000000000	1	57	fresh	0	f	f	1	500g fresh gnocchi	f	f
211	4.0000000000000000	7	16		1	f	f	1	4 tsp olive oil	f	f
212	2.0000000000000000	\N	120		2	f	f	1	2 x 140g/5oz skinless salmon fillets	f	f
213	0.0000000000000000	\N	153	grated	3	f	f	1	thumbnail-size piece ginger , grated	f	f
214	1.0000000000000000	\N	49	zest	4	f	f	1	zest 1 lime , plus wedges to serve	f	f
215	0.5000000000000000	44	155	finely chopped	5	f	f	1	½ bunch spring onions , finely chopped	f	f
232	500.0000000000000000	22	138	chicken	0	f	f	1	500ml chicken stock (fresh if you can get it)	f	f
233	100.0000000000000000	1	165	chopped	0	f	f	1	100g chopped kale	f	f
234	40.0000000000000000	1	111	finely grated	0	f	f	1	40g parmesan, finely grated	f	f
254	0.0000000000000000	\N	16		0	f	f	1	olive oil	f	f
255	2.0000000000000000	3	12		0	f	f	1	2 red onions	f	f
256	3.0000000000000000	16	179		0	f	f	1	3 tablespoons rogan josh paste	f	f
257	1.0000000000000000	51	180		0	f	f	1	1 fresh red chilli	f	f
258	3.0000000000000000	52	181	piece	0	f	f	1	3cm piece of ginger	f	f
259	1.0000000000000000	44	182		0	f	f	1	1 bunch of fresh coriander	f	f
260	3.0000000000000000	53	145		0	f	f	1	3 sweet potatoes	f	f
261	1.0000000000000000	15	183		0	f	f	1	1 x 400 g tin chickpeas	f	f
262	8.0000000000000000	48	184		0	f	f	1	8 ripe tomatoes or 1 x 400g tin chopped tomatoes	f	f
263	1.0000000000000000	15	185		0	f	f	1	1 x 400 ml tin light coconut milk	f	f
264	400.0000000000000000	1	186		0	f	f	1	400 g pre-washed spinach	f	f
265	0.0000000000000000	\N	187		0	f	f	1	Chicken	f	f
266	0.0000000000000000	\N	188		0	f	f	1	Asparagus	f	f
267	0.0000000000000000	\N	189		1	f	f	1	pasta	f	f
268	0.0000000000000000	\N	190		0	f	f	1	Halloumi	f	f
269	0.0000000000000000	\N	173		1	f	f	1	Avocado	f	f
304	0.5000000000000000	23	180		0	f	f	1	½ unit(s) Red Chilli	f	f
236	0.5000000000000000	3	8	chopped	1	f	f	1	½ red onion, chopped	f	f
238	500.0000000000000000	1	167	pack	4	f	f	1	500g pack lean pork mince	f	f
239	300.0000000000000000	22	168		5	f	f	1	300ml passata	f	f
240	5.0000000000000000	6	169		6	f	f	1	5 tbsp barbecue sauce	f	f
241	400.0000000000000000	1	170	can	7	f	f	1	400g can black bean, drained	f	f
242	0.0000000000000000	\N	171	chopped	8	f	f	1	small bunch coriander, chopped	f	f
243	8.0000000000000000	47	172		9	f	f	1	8 taco shells	f	f
244	1.0000000000000000	48	173	peeled and sliced	10	f	f	1	1 ripe avocado, peeled and sliced	f	f
245	0.5000000000000000	49	174	finely shredded	11	f	f	1	½ iceberg lettuce, finely shredded	f	f
246	0.0000000000000000	\N	175	optional	12	f	f	1	soured cream, to serve (optional)	f	f
301	600.0000000000000000	26	61		0	f	f	1	600 grams Butternut Squash	f	f
302	1.0000000000000000	\N	8		1	f	f	1	1 unit(s) Onion	f	f
303	1.0000000000000000	44	82		2	f	f	1	1 bunch(es) Flat Leaf Parsley	f	f
305	1.0000000000000000	\N	306		3	f	f	1	1 unit(s) Garlic Clove	f	f
306	4.0000000000000000	\N	216		4	f	f	1	4 unit(s) Streaky Bacon Rasher	f	f
307	40.0000000000000000	26	217		5	f	f	1	40 grams Parmesan Cheese	f	f
308	1000.0000000000000000	22	85		6	f	f	1	1000 milliliter(s) Water	f	f
309	1.0000000000000000	23	218		7	f	f	1	1 unit(s) Vegetable Stock Pot	f	f
310	30.0000000000000000	1	219		8	f	f	1	30 grams Unsalted Butter	f	f
311	175.0000000000000000	1	220		9	f	f	1	175 grams Risotto Rice	f	f
312	0.5000000000000000	\N	221		10	f	f	1	½ unit(s) Lemon	f	f
272	1.0000000000000000	7	193		2	f	f	1	1 tsp five-spice powder	f	f
273	2.0000000000000000	55	194		3	f	f	1	2 star anise	f	f
274	1.0000000000000000	6	195		4	f	f	1	1 tbsp light soy sauce	f	f
275	2.0000000000000000	\N	196		5	f	f	1	2 skinless chicken breasts	f	f
278	50.0000000000000000	1	397		8	f	f	1	50g/1¾oz sugar-snap peas, halved lengthways	f	f
281	0.0000000000000000	\N	200		11	f	f	1	salt and freshly ground black pepper	f	f
282	75.0000000000000000	1	201	crunchy	12	f	f	1	75g/2½oz crunchy peanut butter	f	f
284	1.0000000000000000	6	203		14	f	f	1	1 tbsp soy sauce	f	f
285	1.0000000000000000	7	51		15	f	f	1	1 tsp runny honey	f	f
286	1.0000000000000000	7	204		16	f	f	1	1 tsp rice wine vinegar	f	f
287	0.5000000000000000	7	205		17	f	f	1	½ tsp finely grated garlic	f	f
288	0.5000000000000000	7	206		18	f	f	1	½ tsp finely grated fresh ginger	f	f
289	1.0000000000000000	\N	180	finely sliced or diced	19	f	f	1	1 red chilli, finely sliced or diced	f	f
291	2.0000000000000000	7	209		21	f	f	1	2 tsp toasted sesame seeds	f	f
292	2.0000000000000000	\N	210	halved	22	f	f	1	2 limes, halved	f	f
270	500.0000000000000000	22	396		0	f	f	1	500ml/18fl oz fresh chicken stock	f	f
271	2.0000000000000000	6	192		1	f	f	1	2 tbsp roughly chopped fresh root ginger	f	f
276	1.0000000000000000	\N	32	julienned	6	f	f	1	1 small cucumber, julienned	f	f
277	1.0000000000000000	\N	197	julienned or grated	7	f	f	1	1 carrot, julienned or grated	f	f
280	0.0000000000000000	\N	199	plus extra for garnish	10	f	f	1	small handful fresh coriander leaves or Thai basil leaves, plus extra for garnish	f	f
283	1.0000000000000000	7	202		13	f	f	1	1 tsp toasted sesame oil	f	f
290	1.0000000000000000	6	208	roughly chopped	20	f	f	1	1 tbsp roasted peanuts, roughly chopped	f	f
297	250.0000000000000000	26	212		4	f	f	1	250 grams Beef Steak Strips	f	f
298	1.0000000000000000	28	213		5	f	f	1	1 pot(s) Rendang Paste	f	f
299	1.0000000000000000	28	214		6	f	f	1	1 pot(s) Thai Garnish	f	f
300	1.0000000000000000	24	215		7	f	f	1	1 tin(s) Coconut Milk	f	f
247	2.0000000000000000	\N	176		0	f	f	1	\N	f	f
293	150.0000000000000000	1	135		0	f	f	1	150 grams Basmati Rice	f	f
294	1.0000000000000000	\N	8		1	f	f	1	1 unit(s) Onion	f	f
295	1.0000000000000000	\N	211	pack	2	f	f	1	1 pack(s) Green Beans	f	f
296	1.0000000000000000	25	25		3	f	f	1	1 bunch(es) Coriander	f	f
248	4.0000000000000000	\N	306		1	f	f	1	\N	f	f
249	4.0000000000000000	\N	177		2	f	f	1	\N	f	f
250	1.0000000000000000	50	60		3	f	f	1	\N	f	f
251	300.0000000000000000	1	107		4	f	f	1	\N	f	f
252	50.0000000000000000	1	111		5	f	f	1	\N	f	f
253	1.0000000000000000	\N	178		6	f	f	1	\N	f	f
313	1.0000000000000000	59	222		0	f	f	1	1 pack(s) Diced Sweet Potato	f	f
314	1.0000000000000000	59	223		0	f	f	1	1 pack(s) Baby Plum Tomatoes	f	f
315	1.0000000000000000	28	224		0	f	f	1	1 pot(s) Dried Thyme	f	f
316	60.0000000000000000	26	225		0	f	f	1	60 grams Bacon Lardons	f	f
317	1.0000000000000000	60	226		0	f	f	1	1 sachet Chicken Stock Powder	f	f
318	180.0000000000000000	26	6		0	f	f	1	180 grams Orzo	f	f
319	1.0000000000000000	60	227		0	f	f	1	1 sachet Cider Vinegar	f	f
320	1.0000000000000000	61	163		0	f	f	1	1 pinch Chilli Flakes	f	f
321	1.0000000000000000	29	228		0	f	f	1	1 bag(s) Baby Spinach	f	f
322	75.0000000000000000	26	87		0	f	f	1	75 grams Creme Fraiche	f	f
323	1.0000000000000000	59	229		0	f	f	1	1 pack(s) Grated Hard Italian Style Cheese	f	f
324	1.0000000000000000	25	230		0	f	f	1	1 bunch(es) Chives	f	f
325	100.0000000000000000	27	231		0	f	f	1	100 milliliter(s) Pasta Water	f	f
326	0.0000000000000000	\N	232		0	f	f	1	What you will need:	f	f
327	2.0000000000000000	62	233		0	f	f	1	2 chicken breasts cut into strips	f	f
328	0.0000000000000000	\N	234		0	f	f	1	Salt and pepper	f	f
329	1.0000000000000000	6	89		0	f	f	1	1 tbsp honey	f	f
330	1.0000000000000000	12	235		0	f	f	1	1 large onion ; chopped	f	f
331	3.0000000000000000	37	47		0	f	f	1	3 cloves of garlic	f	f
332	250.0000000000000000	1	236		0	f	f	1	250 g small button mushroom sliced	f	f
333	0.5000000000000000	7	237		0	f	f	1	1/2 tsp mild chilli power	f	f
334	1.0000000000000000	6	238		0	f	f	1	1 tbsp curry power	f	f
335	250.0000000000000000	1	239		0	f	f	1	250 g long grain rice	f	f
336	100.0000000000000000	1	240		0	f	f	1	100 g frozen peas	f	f
337	4.0000000000000000	6	203		0	f	f	1	4 tbsp soy sauce	f	f
338	1.0000000000000000	63	241		0	f	f	1	1 egg for each person	f	f
339	1.0000000000000000	64	242		0	f	f	1	1 litre of chicken stock	f	f
340	2.0000000000000000	62	243	or the equivalent amount of soft meat from chicken thighs	1	f	f	1	2 chicken breast fillets (or the equivalent amount of soft meat from chicken thighs)	f	f
341	2.0000000000000000	3	244	deseeded and chopped into small cubes	2	f	f	1	2 red peppers, deseeded and chopped into small cubes	f	f
342	8.0000000000000000	65	245	to taste) cut into small cubes	3	f	f	1	8 or 9 inches of chorizo (spicy or not, to taste) cut into small cubes	f	f
343	3.0000000000000000	65	246		4	f	f	1	3 or 4 shallots (or one red onion) chopped finely	f	f
344	240.0000000000000000	66	220	60-70g per person 240-280g	5	f	f	1	240-280g of Risotto rice (60-70g per person)	f	f
345	1.0000000000000000	12	247		6	f	f	1	1 large glass of 50/50 white Vermouth and white wine	f	f
346	25.0000000000000000	1	248	of	7	f	f	1	25g of butter and a few tablespoons of olive oil	f	f
347	4.0000000000000000	16	249	4-6	8	f	f	1	4-6 tablespoons of freshly grated Parmesan cheese	f	f
348	40.0000000000000000	1	1	cheddar	0	f	f	1	40g cheddar cheese	f	f
349	2.0000000000000000	2	2		0	f	f	1	2 British chicken breast portions	f	f
350	45.0000000000000000	1	3	sun-dried	0	f	f	1	45g sun-dried tomato nut pesto	f	f
351	11.0000000000000000	1	4	chicken	0	f	f	1	11g chicken stock mix	f	f
352	16.0000000000000000	1	5	tomato	0	f	f	1	16g tomato paste	f	f
353	150.0000000000000000	1	6		0	f	f	1	150g orzo	f	f
354	5.0000000000000000	1	7		0	f	f	1	5g basil	f	f
355	1.0000000000000000	3	8		0	f	f	1	1 red onion	f	f
356	1.0000000000000000	3	9		0	f	f	1	1 red pepper	f	f
357	1.0000000000000000	4	10		0	f	f	1	1 garlic clove	f	f
363	0.5000000000000000	7	253		5	f	f	1	onion salt	f	f
364	0.5000000000000000	7	237		6	f	f	1	chilli powder	f	f
365	4.0000000000000000	\N	151	cut in 1cm slices	7	f	f	1	sweet potato	f	f
366	1.0000000000000000	6	254		8	f	f	1	rapeseed oil	f	f
367	80.0000000000000000	1	88	grated	9	f	f	1	\N	f	f
381	1.0000000000000000	\N	8	finely sliced	0	f	f	1	\N	f	f
382	1.0000000000000000	\N	21	finely sliced	1	f	f	1	\N	f	f
383	400.0000000000000000	1	220		0	f	f	1	\N	f	f
384	200.0000000000000000	1	240	defrosted	0	f	f	1	\N	f	f
385	180.0000000000000000	1	188	sliced into 2cm pieces	1	f	f	1	\N	f	f
386	1.0000000000000000	39	256		2	f	f	1	\N	f	f
358	2.0000000000000000	6	250		0	f	f	1	2 tbsp roughly chopped coriander	f	f
359	4.0000000000000000	\N	155	finely chopped	1	f	f	1	4 spring onions, finely chopped	f	f
360	1.0000000000000000	\N	251		2	f	f	1	1 lime juice	f	f
361	4.0000000000000000	\N	37	roughly chopped	3	f	f	1	4 tomatoes, roughly chopped	f	f
362	0.5000000000000000	7	252		4	f	f	1	garlic powder	f	f
368	1.0000000000000000	\N	173	roughly chopped	10	f	f	1	\N	f	f
369	2.0000000000000000	\N	120		0	f	f	1	\N	f	f
370	1.0000000000000000	\N	255		0	f	f	1	\N	f	f
371	1.0000000000000000	\N	8	finely sliced	0	f	f	1	\N	f	f
372	1.0000000000000000	\N	21	finely sliced	1	f	f	1	\N	f	f
373	400.0000000000000000	1	220		0	f	f	1	\N	f	f
374	200.0000000000000000	1	240	defrosted	0	f	f	1	\N	f	f
375	180.0000000000000000	1	188	sliced into 2cm pieces	1	f	f	1	\N	f	f
376	1.0000000000000000	39	256		2	f	f	1	\N	f	f
377	25.0000000000000000	1	257	roughly chopped	3	f	f	1	\N	f	f
378	0.5000000000000000	\N	221	zest and juice	4	f	f	1	\N	f	f
379	2.0000000000000000	\N	120		0	f	f	1	\N	f	f
380	1.0000000000000000	\N	255		0	f	f	1	\N	f	f
387	25.0000000000000000	1	257	roughly chopped	3	f	f	1	\N	f	f
388	0.5000000000000000	\N	221	zest and juice	4	f	f	1	\N	f	f
1	40.0000000000000000	1	88		0	f	f	1	40g cheddar cheese	f	f
389	1.0000000000000000	7	254		0	f	f	1	\N	f	f
390	1.0000000000000000	\N	8	roughly chopped	1	f	f	1	\N	f	f
391	2.0000000000000000	\N	21	finely chopped	0	f	f	1	\N	f	f
392	5.0000000000000000	52	262	finely chopped	1	f	f	1	\N	f	f
393	1.0000000000000000	\N	180	deseeded and finely chopped	2	f	f	1	\N	f	f
394	2.0000000000000000	6	263		3	f	f	1	\N	f	f
395	1.0000000000000000	7	24		4	f	f	1	\N	f	f
396	1.0000000000000000	7	264		5	f	f	1	\N	f	f
397	8.0000000000000000	\N	265	boneless and skinless	6	f	f	1	\N	f	f
398	4.0000000000000000	\N	37	(large) roughly chopped	0	f	f	1	\N	f	f
399	300.0000000000000000	1	135		1	f	f	1	\N	f	f
400	1.0000000000000000	\N	259		2	f	f	1	\N	f	f
401	320.0000000000000000	1	211		0	f	f	1	\N	f	f
402	1.0000000000000000	\N	65		0	f	f	1	\N	f	f
403	1.0000000000000000	\N	266	roughly chopped	1	f	f	1	\N	f	f
404	0.0000000000000000	\N	267		0	f	f	1	SALAD	f	f
405	25.0000000000000000	1	268		0	f	f	1	25 g pine nuts	f	f
406	1.0000000000000000	3	269		0	f	f	1	1 red chicory	f	f
407	1.0000000000000000	67	269		0	f	f	1	1 green chicory	f	f
408	2.0000000000000000	\N	270		0	f	f	1	2 clementines	f	f
409	100.0000000000000000	1	228		0	f	f	1	100 g baby spinach	f	f
410	4.0000000000000000	68	271		0	f	f	1	4 sprigs of fresh mint	f	f
411	45.0000000000000000	1	272		0	f	f	1	45 g Manchego cheese	f	f
412	2.0000000000000000	16	273		0	f	f	1	2 tablespoons sherry vinegar	f	f
413	2.0000000000000000	16	274		0	f	f	1	2 tablespoons extra virgin olive oil	f	f
414	1.0000000000000000	18	51		0	f	f	1	1 teaspoon runny honey	f	f
415	0.0000000000000000	\N	189		0	f	f	1	PASTA	f	f
418	0.5000000000000000	69	180	fresh	0	f	f	1	½–1 fresh red chilli	f	f
436	1.0000000000000000	29	284		0	f	f	1	1 bag(s) Diced Butternut Squash	f	f
437	1.0000000000000000	28	285		1	f	f	1	1 pot(s) Curry Powder	f	f
438	1.0000000000000000	23	8		2	f	f	1	1 unit(s) Onion	f	f
439	0.5000000000000000	23	180		3	f	f	1	½ unit(s) Red Chilli	f	f
440	2.0000000000000000	23	286		4	f	f	1	2 unit(s) Vine Tomatoes	f	f
441	1.0000000000000000	25	25		5	f	f	1	1 bunch(es) Coriander	f	f
442	400.0000000000000000	27	85		6	f	f	1	400 milliliter(s) Water	f	f
443	1.0000000000000000	60	287		7	f	f	1	1 sachet Vegetable Stock Powder	f	f
432	0.5000000000000000	7	283		0	f	f	1	1/2 tsp dried chilli flakes	f	f
444	200.0000000000000000	27	215		8	f	f	1	200 milliliter(s) Coconut Milk	f	f
416	320.0000000000000000	1	189		0	f	f	1	320 g dried penne	f	f
417	70.0000000000000000	1	102		1	f	f	1	70 g Iberico chorizo	f	f
419	2.0000000000000000	68	392		2	f	f	1	2 sprigs of fresh rosemary	f	f
420	0.0000000000000000	\N	16		3	f	f	1	olive oil	f	f
421	4.0000000000000000	\N	306		4	f	f	1	4 cloves of garlic	f	f
422	1.0000000000000000	\N	178		5	f	f	1	1 large free-range egg	f	f
423	0.5000000000000000	\N	221		6	f	f	1	½ a lemon	f	f
424	2.0000000000000000	6	393		7	f	f	1	2 heaped tablespoons fat-free natural yoghurt	f	f
425	2.0000000000000000	\N	2		0	f	f	1	2 British chicken breast portions	f	f
426	190.0000000000000000	1	280		1	f	f	1	190g linguine	f	f
427	10.0000000000000000	1	257		2	f	f	1	10g parsley	f	f
428	5.5000000000000000	1	281	Dijon	3	f	f	1	5.5g Dijon mustard	f	f
429	1.0000000000000000	7	282		4	f	f	1	1 tsp smoked paprika	f	f
430	80.0000000000000000	1	104	chestnut	5	f	f	1	80g chestnut mushrooms	f	f
431	50.0000000000000000	1	1	soft	6	f	f	1	50g soft cheese	f	f
433	5.5000000000000000	1	4	chicken	7	f	f	1	5.5g chicken stock mix	f	f
434	1.0000000000000000	4	10		8	f	f	1	1 garlic clove	f	f
435	1.0000000000000000	71	8		9	f	f	1	1 brown onion	f	f
445	200.0000000000000000	26	288		9	f	f	1	200 grams Red Split Lentils	f	f
446	8.0000000000000000	26	74		10	f	f	1	8 grams Flour	f	f
447	2.0000000000000000	23	289		11	f	f	1	2 unit(s) Plain Naan	f	f
448	1.0000000000000000	29	290		12	f	f	1	1 bag(s) Pumpkin Seeds	f	f
449	250.0000000000000000	22	75		0	f	f	1	\N	f	f
450	25.0000000000000000	1	60		1	f	f	1	\N	f	f
451	25.0000000000000000	1	143		2	f	f	1	\N	f	f
452	0.5000000000000000	\N	291		3	f	f	1	\N	f	f
453	50.0000000000000000	1	292		4	f	f	1	\N	f	f
454	40.0000000000000000	1	293		5	f	f	1	\N	f	f
455	28.0000000000000000	1	20		6	f	f	1	\N	f	f
456	70.0000000000000000	1	294		7	f	f	1	\N	f	f
457	150.0000000000000000	1	189		8	f	f	1	\N	f	f
458	40.0000000000000000	1	72		9	f	f	1	\N	f	f
459	10.0000000000000000	1	295		10	f	f	1	\N	f	f
460	2.0000000000000000	6	16		0	f	f	1	2 tbsp olive oil	f	f
461	2.0000000000000000	\N	12	sliced	1	f	f	1	2 onions , sliced	f	f
462	2.0000000000000000	\N	296	crushed	2	f	f	1	2 large garlic cloves , crushed	f	f
463	2.0000000000000000	6	297	2-3	3	f	f	1	2-3 tbsp chipotle chilli paste	f	f
464	400.0000000000000000	1	96	can	4	f	f	1	400g can chopped tomatoes	f	f
465	2.0000000000000000	6	298		5	f	f	1	2 tbsp light brown soft sugar	f	f
466	6.0000000000000000	\N	265	boneless, skinless	6	f	f	1	6 boneless, skinless chicken thighs	f	f
467	1.0000000000000000	\N	20	finely chopped	7	f	f	1	1 small red onion , finely chopped	f	f
468	3.0000000000000000	\N	37	finely chopped	8	f	f	1	3 ripe tomatoes , finely chopped	f	f
469	1.0000000000000000	\N	49	zested and juiced	9	f	f	1	1 lime , zested and juiced	f	f
470	1.0000000000000000	\N	300	leaves and stalks finely chopped, plus extra leaves to serve	10	f	f	1	1 small bunch coriander , leaves and stalks finely chopped, plus extra leaves to serve	f	f
471	0.0000000000000000	\N	301	to serve	11	f	f	1	tortilla chips and guacamole, to serve	f	f
472	400.0000000000000000	1	81	can	0	f	f	1	400g can black beans, drained	f	f
473	0.0000000000000000	\N	171	finely chopped	1	f	f	1	small bunch coriander, finely chopped	f	f
474	4.0000000000000000	\N	302		2	f	f	1	4 large or 8-12 small flour tortillas	f	f
475	1.0000000000000000	\N	173	sliced, or 1 small tub guacamole	3	f	f	1	1 avocado, sliced, or 1 small tub guacamole	f	f
476	2.0000000000000000	6	303		4	f	f	1	2 tbsp soured cream or crème fraîche	f	f
477	2.0000000000000000	\N	305	cut into strips	5	f	f	1	1 red and 1 yellow pepper, cut into strips	f	f
478	1.0000000000000000	6	91		6	f	f	1	1 tbsp oil	f	f
479	1.0000000000000000	\N	20	cut into thin wedges	7	f	f	1	1 red onion, cut into thin wedges	f	f
480	1.0000000000000000	\N	306	crushed	8	f	f	1	1 garlic clove, crushed	f	f
481	0.5000000000000000	7	44		9	f	f	1	½ tsp chilli powder	f	f
482	0.5000000000000000	7	282		10	f	f	1	½ tsp smoked paprika	f	f
483	0.5000000000000000	7	24		11	f	f	1	½ tsp ground cumin	f	f
484	1.0000000000000000	\N	49	juiced	12	f	f	1	1 lime, juiced	f	f
485	2.0000000000000000	6	16		0	f	f	1	2 tbsp olive oil	f	f
486	500.0000000000000000	1	307	lean	1	f	f	1	500g lean diced lamb	f	f
487	1.0000000000000000	\N	8	roughly chopped	2	f	f	1	1 large onion, roughly chopped	f	f
488	2.0000000000000000	\N	308	quartered lengthways and cut into chunks	3	f	f	1	2 large carrots, quartered lengthways and cut into chunks	f	f
489	2.0000000000000000	\N	306	finely chopped	4	f	f	1	2 garlic cloves, finely chopped	f	f
490	2.0000000000000000	6	309		5	f	f	1	2 tbsp ras-el-hanout spice mix	f	f
491	400.0000000000000000	1	17	can	6	f	f	1	400g can chopped tomato	f	f
492	400.0000000000000000	1	310	can	7	f	f	1	400g can chickpea, rinsed and drained	f	f
493	200.0000000000000000	1	311	dried	8	f	f	1	200g dried apricot	f	f
494	600.0000000000000000	22	138	chicken	9	f	f	1	600ml chicken stock	f	f
495	120.0000000000000000	1	312	pack	10	f	f	1	120g pack pomegranate seeds	f	f
496	2.0000000000000000	\N	313	roughly chopped	11	f	f	1	2 large handfuls coriander, roughly chopped	f	f
497	800.0000000000000000	1	314	potatoes, carrots, parsnips, beetroots	0	f	f	1	800 g mixed root veg , (potatoes, carrots, parsnips, beetroots)	f	f
498	2.0000000000000000	\N	244		1	f	f	1	2 red peppers	f	f
499	1.0000000000000000	\N	315	or cauliflower	2	f	f	1	1 small broccoli , or cauliflower	f	f
500	0.0000000000000000	\N	16		3	f	f	1	olive oil	f	f
501	250.0000000000000000	1	316		4	f	f	1	250 g halloumi cheese	f	f
502	1.0000000000000000	\N	317	or 1 cucumber, 2 carrots or 2 beetroots	5	f	f	1	1 courgette , (or 1 cucumber, 2 carrots or 2 beetroots)	f	f
503	1.0000000000000000	\N	318		6	f	f	1	1 large eating apple	f	f
504	100.0000000000000000	1	319	or spinach	7	f	f	1	100 g lamb's lettuce , or spinach	f	f
505	4.0000000000000000	6	320		8	f	f	1	4 tablespoons quality green pesto	f	f
506	200.0000000000000000	1	321		0	f	f	1	200g fusilli	f	f
507	1.0000000000000000	6	16		1	f	f	1	1 tbsp olive oil	f	f
508	1.0000000000000000	\N	8	finely chopped	2	f	f	1	1 onion, finely chopped	f	f
509	2.0000000000000000	\N	306	crushed	3	f	f	1	2 cloves garlic, crushed	f	f
510	0.0000000000000000	\N	322		4	f	f	1	a good pinch dried chilli flakes	f	f
511	400.0000000000000000	1	96	tin	5	f	f	1	400g tin chopped tomatoes	f	f
512	200.0000000000000000	1	323	tin	6	f	f	1	200g tin tuna in olive oil, drained	f	f
513	1.0000000000000000	7	324	optional	7	f	f	1	rosemary, needles chopped to make 1 tsp (optional)	f	f
514	75.0000000000000000	1	325	mature	8	f	f	1	75g mature cheddar, grated	f	f
518	1.0000000000000000	\N	9		3	f	f	1	1 red pepper	f	f
519	0.5000000000000000	\N	32		4	f	f	1	½ cucumber	f	f
520	50.0000000000000000	1	118		5	f	f	1	50g feta cheese, cubed	f	f
521	2.0000000000000000	6	328		6	f	f	1	2tbsp pesto	f	f
522	2.0000000000000000	6	73	pine	7	f	f	1	2tbsp pine nuts	f	f
525	1.0000000000000000	31	331		0	f	f	1	1 beef tomato	f	f
523	1.0000000000000000	\N	334		0	f	f	1	1 white or brown baguette	f	f
524	3.0000000000000000	6	330		1	f	f	1	3 tbsp fresh green pesto	f	f
526	1.0000000000000000	73	72	about 200g	2	f	f	1	1 ball mozzarella (about 200g)	f	f
527	2.0000000000000000	74	332		3	f	f	1	2 handfuls baby spinach leaves	f	f
528	0.0000000000000000	\N	110		4	f	f	1	handful basil leaves	f	f
529	6.0000000000000000	75	333		5	f	f	1	6 slices salami	f	f
530	3.0000000000000000	6	16		0	f	f	1	3 tbsp olive oil	f	f
531	1.0000000000000000	\N	8	finely chopped	1	f	f	1	1 onion, finely chopped	f	f
532	2.0000000000000000	\N	306	crushed	2	f	f	1	2 large garlic cloves, crushed	f	f
533	0.2500000000000000	7	163		3	f	f	1	¼ tsp chilli flakes	f	f
534	2.0000000000000000	\N	339	leaves finely chopped	4	f	f	1	2 rosemary sprigs, leaves finely chopped	f	f
535	2.0000000000000000	\N	336		5	f	f	1	2 x 400g cans chopped tomatoes	f	f
536	1.0000000000000000	6	337		6	f	f	1	1 tbsp brown sugar	f	f
537	6.0000000000000000	\N	340		7	f	f	1	6 pork sausages	f	f
538	150.0000000000000000	22	75	whole	8	f	f	1	150ml whole milk	f	f
539	1.0000000000000000	\N	221	zested	9	f	f	1	1 lemon, zested	f	f
540	350.0000000000000000	1	189	rigatoni	10	f	f	1	350g rigatoni pasta	f	f
541	0.0000000000000000	\N	338	leaves roughly chopped, to serve	11	f	f	1	grated parmesan and ½ small bunch parsley, leaves roughly chopped, to serve	f	f
542	2.0000000000000000	\N	196		0	f	f	1	2 skinless chicken breasts	f	f
543	1.0000000000000000	6	91	plus extra for frying the halloumi, if needed	1	f	f	1	1 tbsp oil , plus extra for frying the halloumi, if needed	f	f
544	4.0000000000000000	6	341	plus extra for drizzling	2	f	f	1	4 tbsp piri-piri sauce or other mild chilli sauce, plus extra for drizzling	f	f
545	0.5000000000000000	\N	221	juiced	3	f	f	1	½ lemon , juiced	f	f
546	0.0000000000000000	\N	342	split in half	4	f	f	1	burger buns , split in half	f	f
547	250.0000000000000000	1	343	block	5	f	f	1	250g block lighter halloumi , sliced into 8 pieces	f	f
548	0.2500000000000000	\N	344	finely sliced	6	f	f	1	¼ small white cabbage , finely sliced	f	f
515	100.0000000000000000	1	326		0	f	f	1	100g couscous	f	f
516	200.0000000000000000	22	391	hot	1	f	f	1	200ml hot low salt vegetable stock (from a cube is fine)	f	f
517	2.0000000000000000	\N	155		2	f	f	1	2 spring onions	f	f
549	2.0000000000000000	6	345		7	f	f	1	2 tbsp mayonnaise	f	f
550	4.0000000000000000	6	346	tzatziki or soured cream & chive dip	8	f	f	1	4 tbsp hummus , tzatziki or soured cream & chive dip	f	f
551	8.0000000000000000	\N	347		9	f	f	1	handful of rocket or 4-8 soft lettuce leaves	f	f
552	2.0000000000000000	\N	348	drained and sliced	10	f	f	1	2 large roasted red peppers from a jar, drained and sliced	f	f
573	2.0000000000000000	6	358		5	f	f	1	2 tablespoons mild curry powder	f	f
574	1.0000000000000000	6	143		6	f	f	1	1 tablespoon plain flour	f	f
575	300.0000000000000000	22	359	chicken	7	f	f	1	300ml chicken or vegetable stock	f	f
576	100.0000000000000000	22	75	coconut	8	f	f	1	100ml coconut milk	f	f
577	1.0000000000000000	7	195		9	f	f	1	1 teaspoon light soy sauce	f	f
578	1.0000000000000000	7	46	to taste	10	f	f	1	1 teaspoon sugar, to taste	f	f
553	1.0000000000000000	6	16		0	f	f	1	1 tbsp olive oil	f	f
554	2.0000000000000000	\N	12	chopped	1	f	f	1	2 onions , chopped	f	f
555	2.0000000000000000	7	24		2	f	f	1	2 tsp ground cumin	f	f
556	2.0000000000000000	\N	349	drained	3	f	f	1	2 x 400g cans chickpeas , drained	f	f
557	500.0000000000000000	1	55	raw	4	f	f	1	500g raw beetroot , peeled, trimmed and coarsely grated	f	f
558	100.0000000000000000	1	350	fresh	5	f	f	1	100g fresh breadcrumb	f	f
559	1.0000000000000000	\N	178		6	f	f	1	1 egg	f	f
560	1.0000000000000000	6	351		7	f	f	1	1 tbsp tahini paste	f	f
561	0.0000000000000000	\N	39	for brushing or frying	8	f	f	1	vegetable oil , for brushing or frying	f	f
562	1.0000000000000000	6	351		9	f	f	1	1 tbsp tahini paste	f	f
563	2.0000000000000000	\N	352		10	f	f	1	2 x 150ml pots natural yogurt	f	f
564	0.0000000000000000	\N	353		11	f	f	1	pinch of sugar	f	f
565	0.0000000000000000	\N	354		12	f	f	1	flatbreads	f	f
566	0.0000000000000000	\N	355	see 'Goes Well With'	13	f	f	1	few pickled golden beetroot , diced (see 'Goes Well With')	f	f
567	3.0000000000000000	74	356		14	f	f	1	3 handfuls beet leaves or a bag of beet salad	f	f
568	2.0000000000000000	6	39	2-3	0	f	f	1	2-3 tablespoons vegetable oil	f	f
569	1.0000000000000000	\N	8	finely chopped	1	f	f	1	1 onion, finely chopped	f	f
570	1.0000000000000000	\N	306	crushed	2	f	f	1	1 garlic clove, crushed	f	f
571	2.2999999999999998	78	181	peeled and grated	3	f	f	1	2.3 piece of ginger, peeled and grated	f	f
572	1.0000000000000000	7	357		4	f	f	1	1 teaspoon tumeric	f	f
579	1.0000000000000000	\N	20	chopped into bite-sized pieces	0	f	f	1	1 large red onion, chopped into bite-sized pieces	f	f
580	3.0000000000000000	\N	244	chopped into bite-sized pieces	1	f	f	1	3 mixed peppers, chopped into bite-sized pieces	f	f
581	1.0000000000000000	\N	360	chopped into bite-sized pieces	2	f	f	1	1 large aubergine, chopped into bite-sized pieces	f	f
582	1.0000000000000000	6	274	plus extra for drizzling	3	f	f	1	1 tbsp extra virgin olive oil, plus extra for drizzling	f	f
583	250.0000000000000000	80	1	halloumi	4	f	f	1	250g/9oz halloumi cheese, sliced	f	f
584	0.0000000000000000	\N	361		5	f	f	1	small handful fresh basil	f	f
585	0.0000000000000000	\N	362		6	f	f	1	freshly ground sea salt and black pepper	f	f
586	4.0000000000000000	\N	363		0	f	f	1	4 large eggs	f	f
587	1.0000000000000000	\N	364		1	f	f	1	1 small red or green pepper	f	f
588	3.0000000000000000	81	365	75 g	2	f	f	1	3 oz (75 g) chorizo sausage	f	f
589	1.0000000000000000	\N	8		3	f	f	1	1 medium onion	f	f
590	3.0000000000000000	\N	37		4	f	f	1	3 medium tomatoes	f	f
591	1.0000000000000000	\N	306		5	f	f	1	1 fat clove garlic	f	f
592	1.0000000000000000	6	16		6	f	f	1	1 tablespoon olive oil	f	f
593	2.0000000000000000	81	367	50 g	7	f	f	1	2 oz (50 g) Gruyère, grated	f	f
594	0.0000000000000000	\N	368		8	f	f	1	salt and freshly milled black pepper	f	f
605	240.0000000000000000	1	189		0	f	f	1	\N	f	f
606	1.0000000000000000	6	254		1	f	f	1	\N	f	f
607	200.0000000000000000	1	120		2	f	f	1	\N	f	f
608	2.0000000000000000	\N	67	finely chopped	3	f	f	1	\N	f	f
609	2.0000000000000000	\N	112	coursely grated	4	f	f	1	\N	f	f
610	120.0000000000000000	1	240		5	f	f	1	\N	f	f
611	300.0000000000000000	1	370		6	f	f	1	\N	f	f
612	1.0000000000000000	\N	27		7	f	f	1	\N	f	f
613	2.0000000000000000	6	19		8	f	f	1	\N	f	f
614	500.0000000000000000	1	371	2oz	0	f	f	1	500g/1lb 2oz salted peanuts	f	f
615	1.0000000000000000	6	89		1	f	f	1	1 tbsp honey	f	f
616	4.0000000000000000	6	39	tbsp	2	f	f	1	4–5 tbsp vegetable oil	f	f
617	250.0000000000000000	1	57		3	f	f	1	250g/9oz gnocchi	f	f
618	1.0000000000000000	5	372	4oz	4	f	f	1	1kg/2lb 4oz deboned and skinless chicken thighs, thinly sliced	f	f
619	4.0000000000000000	6	89		5	f	f	1	4 tbsp honey	f	f
620	4.0000000000000000	6	39		6	f	f	1	4 tbsp vegetable oil	f	f
621	5.0000000000000000	6	373		7	f	f	1	5 tbsp Thai green curry paste	f	f
622	5.0000000000000000	6	201	from above	8	f	f	1	5 tbsp peanut butter, from above	f	f
623	1.0000000000000000	7	45		9	f	f	1	1 tsp salt	f	f
624	2.0000000000000000	\N	315	cut into florets	10	f	f	1	2 heads broccoli, cut into florets	f	f
595	2.0000000000000000	\N	12	quartered	0	f	f	1	\N	f	f
596	2.0000000000000000	\N	369	cut into chunks	1	f	f	1	\N	f	f
597	1.0000000000000000	7	16		2	f	f	1	\N	f	f
598	4.0000000000000000	\N	306	roughly chopped	3	f	f	1	\N	f	f
599	2.0000000000000000	\N	308	cut into chunks	4	f	f	1	\N	f	f
600	2.0000000000000000	\N	112	cut into chunks	5	f	f	1	\N	f	f
601	0.5000000000000000	7	22		6	f	f	1	\N	f	f
602	1.0000000000000000	6	98		7	f	f	1	\N	f	f
603	1200.0000000000000000	1	96	(3 x 400g cans)	8	f	f	1	\N	f	f
604	0.5000000000000000	7	45		9	f	f	1	\N	f	f
764	1.0000000000000000	\N	221	zested	9	f	f	1	1 lemon, zested	f	f
625	2.0000000000000000	\N	374	cut into small wedges	11	f	f	1	2 small red onions, cut into small wedges	f	f
626	3.0000000000000000	6	371	roughly chopped	12	f	f	1	3 tbsp salted peanuts, roughly chopped	f	f
627	0.0000000000000000	\N	375	roughly chopped	13	f	f	1	handful fresh coriander, roughly chopped	f	f
628	1.0000000000000000	\N	49	juice only	14	f	f	1	1 lime, juice only	f	f
629	300.0000000000000000	1	376	strong	0	f	f	1	300g strong bread flour	f	f
630	1.0000000000000000	7	377	from a sachet or a tub	1	f	f	1	1 tsp instant yeast (from a sachet or a tub)	f	f
631	1.0000000000000000	7	45		2	f	f	1	1 tsp salt	f	f
632	1.0000000000000000	6	16	plus extra for drizzling	3	f	f	1	1 tbsp olive oil, plus extra for drizzling	f	f
633	100.0000000000000000	22	168		4	f	f	1	100ml passata	f	f
634	1.0000000000000000	7	378		5	f	f	1	handful fresh basil or 1 tsp dried	f	f
635	1.0000000000000000	\N	306	crushed	6	f	f	1	1 garlic clove, crushed	f	f
636	125.0000000000000000	1	72	ball	7	f	f	1	125g ball mozzarella, sliced	f	f
637	0.0000000000000000	\N	379	or vegetarian alternative	8	f	f	1	handful grated or shaved parmesan (or vegetarian alternative)	f	f
638	0.0000000000000000	\N	380	halved	9	f	f	1	handful of cherry tomatoes, halved	f	f
639	0.0000000000000000	\N	381	optional	10	f	f	1	handful of basil leaves (optional)	f	f
661	250.0000000000000000	1	395		4	f	f	1	250g tagliatelle	f	f
279	3.0000000000000000	\N	155	cut into thin strips/shredded	9	f	f	1	3 spring onions, cut into thin strips/shredded	f	f
651	4.0000000000000000	\N	151		0	f	f	1	4 sweet potatoes	f	f
652	0.0000000000000000	\N	171	chopped	1	f	f	1	small bunch coriander , chopped	f	f
653	200.0000000000000000	1	389	block	2	f	f	1	200g block feta cheese , crumbled	f	f
654	8.0000000000000000	\N	390		3	f	f	1	8 flour tortillas	f	f
655	140.0000000000000000	1	102	sliced	4	f	f	1	140g sliced chorizo (about 24 slices)	f	f
235	2.0000000000000000	7	39		0	f	f	1	2 tsp vegetable oil	f	f
237	2.0000000000000000	7	282		2	f	f	1	2 tsp each smoked paprika and ground cumin	f	f
656	2.0000000000000000	7	24		3	f	f	1	\N	f	f
642	1.0000000000000000	\N	8	finely chopped	2	f	f	1	1 small onion , finely chopped	f	f
643	1.0000000000000000	\N	369	finely chopped	3	f	f	1	1 celery stick, finely chopped	f	f
644	100.0000000000000000	1	383	diced	4	f	f	1	100g diced pancetta	f	f
645	500.0000000000000000	1	384	minced	5	f	f	1	500g minced pork	f	f
646	200.0000000000000000	22	385	dry	6	f	f	1	200ml dry white wine	f	f
647	50.0000000000000000	1	111	plus extra for serving	7	f	f	1	50g parmesan , plus extra for serving	f	f
648	1.0000000000000000	\N	221		8	f	f	1	1 large organic lemon	f	f
649	400.0000000000000000	1	387	dried	9	f	f	1	400g dried egg tagliatelle (not durum wheat tagliatelle)	f	f
640	2.0000000000000000	\N	306		0	f	f	1	2 garlic cloves	f	f
210	1.0000000000000000	\N	151	cut into chips	0	f	f	1	1 large sweet potato , cut into chips	f	f
88	1.0000000000000000	\N	8		0	f	f	1	1 unit(s) Onion	f	f
89	1.0000000000000000	\N	305		1	f	f	1	1 unit(s) Green Pepper	f	f
657	1.0000000000000000	44	188		0	f	f	1	1 bunch asparagus	f	f
658	142.0000000000000000	22	394	tub	1	f	f	1	142ml tub double cream	f	f
659	2.0000000000000000	\N	306	peeled, but left whole	2	f	f	1	2 garlic cloves , peeled, but left whole	f	f
660	50.0000000000000000	1	111	half grated, half shaved	3	f	f	1	50g parmesan , half grated, half shaved	f	f
669	200.0000000000000000	22	385		7	f	f	1	200ml white wine	f	f
670	1.0000000000000000	9	396		8	f	f	1	1l chicken stock	f	f
671	2.0000000000000000	\N	401		9	f	f	1	2 bay leaves	f	f
676	140.0000000000000000	1	60		14	f	f	1	140g butter	f	f
677	250.0000000000000000	1	406		15	f	f	1	250g self-raising flour	f	f
662	2.0000000000000000	6	16		0	f	f	1	2 tbsp olive oil	f	f
663	12.0000000000000000	\N	265		1	f	f	1	12-15 chicken thighs , skin removed, bone in	f	f
664	200.0000000000000000	1	225		2	f	f	1	200g smoked bacon lardon or chopped bacon	f	f
665	1.0000000000000000	\N	8	chopped	3	f	f	1	1 large onion , chopped	f	f
666	4.0000000000000000	\N	369	chopped	4	f	f	1	4 celery sticks, chopped	f	f
667	3.0000000000000000	\N	176	chopped	5	f	f	1	3 leeks , chopped	f	f
668	4.0000000000000000	6	143		6	f	f	1	4 tbsp plain flour	f	f
672	200.0000000000000000	1	198	frozen	10	f	f	1	200g frozen pea	f	f
673	140.0000000000000000	1	405		11	f	f	1	140g sundried tomato	f	f
674	140.0000000000000000	1	328		12	f	f	1	140g fresh pesto	f	f
675	0.0000000000000000	\N	403	chopped	13	f	f	1	small bunch basil , chopped	f	f
678	100.0000000000000000	1	111	grated	16	f	f	1	100g parmesan , grated	f	f
679	50.0000000000000000	1	268		17	f	f	1	50g pine nut	f	f
153	0.0000000000000000	\N	117	finely chopped	10	f	f	1	a small bunch flat-leaf parsley, finely chopped	f	f
682	0.5000000000000000	10	408	leaves picked	2	f	f	1	½ small bunch thyme , leaves picked	f	f
683	1.5000000000000000	6	282		3	f	f	1	1½ tbsp smoked paprika	f	f
684	4.0000000000000000	\N	306	crushed	4	f	f	1	4 garlic cloves , crushed	f	f
685	3.0000000000000000	6	89		5	f	f	1	3 tbsp honey	f	f
686	4.0000000000000000	\N	196	cut into bite-sized chunks 4-5	6	f	f	1	4-5 chicken breasts (about 650g), cut into bite-sized chunks	f	f
687	200.0000000000000000	1	102		7	f	f	1	200g chorizo ring, sliced into thick coins	f	f
688	250.0000000000000000	1	305		8	f	f	1	250g padron pepper , or 3 green peppers cut into pieces	f	f
689	0.0000000000000000	\N	411	to serve	9	f	f	1	charred lemon halves or wedges, to serve	f	f
690	1.2000000000000000	5	29	strong	10	f	f	1	1.2kg strong white bread flour , plus extra for dusting	f	f
641	2.0000000000000000	6	113		1	f	f	1	2 tbsp extra-virgin olive oil	f	f
650	3.0000000000000000	6	388		10	f	f	1	3 tbsp chopped flatleaf parsley	f	f
680	100.0000000000000000	22	91	olive	0	f	f	1	100ml olive oil	f	f
681	75.0000000000000000	22	407	sherry	1	f	f	1	75ml sherry vinegar	f	f
691	200.0000000000000000	22	91	olive	11	f	f	1	200ml olive oil , plus extra for proving	f	f
692	1.0000000000000000	6	412		12	f	f	1	1 tbsp fine salt	f	f
693	14.0000000000000000	\N	30		13	f	f	1	2 x 7g sachets fast-action dried yeast	f	f
698	1.0000000000000000	89	9	deseeded and sliced	0	f	f	1	1 yellow pepper, deseeded and sliced	f	f
694	2.0000000000000000	6	16		0	f	f	1	2 tbsp olive oil	f	f
695	2.0000000000000000	\N	196	cut into strips	1	f	f	1	2 large skinless chicken breasts, cut into strips	f	f
696	1.0000000000000000	\N	8	thinly sliced	2	f	f	1	1 onion, thinly sliced	f	f
697	2.0000000000000000	\N	244	deseeded and sliced	3	f	f	1	1 red pepper, deseeded and sliced	f	f
699	1.0000000000000000	\N	306	crushed	4	f	f	1	1 garlic clove, crushed	f	f
700	0.2500000000000000	7	44		5	f	f	1	1⁄4 tsp chilli powder	f	f
701	1.0000000000000000	7	282		6	f	f	1	1 heaped tsp sweet smoked paprika	f	f
702	0.5000000000000000	7	22		7	f	f	1	1⁄2 tsp dried oregano	f	f
703	1.0000000000000000	7	264		8	f	f	1	1 tsp ground coriander	f	f
704	0.5000000000000000	7	24		9	f	f	1	1⁄2 tsp ground cumin	f	f
705	3.0000000000000000	6	98		10	f	f	1	3 tbsp tomato purée	f	f
706	80.0000000000000000	22	416	double	11	f	f	1	80ml double cream	f	f
707	350.0000000000000000	1	417	penne	12	f	f	1	350g penne or rigatoni pasta	f	f
708	0.5000000000000000	\N	418	small	13	f	f	1	1⁄2 small bunch of flat-leaf parsley, finely chopped	f	f
709	0.0000000000000000	\N	419	to serve	14	f	f	1	grated parmesan or cheddar, to serve	f	f
710	200.0000000000000000	22	85		11	f	f	1	\N	f	f
711	200.0000000000000000	22	85		11	f	f	1	\N	f	f
712	8.0000000000000000	\N	340		0	f	f	1	\N	f	f
713	1.0000000000000000	\N	8	chopped	1	f	f	1	\N	f	f
714	1.0000000000000000	\N	197	grated	2	f	f	1	\N	f	f
715	3.0000000000000000	\N	306	crushed	3	f	f	1	\N	f	f
716	1.0000000000000000	6	98		4	f	f	1	\N	f	f
717	3.0000000000000000	6	16		5	f	f	1	\N	f	f
718	400.0000000000000000	22	96	(1 tin)	6	f	f	1	\N	f	f
719	2.0000000000000000	7	164		7	f	f	1	\N	f	f
720	0.0000000000000000	1	189		8	f	f	1	\N	f	f
721	0.0000000000000000	\N	111	to serve	9	f	f	1	\N	f	f
722	8.0000000000000000	\N	340		0	f	f	1	\N	f	f
723	1.0000000000000000	\N	8	chopped	1	f	f	1	\N	f	f
724	1.0000000000000000	\N	197	grated	2	f	f	1	\N	f	f
725	3.0000000000000000	\N	306	crushed	3	f	f	1	\N	f	f
726	1.0000000000000000	6	98		4	f	f	1	\N	f	f
727	3.0000000000000000	6	16		5	f	f	1	\N	f	f
728	400.0000000000000000	22	96	(1 tin)	6	f	f	1	\N	f	f
729	2.0000000000000000	7	164		7	f	f	1	\N	f	f
730	0.0000000000000000	1	189		8	f	f	1	\N	f	f
731	0.0000000000000000	\N	111	to serve	9	f	f	1	\N	f	f
732	8.0000000000000000	\N	340		0	f	f	1	\N	f	f
733	1.0000000000000000	\N	8	chopped	1	f	f	1	\N	f	f
734	1.0000000000000000	\N	197	grated	2	f	f	1	\N	f	f
735	3.0000000000000000	\N	306	crushed	3	f	f	1	\N	f	f
736	1.0000000000000000	6	98		4	f	f	1	\N	f	f
737	3.0000000000000000	6	16		5	f	f	1	\N	f	f
738	400.0000000000000000	22	96	(1 tin)	6	f	f	1	\N	f	f
739	2.0000000000000000	7	164		7	f	f	1	\N	f	f
740	0.0000000000000000	1	189		8	f	f	1	\N	f	f
741	0.0000000000000000	\N	111	to serve	9	f	f	1	\N	f	f
753	0.0000000000000000	\N	424	optional	0	f	f	1	cooked rice or tortillas, coriander, feta, lime wedges and chopped red onion, to serve (optional)	f	f
742	2.0000000000000000	6	420		0	f	f	1	2 tbsp sunflower oil	f	f
743	2.0000000000000000	\N	12	sliced	1	f	f	1	2 onions, sliced	f	f
744	4.0000000000000000	\N	265		2	f	f	1	4 boneless, skinless chicken thighs	f	f
745	3.0000000000000000	\N	306	finely chopped	3	f	f	1	3 garlic cloves, finely chopped	f	f
746	1.0000000000000000	6	421		4	f	f	1	1 tbsp oregano	f	f
747	1.0000000000000000	7	40		5	f	f	1	1 tsp cumin seeds	f	f
748	1.0000000000000000	7	297		6	f	f	1	3 tbsp chipotle in adobo or 1 tsp chipotle paste	f	f
749	350.0000000000000000	1	168		7	f	f	1	350g passata	f	f
750	0.5000000000000000	\N	95	chicken	8	f	f	1	1⁄2 chicken stock shot or cube	f	f
751	400.0000000000000000	1	81		9	f	f	1	400g can black beans, drained but not rinsed	f	f
752	0.5000000000000000	\N	49	juiced	10	f	f	1	1⁄2 lime, juiced	f	f
754	100.0000000000000000	22	85		11	f	f	1	\N	f	f
755	3.0000000000000000	6	16		0	f	f	1	3 tbsp olive oil	f	f
756	1.0000000000000000	\N	8	finely chopped	1	f	f	1	1 onion, finely chopped	f	f
757	2.0000000000000000	\N	296	crushed	2	f	f	1	2 large garlic cloves, crushed	f	f
758	0.2500000000000000	7	163		3	f	f	1	¼ tsp chilli flakes	f	f
759	2.0000000000000000	\N	339	leaves finely chopped	4	f	f	1	2 rosemary sprigs, leaves finely chopped	f	f
760	800.0000000000000000	1	17	(2 cans)	5	f	f	1	2 x 400g cans chopped tomatoes	f	f
761	1.0000000000000000	6	337		6	f	f	1	1 tbsp brown sugar	f	f
762	6.0000000000000000	\N	340		7	f	f	1	6 pork sausages	f	f
763	150.0000000000000000	22	75	whole	8	f	f	1	150ml whole milk	f	f
765	350.0000000000000000	1	189	rigatoni	10	f	f	1	350g rigatoni pasta	f	f
766	0.0000000000000000	\N	338	leaves roughly chopped, to serve	11	f	f	1	grated parmesan and ½ small bunch parsley, leaves roughly chopped, to serve	f	f
767	3.0000000000000000	6	16		0	f	f	1	3 tbsp olive oil	f	f
768	16.0000000000000000	62	425	about 3kg/6lb 8oz in total	1	f	f	1	16 chicken pieces on the bone (about 3kg/6lb 8oz in total)	f	f
769	140.0000000000000000	1	426	smoked	2	f	f	1	140g smoked bacon, chopped or lardons or cubetti di pancetta	f	f
770	4.0000000000000000	20	308	thickly sliced	3	f	f	1	4 medium carrots, thickly sliced	f	f
771	2.0000000000000000	\N	12	roughly chopped	4	f	f	1	2 onions, roughly chopped	f	f
772	2.0000000000000000	6	143		5	f	f	1	2 tbsp plain flour	f	f
773	1.0000000000000000	6	98		6	f	f	1	1 tbsp tomato purée	f	f
774	75.0000000000000000	22	427	white	7	f	f	1	75ml white wine or cider vinegar	f	f
775	1.0000000000000000	9	138	chicken	8	f	f	1	1l chicken stock	f	f
776	2.0000000000000000	88	401		9	f	f	1	2 bay leaves	f	f
777	4.0000000000000000	6	428		10	f	f	1	4 tbsp double cream or crème fraîche	f	f
778	600.0000000000000000	1	429	small	11	f	f	1	600g small new potatoes, halved	f	f
779	12.0000000000000000	12	430	quartered	12	f	f	1	12 large white mushrooms, quartered	f	f
780	0.0000000000000000	\N	431	such as parsley, tarragon or chives	13	f	f	1	chopped herbs, such as parsley, tarragon or chives	f	f
781	3.0000000000000000	6	16		0	f	f	1	3 tbsp olive oil	f	f
782	2.0000000000000000	\N	12	finely chopped	1	f	f	1	2 onions, finely chopped	f	f
783	3.0000000000000000	\N	308	finely chopped	2	f	f	1	3 carrots, finely chopped	f	f
784	3.0000000000000000	\N	369	finely chopped	3	f	f	1	3 celery sticks, finely chopped	f	f
785	3.0000000000000000	\N	306	crushed	4	f	f	1	3 garlic cloves, crushed	f	f
786	500.0000000000000000	1	432		5	f	f	1	500g bag dried red lentils	f	f
787	2.0000000000000000	\N	336		6	f	f	1	2 x 400g cans chopped tomatoes	f	f
788	2.0000000000000000	6	98		7	f	f	1	2 tbsp tomato purée	f	f
789	2.0000000000000000	7	433		8	f	f	1	2 tsp each dried oregano and thyme	f	f
790	3.0000000000000000	\N	435		9	f	f	1	3 bay leaves	f	f
791	1.0000000000000000	9	391		10	f	f	1	1l vegetable stock	f	f
792	500.0000000000000000	1	107		11	f	f	1	500g spaghetti	f	f
793	0.0000000000000000	\N	434	grated, to serve	12	f	f	1	parmesan or vegetarian cheese, grated, to serve	f	f
809	2.0000000000000000	\N	308	chopped	1	f	f	1	\N	f	f
808	0.0000000000000000	\N	403	shredded	15	f	f	1	small bunch basil, shredded	f	f
810	2.0000000000000000	\N	308	chopped	1	f	f	1	\N	f	f
814	1.0000000000000000	6	39		2	f	f	1	1 tbsp vegetable oil	f	f
815	1.0000000000000000	\N	8	chopped	3	f	f	1	1 onion , chopped	f	f
821	2.0000000000000000	\N	37	quartered	9	f	f	1	2 tomatoes , quartered	f	f
822	0.0000000000000000	\N	447	to serve	10	f	f	1	cooked rice , to serve	f	f
823	1.0000000000000000	6	420		0	f	f	1	1 tbsp sunflower oil	f	f
794	2.0000000000000000	\N	12	chopped	0	f	f	1	2 each of onions and carrots, chopped	f	f
811	2.0000000000000000	\N	308	chopped	1	f	f	1	\N	f	f
795	4.0000000000000000	\N	369	chopped	2	f	f	1	4 sticks celery, chopped	f	f
796	1.0000000000000000	6	16		3	f	f	1	1 tbsp olive oil	f	f
797	2.0000000000000000	6	46		4	f	f	1	2 tbsp sugar	f	f
798	4.0000000000000000	\N	306	crushed	5	f	f	1	4 garlic cloves, crushed	f	f
799	2.0000000000000000	6	98		6	f	f	1	2 tbsp tomato purée	f	f
800	2.0000000000000000	\N	435		7	f	f	1	2 bay leaves	f	f
801	0.0000000000000000	\N	438		8	f	f	1	few sprigs thyme	f	f
802	3.0000000000000000	\N	112	chopped	9	f	f	1	3 courgettes, chopped	f	f
803	400.0000000000000000	1	439	drained	10	f	f	1	400g can butter beans, drained	f	f
804	400.0000000000000000	1	440		11	f	f	1	400g can chopped tomatoes	f	f
805	1.2000000000000000	9	138	vegetable	12	f	f	1	1.2l vegetable stock	f	f
806	100.0000000000000000	1	441	grated	13	f	f	1	100g parmesan or vegetarian equivalent, grated	f	f
807	140.0000000000000000	1	442		14	f	f	1	140g small pasta shapes	f	f
824	1.0000000000000000	\N	8	finely chopped	1	f	f	1	1 onion, finely chopped	f	f
812	425.0000000000000000	1	443	drained, juice reserved	0	f	f	1	425g can pineapple chunks, drained, juice reserved	f	f
813	2.0000000000000000	6	444	malt vinegar and cornflour	1	f	f	1	2 tbsp each tomato ketchup , malt vinegar and cornflour	f	f
816	1.0000000000000000	\N	180	deseeded and sliced	4	f	f	1	1 red chilli , deseeded and sliced	f	f
817	2.0000000000000000	\N	305	chopped	5	f	f	1	1 red and green pepper , chopped	f	f
818	2.0000000000000000	\N	308	sliced on the diagonal	6	f	f	1	2 carrots , sliced on the diagonal	f	f
819	2.0000000000000000	\N	196	thinly sliced	7	f	f	1	2 skinless chicken breasts , thinly sliced	f	f
820	125.0000000000000000	1	448	sliced lengthways	8	f	f	1	125g packs baby corn , sliced lengthways	f	f
825	1.0000000000000000	\N	306	finely chopped	2	f	f	1	1 garlic clove, finely chopped	f	f
826	1.0000000000000000	7	264		3	f	f	1	1 tsp ground coriander	f	f
827	1.0000000000000000	7	24		4	f	f	1	1 tsp ground cumin	f	f
828	1.0000000000000000	7	449		5	f	f	1	1 tsp ground turmeric	f	f
829	0.5000000000000000	7	450		6	f	f	1	½ tsp cayenne pepper	f	f
830	400.0000000000000000	1	451	prepared weight	7	f	f	1	400g butternut squash, peeled and cut into 2cm (prepared weight)	f	f
831	400.0000000000000000	1	452		8	f	f	1	400g can chopped tomato	f	f
832	1.2000000000000000	9	138	chicken	9	f	f	1	1.2l chicken stock	f	f
833	1.0000000000000000	\N	453	heaped	10	f	f	1	1 heaped tbsp mango chutney	f	f
834	300.0000000000000000	1	454		11	f	f	1	300g red lentil	f	f
835	0.0000000000000000	\N	455	roughly chopped	12	f	f	1	small pack coriander, roughly chopped	f	f
836	0.0000000000000000	\N	456	to serve	13	f	f	1	naan bread, to serve	f	f
837	1.0000000000000000	6	91		0	f	f	1	1 tbsp oil	f	f
838	12.0000000000000000	\N	457		1	f	f	1	12 shop-bought lamb meatballs	f	f
839	1.0000000000000000	\N	8	sliced	2	f	f	1	1 onion , sliced	f	f
840	2.0000000000000000	\N	296	crushed	3	f	f	1	2 large garlic cloves , crushed	f	f
841	2.0000000000000000	7	24		4	f	f	1	2 tsp ground cumin	f	f
842	1.0000000000000000	7	264		5	f	f	1	1 tsp ground coriander	f	f
843	0.5000000000000000	7	14		6	f	f	1	½ tsp ground cinnamon	f	f
844	1.0000000000000000	6	458		7	f	f	1	1 tbsp rose harrisa	f	f
845	400.0000000000000000	1	440		8	f	f	1	400g can chopped tomatoes	f	f
846	200.0000000000000000	22	459	lamb or beef	9	f	f	1	200ml low-salt stock (lamb or beef)	f	f
847	2.0000000000000000	\N	460		10	f	f	1	2 x 400g can chickpeas	f	f
848	0.0000000000000000	\N	461	finely chopped	11	f	f	1	small bunch of parsley , finely chopped	f	f
849	0.5000000000000000	\N	462	chopped	12	f	f	1	½ small bunch of mint , chopped	f	f
850	50.0000000000000000	1	312		13	f	f	1	50g pomegranate seeds	f	f
851	4.0000000000000000	6	39		0	f	f	1	4 tbsp vegetable oil	f	f
852	25.0000000000000000	1	60		0	f	f	1	25g butter	f	f
853	4.0000000000000000	\N	12	roughly chopped	0	f	f	1	4 onions, roughly chopped	f	f
854	6.0000000000000000	6	463	use shop-bought or make your own – see recipe, below	0	f	f	1	6 tbsp chicken tikka masala paste (use shop-bought or make your own – see recipe, below)	f	f
855	2.0000000000000000	3	244	deseeded and cut into chunks	0	f	f	1	2 red peppers, deseeded and cut into chunks	f	f
856	8.0000000000000000	\N	299	skinless chicken breasts, cut into 2.5cm cubes	0	f	f	1	8 boneless, skinless chicken breasts, cut into 2.5cm cubes	f	f
857	2.0000000000000000	15	336		0	f	f	1	2 x 400g cans chopped tomatoes	f	f
858	4.0000000000000000	6	98		0	f	f	1	4 tbsp tomato purée	f	f
859	2.0000000000000000	6	464	2-3	0	f	f	1	2-3 tbsp mango chutney	f	f
860	150.0000000000000000	22	394		0	f	f	1	150ml double cream	f	f
861	150.0000000000000000	22	465		0	f	f	1	150ml natural yogurt	f	f
862	0.0000000000000000	\N	466	to serve	0	f	f	1	chopped coriander leaves, to serve	f	f
875	0.0000000000000000	\N	25	optional	0	f	f	1	coriander (optional)	f	f
876	0.0000000000000000	\N	470	optional	0	f	f	1	sliced chillies (optional)	f	f
877	0.0000000000000000	\N	471		0	f	f	1	lime wedges	f	f
878	0.0000000000000000	\N	101		0	f	f	1	soured cream	f	f
863	1.0000000000000000	6	16		0	f	f	1	1 tbsp olive oil	f	f
864	1.0000000000000000	\N	8	finely chopped	1	f	f	1	1 onion, finely chopped	f	f
865	250.0000000000000000	1	114	beef	2	f	f	1	250g/9oz beef mince	f	f
866	1.0000000000000000	7	467		3	f	f	1	1 tsp hot smoked paprika	f	f
867	1.0000000000000000	7	24		4	f	f	1	1 tsp ground cumin	f	f
868	0.5000000000000000	7	44		5	f	f	1	½ tsp chilli powder	f	f
869	400.0000000000000000	1	468	drained	6	f	f	1	½ 400g tin black beans, drained	f	f
870	200.0000000000000000	1	469	lightly	7	f	f	1	200g/7oz lightly salted corn tortilla chips	f	f
871	150.0000000000000000	1	325	grated	8	f	f	1	150g/5½oz cheddar, grated	f	f
872	100.0000000000000000	1	37	cherry	9	f	f	1	100g/3½oz cherry tomatoes, quartered	f	f
873	0.0000000000000000	\N	200		10	f	f	1	salt and freshly ground black pepper	f	f
874	4.0000000000000000	\N	155	finely chopped	11	f	f	1	4 spring onions, finely chopped	f	f
879	2.0000000000000000	\N	296		0	f	f	1	2 * 2 unit(s) Garlic Clove	f	f
880	15.0000000000000000	1	89		1	f	f	1	2 * 15 grams Honey	f	f
881	10.0000000000000000	1	486		2	f	f	1	2 * 10 grams Panko Breadcrumbs	f	f
882	240.0000000000000000	1	487		3	f	f	1	2 * 240 grams Pork Mince	f	f
883	1.0000000000000000	\N	79		4	f	f	1	2 * 1 unit(s) Green Pepper	f	f
884	1.0000000000000000	\N	8		5	f	f	1	2 * 1 unit(s) Onion	f	f
885	2.0000000000000000	\N	488		6	f	f	1	2 * 2 nest(s) Egg Noodle Nest	f	f
886	96.0000000000000000	22	489		7	f	f	1	2 * 96 grams Hoisin Sauce	f	f
887	15.0000000000000000	22	203		8	f	f	1	2 * 15 milliliter(s) Soy Sauce	f	f
888	5.0000000000000000	97	490		9	f	f	1	2 * 5 grams Roasted White Sesame Seeds	f	f
889	15.0000000000000000	22	204		10	f	f	1	2 * 15 milliliter(s) Rice Vinegar	f	f
890	1.0000000000000000	6	491		11	f	f	1	2 * 1 tbsp Water for the Breadcrumbs	f	f
891	0.2500000000000000	7	45		12	f	f	1	2 * ¼ tsp Salt for the Meatballs	f	f
892	50.0000000000000000	22	492		13	f	f	1	2 * 50 milliliter(s) Water for the Sauce	f	f
893	1.0000000000000000	\N	9		0	f	f	1	2 * 1 unit(s) Bell Pepper	f	f
894	80.0000000000000000	1	503		1	f	f	1	2 * 80 grams Mangetout	f	f
895	1.0000000000000000	\N	155		2	f	f	1	2 * 1 unit(s) Spring Onion	f	f
896	2.0000000000000000	\N	296		3	f	f	1	2 * 2 unit(s) Garlic Clove	f	f
897	210.0000000000000000	1	504		4	f	f	1	2 * 210 grams Diced Chicken Thigh	f	f
898	10.0000000000000000	1	505		5	f	f	1	2 * 10 grams Cornflour	f	f
899	2.0000000000000000	\N	488		6	f	f	1	2 * 2 nest(s) Egg Noodle Nest	f	f
900	50.0000000000000000	1	506		7	f	f	1	2 * 50 grams Ketjap Manis	f	f
901	30.0000000000000000	22	204		8	f	f	1	2 * 30 milliliter(s) Rice Vinegar	f	f
902	2.0000000000000000	6	507		9	f	f	1	2 * 2 tbsp Tomato Ketchup	f	f
903	1.0000000000000000	7	46		10	f	f	1	2 * 1 tsp Sugar for the Sauce	f	f
904	75.0000000000000000	22	492		11	f	f	1	2 * 75 milliliter(s) Water for the Sauce	f	f
905	100.0000000000000000	1	520		0	f	f	1	2 * 100 grams Jasmine Rice	f	f
906	1.0000000000000000	\N	61		1	f	f	1	2 * 1 unit(s) Butternut Squash	f	f
907	0.0000000000000000	\N	521		2	f	f	1	2 * 1 sachet(s) Thai Style Spice Blend	f	f
908	5.0000000000000000	1	522		3	f	f	1	2 * 5 grams Black Sesame Seeds	f	f
909	1.0000000000000000	\N	523		4	f	f	1	2 * 1 unit(s) Echalion Shallot	f	f
910	1.0000000000000000	\N	21		5	f	f	1	2 * 1 unit(s) Garlic Clove	f	f
911	0.5000000000000000	\N	49		6	f	f	1	2 * ½ unit(s) Lime	f	f
912	45.0000000000000000	1	373		7	f	f	1	2 * 45 grams Thai Green Curry Paste	f	f
913	10.0000000000000000	1	524		8	f	f	1	2 * 10 grams Vegetable Stock Paste	f	f
914	200.0000000000000000	22	215		9	f	f	1	2 * 200 milliliter(s) Coconut Milk	f	f
915	120.0000000000000000	1	198		10	f	f	1	2 * 120 grams Peas	f	f
916	200.0000000000000000	22	525		11	f	f	1	2 * 200 milliliter(s) Water for the Rice	f	f
917	50.0000000000000000	22	492		12	f	f	1	2 * 50 milliliter(s) Water for the Sauce	f	f
918	3.0000000000000000	6	52		0	f	f	1	3 tbsp groundnut oil	f	f
919	0.2500000000000000	\N	526	torn into small pieces	1	f	f	1	¼ ciabatta, torn into small pieces	f	f
920	1.0000000000000000	\N	20	finely diced	2	f	f	1	1 red onion, finely diced	f	f
921	2.0000000000000000	\N	296	crushed	3	f	f	1	2 garlic cloves, crushed	f	f
922	500.0000000000000000	1	527		4	f	f	1	500g British free-range pork mince	f	f
923	150.0000000000000000	22	396		5	f	f	1	150ml chicken stock	f	f
924	4.0000000000000000	\N	244		6	f	f	1	4 romano peppers	f	f
925	4.0000000000000000	\N	155	sliced	7	f	f	1	4 spring onions, sliced	f	f
926	3.0000000000000000	6	528		8	f	f	1	3 tbsp sweet chilli sauce	f	f
927	2.0000000000000000	6	529		9	f	f	1	2 tbsp dark soy sauce	f	f
928	0.0000000000000000	\N	530	plus extra to serve	10	f	f	1	Large handful of fresh coriander leaves, plus extra to serve	f	f
929	2.0000000000000000	97	531		0	f	f	1	2 * 20 grams Chicken Stock Paste	f	f
930	2.0000000000000000	97	532		0	f	f	1	2 * 120 grams Bulgur Wheat	f	f
931	2.0000000000000000	97	533		0	f	f	1	2 * 80 grams Green Beans	f	f
932	2.0000000000000000	97	493		0	f	f	1	2 * 1 unit(s) Bell Pepper	f	f
933	2.0000000000000000	97	472		0	f	f	1	2 * 2 unit(s) Garlic Clove	f	f
934	2.0000000000000000	97	534		0	f	f	1	2 * 260 grams Diced Chicken Thigh	f	f
935	2.0000000000000000	97	535		0	f	f	1	2 * 30 grams Tomato Puree	f	f
936	2.0000000000000000	97	536		0	f	f	1	2 * 1 sachet(s) Roasted Spice and Herb Blend	f	f
937	2.0000000000000000	97	537		0	f	f	1	2 * ½ unit(s) Lemon	f	f
938	2.0000000000000000	97	538		0	f	f	1	2 * 240 milliliter(s) Water for the Bulgur	f	f
939	2.0000000000000000	97	539		0	f	f	1	2 * ½ tsp Sugar	f	f
940	2.0000000000000000	97	540		0	f	f	1	2 * 100 milliliter(s) Water for the Sauce	f	f
941	2.0000000000000000	97	476		0	f	f	1	2 * 1 unit(s) Green Pepper	f	f
942	2.0000000000000000	97	494		0	f	f	1	2 * 80 grams Mangetout	f	f
943	2.0000000000000000	97	495		0	f	f	1	2 * 1 unit(s) Spring Onion	f	f
944	2.0000000000000000	97	472		0	f	f	1	2 * 2 unit(s) Garlic Clove	f	f
945	2.0000000000000000	97	497		0	f	f	1	2 * 10 grams Cornflour	f	f
946	2.0000000000000000	97	496		0	f	f	1	2 * 210 grams Diced Chicken Thigh	f	f
947	2.0000000000000000	97	478		0	f	f	1	2 * 2 nest(s) Egg Noodle Nest	f	f
948	2.0000000000000000	97	498		0	f	f	1	2 * 50 grams Ketjap Manis	f	f
949	2.0000000000000000	97	499		0	f	f	1	2 * 30 milliliter(s) Rice Vinegar	f	f
950	2.0000000000000000	97	500		0	f	f	1	2 * 2 tbsp Tomato Ketchup	f	f
951	2.0000000000000000	97	501		0	f	f	1	2 * 1 tsp Sugar for the Sauce	f	f
952	2.0000000000000000	97	502		0	f	f	1	2 * 75 milliliter(s) Water for the Sauce	f	f
953	2.0000000000000000	97	478		0	f	f	1	2 * 2 nest(s) Egg Noodle Nest	f	f
954	2.0000000000000000	97	475		0	f	f	1	2 * 240 grams Pork Mince	f	f
955	2.0000000000000000	97	541		0	f	f	1	2 * 1 sachet(s) Indonesian Style Spice Mix	f	f
956	2.0000000000000000	97	493		0	f	f	1	2 * 1 unit(s) Bell Pepper	f	f
957	2.0000000000000000	97	542		0	f	f	1	2 * 25 grams Salted Peanuts	f	f
958	2.0000000000000000	97	514		0	f	f	1	2 * ½ unit(s) Lime	f	f
959	2.0000000000000000	97	498		0	f	f	1	2 * 50 grams Ketjap Manis	f	f
960	2.0000000000000000	97	482		0	f	f	1	2 * 15 milliliter(s) Rice Vinegar	f	f
961	2.0000000000000000	97	473		0	f	f	1	2 * 15 grams Honey	f	f
962	2.0000000000000000	97	485		0	f	f	1	2 * 50 milliliter(s) Water for the Sauce	f	f
963	2.0000000000000000	97	543		0	f	f	1	2 * 150 grams Basmati Rice	f	f
964	2.0000000000000000	97	512		0	f	f	1	2 * 1 unit(s) Echalion Shallot	f	f
965	2.0000000000000000	97	472		0	f	f	1	2 * 2 unit(s) Garlic Clove	f	f
966	2.0000000000000000	97	544		0	f	f	1	2 * ½ unit(s) Red Chilli	f	f
967	2.0000000000000000	97	545		0	f	f	1	2 * 240 grams Beef Mince	f	f
968	2.0000000000000000	97	498		0	f	f	1	2 * 50 grams Ketjap Manis	f	f
969	2.0000000000000000	97	546		0	f	f	1	2 * 25 milliliter(s) Soy Sauce	f	f
970	2.0000000000000000	97	547		0	f	f	1	2 * 1 unit(s) Pak Choi	f	f
971	2.0000000000000000	97	548		0	f	f	1	2 * 300 milliliter(s) Water for the Rice	f	f
972	2.0000000000000000	97	549		0	f	f	1	2 * 15 milliliter(s) Cider Vinegar	f	f
973	2.0000000000000000	97	534		0	f	f	1	2 * 260 grams Diced Chicken Thigh	f	f
974	2.0000000000000000	97	550		0	f	f	1	2 * 20 grams Chipotle Paste	f	f
975	2.0000000000000000	97	551		0	f	f	1	2 * 60 grams Mature Cheddar Cheese	f	f
976	2.0000000000000000	97	495		0	f	f	1	2 * 1 unit(s) Spring Onion	f	f
977	2.0000000000000000	97	552		0	f	f	1	2 * ½ carton(s) Black Beans	f	f
978	2.0000000000000000	97	553		0	f	f	1	2 * 1 unit(s) Carrot	f	f
979	2.0000000000000000	97	554		0	f	f	1	2 * 64 grams BBQ Sauce	f	f
980	2.0000000000000000	97	555		0	f	f	1	2 * 450 grams Potatoes	f	f
981	2.0000000000000000	97	556		0	f	f	1	2 * 100 milliliter(s) Water	f	f
982	2.0000000000000000	97	557		0	f	f	1	2 * 50 grams Hoisin Sauce	f	f
983	2.0000000000000000	97	546		0	f	f	1	2 * 25 milliliter(s) Soy Sauce	f	f
984	2.0000000000000000	97	558		0	f	f	1	2 * 6 unit(s) Plain Taco Tortilla	f	f
985	2.0000000000000000	97	513		0	f	f	1	2 * 1 unit(s) Garlic Clove	f	f
986	2.0000000000000000	97	542		0	f	f	1	2 * 25 grams Salted Peanuts	f	f
987	2.0000000000000000	97	495		0	f	f	1	2 * 1 unit(s) Spring Onion	f	f
988	2.0000000000000000	97	559		0	f	f	1	2 * 250 grams Sweet Potato Fries	f	f
989	2.0000000000000000	97	475		0	f	f	1	2 * 240 grams Pork Mince	f	f
990	2.0000000000000000	97	560		0	f	f	1	2 * 1 sachet(s) Ginger Puree	f	f
991	2.0000000000000000	97	561		0	f	f	1	2 * ½ unit(s) Cucumber	f	f
992	2.0000000000000000	97	477		0	f	f	1	2 * 1 unit(s) Onion	f	f
993	2.0000000000000000	97	476		0	f	f	1	2 * 1 unit(s) Green Pepper	f	f
994	2.0000000000000000	97	562		0	f	f	1	2 * 1 unit(s) Chorizo Stick	f	f
995	2.0000000000000000	97	563		0	f	f	1	2 * 1 tin(s) Black Beans	f	f
996	2.0000000000000000	97	564		0	f	f	1	2 * 1 bunch(es) Flat Leaf Parsley	f	f
997	2.0000000000000000	97	565		0	f	f	1	2 * 1 unit(s) Lime	f	f
998	2.0000000000000000	97	535		0	f	f	1	2 * 30 grams Tomato Puree	f	f
999	2.0000000000000000	97	566		0	f	f	1	2 * ¾ tsp Mexican Spice	f	f
1000	2.0000000000000000	97	567		0	f	f	1	2 * 125 milliliter(s) Water	f	f
1001	2.0000000000000000	97	568		0	f	f	1	2 * 4 unit(s) Super Soft Tortilla with Whole Wheat	f	f
1002	2.0000000000000000	97	569		0	f	f	1	2 * 1 pot(s) Creme Fraiche	f	f
1003	2.0000000000000000	97	551		0	f	f	1	2 * 60 grams Mature Cheddar Cheese	f	f
1004	2.0000000000000000	97	570		0	f	f	1	2 * 1 tbsp Honey	f	f
1005	2.0000000000000000	97	561		0	f	f	1	2 * ½ unit(s) Cucumber	f	f
1006	2.0000000000000000	97	571		0	f	f	1	2 * 1 bag(s) Baby Leaves	f	f
1007	2.0000000000000000	97	572		0	f	f	1	2 * 1 tbsp Olive Oil	f	f
1008	2.0000000000000000	97	573		0	f	f	1	2 * 1 pot(s) KNORR Vegetable Stock	f	f
1009	2.0000000000000000	97	574		0	f	f	1	2 * 1 carton(s) Finely Chopped Tomatoes with Onion and Garlic	f	f
1010	2.0000000000000000	97	575		0	f	f	1	2 * 1 pot(s) Tagine Garnish	f	f
1011	2.0000000000000000	97	576		0	f	f	1	2 * 1 sachet(s) Tagine Paste	f	f
1012	2.0000000000000000	97	577		0	f	f	1	2 * 200 grams Lamb Mince	f	f
1013	2.0000000000000000	97	578		0	f	f	1	2 * 120 grams Couscous	f	f
1014	2.0000000000000000	97	579		0	f	f	1	2 * 1 unit(s) Courgette	f	f
1015	2.0000000000000000	97	580		0	f	f	1	2 * 1 bunch(es) Coriander	f	f
1016	2.0000000000000000	97	581		0	f	f	1	2 * 240 milliliter(s) Boiling Water	f	f
1017	4.0000000000000000	6	39		0	f	f	1	4 tbsp vegetable oil	f	f
1018	1.0000000000000000	7	40		0	f	f	1	1 tsp cumin seeds	f	f
1019	1.0000000000000000	12	582	pierced	0	f	f	1	1 large green chilli, pierced	f	f
1020	1.0000000000000000	12	41	200g, peeled and cut into 2cm chunks	0	f	f	1	1 large potato, 200g, peeled and cut into 2cm chunks	f	f
1021	1.0000000000000000	12	42	500g, cut into florets	0	f	f	1	1 large cauliflower, 500g, cut into florets	f	f
1022	0.2500000000000000	7	449		0	f	f	1	1/4 tsp ground turmeric	f	f
1023	0.1250000000000000	7	44		0	f	f	1	1/8 tsp chilli powder	f	f
1024	1.0000000000000000	7	45		0	f	f	1	1 tsp salt	f	f
1025	1.0000000000000000	7	46		0	f	f	1	1 tsp sugar	f	f
1026	0.0000000000000000	\N	583	to loosen the dish to your taste	0	f	f	1	obligatory backup jug of water, to loosen the dish to your taste	f	f
1027	0.0000000000000000	\N	584		0	f	f	1	handful of fresh coriander leaves	f	f
\.


--
-- Data for Name: cookbook_invitelink; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_invitelink (id, uuid, valid_until, created_at, created_by_id, used_by_id, group_id, space_id, email, reusable, internal_note) FROM stdin;
1	9d2d6c7b-fcc8-4d3f-91fe-36b8be1bb607	2022-04-07	2022-03-24 21:45:11.015709+00	1	2	3	1		f	\N
\.


--
-- Data for Name: cookbook_keyword; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_keyword (id, name, icon, description, created_at, updated_at, space_id, depth, numchild, path) FROM stdin;
\.


--
-- Data for Name: cookbook_mealplan; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_mealplan (id, note, date, recipe_id, created_by_id, title, meal_type_id, servings, space_id) FROM stdin;
5		2022-03-28	32	1		6	1.0000	1
7		2022-07-27	1	2		8	2.0000	1
8		2022-07-27	1	2		8	2.0000	1
9		2022-07-28	3	2		8	4.0000	1
\.


--
-- Data for Name: cookbook_mealplan_shared; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_mealplan_shared (id, mealplan_id, user_id) FROM stdin;
\.


--
-- Data for Name: cookbook_mealtype; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_mealtype (id, name, "order", created_by_id, space_id, color, icon, "default") FROM stdin;
5	Lunch	0	1	1	\N	\N	f
6	Dinner	0	1	1	\N	\N	f
7	Lunch	0	2	1	\N	\N	f
8	Dinner	0	2	1	\N	\N	f
\.


--
-- Data for Name: cookbook_nutritioninformation; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_nutritioninformation (id, fats, carbohydrates, proteins, calories, source, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_property; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_property (id, property_amount, property_type_id, space_id, import_food_id) FROM stdin;
\.


--
-- Data for Name: cookbook_propertytype; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_propertytype (id, name, unit, icon, description, category, open_data_slug, space_id, "order") FROM stdin;
1	Fat	g	\N	\N	\N	\N	1	0
2	Carbohydrates	g	\N	\N	\N	\N	1	0
3	Proteins	g	\N	\N	\N	\N	1	0
4	Calories	kcal	\N	\N	\N	\N	1	0
\.


--
-- Data for Name: cookbook_recipe; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipe (id, name, file_uid, file_path, link, working_time, internal, created_at, updated_at, created_by_id, storage_id, image, waiting_time, cors_link, nutrition_id, servings, description, servings_text, space_id, desc_search_vector, name_search_vector, source_url, show_ingredient_overview, private) FROM stdin;
3	Chicken souvlaki			\N	45	t	2022-03-14 17:24:22.402542+00	2022-03-14 17:24:23.077954+00	1	\N	recipes/ac12f0d2-a8bb-4f7d-a30c-43448a3c8c51_3.jpeg	40	\N	\N	4	Marinate the chicken for these Greek-style spiced kebabs as long as possible to soak up all the flavour and make it really tender. Serve with warm bread, salad and tzatziki		1	'bread':29C 'chicken':3C 'flavour':20C 'greek':7C 'greek-styl':6C 'kebab':10C 'long':12C 'make':22C 'marin':1C 'possibl':14C 'realli':24C 'salad':30C 'serv':26C 'soak':16C 'spice':9C 'style':8C 'tender':25C 'tzatziki':32C 'warm':28C	'chicken':1A 'souvlaki':2A	\N	t	f
54	Beetroot falafel			\N	30	t	2022-07-29 08:09:03.565123+00	2022-07-29 08:09:57.36245+00	2	\N	recipes/c67b69e6-2096-49cc-89e4-f47e71754ee1_54.jpg	25	\N	\N	6	Jazz up an all-time vegetarian favourite by adding vibrant beetroot - serve with tahini yoghurt dip and pickled beets	6	1	'ad':10C 'all-tim':4C 'beet':20C 'beetroot':12C 'dip':17C 'favourit':8C 'jazz':1C 'pickl':19C 'serv':13C 'tahini':15C 'time':6C 'vegetarian':7C 'vibrant':11C 'yoghurt':16C	'beetroot':1A 'falafel':2A	https://www.bbcgoodfood.com/recipes/beetroot-falafel	t	f
1	One-Pot Chicken, Red Pepper & Pesto Orzo			\N	25	t	2022-03-14 10:59:51.172481+00	2022-07-26 20:31:29.565042+00	1	\N	recipes/475f95c5-ac4b-460e-9ab3-c6c24c287810_1.jpeg	0	\N	\N	2	For this easy one-pot pasta, you'll sauté British chicken with red pepper and onion, then add orzo, red pesto and top with fresh basil. Tastes like risotto, but with a lot less stirring!		1	'add':19C 'basil':27C 'british':11C 'chicken':12C 'easi':3C 'fresh':26C 'less':35C 'like':29C 'll':9C 'lot':34C 'one':5C 'one-pot':4C 'onion':17C 'orzo':20C 'pasta':7C 'pepper':15C 'pesto':22C 'pot':6C 'red':14C,21C 'risotto':30C 'saut':10C 'stir':36C 'tast':28C 'top':24C	'chicken':4A 'one':2A 'one-pot':1A 'orzo':8A 'pepper':6A 'pesto':7A 'pot':3A 'red':5A	\N	t	f
52	Sausage ragu			\N	5	t	2022-07-28 20:35:30.352657+00	2022-07-28 20:36:45.160329+00	2	\N	recipes/98e3e3ea-a93a-46a2-86e4-6fc453593470_52.jpg	45	\N	\N	4	Feed the family this comforting, budget-friendly sausage ragu with pasta. You can freeze the leftovers for another time and it tastes just as good	4	1	'anoth':19C 'budget':7C 'budget-friend':6C 'comfort':5C 'famili':3C 'feed':1C 'freez':15C 'friend':8C 'good':26C 'leftov':17C 'pasta':12C 'ragu':10C 'sausag':9C 'tast':23C 'time':20C	'ragu':2A 'sausag':1A	https://www.bbcgoodfood.com/recipes/sausage-ragu	t	f
5	Jools’ Asian-style salmon			\N	25	t	2022-03-24 20:45:01.351997+00	2022-03-24 20:45:02.043861+00	1	\N	recipes/76c794d6-7d7e-46ce-b89d-1060d55e4100_5.jpeg	0	\N	\N	2	This is a lovely gentle introduction to bolder flavours – my kids absolutely love it. And if you’re just making it for grown-ups, feel free to use mirin or sweet sherry instead of the lime juice.		1	'absolut':12C 'bolder':8C 'feel':26C 'flavour':9C 'free':27C 'gentl':5C 'grown':24C 'grown-up':23C 'instead':34C 'introduct':6C 'juic':38C 'kid':11C 'lime':37C 'love':4C,13C 'make':20C 'mirin':30C 're':18C 'sherri':33C 'sweet':32C 'up':25C 'use':29C	'asian':3A 'asian-styl':2A 'jool':1A 'salmon':5A 'style':4A	\N	t	f
4	Aloo Ghobi			\N	5	t	2022-03-24 20:42:44.319735+00	2022-03-24 20:43:48.785253+00	1	\N	recipes/c008dd1e-d92f-4463-9d75-74c6e8582a82_4.jpeg	30	\N	\N	4	Cheap and healthy ingredients combine alongside store-cupboard spices to create this Indian staple, Aloo Ghobi.		1	'alongsid':6C 'aloo':16C 'cheap':1C 'combin':5C 'creat':12C 'cupboard':9C 'ghobi':17C 'healthi':3C 'indian':14C 'ingredi':4C 'spice':10C 'stapl':15C 'store':8C 'store-cupboard':7C	'aloo':1A 'ghobi':2A	\N	t	f
55	Wagamama chicken katsu curry recipe			\N	0	t	2022-08-05 10:38:21.982913+00	2022-08-05 10:39:37.214031+00	2	\N	recipes/ca11b972-02c4-4817-adf7-ffa60d63d4ed_55.png	0	\N	\N	1	Recently restaurant chain Wagamama launched an online tutorial to show us all how to make their famous katsu chicken curry recipe from home.	Serves:	1	'chain':3C 'chicken':19C 'curri':20C 'famous':17C 'home':23C 'katsu':18C 'launch':5C 'make':15C 'onlin':7C 'recent':1C 'recip':21C 'restaur':2C 'show':10C 'tutori':8C 'us':11C 'wagamama':4C	'chicken':2A 'curri':4A 'katsu':3A 'recip':5A 'wagamama':1A	https://www.goodto.com/recipes/wagamama-chicken-katsu-curry	t	f
8	Caramelised squash & spinach lasagne			\N	25	t	2022-03-24 20:58:01.475822+00	2022-03-24 20:58:01.810741+00	1	\N	recipes/19a5c8e4-79e4-4187-b707-002f979abbbe_8.jpeg	100	\N	\N	6	Enjoy this veggie lasagne, with layers of spinach and slow-roasted squash. Add in some sage and a little crunch from golden pine nuts for a comforting supper		1	'add':14C 'comfort':28C 'crunch':21C 'enjoy':1C 'golden':23C 'lasagn':4C 'layer':6C 'littl':20C 'nut':25C 'pine':24C 'roast':12C 'sage':17C 'slow':11C 'slow-roast':10C 'spinach':8C 'squash':13C 'supper':29C 'veggi':3C	'caramelis':1A 'lasagn':4A 'spinach':3A 'squash':2A	\N	t	f
7	Butternut squash fettuccine			\N	10	t	2022-03-24 20:51:41.572247+00	2022-03-24 20:56:23.82712+00	1	\N		20	\N	\N	4			1		'butternut':1A 'fettuccin':3A 'squash':2A	\N	t	f
61	Pizza Margherita			\N	0	t	2022-08-07 19:06:54.738751+00	2022-08-07 19:07:43.123918+00	2	\N	recipes/cf95958d-3c00-4704-9ce5-90aff0e665b4_61.jpg	10	\N	\N	2	Even a novice cook can master the art of pizza with our simple step-by-step guide. Bellissimo!	Makes  pizzas, serves	1	'art':8C 'bellissimo':19C 'cook':4C 'even':1C 'guid':18C 'master':6C 'novic':3C 'pizza':10C 'simpl':13C 'step':15C,17C 'step-by-step':14C	'margherita':2A 'pizza':1A	https://www.bbcgoodfood.com/recipes/pizza-margherita-4-easy-steps	t	f
2	Greek lamb with orzo			\N	0	t	2022-03-14 11:29:41.440245+00	2022-08-11 14:03:34.284102+00	1	\N	recipes/7407ac44-0587-479d-9cd8-6e9c4c08d558_2.jpeg	155	\N	\N	6	Entertaining doesn't have to equal stress, this spruced up one-pot is perfect for people with little time for preparation		1	'doesn':2C 'entertain':1C 'equal':6C 'littl':19C 'one':12C 'one-pot':11C 'peopl':17C 'perfect':15C 'pot':13C 'prepar':22C 'spruce':9C 'stress':7C 'time':20C	'greek':1A 'lamb':2A 'orzo':4A	\N	t	f
67	Fajita-style pasta			\N	10	t	2022-08-11 20:20:16.555258+00	2022-08-11 20:22:52.319281+00	2	\N	recipes/c916189b-7551-4b37-9962-52129c827566_67.jpg	25	\N	\N	4	Take the aromatic flavours of a classic Mexican fajita and combine with pasta for this easy, vibrant meal. It's an ideal Friday night dinner	Serves -	1	'aromat':3C 'classic':7C 'combin':11C 'dinner':25C 'easi':16C 'fajita':9C 'flavour':4C 'friday':23C 'ideal':22C 'meal':18C 'mexican':8C 'night':24C 'pasta':13C 'take':1C 'vibrant':17C	'fajita':2A 'fajita-styl':1A 'pasta':4A 'style':3A	https://www.bbcgoodfood.com/recipes/fajita-style-pasta	t	f
68	Sausage and fennel pasta			\N	0	t	2022-08-19 14:21:24.53127+00	2022-08-20 13:05:44.484573+00	2	\N		0	\N	\N	4	Lucy Wood recipe		1	'luci':1C 'recip':3C 'wood':2C	'fennel':3A 'pasta':4A 'sausag':1A	\N	t	f
12	Greek lamb with orzo			\N	0	t	2022-03-24 21:02:13.028377+00	2022-03-24 21:02:13.247762+00	1	\N	recipes/fe17ceef-db91-4b79-a32d-21534d861e15_12.jpeg	155	\N	\N	6	Entertaining doesn't have to equal stress, this spruced up one-pot is perfect for people with little time for preparation		1	'doesn':2C 'entertain':1C 'equal':6C 'littl':19C 'one':12C 'one-pot':11C 'peopl':17C 'perfect':15C 'pot':13C 'prepar':22C 'spruce':9C 'stress':7C 'time':20C	'greek':1A 'lamb':2A 'orzo':4A	\N	t	f
10	Chilli con carne recipe			\N	70	t	2022-03-24 20:59:24.696132+00	2022-03-24 20:59:25.033666+00	1	\N	recipes/b4555dac-1e21-437c-94be-017171fa048e_10.jpeg	0	\N	\N	4	This great chilli recipe has to be one of the best dishes to serve to friends for a casual get-together. An easy sharing favourite that uses up storecupboard ingredients.		1	'best':11C 'casual':19C 'chilli':3C 'dish':12C 'easi':24C 'favourit':26C 'friend':16C 'get':21C 'get-togeth':20C 'great':2C 'ingredi':31C 'one':8C 'recip':4C 'serv':14C 'share':25C 'storecupboard':30C 'togeth':22C 'use':28C	'carn':3A 'chilli':1A 'con':2A 'recip':4A	\N	t	f
91	Aloo Ghobi			\N	5	t	2023-08-02 16:39:04.04123+00	2023-08-02 16:39:05.619317+00	1	\N	recipes/6a748e2b-f731-4136-9373-2a788694c871_91.jpg	30	\N	\N	4	Cheap and healthy ingredients combine alongside store-cupboard spices to create this Indian staple, Aloo Ghobi.	Serves	1	'alongsid':6C 'aloo':16C 'cheap':1C 'combin':5C 'creat':12C 'cupboard':9C 'ghobi':17C 'healthi':3C 'indian':14C 'ingredi':4C 'spice':10C 'stapl':15C 'store':8C 'store-cupboard':7C	'aloo':1A 'ghobi':2A	https://thehappyfoodie.co.uk/recipes/aloo-ghobi/	t	f
11	One-pot chorizo pasta			\N	30	t	2022-03-24 21:00:18.771956+00	2022-03-24 21:00:19.19384+00	1	\N	recipes/1d80362e-ae63-4cc6-963d-8fcf8fd3d94e_11.jpeg	30	\N	\N	6	This one-pan chorizo pasta from Eat Well for Less is quick, simple and speedy dinner. A true family favourite with less washing up.\r\n\nEach serving provides 411 kcal, 20g protein, 62g carbohydrates (of which 9g sugars), 11g fat (of which 4g saturates), 7g fibre and 1g salt.		1	'11g':39C '1g':48C '20g':31C '411':29C '4g':43C '62g':33C '7g':45C '9g':37C 'carbohydr':34C 'chorizo':5C 'dinner':17C 'eat':8C 'famili':20C 'fat':40C 'favourit':21C 'fibr':46C 'kcal':30C 'less':11C,23C 'one':3C 'one-pan':2C 'pan':4C 'pasta':6C 'protein':32C 'provid':28C 'quick':13C 'salt':49C 'satur':44C 'serv':27C 'simpl':14C 'speedi':16C 'sugar':38C 'true':19C 'wash':24C 'well':9C	'chorizo':4A 'one':2A 'one-pot':1A 'pasta':5A 'pot':3A	\N	t	f
53	15-minute chicken & halloumi burgers			\N	5	t	2022-07-28 20:44:01.313109+00	2022-07-28 20:44:58.28253+00	2	\N	recipes/52f819fb-2aa1-4f4a-a8a9-6b741ee58c05_53.jpg	10	\N	\N	4	Struggle to find dishes to cook that take very little time but the whole family will love? Look no further than these chicken and halloumi burgers	4	1	'burger':26C 'chicken':23C 'cook':6C 'dish':4C 'famili':15C 'find':3C 'halloumi':25C 'littl':10C 'look':18C 'love':17C 'struggl':1C 'take':8C 'time':11C 'whole':14C	'15':1A 'burger':5A 'chicken':3A 'halloumi':4A 'minut':2A	https://www.bbcgoodfood.com/recipes/15-minute-chicken-halloumi-burgers	t	f
14	Grilled Salmon with Mango Salsa and Coconut Rice			\N	30	t	2022-03-24 21:04:03.736831+00	2022-03-24 21:04:04.166201+00	1	\N	recipes/403d09a4-3804-476f-ac22-8249a7922bf4_14.jpeg	26	\N	\N	4	Here you have one of the ultimate summer meals! Flaky tender salmon is topped with a bright and creamy mango avocado salsa and served alongside of bed or rich coconut rice. Sure to impress anyone lucky enough to try it!		1	'alongsid':25C 'anyon':35C 'avocado':21C 'bed':27C 'bright':17C 'coconut':30C 'creami':19C 'enough':37C 'flaki':10C 'impress':34C 'lucki':36C 'mango':20C 'meal':9C 'one':4C 'rice':31C 'rich':29C 'salmon':12C 'salsa':22C 'serv':24C 'summer':8C 'sure':32C 'tender':11C 'top':14C 'tri':39C 'ultim':7C	'coconut':7A 'grill':1A 'mango':4A 'rice':8A 'salmon':2A 'salsa':5A	\N	t	f
15	Indian butternut squash curry			\N	10	t	2022-03-24 21:04:57.96561+00	2022-03-24 21:04:58.280308+00	1	\N	recipes/e38455e3-56a2-4489-925e-8fa7cd0603c0_15.jpeg	40	\N	\N	4	Up your veg count and get three of your five-a-day with this fragrant, low fat vegetarian curry		1	'count':4C 'curri':20C 'day':13C 'fat':18C 'five':11C 'five-a-day':10C 'fragrant':16C 'get':6C 'low':17C 'three':7C 'veg':3C 'vegetarian':19C	'butternut':2A 'curri':4A 'indian':1A 'squash':3A	\N	t	f
56	One pan halloumi veggie traybake			\N	30	t	2022-08-05 10:48:39.403727+00	2022-08-05 10:49:38.611667+00	2	\N	recipes/ec97ddf2-340c-4ae8-8529-4a2d2ba28846_56.jpg	30	\N	\N	2	*Roasted veg topped with halloumi makes for an easy veggie dinner to look forward. Simply throw all the veggies into one roasting dish, top with slices of halloumi and finish under the grill.	Serves	1	'dinner':11C 'dish':23C 'easi':9C 'finish':30C 'forward':14C 'grill':33C 'halloumi':5C,28C 'look':13C 'make':6C 'one':21C 'roast':1C,22C 'simpli':15C 'slice':26C 'throw':16C 'top':3C,24C 'veg':2C 'veggi':10C,19C	'halloumi':3A 'one':1A 'pan':2A 'traybak':5A 'veggi':4A	https://www.bbc.co.uk/food/recipes/one_pan_halloumi_veggie_49929	t	f
16	Truffle mac ’n’ cheese with cauliflower			\N	20	t	2022-03-24 21:08:59.707672+00	2022-03-24 21:08:59.714387+00	1	\N		35	\N	\N	6			1		'cauliflow':6A 'chees':4A 'mac':2A 'n':3A 'truffl':1A	\N	t	f
62	Tagliatelle with a lemon pork ragù			\N	0	t	2022-08-07 19:27:28.1523+00	2022-08-15 09:18:07.802492+00	2	\N	recipes/55c62a5a-0661-4a6e-8a7d-bca04fea38a1_62.jpg	0	\N	\N	4	Authentic Italian tagliatelle with a lemon pork ragù	4	1	'authent':1C 'italian':2C 'lemon':6C 'pork':7C 'ragu':8C 'tagliatell':3C	'lemon':4A 'pork':5A 'ragu':6A 'tagliatell':1A	https://www.bbcgoodfood.com/recipes/tagliatelle-lemon-pork-ragu	t	f
13	Greek lamb-stuffed courgettes			\N	45	t	2022-03-24 21:02:52.83102+00	2022-08-11 14:09:57.217863+00	1	\N	recipes/4da462c5-5321-4391-9034-be5acc18f177_13.jpeg	0	\N	\N	3	Make the most of this versatile vegetable by topping with spiced lamb mince, pine nuts and feta in this crowd-pleasing Mediterranean dish		1	'crowd':21C 'crowd-pleas':20C 'dish':24C 'feta':17C 'lamb':12C 'make':1C 'mediterranean':23C 'minc':13C 'nut':15C 'pine':14C 'pleas':22C 'spice':11C 'top':9C 'veget':7C 'versatil':6C	'courgett':5A 'greek':1A 'lamb':3A 'lamb-stuf':2A 'stuf':4A	\N	t	f
17	One-Pot Chicken, Red Pepper & Pesto Orzo			\N	25	t	2022-03-24 21:11:13.012344+00	2022-03-24 21:11:14.206206+00	1	\N	recipes/c9d97684-5bbb-48db-9873-70671bc554db_17.jpeg	0	\N	\N	2	For this easy one-pot pasta, you'll sauté British chicken with red pepper and onion, then add orzo, red pesto and top with fresh basil. Tastes like risotto, but with a lot less stirring!		1	'add':19C 'basil':27C 'british':11C 'chicken':12C 'easi':3C 'fresh':26C 'less':35C 'like':29C 'll':9C 'lot':34C 'one':5C 'one-pot':4C 'onion':17C 'orzo':20C 'pasta':7C 'pepper':15C 'pesto':22C 'pot':6C 'red':14C,21C 'risotto':30C 'saut':10C 'stir':36C 'tast':28C 'top':24C	'chicken':4A 'one':2A 'one-pot':1A 'orzo':8A 'pepper':6A 'pesto':7A 'pot':3A 'red':5A	\N	t	f
18	Pollock, beetroot & potato traybake with lemony crème fraîche			\N	10	t	2022-03-24 21:12:50.07136+00	2022-03-24 21:12:50.275899+00	1	\N	recipes/0bfbcb00-10b5-45fc-a548-54dc10d38aef_18.jpeg	45	\N	\N	4	This white fish is sustainable and cheaper than cod - serve it with fresh lemon dipping sauce and root veg		1	'cheaper':7C 'cod':9C 'dip':15C 'fish':3C 'fresh':13C 'lemon':14C 'root':18C 'sauc':16C 'serv':10C 'sustain':5C 'veg':19C 'white':2C	'beetroot':2A 'creme':7A 'fraich':8A 'lemoni':6A 'pollock':1A 'potato':3A 'traybak':4A	\N	t	f
21	Sausage, kale & gnocchi one-pot			\N	5	t	2022-03-24 21:15:22.460019+00	2022-03-24 21:15:22.67006+00	1	\N	recipes/bef44e54-d8ca-4dc3-a773-68a7b0dc9c43_21.jpeg	15	\N	\N	4	Plate up this delicious one-pot of sausage, kale and gnocchi in just 20 minutes, with just five minutes prep. Midweek suppers never got so easy – or tasty!		1	'20':15C 'delici':4C 'easi':27C 'five':19C 'gnocchi':12C 'got':25C 'kale':10C 'midweek':22C 'minut':16C,20C 'never':24C 'one':6C 'one-pot':5C 'plate':1C 'pot':7C 'prep':21C 'sausag':9C 'supper':23C 'tasti':29C	'gnocchi':3A 'kale':2A 'one':5A 'one-pot':4A 'pot':6A 'sausag':1A	\N	t	f
63	Sweet potato & chorizo quesadillas			\N	20	t	2022-08-10 11:54:46.694279+00	2022-08-11 08:00:24.451856+00	2	\N	recipes/2f4aa2fe-0191-4c79-a158-86dcf275ddd5_63.jpg	60	\N	\N	4	Fill tortilla wraps with sweet potato, spicy Spanish sausage and feta cheese then finish on a griddle pan	4	1	'chees':12C 'feta':11C 'fill':1C 'finish':14C 'griddl':17C 'pan':18C 'potato':6C 'sausag':9C 'spanish':8C 'spici':7C 'sweet':5C 'tortilla':2C 'wrap':3C	'chorizo':3A 'potato':2A 'quesadilla':4A 'sweet':1A	https://www.bbcgoodfood.com/recipes/sweet-potato-chorizo-quesadillas	t	f
20	Sausage & maple swede traybake			\N	15	t	2022-03-24 21:14:43.511707+00	2022-03-24 21:14:43.795413+00	1	\N	recipes/de857ec4-0714-43b4-9e59-ff09e11dbf3f_20.jpeg	60	\N	\N	4	Forget boring bangers and mash, this seasonal traybake with roasted red onions, apples and swede is much more colourful, and just as easy to prepare		1	'appl':13C 'banger':3C 'bore':2C 'colour':19C 'easi':23C 'forget':1C 'mash':5C 'much':17C 'onion':12C 'prepar':25C 'red':11C 'roast':10C 'season':7C 'swede':15C 'traybak':8C	'mapl':2A 'sausag':1A 'swede':3A 'traybak':4A	\N	t	f
64	Asparagus cream pasta			\N	0	t	2022-08-11 13:52:26.735532+00	2022-08-11 13:53:00.055186+00	2	\N	recipes/5e2db71a-37e2-45d0-83e9-bcc1d62b4d62_64.jpg	30	\N	\N	2	Making a cream out of the stalks means that every mouthful of pasta will have a delicious taste of asparagus	2	1	'asparagus':20C 'cream':3C 'delici':17C 'everi':10C 'make':1C 'mean':8C 'mouth':11C 'pasta':13C 'stalk':7C 'tast':18C	'asparagus':1A 'cream':2A 'pasta':3A	https://www.bbcgoodfood.com/recipes/asparagus-cream-pasta	t	f
22	Smoky pork & black bean tacos			\N	10	t	2022-03-24 21:16:29.640306+00	2022-08-11 08:13:25.245663+00	1	\N	recipes/a9872eb1-a304-4d3d-afe0-ee926ef50217_22.jpeg	15	\N	\N	4	Mexican pork chilli with a smoky barbecued flavour, served in crispy tortilla shells with ripe avocado. These easy pork tacos make a speedy family meal, ready in under 30 mins		1	'30':29C 'avocado':16C 'barbecu':7C 'chilli':3C 'crispi':11C 'easi':18C 'famili':24C 'flavour':8C 'make':21C 'meal':25C 'mexican':1C 'min':30C 'pork':2C,19C 'readi':26C 'ripe':15C 'serv':9C 'shell':13C 'smoki':6C 'speedi':23C 'taco':20C 'tortilla':12C	'bean':4A 'black':3A 'pork':2A 'smoki':1A 'taco':5A	\N	t	f
19	Salmon & ginger fish cakes			\N	15	t	2022-03-24 21:13:23.402124+00	2022-08-11 08:15:17.634879+00	1	\N	recipes/2bbe05b7-e44b-46c3-b3d4-932cbfeee096_19.jpeg	30	\N	\N	2	Create a complete superhealthy supper with these light, Asian-style fish cakes and sweet potato chips		1	'asian':10C 'asian-styl':9C 'cake':13C 'chip':17C 'complet':3C 'creat':1C 'fish':12C 'light':8C 'potato':16C 'style':11C 'superhealthi':4C 'supper':5C 'sweet':15C	'cake':4A 'fish':3A 'ginger':2A 'salmon':1A	\N	t	f
23	Sweet Leek Carbonara			\N	0	t	2022-03-24 21:21:28.0325+00	2022-08-11 16:47:34.859319+00	1	\N	recipes/a0397c15-e997-4a29-8532-e78474c9ea25_23.jpeg	50	\N	\N	4	Jamie Oliver's delicious Sweet Leek Carbonara is an easy, quick pasta dish perfect for a stress-free weeknight dinner. A clever twist on a traditional carbonara, this is a great way to add extra veggies to your mealtimes.		1	'add':35C 'carbonara':7C,28C 'clever':23C 'delici':4C 'dinner':21C 'dish':13C 'easi':10C 'extra':36C 'free':19C 'great':32C 'jami':1C 'leek':6C 'mealtim':40C 'oliv':2C 'pasta':12C 'perfect':14C 'quick':11C 'stress':18C 'stress-fre':17C 'sweet':5C 'tradit':27C 'twist':24C 'veggi':37C 'way':33C 'weeknight':20C	'carbonara':3A 'leek':2A 'sweet':1A	\N	t	f
57	Gratin of Eggs with Peppers and Chorizo			\N	0	t	2022-08-05 10:51:01.885244+00	2022-08-05 10:51:46.355822+00	2	\N	recipes/ffd6c88b-a859-47c4-99e3-f494b85f9110_57.jpg	15	\N	\N	2	\N	Serves	1		'chorizo':7A 'egg':3A 'gratin':1A 'pepper':5A	https://www.deliaonline.com/recipes/collections/recipes-for-2/gratin-of-eggs-with-peppers-and-chorizo	t	f
69	Pulled chicken & black bean chilli			\N	10	t	2022-09-06 19:09:05.227732+00	2022-09-06 19:12:29.768441+00	2	\N	recipes/a58a63f6-8918-4051-ae02-d66be27c8d4e_69.jpg	60	\N	\N	4	Make a batch of Mexican-inspired pulled chicken and black bean chilli, which can be easily doubled and kept in the freezer. Serve with rice or tortilla wraps	4	1	'batch':3C 'bean':12C 'black':11C 'chicken':9C 'chilli':13C 'doubl':18C 'easili':17C 'freezer':23C 'inspir':7C 'kept':20C 'make':1C 'mexican':6C 'mexican-inspir':5C 'pull':8C 'rice':26C 'serv':24C 'tortilla':28C 'wrap':29C	'bean':4A 'black':3A 'chicken':2A 'chilli':5A 'pull':1A	https://www.bbcgoodfood.com/recipes/pulled-chicken-black-bean-chilli	t	f
74	Sweet & sour chicken & veg			\N	20	t	2022-12-09 14:14:01.400551+00	2022-12-09 20:06:33.266957+00	2	\N	recipes/bfd9bcd8-10db-48a9-ab27-bd97ec3f2ea2_74.jpg	20	\N	\N	4	A trusty takeaway favourite just got superhealthy. Make ahead and freeze for Friday!	4	1	'ahead':9C 'favourit':4C 'freez':11C 'friday':13C 'got':6C 'make':8C 'superhealthi':7C 'takeaway':3C 'trusti':2C	'chicken':3A 'sour':2A 'sweet':1A 'veg':4A	https://www.bbcgoodfood.com/recipes/sweet-sour-chicken-veg	t	f
24	Sweet potato, chickpea & spinach curry			\N	60	t	2022-03-24 21:22:16.003062+00	2022-03-24 21:22:16.331639+00	1	\N	recipes/ad7c4c77-98ba-47cc-8601-c2e8e0f4ee0c_24.jpeg	0	\N	\N	6	This is a cheap and easy dish. You could add chopped cauliflower, red pepper or aubergine before the sweet potato; throw in shredded cooked chicken with the tomatoes; add raw prawns or white fish pieces 5 minutes before the end of the cooking time; or serve in a flatbread with grated carrot, coriander and shredded lettuce.		1	'5':36C 'add':10C,29C 'aubergin':16C 'carrot':52C 'cauliflow':12C 'cheap':4C 'chicken':25C 'chop':11C 'cook':24C,43C 'coriand':53C 'could':9C 'dish':7C 'easi':6C 'end':40C 'fish':34C 'flatbread':49C 'grate':51C 'lettuc':56C 'minut':37C 'pepper':14C 'piec':35C 'potato':20C 'prawn':31C 'raw':30C 'red':13C 'serv':46C 'shred':23C,55C 'sweet':19C 'throw':21C 'time':44C 'tomato':28C 'white':33C	'chickpea':3A 'curri':5A 'potato':2A 'spinach':4A 'sweet':1A	\N	t	f
29	Beef 'Rendang' with Coconut Rice			\N	20	t	2022-03-24 21:31:30.872255+00	2022-08-11 13:59:09.010063+00	1	\N	recipes/c7ae1686-6456-4de2-af1a-9f9bfabf24fa_29.jpeg	0	\N	\N	2	We’ve looked to Indonesia for inspiration for this quick and easy curry dish. On the table in just 20 minutes but still bursting with flavour, tender strips of beef are fried with an aromatic thai garnish and rendang paste, before being gently simmered in coconut milk. Served with fluffy coconut basmati rice, the green beans and coriander perfectly round off the dish with a splash of colour.		1	'20':20C 'aromat':35C 'basmati':52C 'bean':56C 'beef':30C 'burst':24C 'coconut':46C,51C 'colour':68C 'coriand':58C 'curri':13C 'dish':14C,63C 'easi':12C 'flavour':26C 'fluffi':50C 'fri':32C 'garnish':37C 'gentl':43C 'green':55C 'indonesia':5C 'inspir':7C 'look':3C 'milk':47C 'minut':21C 'past':40C 'perfect':59C 'quick':10C 'rendang':39C 'rice':53C 'round':60C 'serv':48C 'simmer':44C 'splash':66C 'still':23C 'strip':28C 'tabl':17C 'tender':27C 'thai':36C 've':2C	'beef':1A 'coconut':4A 'rendang':2A 'rice':5A	\N	t	f
25	Asian style chicken			\N	0	t	2022-03-24 21:25:11.425057+00	2022-03-24 21:26:13.920167+00	1	\N		0	\N	\N	1	\N		1		'asian':1A 'chicken':3A 'style':2A	\N	t	f
30	Bacon and Butternut Squash Risotto			\N	35	t	2022-03-24 21:32:39.847453+00	2022-08-11 13:56:06.51824+00	1	\N	recipes/5a3e8180-20e6-4216-858b-6727dbcfcf6d_30.jpeg	0	\N	\N	2	Risotto is the ultimate comfort food; it’s warm, creamy and satisfying. With just the right amount of heat from the chillies, creaminess from the risotto rice and the roasted butternut squash, you’ll be cosying up on the couch to enjoy this bowl of goodness. Don’t forget the all important final squeeze of lemon!		1	'amount':17C 'bowl':44C 'butternut':31C 'chilli':22C 'comfort':5C 'cosi':36C 'couch':40C 'creami':10C,23C 'enjoy':42C 'final':53C 'food':6C 'forget':49C 'good':46C 'heat':19C 'import':52C 'lemon':56C 'll':34C 'rice':27C 'right':16C 'risotto':1C,26C 'roast':30C 'satisfi':12C 'squash':32C 'squeez':54C 'ultim':4C 'warm':9C	'bacon':1A 'butternut':3A 'risotto':5A 'squash':4A	\N	t	f
27	Avocado on toast			\N	0	t	2022-03-24 21:27:23.736031+00	2022-03-24 21:27:55.072167+00	1	\N		0	\N	\N	1	\N		1		'avocado':1A 'toast':3A	\N	t	f
58	Super Veggie Passata			\N	0	t	2022-08-05 13:46:41.942287+00	2022-08-07 19:24:54.586981+00	2	\N		0	\N	\N	3	This recipe makes a large quantity of Super Veggie Passata - a great sauce to have in the freezer as a handy stand-by. You can prep all the veg by hand, but it's much easier to just chop them in a food processor in batches, and you'll have a super speedy veggie sauce in no time at all.		1	'batch':47C 'chop':40C 'easier':37C 'food':44C 'freezer':18C 'great':12C 'hand':32C 'handi':21C 'larg':5C 'll':50C 'make':3C 'much':36C 'passata':10C 'prep':27C 'processor':45C 'quantiti':6C 'recip':2C 'sauc':13C,56C 'speedi':54C 'stand':23C 'stand-bi':22C 'super':8C,53C 'time':59C 'veg':30C 'veggi':9C,55C	'passata':3A 'super':1A 'veggi':2A	\N	t	f
28	Bang bang chicken			\N	30	t	2022-03-24 21:28:45.525996+00	2022-08-11 13:58:10.206923+00	1	\N	recipes/8dfbba17-8291-4af0-89b1-93f00f0f5a46_28.jpeg	10	\N	\N	2	This vibrant bang bang chicken recipe is full of bold flavours from chilli, peanut and lime. Use leftover roast chicken, if you like, but the poached chicken in star anise and ginger is divine.		1	'anis':30C 'bang':3C,4C 'bold':10C 'chicken':5C,20C,27C 'chilli':13C 'divin':34C 'flavour':11C 'full':8C 'ginger':32C 'leftov':18C 'like':23C 'lime':16C 'peanut':14C 'poach':26C 'recip':6C 'roast':19C 'star':29C 'use':17C 'vibrant':2C	'bang':1A,2A 'chicken':3A	\N	t	f
31	Sweet Potato and Bacon Orzo with Spinach			\N	30	t	2022-03-24 21:33:25.803061+00	2022-03-24 21:33:26.202228+00	1	\N	recipes/17525331-41ee-4e13-982c-19bdf407d5b9_31.jpeg	0	\N	\N	2	Looking for a tasty midweek dinner option? Try cooking up our Sweet Potato Orzo in just 20 minutes for a balanced and tasty dinnertime.		1	'20':17C 'balanc':21C 'cook':9C 'dinner':6C 'dinnertim':24C 'look':1C 'midweek':5C 'minut':18C 'option':7C 'orzo':14C 'potato':13C 'sweet':12C 'tasti':4C,23C 'tri':8C	'bacon':4A 'orzo':5A 'potato':2A 'spinach':7A 'sweet':1A	\N	t	f
65	Pesto chicken stew with cheesy dumplings			\N	50	t	2022-08-11 14:05:53.882651+00	2022-08-11 14:08:27.954258+00	2	\N	recipes/cdfaef8e-7fd0-4ee3-86f1-f9bea8e96a2a_65.jpg	140	\N	\N	8	A slow-cooked chicken casserole with Italian basil flavours that makes a perfect weekend one-pot	8	1	'basil':9C 'casserol':6C 'chicken':5C 'cook':4C 'flavour':10C 'italian':8C 'make':12C 'one':17C 'one-pot':16C 'perfect':14C 'pot':18C 'slow':3C 'slow-cook':2C 'weekend':15C	'cheesi':5A 'chicken':2A 'dumpl':6A 'pesto':1A 'stew':3A	https://www.bbcgoodfood.com/recipes/pesto-chicken-stew-cheesy-dumplings	t	f
32	Mary Berry - Chicken Malay Rice			\N	15	t	2022-03-24 21:34:45.028196+00	2022-03-24 21:34:45.393416+00	1	\N	recipes/e8cee9ae-3cea-49e4-8490-de2b37cb87ff_32.jpeg	0	\N	\N	1	""		1		'berri':2A 'chicken':3A 'malay':4A 'mari':1A 'rice':5A	\N	t	f
33	Chicken, Red Pepper and Chorizo Risotto			\N	25	t	2022-03-24 21:36:15.586049+00	2022-03-24 21:36:38.497352+00	1	\N		35	\N	\N	4	An Italian dish made with typically Spanish ingredients that is good accompanied with French wine. A great celebration of Europe! Can be made with spicy chorizo for those who fancy a bit of heat.		1	'accompani':12C 'bit':32C 'celebr':18C 'chorizo':26C 'dish':3C 'europ':20C 'fanci':30C 'french':14C 'good':11C 'great':17C 'heat':34C 'ingredi':8C 'italian':2C 'made':4C,23C 'spanish':7C 'spici':25C 'typic':6C 'wine':15C	'chicken':1A 'chorizo':5A 'pepper':3A 'red':2A 'risotto':6A	\N	t	f
89	Cheesy Chorizo Enchiladas with Black Beans and Citrus Salad			\N	40	t	2023-08-02 16:36:57.303283+00	2023-08-02 16:36:59.913072+00	1	\N	recipes/a3114f5e-2170-4b18-a4e6-34d0864ba3ec_89.jpg	0	\N	\N	2	\N	2	1		'bean':6A 'black':5A 'cheesi':1A 'chorizo':2A 'citrus':8A 'enchilada':3A 'salad':9A	https://www.hellofresh.co.uk/recipes/enchiladas-with-black-beans-59551771c6243b447a424cc2	t	f
34	One-Pot Chicken, Red Pepper & Pesto Orzo			\N	25	t	2022-03-24 21:46:26.13256+00	2022-03-24 21:46:27.057872+00	1	\N	recipes/2739fa49-6b11-44a0-afb5-51080467beeb_34.jpeg	0	\N	\N	2	For this easy one-pot pasta, you'll sauté British chicken with red pepper and onion, then add orzo, red pesto and top with fresh basil. Tastes like risotto, but with a lot less stirring!		1	'add':19C 'basil':27C 'british':11C 'chicken':12C 'easi':3C 'fresh':26C 'less':35C 'like':29C 'll':9C 'lot':34C 'one':5C 'one-pot':4C 'onion':17C 'orzo':20C 'pasta':7C 'pepper':15C 'pesto':22C 'pot':6C 'red':14C,21C 'risotto':30C 'saut':10C 'stir':36C 'tast':28C 'top':24C	'chicken':4A 'one':2A 'one-pot':1A 'orzo':8A 'pepper':6A 'pesto':7A 'pot':3A 'red':5A	\N	t	f
59	Creamy Salmon and Pea Pasta			\N	0	t	2022-08-05 19:26:39.981561+00	2022-08-05 19:37:38.002066+00	2	\N	recipes/b524be70-fd8b-4630-9853-ebd620061797_59.jpg	0	\N	\N	3	The addition of the grated courgettes makes this a lovely light pasta dish, with the advantage of giving you a good portion of vegetables.		1	'addit':2C 'advantag':16C 'courgett':6C 'dish':13C 'give':18C 'good':21C 'grate':5C 'light':11C 'love':10C 'make':7C 'pasta':12C 'portion':22C 'veget':24C	'creami':1A 'pasta':5A 'pea':4A 'salmon':2A	\N	t	f
41	Chorizo carbonara			\N	15	t	2022-07-27 19:57:50.607807+00	2022-08-11 08:18:14.425047+00	2	\N	recipes/1e015012-6425-4a57-933f-c3435ece16d5_41.jpg	0	\N	\N	4	The spicy sausage really fires up the light carbonara sauce – a great combo with the zesty salad!		1	'carbonara':9C 'combo':13C 'fire':5C 'great':12C 'light':8C 'realli':4C 'salad':17C 'sauc':10C 'sausag':3C 'spici':2C 'zesti':16C	'carbonara':2A 'chorizo':1A	https://www.jamieoliver.com/recipes/pasta-recipes/chorizo-carbonara-with-catalan-market-salad/	t	f
43	Coconut Dal with Roasted Butternut Squash, Crispy Onions and Naans			\N	40	t	2022-07-27 20:09:50.514382+00	2022-07-27 20:10:39.884346+00	2	\N	recipes/b5e5ea23-45f6-4ff3-b3db-3eb6b1c10e7b_43.jpg	0	\N	\N	2	*We love this creamy coconut dal as it reminds us of sandy palm fringed beaches and warmer weather... Our dal is warming and hearty, thanks to being seasoned with our curry powder blend and creamy coconut milk. Topped with roasted squash, crispy onions, pumpkin seeds and fresh coriander for an unbeatable texture combination, this is a dish you can’t go wrong with.*	2	1	'beach':15C 'blend':33C 'coconut':5C,36C 'combin':53C 'coriand':48C 'creami':4C,35C 'crispi':42C 'curri':31C 'dal':6C,20C 'dish':57C 'fresh':47C 'fring':14C 'go':61C 'hearti':24C 'love':2C 'milk':37C 'onion':43C 'palm':13C 'powder':32C 'pumpkin':44C 'remind':9C 'roast':40C 'sandi':12C 'season':28C 'seed':45C 'squash':41C 'textur':52C 'thank':25C 'top':38C 'unbeat':51C 'us':10C 'warm':22C 'warmer':17C 'weather':18C 'wrong':62C	'butternut':5A 'coconut':1A 'crispi':7A 'dal':2A 'naan':10A 'onion':8A 'roast':4A 'squash':6A	https://www.hellofresh.co.uk/recipes/coconut-dal-wk40-598c5f5f0534685d355f40e3	t	f
42	Smoky Chicken & Mushroom Linguine			\N	25	t	2022-07-27 20:05:31.468598+00	2022-07-27 20:08:02.645721+00	2	\N	recipes/261a53d0-7af8-49fd-94d2-7833716a12c5_42.jpg	0	\N	\N	1		1	1		'chicken':2A 'linguin':4A 'mushroom':3A 'smoki':1A	https://production-api.gousto.co.uk/cmsreadbroker/v1/recipe/smoky-chicken-mushroom-linguine	t	f
40	Chicken Biryani			\N	0	t	2022-07-27 14:28:38.965158+00	2022-07-27 14:42:35.101788+00	2	\N	recipes/35d0324c-a21c-457f-a936-0674b7162ddc_40.jpg	0	\N	\N	1	Chicken biryani is the perfect one-pot dish. Chicken, rice and vegetables are all cooked together with a selection of spices in one large sauté pan. The results are as good as your local take-away and healthier, plus it's made at a fraction of the cost.		1	'away':38C 'biryani':2C 'chicken':1C,10C 'cook':16C 'cost':50C 'dish':9C 'fraction':47C 'good':32C 'healthier':40C 'larg':25C 'local':35C 'made':44C 'one':7C,24C 'one-pot':6C 'pan':27C 'perfect':5C 'plus':41C 'pot':8C 'result':29C 'rice':11C 'saut':26C 'select':20C 'spice':22C 'take':37C 'take-away':36C 'togeth':17C 'veget':13C	'biryani':2A 'chicken':1A	\N	t	f
37	Sweet Potato Nachos			\N	0	t	2022-07-26 19:45:18.281587+00	2022-07-26 20:05:10.801231+00	2	\N	recipes/42475686-0a12-4d75-b9d8-4e5e22f6cc57_37.jpg	0	\N	\N	4	Until you've tasted these, you will always think that traditional nachos are the way to go! However, these are so moreish, plus they count for two portions of your 5-a-day, that you'll be wanting to eat them cold from the fridge if there are any left over!		1	'5':31C 'a-day':32C 'alway':8C 'cold':43C 'count':25C 'day':34C 'eat':41C 'fridg':46C 'go':17C 'howev':18C 'left':51C 'll':37C 'moreish':22C 'nacho':12C 'plus':23C 'portion':28C 'tast':4C 'think':9C 'tradit':11C 'two':27C 've':3C 'want':39C 'way':15C	'nacho':3A 'potato':2A 'sweet':1A	\N	t	f
38	Salmon, Asparagus and Pea Risotto			\N	2	t	2022-07-26 20:11:31.32487+00	2022-07-26 20:24:52.730595+00	2	\N	recipes/71050a19-582f-49d5-bb30-fc60ce878d27_38.png	20	\N	\N	4	\N		1		'asparagus':2A 'pea':4A 'risotto':5A 'salmon':1A	\N	t	f
45	Chipotle chicken tinga			\N	15	t	2022-07-28 20:07:52.303732+00	2022-07-28 20:09:23.449167+00	2	\N	recipes/99ed4479-2be9-4837-9824-cf2b48e17ce8_45.jpg	40	\N	\N	4	Serve this chilli chicken with our tomato salsa, tortilla chips, guacamole and coriander for an easy midweek meal	4	1	'chicken':4C 'chilli':3C 'chip':10C 'coriand':13C 'easi':16C 'guacamol':11C 'meal':18C 'midweek':17C 'salsa':8C 'serv':1C 'tomato':7C 'tortilla':9C	'chicken':2A 'chipotl':1A 'tinga':3A	https://www.bbcgoodfood.com/recipes/chipotle-chicken-tinga	t	f
46	Vegetarian fajitas			\N	5	t	2022-07-28 20:09:48.39285+00	2022-07-28 20:11:17.285105+00	2	\N	recipes/b898906b-e980-47cf-858e-b1388c13452d_46.jpg	10	\N	\N	4	For a quick, easy veggie family meal, try these black bean, avocado and pepper fajitas. If you don't have the spices, swap them out for fajita seasoning	4	1	'avocado':12C 'bean':11C 'black':10C 'easi':4C 'fajita':15C,27C 'famili':6C 'meal':7C 'pepper':14C 'quick':3C 'season':28C 'spice':22C 'swap':23C 'tri':8C 'veggi':5C	'fajita':2A 'vegetarian':1A	https://www.bbcgoodfood.com/recipes/veggie-fajitas	t	f
44	Pollo Pesto Pasta			\N	0	t	2022-07-28 07:21:57.517973+00	2022-07-28 07:31:43.656554+00	2	\N	recipes/676b5667-bfc6-44a8-a0da-7ef2ae75cd58_44.jpg	0	\N	\N	2	\N		1		'pasta':3A 'pesto':2A 'pollo':1A	\N	t	f
47	Fruity lamb tagine			\N	15	t	2022-07-28 20:12:02.220624+00	2022-07-28 20:12:52.930721+00	2	\N	recipes/26fdad7a-aa47-40c4-a778-94193abc8361_47.jpg	90	\N	\N	4	This succulent and superhealthy one-pot is guaranteed to satisfy a crowd - save time and make it up to two days ahead	4	1	'ahead':23C 'crowd':13C 'day':22C 'guarante':9C 'make':17C 'one':6C 'one-pot':5C 'pot':7C 'satisfi':11C 'save':14C 'succul':2C 'superhealthi':4C 'time':15C 'two':21C	'fruiti':1A 'lamb':2A 'tagin':3A	https://www.bbcgoodfood.com/recipes/fruity-lamb-tagine	t	f
48	Roasted roots & halloumi traybake with courgette tangles			\N	45	t	2022-07-28 20:14:14.038465+00	2022-07-28 20:15:37.100735+00	2	\N	recipes/a3fc7c11-6cd6-4c1c-a3c0-f18baf5b8cf5_48.png	0	\N	\N	4	*The kids’ favourite dinners are always the traybakes – we cannot get enough of them in our family! Our trick for keeping it fresh is to combine roasted ingredients with fresh ones and to top them with a good sauce or pesto, giving a mix of temperatures as well as textures. We use a spiraliser to create the vegetable tangles but a julienne peeler will also do the trick.*		1	'also':65C 'alway':6C 'cannot':10C 'combin':26C 'creat':56C 'dinner':4C 'enough':12C 'famili':17C 'favourit':3C 'fresh':23C,30C 'get':11C 'give':42C 'good':38C 'ingredi':28C 'julienn':62C 'keep':21C 'kid':2C 'mix':44C 'one':31C 'peeler':63C 'pesto':41C 'roast':27C 'sauc':39C 'spiralis':54C 'tangl':59C 'temperatur':46C 'textur':50C 'top':34C 'traybak':8C 'trick':19C,68C 'use':52C 'veget':58C 'well':48C	'courgett':6A 'halloumi':3A 'roast':1A 'root':2A 'tangl':7A 'traybak':4A	https://www.jamieoliver.com/recipes/vegetable-recipes/roasted-roots-halloumi-traybake-with-courgette-tangles/	t	f
9	Cheesy Chorizo Enchiladas with Black Beans and Citrus Salad			\N	40	t	2022-03-24 20:58:38.492483+00	2022-08-11 08:20:25.202489+00	1	\N	recipes/975135e8-24bc-4b5f-8a5f-5a9f7160f5a1_9.jpeg	0	\N	\N	2	Mexican food is recognised by UNESCO as an 'Intangible Cultural Heritage of Humanity'. We're not entirely sure what that means but we're in favour of anything that gives props to things that are delicious. And Mexican food is undenably delicious. Like this enchilada recipe which is bursting with black beans and chorizo. Buen provecho!		1	'anyth':28C 'bean':52C 'black':51C 'buen':55C 'burst':49C 'chorizo':54C 'cultur':10C 'delici':36C,42C 'enchilada':45C 'entir':17C 'favour':26C 'food':2C,39C 'give':30C 'heritag':11C 'human':13C 'intang':9C 'like':43C 'mean':21C 'mexican':1C,38C 'prop':31C 'provecho':56C 're':15C,24C 'recip':46C 'recognis':4C 'sure':18C 'thing':33C 'unden':41C 'unesco':6C	'bean':6A 'black':5A 'cheesi':1A 'chorizo':2A 'citrus':8A 'enchilada':3A 'salad':9A	\N	t	f
51	Mozzarella & salami picnic baguette			\N	10	t	2022-07-28 20:21:39.236112+00	2022-07-28 20:23:09.825616+00	2	\N	recipes/54783a5c-e7e8-4992-bdc4-a86c688476c0_51.jpg	0	\N	\N	4	A perfect sandwich for a summer picnic. Filled with salami, spinach, basil, pesto and mozzarella, it has all the flavours of Italy that kids and grownups will enjoy	4	1	'basil':12C 'enjoy':28C 'fill':8C 'flavour':20C 'grownup':26C 'itali':22C 'kid':24C 'mozzarella':15C 'perfect':2C 'pesto':13C 'picnic':7C 'salami':10C 'sandwich':3C 'spinach':11C 'summer':6C	'baguett':4A 'mozzarella':1A 'picnic':3A 'salami':2A	https://www.bbcgoodfood.com/recipes/mozzarella-salami-pesto-sandwich	t	f
50	10-minute couscous salad			\N	10	t	2022-07-28 20:20:25.393968+00	2022-08-11 13:50:02.964432+00	2	\N	recipes/7d546af3-d319-4f38-80e0-f32b9e7443ea_50.jpg	0	\N	\N	2	This makes a great lunchbox filler for a day out and is equally good at home from the fridge	2	1	'day':9C 'equal':13C 'filler':6C 'fridg':19C 'good':14C 'great':4C 'home':16C 'lunchbox':5C 'make':2C	'10':1A 'couscous':3A 'minut':2A 'salad':4A	https://www.bbcgoodfood.com/recipes/10minute-couscous-salad	t	f
49	Tuna pasta bake			\N	50	t	2022-07-28 20:17:20.884034+00	2022-07-28 20:18:04.25622+00	2	\N	recipes/9a18ddae-977f-4097-9664-3c36b2cdddc1_49.jpg	0	\N	\N	3	Tuna pasta bake is an absolute classic, made even more wonderful with the addition of dried chilli flakes and rosemary. It's a real crowd pleaser!	Serves	1	'absolut':6C 'addit':14C 'bake':3C 'chilli':17C 'classic':7C 'crowd':25C 'dri':16C 'even':9C 'flake':18C 'made':8C 'pasta':2C 'pleaser':26C 'real':24C 'rosemari':20C 'tuna':1C 'wonder':11C	'bake':3A 'pasta':2A 'tuna':1A	https://www.olivemagazine.com/recipes/family/tuna-pasta-bake/	t	f
70	Sausage ragu			\N	5	t	2022-09-06 19:13:08.803488+00	2022-09-06 19:14:57.37319+00	2	\N	recipes/dd934b0a-67dc-42ca-b4f7-b3316b26abfb_70.jpg	45	\N	\N	4	Feed the family this comforting, budget-friendly sausage ragu with pasta. You can freeze the leftovers for another time and it tastes just as good	4	1	'anoth':19C 'budget':7C 'budget-friend':6C 'comfort':5C 'famili':3C 'feed':1C 'freez':15C 'friend':8C 'good':26C 'leftov':17C 'pasta':12C 'ragu':10C 'sausag':9C 'tast':23C 'time':20C	'ragu':2A 'sausag':1A	https://www.bbcgoodfood.com/recipes/sausage-ragu	t	f
66	Sticky chicken & chorizo skewers			\N	40	t	2022-08-11 19:55:48.637813+00	2022-08-11 19:57:43.397383+00	2	\N	recipes/def4d249-50c3-4d10-bf6b-d787a91124fe_66.jpg	40	\N	\N	8	Pair the winning combo of chicken and chorizo with a sticky garlic, honey and thyme glaze. Serve on skewers in homemade flatbreads	Serves  (with  flatbreads)	1	'chicken':6C 'chorizo':8C 'combo':4C 'flatbread':22C 'garlic':12C 'glaze':16C 'homemad':21C 'honey':13C 'pair':1C 'serv':17C 'skewer':19C 'sticki':11C 'thyme':15C 'win':3C	'chicken':2A 'chorizo':3A 'skewer':4A 'sticki':1A	https://www.bbcgoodfood.com/recipes/sticky-chicken-chorizo-skewers	t	f
60	Peanut chicken traybake			\N	30	t	2022-08-05 19:47:59.451052+00	2022-08-05 19:49:23.635784+00	2	\N	recipes/b951f40a-1478-4f25-96a9-559d4ae5098f_60.jpg	60	\N	\N	4	\N	Serves	1		'chicken':2A 'peanut':1A 'traybak':3A	https://www.bbc.co.uk/food/recipes/one-tray_peanut_chicken_19540	t	f
72	Lentil bolognese			\N	15	t	2022-12-09 09:44:38.909629+00	2022-12-09 09:45:52.446853+00	2	\N	recipes/1178ab9f-c3d9-46ac-9aff-35706f84f563_72.jpg	75	\N	\N	6	Struggle to get your five-a-day? This superhealthy lentil ragu will get you four steps closer and can be frozen for extra convenience	6	1	'closer':18C 'conveni':25C 'day':8C 'extra':24C 'five':6C 'five-a-day':5C 'four':16C 'frozen':22C 'get':3C,14C 'lentil':11C 'ragu':12C 'step':17C 'struggl':1C 'superhealthi':10C	'bolognes':2A 'lentil':1A	https://www.bbcgoodfood.com/recipes/lentil-ragu	t	f
71	One-pot chicken & bacon stew			\N	20	t	2022-09-29 09:05:45.662589+00	2022-09-29 09:06:53.652238+00	2	\N	recipes/9d41ed29-ee75-456e-a1ee-12efeb4f81c3_71.jpg	90	\N	\N	8	Cook a batch of this delicious family favourite and you'll always have a satisfying meal to hand	8	1	'alway':12C 'batch':3C 'cook':1C 'delici':6C 'famili':7C 'favourit':8C 'hand':18C 'll':11C 'meal':16C 'satisfi':15C	'bacon':5A 'chicken':4A 'one':2A 'one-pot':1A 'pot':3A 'stew':6A	https://www.bbcgoodfood.com/recipes/one-pot-chicken-bacon-stew	t	f
73	Italian vegetable soup			\N	15	t	2022-12-09 09:47:04.37341+00	2022-12-09 14:01:42.818218+00	2	\N	recipes/f7a61241-44b3-4a8e-b125-f7cddc07a00a_73.jpg	55	\N	\N	8	Warm up your week with this nourishing healthy vegetable soup that's packed with veggies and pasta, and easy to freeze ahead	8	1	'ahead':22C 'easi':19C 'freez':21C 'healthi':8C 'nourish':7C 'pack':13C 'pasta':17C 'soup':10C 'veget':9C 'veggi':15C 'warm':1C 'week':4C	'italian':1A 'soup':3A 'veget':2A	https://www.bbcgoodfood.com/recipes/italian-vegetable-soup	t	f
6	Gnocchi with Roast Rainbow Beetroot & Pesto			\N	0	t	2022-03-24 20:47:06.37201+00	2022-08-15 09:22:30.324552+00	1	\N	recipes/aa846091-b9a1-4303-8472-fa3dcc43ede9_6.jpg	0	\N	\N	2	This easy summer supper is bursting with colour and flavour. A bright mix of tender roast rainbow beetroot, glazed with a splash of balsamic and tossed with fluffy golden gnocchi, finished with a drizzle of pesto and fresh, fragrant basil leaves.		1	'balsam':24C 'basil':40C 'beetroot':18C 'bright':12C 'burst':6C 'colour':8C 'drizzl':34C 'easi':2C 'finish':31C 'flavour':10C 'fluffi':28C 'fragrant':39C 'fresh':38C 'glaze':19C 'gnocchi':30C 'golden':29C 'leav':41C 'mix':13C 'pesto':36C 'rainbow':17C 'roast':16C 'splash':22C 'summer':3C 'supper':4C 'tender':15C 'toss':26C	'beetroot':5A 'gnocchi':1A 'pesto':6A 'rainbow':4A 'roast':3A	\N	t	f
75	Red lentil & squash dhal			\N	15	t	2022-12-09 20:47:41.565675+00	2022-12-09 20:48:34.144469+00	2	\N	recipes/41e7b43e-52a6-4445-a8e0-ec0d8478a7b2_75.jpg	40	\N	\N	4	A hearty budget meal of spiced red lentils with butternut and tomatoes. Add coriander, cumin, turmeric and a dollop of mango chutney	4	1	'add':13C 'budget':3C 'butternut':10C 'chutney':22C 'coriand':14C 'cumin':15C 'dollop':19C 'hearti':2C 'lentil':8C 'mango':21C 'meal':4C 'red':7C 'spice':6C 'tomato':12C 'turmer':16C	'dhal':4A 'lentil':2A 'red':1A 'squash':3A	https://www.bbcgoodfood.com/recipes/red-lentil-squash-dhal	t	f
76	Spiced lamb meatball stew			\N	10	t	2022-12-09 20:52:51.48686+00	2022-12-09 20:53:50.836468+00	2	\N	recipes/94f59b8c-8682-4000-90c9-c66b0f1526a2_76.jpg	30	\N	\N	4	Enjoy spiced lamb meatballs with chickpeas and pomegranate seeds in a harissa sauce for an easy midweek meal. Freeze any leftovers for busy weekdays	4	1	'busi':23C 'chickpea':6C 'easi':16C 'enjoy':1C 'freez':19C 'harissa':12C 'lamb':3C 'leftov':21C 'meal':18C 'meatbal':4C 'midweek':17C 'pomegran':8C 'sauc':13C 'seed':9C 'spice':2C 'weekday':24C	'lamb':2A 'meatbal':3A 'spice':1A 'stew':4A	https://www.bbcgoodfood.com/recipes/spiced-lamb-meatball-stew	t	f
77	Chicken tikka masala			\N	15	t	2023-01-25 20:29:43.41345+00	2023-01-25 20:29:46.228009+00	2	\N	recipes/97900f85-baa9-4cd0-ae99-8dddba3745a0_77.jpg	50	\N	\N	10	This takeaway favourite is freezer-friendly and quick to reheat, giving you the chance to get ahead and save money.	10	1	'ahead':18C 'chanc':15C 'favourit':3C 'freezer':6C 'freezer-friend':5C 'friend':7C 'get':17C 'give':12C 'money':21C 'quick':9C 'reheat':11C 'save':20C 'takeaway':2C	'chicken':1A 'masala':3A 'tikka':2A	https://www.bbcgoodfood.com/recipes/chicken-tikka-masala	t	f
79	Honey Garlic Pork Meatballs with Hoisin Veg Noodles and Toasted Sesame Seeds			\N	30	t	2023-04-28 13:09:53.153855+00	2023-04-28 13:14:00.661836+00	2	\N	recipes/f53ab01e-3422-45db-acc0-fbf054dc1dc6_79.jpg	0	\N	\N	2	These Honey Garlic Pork Meatballs are a crowd pleaser and is one to get the family round the dinner table for. Super simple to make, and easily customised to suit the kids too.	2	1	'crowd':8C 'customis':28C 'dinner':19C 'easili':27C 'famili':16C 'garlic':3C 'get':14C 'honey':2C 'kid':32C 'make':25C 'meatbal':5C 'one':12C 'pleaser':9C 'pork':4C 'round':17C 'simpl':23C 'suit':30C 'super':22C 'tabl':20C	'garlic':2A 'hoisin':6A 'honey':1A 'meatbal':4A 'noodl':8A 'pork':3A 'seed':12A 'sesam':11A 'toast':10A 'veg':7A	https://www.hellofresh.co.uk/recipes/honey-garlic-beef-meatballs-63f63e14d25a1b126733231b	t	f
78	Nachos			\N	30	t	2023-02-26 12:54:45.398071+00	2023-02-26 12:56:00.981475+00	2	\N	recipes/dc24ee70-9897-425a-86cb-aceec4cc079a_78.jpg	30	\N	\N	2	If you haven't learned how to make your own nachos, this is your moment. Ellis Barrie shows you how easy it is to make the perfect snack for hungry mates.	Serves  as a main,  as a starter	1	'barri':17C 'easi':21C 'elli':16C 'haven':3C 'hungri':30C 'learn':5C 'make':8C,25C 'mate':31C 'moment':15C 'nacho':11C 'perfect':27C 'show':18C 'snack':28C	'nacho':1A	https://www.bbc.co.uk/food/recipes/nachos_92445	t	f
81	Green Thai Style Butternut Squash Curry with Black Sesame Seeds and Zesty Pea Jasmine Rice			\N	40	t	2023-04-28 13:20:24.188811+00	2023-04-28 13:23:53.64559+00	2	\N	recipes/f71bea93-cf25-4799-8d04-3de4048974cf_81.jpg	0	\N	\N	2	Our Green Thai Style Butternut Squash Curry is a delicious veggie option that makes it easy to eat more veg in your diet and try something new!	2	1	'butternut':5C 'curri':7C 'delici':10C 'diet':23C 'easi':16C 'eat':18C 'green':2C 'make':14C 'new':27C 'option':12C 'someth':26C 'squash':6C 'style':4C 'thai':3C 'tri':25C 'veg':20C 'veggi':11C	'black':8A 'butternut':4A 'curri':6A 'green':1A 'jasmin':14A 'pea':13A 'rice':15A 'seed':10A 'sesam':9A 'squash':5A 'style':3A 'thai':2A 'zesti':12A	https://www.hellofresh.co.uk/recipes/green-thai-style-butternut-squash-curry-63e28236944e4b1699c3aaa0	t	f
80	Sweet and Sticky Chicken Noodles with Bell Pepper and Mangetout			\N	30	t	2023-04-28 13:15:38.629564+00	2023-04-28 13:19:15.287876+00	2	\N	recipes/abcc79f9-1503-4e16-b817-7f4f67d55d79_80.jpg	0	\N	\N	2	A customer favourite, this Sweet and Sticky Chicken Noodles is a tried-and-tested recipe that always wins with a crowd.	2	1	'alway':18C 'chicken':8C 'crowd':22C 'custom':2C 'favourit':3C 'noodl':9C 'recip':16C 'sticki':7C 'sweet':5C 'test':15C 'tri':13C 'tried-and-test':12C 'win':19C	'bell':7A 'chicken':4A 'mangetout':10A 'noodl':5A 'pepper':8A 'sticki':3A 'sweet':1A	https://www.hellofresh.co.uk/recipes/sweet-and-sticky-chicken-noodles-63e282301ac229c7283c8268	t	f
83	Spiced Tomato Chicken on Zesty Bulgur with Pepper and Green Beans			\N	25	t	2023-08-02 16:32:17.845589+00	2023-08-02 16:32:21.770545+00	1	\N	recipes/ba743bf0-04b7-4f1d-b6f6-b9cfcc4a7c72_83.jpg	0	\N	\N	2	This Spiced Tomato Chicken on Zesty Bulgur is bursting full of flavours and makes the perfect dinner night option from HelloFresh. Cook up a fresh start!	2	1	'bulgur':7C 'burst':9C 'chicken':4C 'cook':22C 'dinner':17C 'flavour':12C 'fresh':25C 'full':10C 'hellofresh':21C 'make':14C 'night':18C 'option':19C 'perfect':16C 'spice':2C 'start':26C 'tomato':3C 'zesti':6C	'bean':11A 'bulgur':6A 'chicken':3A 'green':10A 'pepper':8A 'spice':1A 'tomato':2A 'zesti':5A	https://www.hellofresh.co.uk/recipes/spiced-tomato-chicken-on-zesty-bulgur-63e2823a246012e72804d20e	t	f
82	Sticky pork-stuffed peppers			\N	0	t	2023-07-14 10:24:04.678729+00	2023-07-14 10:24:58.653707+00	2	\N	recipes/e353980b-0c3f-40f0-8559-3f79a10cbb15_82.jpg	0	\N	\N	4	The Asian-inspired sticky pork in this stuffed pepper recipe is incredibly moreish – and so simple to make	Serves	1	'asian':3C 'asian-inspir':2C 'incred':13C 'inspir':4C 'make':19C 'moreish':14C 'pepper':10C 'pork':6C 'recip':11C 'simpl':17C 'sticki':5C 'stuf':9C	'pepper':5A 'pork':3A 'pork-stuf':2A 'sticki':1A 'stuf':4A	https://www.deliciousmagazine.co.uk/recipes/sticky-pork-stuffed-peppers/	t	f
85	Indonesian Inspired Pork Noodles with Stir-Fried Pepper, Lime and Peanuts			\N	20	t	2023-08-02 16:34:10.947515+00	2023-08-02 16:34:12.840158+00	1	\N	recipes/41a41239-e20d-4776-850f-52ef7b2d5056_85.jpg	0	\N	\N	2	Looking for a quick and tasty midweek dinner option? Try cooking up our Indonesian Inspired Pork Noodles in just 20 minutes for a delicious and speedy meal.	2	1	'20':20C 'cook':11C 'delici':24C 'dinner':8C 'indonesian':14C 'inspir':15C 'look':1C 'meal':27C 'midweek':7C 'minut':21C 'noodl':17C 'option':9C 'pork':16C 'quick':4C 'speedi':26C 'tasti':6C 'tri':10C	'fri':8A 'indonesian':1A 'inspir':2A 'lime':10A 'noodl':4A 'peanut':12A 'pepper':9A 'pork':3A 'stir':7A 'stir-fri':6A	https://www.hellofresh.co.uk/recipes/indonesian-inspired-pork-noodles-645a6637572079217b737e85	t	f
84	Sweet and Sticky Chicken with Green Pepper, Mangetout and Noodles			\N	30	t	2023-08-02 16:33:21.269768+00	2023-08-02 16:33:23.28715+00	1	\N	recipes/69fefcef-c404-45fb-a751-96621e62369d_84.jpg	0	\N	\N	2	This delicious Sweet and Sticky Chicken has been expertly designed by our chefs as a lighter option to help with a balanced lifestyle.	2	1	'balanc':22C 'chef':13C 'chicken':6C 'delici':2C 'design':10C 'expert':9C 'help':19C 'lifestyl':23C 'lighter':16C 'option':17C 'sticki':5C 'sweet':3C	'chicken':4A 'green':6A 'mangetout':8A 'noodl':10A 'pepper':7A 'sticki':3A 'sweet':1A	https://www.hellofresh.co.uk/recipes/sweet-and-sticky-chicken-6373bc50300835c748be6ade	t	f
86	Thai Style Beef Rice Bowl with Pak Choi			\N	35	t	2023-08-02 16:35:40.257374+00	2023-08-02 16:35:42.218027+00	1	\N	recipes/e00a8f97-7e38-432a-9141-35fd7ad1040f_86.jpg	0	\N	\N	2	This Thai Style Beef Rice Bowl is a crowd pleaser and is one to get the family round the dinner table for. Super simple to make, and easily customised to suit the kids too.	2	1	'beef':4C 'bowl':6C 'crowd':9C 'customis':29C 'dinner':20C 'easili':28C 'famili':17C 'get':15C 'kid':33C 'make':26C 'one':13C 'pleaser':10C 'rice':5C 'round':18C 'simpl':24C 'style':3C 'suit':31C 'super':23C 'tabl':21C 'thai':2C	'beef':3A 'bowl':5A 'choi':8A 'pak':7A 'rice':4A 'style':2A 'thai':1A	https://www.hellofresh.co.uk/recipes/thai-style-beef-rice-bowl-642da476f64a988df1029fec	t	f
87	Smokey BBQ Chicken and Blackbean Loaded Wedges With Cheese			\N	40	t	2023-08-02 16:36:08.491354+00	2023-08-02 16:36:10.937378+00	1	\N	recipes/4f6e3693-156f-40b4-a283-e1dcb4124dd6_87.jpg	0	\N	\N	2	This BBQ Chicken & Blackbean Loaded Wedges is bursting full of flavours and make the perfect dinner night option, from HelloFresh. Cook up a fresh start!	2	1	'bbq':2C 'blackbean':4C 'burst':8C 'chicken':3C 'cook':21C 'dinner':16C 'flavour':11C 'fresh':24C 'full':9C 'hellofresh':20C 'load':5C 'make':13C 'night':17C 'option':18C 'perfect':15C 'start':25C 'wedg':6C	'bbq':2A 'blackbean':5A 'chees':9A 'chicken':3A 'load':6A 'smokey':1A 'wedg':7A	https://www.hellofresh.co.uk/recipes/smokey-bbq-chicken-and-blackbean-loaded-wedges-5feb63f3f9f0bc296e6c7db0	t	f
88	Hoisin Pork Wraps with Cucumber and Sweet Potato Fries			\N	20	t	2023-08-02 16:36:29.629588+00	2023-08-02 16:36:31.529053+00	1	\N	recipes/0919ae89-68e2-4ee2-9a11-5bbf2a2f75c1_88.jpg	0	\N	\N	2	Sweet, sticky and rich with flavour, our hoisin pork wraps are a delicious treat that can be whipped up in as little as 20 minutes.	2	1	'20':24C 'delici':13C 'flavour':6C 'hoisin':8C 'littl':22C 'minut':25C 'pork':9C 'rich':4C 'sticki':2C 'sweet':1C 'treat':14C 'whip':18C 'wrap':10C	'cucumb':5A 'fri':9A 'hoisin':1A 'pork':2A 'potato':8A 'sweet':7A 'wrap':3A	https://www.hellofresh.co.uk/recipes/hoisin-pork-wraps-5dfb8767a5211525e95d1527	t	f
90	Middle Eastern Style Lamb Stew with Couscous and Charred Courgette			\N	20	t	2023-08-02 16:37:41.916182+00	2023-08-02 16:37:43.771628+00	1	\N	recipes/1a93157a-6f59-43d5-9773-c91e12349424_90.jpg	0	\N	\N	2	\N	2	1		'char':9A 'courgett':10A 'couscous':7A 'eastern':2A 'lamb':4A 'middl':1A 'stew':5A 'style':3A	https://www.hellofresh.co.uk/recipes/middle-eastern-style-lamb-apricot-stew-61f79ab96de22f72d27f6baf	t	f
\.


--
-- Data for Name: cookbook_recipe_keywords; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipe_keywords (id, recipe_id, keyword_id) FROM stdin;
\.


--
-- Data for Name: cookbook_recipe_properties; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipe_properties (id, recipe_id, property_id) FROM stdin;
\.


--
-- Data for Name: cookbook_recipe_shared; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipe_shared (id, recipe_id, user_id) FROM stdin;
\.


--
-- Data for Name: cookbook_recipe_steps; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipe_steps (id, recipe_id, step_id) FROM stdin;
1	1	1
2	2	2
4	3	3
5	4	4
7	5	5
8	6	6
9	7	7
12	8	8
13	9	9
14	10	10
15	11	11
16	12	12
17	13	13
18	14	14
19	15	15
20	16	16
21	17	17
22	18	18
23	19	19
24	20	20
25	21	21
26	22	22
27	23	23
28	24	24
29	25	25
33	27	27
35	28	28
36	29	29
37	30	30
38	31	31
39	32	32
40	33	33
42	34	34
45	37	37
47	37	38
48	37	39
49	37	40
50	37	41
51	37	42
64	38	43
73	38	50
74	38	51
75	38	52
76	38	53
77	38	54
78	38	55
93	40	61
94	40	64
95	40	65
97	40	62
98	40	63
99	41	66
102	42	67
105	43	68
107	44	69
109	45	70
111	46	71
113	47	72
115	48	73
117	49	74
119	50	75
121	51	76
123	52	77
125	53	78
127	54	79
130	55	80
132	56	81
134	57	82
136	58	83
138	59	84
140	60	85
142	61	86
145	62	87
148	63	88
158	64	89
173	65	90
179	66	91
181	67	92
186	68	93
190	69	94
192	70	95
194	71	96
196	72	97
198	73	98
202	74	99
205	75	100
207	76	101
209	77	102
210	78	103
212	79	104
214	80	105
216	81	106
218	82	107
220	83	108
221	84	109
222	85	110
223	86	111
224	87	112
225	88	113
226	89	114
227	90	115
228	91	116
\.


--
-- Data for Name: cookbook_recipebook; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipebook (id, name, created_by_id, description, icon, space_id, filter_id) FROM stdin;
\.


--
-- Data for Name: cookbook_recipebook_shared; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipebook_shared (id, recipebook_id, user_id) FROM stdin;
\.


--
-- Data for Name: cookbook_recipebookentry; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipebookentry (id, book_id, recipe_id) FROM stdin;
\.


--
-- Data for Name: cookbook_recipeimport; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_recipeimport (id, name, file_uid, file_path, created_at, storage_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_searchfields; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_searchfields (id, name, field) FROM stdin;
1	Name	name
2	Description	description
3	Instructions	steps__instruction
4	Ingredients	steps__ingredients__food__name
5	Keywords	keywords__name
6	Units	steps__ingredients__unit__name
\.


--
-- Data for Name: cookbook_searchpreference; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_searchpreference (user_id, search, lookup, trigram_threshold) FROM stdin;
2	plain	t	0.20
1	plain	t	0.20
\.


--
-- Data for Name: cookbook_searchpreference_fulltext; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_searchpreference_fulltext (id, searchpreference_id, searchfields_id) FROM stdin;
\.


--
-- Data for Name: cookbook_searchpreference_icontains; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_searchpreference_icontains (id, searchpreference_id, searchfields_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: cookbook_searchpreference_istartswith; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_searchpreference_istartswith (id, searchpreference_id, searchfields_id) FROM stdin;
\.


--
-- Data for Name: cookbook_searchpreference_trigram; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_searchpreference_trigram (id, searchpreference_id, searchfields_id) FROM stdin;
1	1	1
5	2	1
6	2	4
7	1	4
\.


--
-- Data for Name: cookbook_searchpreference_unaccent; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_searchpreference_unaccent (id, searchpreference_id, searchfields_id) FROM stdin;
1	1	1
7	2	1
\.


--
-- Data for Name: cookbook_sharelink; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_sharelink (id, uuid, created_at, created_by_id, recipe_id, space_id, request_count, abuse_blocked) FROM stdin;
\.


--
-- Data for Name: cookbook_shoppinglist; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_shoppinglist (id, uuid, note, created_at, created_by_id, finished, supermarket_id, space_id) FROM stdin;
1	8ff7a57d-ba64-4b5c-a3ec-394e1264c607	\N	2022-03-14 11:37:10.2532+00	1	t	\N	1
2	5c756459-04bc-425d-8201-1c2caf48b418	\N	2022-03-14 11:42:07.975433+00	1	t	\N	1
\.


--
-- Data for Name: cookbook_shoppinglist_entries; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_shoppinglist_entries (id, shoppinglist_id, shoppinglistentry_id) FROM stdin;
\.


--
-- Data for Name: cookbook_shoppinglist_recipes; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_shoppinglist_recipes (id, shoppinglist_id, shoppinglistrecipe_id) FROM stdin;
1	1	3
2	1	4
5	2	7
\.


--
-- Data for Name: cookbook_shoppinglist_shared; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_shoppinglist_shared (id, shoppinglist_id, user_id) FROM stdin;
\.


--
-- Data for Name: cookbook_shoppinglistentry; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_shoppinglistentry (id, amount, "order", checked, food_id, list_recipe_id, unit_id, completed_at, created_at, created_by_id, space_id, ingredient_id, delay_until) FROM stdin;
144	0.1250000000000000	0	t	408	15	10	2022-08-14 09:34:29.506285+00	2022-08-14 09:30:00.173685+00	2	1	682	\N
151	0.0000000000000000	0	t	411	15	\N	2022-08-14 09:34:30.930826+00	2022-08-14 09:30:00.23048+00	2	1	689	\N
158	1.0000000000000000	0	t	22	16	7	2022-08-14 09:34:55.112044+00	2022-08-14 09:30:14.557034+00	2	1	13	\N
149	50.0000000000000000	0	t	102	15	1	2022-08-14 12:13:31.518128+00	2022-08-14 09:30:00.214956+00	2	1	687	\N
160	2.0000000000000000	0	t	261	16	\N	2022-08-14 12:13:33.446279+00	2022-08-14 09:30:14.572745+00	2	1	15	\N
155	3.5000000000000000	0	t	30	15	\N	2022-08-14 12:13:37.551353+00	2022-08-14 09:30:00.263877+00	2	1	693	\N
154	0.2500000000000000	0	t	412	15	6	2022-08-14 12:13:38.452413+00	2022-08-14 09:30:00.257375+00	2	1	692	\N
146	1.0000000000000000	0	t	306	15	\N	2022-08-14 12:13:40.192149+00	2022-08-14 09:30:00.188561+00	2	1	684	\N
130	125.0000000000000000	0	t	57	14	1	2022-08-14 12:14:32.27884+00	2022-08-14 09:29:47.181137+00	2	1	617	\N
159	0.5000000000000000	0	t	14	16	7	2022-08-14 12:14:33.174653+00	2022-08-14 09:30:14.565581+00	2	1	14	\N
140	0.0000000000000000	0	t	375	14	\N	2022-08-14 12:14:34.024132+00	2022-08-14 09:29:47.405149+00	2	1	627	\N
121	0.6666666666666667	0	t	182	13	44	2022-08-14 12:16:22.734663+00	2022-08-14 09:29:11.233676+00	2	1	259	\N
120	2.0000000000000000	0	t	181	13	52	2022-08-14 12:16:23.817254+00	2022-08-14 09:29:11.216759+00	2	1	258	\N
142	25.0000000000000000	0	t	91	15	22	2022-08-14 12:16:24.770175+00	2022-08-14 09:30:00.155488+00	2	1	680	\N
153	50.0000000000000000	0	t	91	15	22	2022-08-14 12:16:24.968941+00	2022-08-14 09:30:00.249142+00	2	1	691	\N
116	0.0000000000000000	0	t	16	13	\N	2022-08-14 12:16:25.709925+00	2022-08-14 09:29:11.172723+00	2	1	254	\N
135	2.5000000000000000	0	t	201	14	6	2022-08-14 12:16:31.119967+00	2022-08-14 09:29:47.231907+00	2	1	622	\N
126	266.6666666666666667	0	t	186	13	1	2022-08-14 12:16:35.330234+00	2022-08-14 09:29:11.313951+00	2	1	264	\N
119	0.6666666666666667	0	t	180	13	51	2022-08-14 12:16:36.19478+00	2022-08-14 09:29:11.205958+00	2	1	257	\N
156	1.0000000000000000	0	t	260	16	5	2022-08-14 12:19:53.070299+00	2022-08-14 09:30:14.503546+00	2	1	11	\N
145	0.3750000000000000	0	t	282	15	6	2022-08-14 12:20:12.478096+00	2022-08-14 09:30:00.182451+00	2	1	683	\N
124	5.3333333333333333	0	t	184	13	48	2022-08-14 12:20:14.770702+00	2022-08-14 09:29:11.283449+00	2	1	262	\N
129	2.0000000000000000	0	t	39	14	6	2022-08-14 12:20:16.546434+00	2022-08-14 09:29:47.172996+00	2	1	616	\N
133	2.0000000000000000	0	t	39	14	6	2022-08-14 12:20:16.650293+00	2022-08-14 09:29:47.216347+00	2	1	620	\N
136	0.5000000000000000	0	t	45	14	7	2022-08-14 12:20:25.183867+00	2022-08-14 09:29:47.374856+00	2	1	623	\N
118	2.0000000000000000	0	t	179	13	16	2022-08-14 12:21:07.501847+00	2022-08-14 09:29:11.197989+00	2	1	256	\N
152	0.3000000000000000	0	t	29	15	5	2022-08-14 12:21:12.227134+00	2022-08-14 09:30:00.24056+00	2	1	690	\N
117	1.3333333333333333	0	t	12	13	3	2022-08-14 14:58:10.227121+00	2022-08-14 09:29:11.188924+00	2	1	255	\N
157	2.0000000000000000	0	t	12	16	\N	2022-08-14 14:58:10.355843+00	2022-08-14 09:30:14.513867+00	2	1	12	\N
138	1.0000000000000000	0	t	374	14	\N	2022-08-14 14:58:12.962025+00	2022-08-14 09:29:47.389202+00	2	1	625	\N
137	1.0000000000000000	0	t	315	14	\N	2022-08-14 15:01:07.891918+00	2022-08-14 09:29:47.381103+00	2	1	624	\N
131	0.5000000000000000	0	t	372	14	5	2022-08-14 15:02:59.889501+00	2022-08-14 09:29:47.189626+00	2	1	618	\N
150	62.5000000000000000	0	t	305	15	1	2022-08-14 15:03:39.441962+00	2022-08-14 09:30:00.223322+00	2	1	688	\N
141	0.5000000000000000	0	t	49	14	\N	2022-08-14 15:03:41.170311+00	2022-08-14 09:29:47.413717+00	2	1	628	\N
127	250.0000000000000000	0	t	371	14	1	2022-08-14 15:03:43.717031+00	2022-08-14 09:29:47.156205+00	2	1	614	\N
139	1.5000000000000000	0	t	371	14	6	2022-08-14 15:03:43.786519+00	2022-08-14 09:29:47.399802+00	2	1	626	\N
143	18.7500000000000000	0	t	407	15	22	2022-08-14 15:03:45.171225+00	2022-08-14 09:30:00.165609+00	2	1	681	\N
122	2.0000000000000000	0	t	145	13	53	2022-08-14 15:03:48.31624+00	2022-08-14 09:29:11.25048+00	2	1	260	\N
148	1.0000000000000000	0	t	196	15	\N	2022-08-14 15:04:50.387589+00	2022-08-14 09:30:00.205667+00	2	1	686	\N
134	2.5000000000000000	0	t	373	14	6	2022-08-14 15:05:40.722373+00	2022-08-14 09:29:47.224607+00	2	1	621	\N
67	0.3333333333333333	0	f	11	9	5	\N	2022-03-24 21:41:17.945386+00	1	1	11	\N
68	0.6666666666666667	0	f	12	9	\N	\N	2022-03-24 21:41:18.023369+00	1	1	12	\N
69	0.3333333333333333	0	f	13	9	6	\N	2022-03-24 21:41:18.030236+00	1	1	13	\N
70	0.1666666666666667	0	f	14	9	7	\N	2022-03-24 21:41:18.047786+00	1	1	14	\N
71	0.6666666666666667	0	f	15	9	8	\N	2022-03-24 21:41:18.055422+00	1	1	15	\N
72	0.6666666666666667	0	f	16	9	6	\N	2022-03-24 21:41:18.070487+00	1	1	16	\N
73	133.3333333333333333	0	f	17	9	1	\N	2022-03-24 21:41:18.08206+00	1	1	17	\N
74	0.4000000000000000	0	f	18	9	9	\N	2022-03-24 21:41:18.088357+00	1	1	18	\N
75	0.0000000000000000	0	f	19	9	\N	\N	2022-03-24 21:41:18.092494+00	1	1	20	\N
125	0.6666666666666667	0	t	185	13	15	2022-08-14 09:30:31.668251+00	2022-08-14 09:29:11.300124+00	2	1	263	\N
128	0.5000000000000000	0	t	89	14	6	2022-08-14 09:30:32.72443+00	2022-08-14 09:29:47.164877+00	2	1	615	\N
132	2.0000000000000000	0	t	89	14	6	2022-08-14 09:30:32.827537+00	2022-08-14 09:29:47.199461+00	2	1	619	\N
147	0.7500000000000000	0	t	89	15	6	2022-08-14 09:30:32.940274+00	2022-08-14 09:30:00.1981+00	2	1	685	\N
123	0.6666666666666667	0	t	183	13	15	2022-08-14 09:30:29.985074+00	2022-08-14 09:29:11.26721+00	2	1	261	\N
162	400.0000000000000000	0	t	17	16	1	2022-08-14 12:13:29.797268+00	2022-08-14 09:30:14.690873+00	2	1	17	\N
165	0.0000000000000000	0	t	19	16	\N	2022-08-14 12:13:39.321241+00	2022-08-14 09:30:14.714322+00	2	1	20	\N
161	2.0000000000000000	0	t	16	16	6	2022-08-14 12:16:25.907313+00	2022-08-14 09:30:14.581795+00	2	1	16	\N
164	400.0000000000000000	0	t	6	16	1	2022-08-14 12:16:29.158356+00	2022-08-14 09:30:14.707874+00	2	1	19	\N
163	1.2000000000000000	0	t	391	16	9	2022-08-14 12:20:18.561543+00	2022-08-14 09:30:14.699375+00	2	1	18	\N
\.


--
-- Data for Name: cookbook_shoppinglistrecipe; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_shoppinglistrecipe (id, servings, recipe_id, mealplan_id, name) FROM stdin;
5	2.0000	1	\N	
6	2.0000	1	\N	
3	1.0000	2	\N	
4	1.0000	1	\N	
7	1.0000	2	\N	
8	1.0000	32	\N	
9	2.0000	2	\N	
13	4.0000	24	\N	
14	2.0000	60	\N	
15	2.0000	66	\N	
16	6.0000	2	\N	
\.


--
-- Data for Name: cookbook_space; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_space (id, name, message, created_by_id, max_recipes, max_users, demo, max_file_storage_mb, allow_sharing, created_at, show_facet_count, image_id, use_plural, no_sharing_limit, internal_note) FROM stdin;
1	Default		1	0	0	f	0	t	2022-03-14 10:02:42.303534+00	f	\N	f	f	\N
\.


--
-- Data for Name: cookbook_space_food_inherit; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_space_food_inherit (id, space_id, foodinheritfield_id) FROM stdin;
\.


--
-- Data for Name: cookbook_step; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_step (id, instruction, "order", name, "time", show_as_header, file_id, space_id, step_recipe_id, search_vector, show_ingredients_table) FROM stdin;
50	In a saucepan, mix the stock cube with 1 litre of boiling water and cover to keep hot.	1	Step 2	0	f	\N	1	\N	'1':9B 'boil':12B 'cover':15B 'cube':7B 'hot':18B 'keep':17B 'litr':10B 'mix':4B 'saucepan':3B 'stock':6B 'water':13B	t
51	Heat 2 tbsp olive oil in a large pan over a medium heat. Add the onion and garlic, season and sweat for 3-5 minutes until they begin to soften.	2	Step 3	0	f	\N	1	\N	'-5':24B '2':2B '3':23B 'add':14B 'begin':28B 'garlic':18B 'heat':1B,13B 'larg':8B 'medium':12B 'minut':25B 'oil':5B 'oliv':4B 'onion':16B 'pan':9B 'season':19B 'soften':30B 'sweat':21B 'tbsp':3B	t
3	Tip the chicken into a large bowl and add the marinade ingredients, along with 1 tsp salt and plenty of black pepper. Mix well, ensuring each thigh is well coated. Cover and chill for at least 3 hrs, or up to 48 hrs if you have time.  \nA few hours before you want to eat, make the pitta. In a bowl, mix the flour, yeast, sugar and 1/ 2 tsp salt with your fingertips. Add 150ml lukewarm water and 2 tsp olive oil, and combine to a dough. Tip onto a work surface and knead for 8-10 mins (or use a tabletop mixer for 5 mins). Clean, then lightly oil your bowl, return the dough and cover loosely with cling film. Leave to rise for 1 hr or until nearly doubled in size.  \nDivide the dough into four equal pieces. Roll out to circles, as thin as you can. Cover with sheets of oiled cling film and leave to rise for 15-20 mins.  \nTo make the tzatziki, halve the cucumber lengthways and scoop out the seeds. Finely chop, then combine with the remaining ingredients, along with a pinch of salt. Chill until ready to serve.  \nHeat the grill to its highest setting. Line a roasting tin with foil and find 4 metal skewers long enough to sit across the top with a little space underneath. Remove the chicken from the fridge, take one thigh and thread it over 2 skewers, so it has a skewer through either side. Thread another piece of chicken on top, leaving a slight gap between each piece; you should fit 6 thighs on each pair of skewers. Position the skewers on top of the roasting tin and set aside while you finish the pittas.  \nHeat a large frying pan (or two if you have them) over a medium-high heat and brush the breads with oil. Gently lift one into the pan. It should sizzle, and bubbles should appear on the surface after 1-2 mins. When the underside is golden, flip it and cook for another 2-3 mins. Continue until all the breads are cooked, wrapping them in foil as you go. Keep the bread warm in the bottom of the oven while you cook the chicken. Alternatively, cook on the barbecue for 5-8 mins, turning occasionally.  \nPut the chicken under the hot grill and cook for 15-20 mins, brushing with oil and any juices from the bottom of the tin regularly, and turning halfway through cooking. Once cooked, remove from the oven and rest for 5 mins.  \nCut through each pair of skewers to make four kebabs and serve in the warm bread, with lettuce, tomato, red onion, lemon wedges and tzatziki.\n\nImported from: https://www.bbcgoodfood.com/recipes/chicken-gyros	0		0	t	\N	1	\N	'-10':98B '-2':333B '-20':164B,400B '-3':347B '-8':385B '/recipes/chicken-gyros':460B '1':15B,68B,127B,332B '15':163B,399B '150ml':76B '2':69B,80B,241B,346B '3':37B '4':213B '48':42B '5':106B,384B,429B '6':268B '8':97B 'across':220B 'add':9B,75B 'along':13B,187B 'altern':378B 'anoth':252B,345B 'appear':327B 'asid':286B 'barbecu':382B 'black':21B 'bottom':369B,410B 'bowl':7B,61B,113B 'bread':312B,353B,365B,446B 'brush':310B,402B 'bubbl':325B 'chicken':3B,230B,255B,377B,391B 'chill':33B,193B 'chop':180B 'circl':145B 'clean':108B 'cling':121B,156B 'coat':30B 'combin':85B,182B 'continu':349B 'cook':343B,355B,375B,379B,397B,419B,421B 'cover':31B,118B,151B 'cucumb':172B 'cut':431B 'divid':135B 'doubl':132B 'dough':88B,116B,137B 'eat':55B 'either':249B 'enough':217B 'ensur':25B 'equal':140B 'film':122B,157B 'find':212B 'fine':179B 'fingertip':74B 'finish':289B 'fit':267B 'flip':340B 'flour':64B 'foil':210B,359B 'four':139B,439B 'fri':295B 'fridg':233B 'gap':261B 'gentl':315B 'go':362B 'golden':339B 'grill':200B,395B 'halfway':417B 'halv':170B 'heat':198B,292B,308B 'high':307B 'highest':203B 'hot':394B 'hour':50B 'hr':128B 'hrs':38B,43B 'import':456B 'ingredi':12B,186B 'juic':407B 'kebab':440B 'keep':363B 'knead':95B 'larg':6B,294B 'least':36B 'leav':123B,159B,258B 'lemon':452B 'lengthway':173B 'lettuc':448B 'lift':316B 'light':110B 'line':205B 'littl':225B 'long':216B 'loos':119B 'lukewarm':77B 'make':56B,167B,438B 'marinad':11B 'medium':306B 'medium-high':305B 'metal':214B 'min':99B,107B,165B,334B,348B,386B,401B,430B 'mix':23B,62B 'mixer':104B 'near':131B 'occasion':388B 'oil':83B,111B,155B,314B,404B 'oliv':82B 'one':235B,317B 'onion':451B 'onto':90B 'oven':372B,425B 'pair':272B,434B 'pan':296B,320B 'pepper':22B 'piec':141B,253B,264B 'pinch':190B 'pitta':58B,291B 'plenti':19B 'posit':275B 'put':389B 'readi':195B 'red':450B 'regular':414B 'remain':185B 'remov':228B,422B 'rest':427B 'return':114B 'rise':125B,161B 'roast':207B,282B 'roll':142B 'salt':17B,71B,192B 'scoop':175B 'seed':178B 'serv':197B,442B 'set':204B,285B 'sheet':153B 'side':250B 'sit':219B 'size':134B 'sizzl':323B 'skewer':215B,242B,247B,274B,277B,436B 'slight':260B 'space':226B 'sugar':66B 'surfac':93B,330B 'tabletop':103B 'take':234B 'thigh':27B,236B,269B 'thin':147B 'thread':238B,251B 'time':47B 'tin':208B,283B,413B 'tip':1B,89B 'tomato':449B 'top':222B,257B,279B 'tsp':16B,70B,81B 'turn':387B,416B 'two':298B 'tzatziki':169B,455B 'underneath':227B 'undersid':337B 'use':101B 'want':53B 'warm':366B,445B 'water':78B 'wedg':453B 'well':24B,29B 'work':92B 'wrap':356B 'www.bbcgoodfood.com':459B 'www.bbcgoodfood.com/recipes/chicken-gyros':458B 'yeast':65B	t
52	Add the risotto rice and stir continuously for a few minutes to toast the rice and coat each grain in oil.	3	Step 4	0	f	\N	1	\N	'add':1B 'coat':17B 'continu':7B 'grain':19B 'minut':11B 'oil':21B 'rice':4B,15B 'risotto':3B 'stir':6B 'toast':13B	t
8	Heat the oven to 200C/180C fan/gas 6. Tip the squash and garlic into a large roasting tin or dish (you can use the same one to assemble the lasagne to save on washing-up – ours was 35 x 40cm and 5cm deep). Tear over 4-5 sage leaves, drizzle with the oil and season well, then toss to coat. Roast for 40-50 mins, moving the squash around once or twice, until soft and caramelised. Squeeze the garlic from the skins and mash with the squash, leaving a few chunky bits for texture.  \nMeanwhile, make the white sauce. Melt the butter in a large saucepan, and stir in the flour to make a sandy paste. Splash a little milk into the pan, stirring continuously to prevent lumps. Keep adding more milk, a little at a time, until the paste thins to a smooth, creamy sauce and the milk has all been used. Simmer for 1 min more. Stir in the mascarpone and half the parmesan. Season well and grate in a generous amount of nutmeg.  \nTip the spinach into a colander and pour over a kettleful of boiling water to wilt (do this in batches). Once cool enough to handle, squeeze the spinach over the colander to remove the water, then season and roughly chop.  \nRemove half of the crushed garlicky squash from the roasting tin and set aside on a plate. Spread the remaining squash out over the base of the tin or dish you intend to serve the lasagne in. Ladle over about a quarter of the sauce, then top with a single layer of lasagne sheets, snapping them to fill any gaps. Make an even layer of spinach on top of the pasta, and top with another quarter of the sauce, more pasta, squash, sauce, pasta and finally the remaining white sauce.  \nScatter over the remaining parmesan, the mozzarella and pine nuts. If the oven is off, heat to 200C/180C fan/gas 6 and cook the lasagne for 30 mins. Rub a little extra oil over 5 or 6 sage leaves, place them on top of the lasagne and return to the oven for another 15-20 mins until golden and bubbling. Leave to cool for 5 mins before serving.\n\nImported from: https://www.bbcgoodfood.com/recipes/caramelised-squash-spinach-lasagne	0		0	t	\N	1	\N	'-20':360B '-5':47B '-50':64B '/recipes/caramelised-squash-spinach-lasagne':378B '1':156B '15':359B '200c/180c':5B,324B '30':332B '35':38B '4':46B '40':63B '40cm':40B '5':340B,370B '5cm':42B '6':7B,326B,342B 'ad':130B 'amount':174B 'anoth':291B,358B 'around':69B 'asid':230B 'assembl':27B 'base':241B 'batch':196B 'bit':92B 'boil':189B 'bubbl':365B 'butter':102B 'caramelis':76B 'chop':216B 'chunki':91B 'coat':60B 'coland':182B,207B 'continu':125B 'cook':328B 'cool':198B,368B 'creami':145B 'crush':221B 'deep':43B 'dish':19B,246B 'drizzl':50B 'enough':199B 'even':279B 'extra':337B 'fan/gas':6B,325B 'fill':274B 'final':302B 'flour':111B 'gap':276B 'garlic':12B,79B 'garlicki':222B 'generous':173B 'golden':363B 'grate':170B 'half':164B,218B 'handl':201B 'heat':1B,322B 'import':374B 'intend':248B 'keep':129B 'kettl':187B 'ladl':254B 'larg':15B,105B 'lasagn':29B,252B,269B,330B,351B 'layer':267B,280B 'leav':49B,88B,344B,366B 'littl':119B,134B,336B 'lump':128B 'make':96B,113B,277B 'mascarpon':162B 'mash':84B 'meanwhil':95B 'melt':100B 'milk':120B,132B,149B 'min':65B,157B,333B,361B,371B 'move':66B 'mozzarella':313B 'nut':316B 'nutmeg':176B 'oil':53B,338B 'one':25B 'oven':3B,319B,356B 'pan':123B 'parmesan':166B,311B 'past':116B,140B 'pasta':287B,297B,300B 'pine':315B 'place':345B 'plate':233B 'pour':184B 'prevent':127B 'quarter':258B,292B 'remain':236B,304B,310B 'remov':209B,217B 'return':353B 'roast':16B,61B,226B 'rough':215B 'rub':334B 'sage':48B,343B 'sandi':115B 'sauc':99B,146B,261B,295B,299B,306B 'saucepan':106B 'save':31B 'scatter':307B 'season':55B,167B,213B 'serv':250B,373B 'set':229B 'sheet':270B 'simmer':154B 'singl':266B 'skin':82B 'smooth':144B 'snap':271B 'soft':74B 'spinach':179B,204B,282B 'splash':117B 'spread':234B 'squash':10B,68B,87B,223B,237B,298B 'squeez':77B,202B 'stir':108B,124B,159B 'tear':44B 'textur':94B 'thin':141B 'time':137B 'tin':17B,227B,244B 'tip':8B,177B 'top':263B,284B,289B,348B 'toss':58B 'twice':72B 'use':22B,153B 'wash':34B 'washing-up':33B 'water':190B,211B 'well':56B,168B 'white':98B,305B 'wilt':192B 'www.bbcgoodfood.com':377B 'www.bbcgoodfood.com/recipes/caramelised-squash-spinach-lasagne':376B 'x':39B	t
53	Add the stock one ladle at a time until each ladleful has been absorbed by the rice, repeating the process until all the stock has been used  (15-18 mins).	4	Step 5	0	f	\N	1	\N	'-18':29B '15':28B 'absorb':14B 'add':1B 'ladl':5B,11B 'min':30B 'one':4B 'process':20B 'repeat':18B 'rice':17B 'stock':3B,24B 'time':8B 'use':27B	t
84	Bring a large saucepan of salted water to the boil, then add the pasta and cook according to the packet instructions.\n\nWhile the pasta cooks, heat a frying pan until hot then add half of the rapeseed oil and the salmon and fry over a high heat for 2 minutes on each side until golden brown and there's a little resistance when it's pressed lightly. Transfer the salmon to a plate and leave to rest - it will continue to cook while you cook the veg.\n\nWipe the pan, return to the heat, then add the remaining oil and shallots. Fry over a medium heat for a couple of minutes until just softening, then add the grated courgettes, increase the heat to high and fry for a further few minutes until the juices have evaporated, stirring occasionally.\n\nStir in the frozen peas and cook for 1 minute to defrost the peas. Turn the heat down to low and stir in the creme fraiche and lemon zest and juice, being careful not to overheat the mixture as you don't want it to curdle.\n\nDrain the pasta and return it to the pan, reserving a little of the cooking water (about 3 tablespoons) in case you need to loosen the sauce. Add the veg sauce to the pasta and toss well, adding the reserved pasta water if you think it needs it. Flake the salmon into the mixture and toss gently to mix.\n\nServe immediately with the parmesan sprinkled over and a little black pepper.	0		0	f	\N	1	\N	'1':147B '2':49B '3':202B 'accord':17B 'ad':222B 'add':12B,33B,96B,116B,212B 'black':254B 'boil':10B 'bring':1B 'brown':56B 'care':171B 'case':205B 'continu':80B 'cook':16B,25B,82B,85B,145B,199B 'coupl':109B 'courgett':119B 'creme':163B 'curdl':184B 'defrost':150B 'drain':185B 'evapor':136B 'flake':233B 'fraich':164B 'fri':28B,43B,102B,126B 'frozen':142B 'gentl':241B 'golden':55B 'grate':118B 'half':34B 'heat':26B,47B,94B,106B,122B,155B 'high':46B,124B 'hot':31B 'immedi':245B 'increas':120B 'instruct':21B 'juic':134B,169B 'larg':3B 'leav':75B 'lemon':166B 'light':67B 'littl':61B,196B,253B 'loosen':209B 'low':158B 'medium':105B 'minut':50B,111B,131B,148B 'mix':243B 'mixtur':176B,238B 'need':207B,231B 'occasion':138B 'oil':38B,99B 'overheat':174B 'packet':20B 'pan':29B,90B,193B 'parmesan':248B 'pasta':14B,24B,187B,218B,225B 'pea':143B,152B 'pepper':255B 'plate':73B 'press':66B 'rapese':37B 'remain':98B 'reserv':194B,224B 'resist':62B 'rest':77B 'return':91B,189B 'salmon':41B,70B,235B 'salt':6B 'sauc':211B,215B 'saucepan':4B 'serv':244B 'shallot':101B 'side':53B 'soften':114B 'sprinkl':249B 'stir':137B,139B,160B 'tablespoon':203B 'think':229B 'toss':220B,240B 'transfer':68B 'turn':153B 'veg':87B,214B 'want':181B 'water':7B,200B,226B 'well':221B 'wipe':88B 'zest':167B	t
4	Put the vegetable oil in a large heavy-based saucepan and set over a medium-high heat. When hot, add the cumin seeds and green chilli and fry until the cumin seeds turn deep golden brown and become fragrant. Turn the heat down to low and add the cubed potato, cooking gently for 8 minutes until it starts to soften at the edges.   \n\nAdd the cauliflower florets, ground turmeric, chilli powder, salt and sugar and give everything a good mix together until the cauliflower is fully coated with the spices.  \n\nCover with a lid and cook gently for 15-20 minutes, adding a splash of water only if absolutely necessary and stirring occasionally, until the cauliflower is tender and cooked through. Stir through the chopped coriander leaves, then serve.\n\nImported from: https://thehappyfoodie.co.uk/recipes/aloo-ghobi/	0		0	t	\N	1	\N	'-20':102B '/recipes/aloo-ghobi/':136B '15':101B '8':56B 'absolut':111B 'ad':104B 'add':22B,49B,66B 'base':10B 'becom':40B 'brown':38B 'cauliflow':68B,86B,118B 'chilli':28B,72B 'chop':127B 'coat':89B 'cook':53B,98B,122B 'coriand':128B 'cover':93B 'cube':51B 'cumin':24B,33B 'deep':36B 'edg':65B 'everyth':79B 'floret':69B 'fragrant':41B 'fri':30B 'fulli':88B 'gentl':54B,99B 'give':78B 'golden':37B 'good':81B 'green':27B 'ground':70B 'heat':19B,44B 'heavi':9B 'heavy-bas':8B 'high':18B 'hot':21B 'import':132B 'larg':7B 'leav':129B 'lid':96B 'low':47B 'medium':17B 'medium-high':16B 'minut':57B,103B 'mix':82B 'necessari':112B 'occasion':115B 'oil':4B 'potato':52B 'powder':73B 'put':1B 'salt':74B 'saucepan':11B 'seed':25B,34B 'serv':131B 'set':13B 'soften':62B 'spice':92B 'splash':106B 'start':60B 'stir':114B,124B 'sugar':76B 'tender':120B 'thehappyfoodie.co.uk':135B 'thehappyfoodie.co.uk/recipes/aloo-ghobi/':134B 'togeth':83B 'turmer':71B 'turn':35B,42B 'veget':3B 'water':108B	t
54	After around 10 minutes, add the peas and asparagu and stir for another 2 minutes. Add the cream cheese, a handful of parsley and the lemon juice.	5	Step 6	0	f	\N	1	\N	'10':3B '2':14B 'add':5B,16B 'anoth':13B 'around':2B 'asparagu':9B 'chees':19B 'cream':18B 'hand':21B 'juic':27B 'lemon':26B 'minut':4B,15B 'parsley':23B 'pea':7B 'stir':11B	t
5	For the marinade, peel and crush the garlic into a shallow bowl. Peel and finely grate in the ginger, followed by the zest of half the lime.  \nNext, add the soy, juice from half the lime, the honey and oil and mix together well.  \nPreheat the grill to medium and line a baking tray with tin foil.  \nCheck that there aren’t any stray bones lurking in the salmon fillets, then cut them up into 2.5cm cubes. Toss them in the marinade and leave for around 10 minutes to absorb the flavour.  \nThread the salmon onto 2 large or 4 small skewers (soak them first, if wooden), but don’t push the pieces too tightly together, then place onto the tray.  \nGrill for around 8 to 10 minutes, or until beautifully glazed and cooked through, turning regularly and brushing with leftover marinade.  \nToast the sesame seeds (if using) in a dry non-stick frying pan until golden, then tip onto a plate and leave to cool.  \nOnce cooked, transfer the skewers to a plate and sprinkle with the toasted same seeds (if using), dunking the cubes of salmon in any that escape onto the plate.  \nCut the remaining lime into wedges for squeezing over. Delicious served with plenty of greens and brown rice or noodles.\n\nImported from: https://www.jamieoliver.com/recipes/fish-recipes/jools-asian-style-salmon/	0		0	t	\N	1	\N	'/recipes/fish-recipes/jools-asian-style-salmon/':222B '10':88B,128B '2':98B '2.5':76B '4':101B '8':126B 'absorb':91B 'add':29B 'aren':61B 'around':87B,125B 'bake':53B 'beauti':132B 'bone':65B 'bowl':12B 'brown':214B 'brush':140B 'check':58B 'cm':77B 'cook':135B,170B 'cool':168B 'crush':6B 'cube':78B,188B 'cut':72B,198B 'delici':207B 'dri':152B 'dunk':186B 'escap':194B 'fillet':70B 'fine':15B 'first':106B 'flavour':93B 'foil':57B 'follow':20B 'fri':156B 'garlic':8B 'ginger':19B 'glaze':133B 'golden':159B 'grate':16B 'green':212B 'grill':47B,123B 'half':25B,34B 'honey':38B 'import':218B 'juic':32B 'larg':99B 'leav':85B,166B 'leftov':142B 'lime':27B,36B,201B 'line':51B 'lurk':66B 'marinad':3B,83B,143B 'medium':49B 'minut':89B,129B 'mix':42B 'next':28B 'non':154B 'non-stick':153B 'noodl':217B 'oil':40B 'onto':97B,120B,162B,195B 'pan':157B 'peel':4B,13B 'piec':114B 'place':119B 'plate':164B,176B,197B 'plenti':210B 'preheat':45B 'push':112B 'regular':138B 'remain':200B 'rice':215B 'salmon':69B,96B,190B 'seed':147B,183B 'serv':208B 'sesam':146B 'shallow':11B 'skewer':103B,173B 'small':102B 'soak':104B 'soy':31B 'sprinkl':178B 'squeez':205B 'stick':155B 'stray':64B 'thread':94B 'tight':116B 'tin':56B 'tip':161B 'toast':144B,181B 'togeth':43B,117B 'toss':79B 'transfer':171B 'tray':54B,122B 'turn':137B 'use':149B,185B 'wedg':203B 'well':44B 'wooden':108B 'www.jamieoliver.com':221B 'www.jamieoliver.com/recipes/fish-recipes/jools-asian-style-salmon/':220B 'zest':23B	t
98	Gently cook the onion, carrots and celery in the oil in a large saucepan for 20 mins, until soft. Splash in water if they stick. Add the sugar, garlic, purée, herbs and courgettes and cook for 4-5 mins on a medium heat until they brown a little.  \n\nPour in the beans, tomatoes and stock, then simmer for 20 mins. \n\nIf you’re freezing it, cool and do so now (freeze for up to three months). If not, add half the Parmesan and the pasta and simmer for 6-8 mins until pasta cooked. Sprinkle with basil and remaining Parmesan to serve. \n\nIf frozen, defrost then re-heat before adding pasta and cheese and continuing as above.	0		0	t	\N	1	\N	'-5':38B '-8':90B '20':16B,59B '4':37B '6':89B 'ad':111B 'add':26B,79B 'basil':97B 'bean':52B 'brown':46B 'carrot':5B 'celeri':7B 'chees':114B 'continu':116B 'cook':2B,35B,94B 'cool':66B 'courgett':33B 'defrost':105B 'freez':64B,71B 'frozen':104B 'garlic':29B 'gentl':1B 'half':80B 'heat':43B,109B 'herb':31B 'larg':13B 'littl':48B 'medium':42B 'min':17B,39B,60B,91B 'month':76B 'oil':10B 'onion':4B 'parmesan':82B,100B 'pasta':85B,93B,112B 'pour':49B 'pure':30B 're':63B,108B 're-heat':107B 'remain':99B 'saucepan':14B 'serv':102B 'simmer':57B,87B 'soft':19B 'splash':20B 'sprinkl':95B 'stick':25B 'stock':55B 'sugar':28B 'three':75B 'tomato':53B 'water':22B	t
55	Divide between serving dishes and flake the salmon over each, then finish with the remaining parsley and lemon zest	6	Step 7	0	f	\N	1	\N	'dish':4B 'divid':1B 'finish':12B 'flake':6B 'lemon':18B 'parsley':16B 'remain':15B 'salmon':8B 'serv':3B 'zest':19B	t
62	Add the garlic, ginger, chilli, curry powder, cumin and ground coriander, stir through and fry for a further minute, then add the chicken pieces and fry for 3-4 minutes until just beginning to brown, stirring occasionally.	1	Step 2	0	f	\N	1	\N	'-4':29B '3':28B 'add':1B,21B 'begin':33B 'brown':35B 'chicken':23B 'chilli':5B 'coriand':11B 'cumin':8B 'curri':6B 'fri':15B,26B 'garlic':3B 'ginger':4B 'ground':10B 'minut':19B,30B 'occasion':37B 'piec':24B 'powder':7B 'stir':12B,36B	t
63	Add the tomatoes and stir-fry for another minute, then add the rice and stir through. Add the crumbled stock cube and 600ml of cold water. Stir well and bring to the boil, then reduce the heat, cover with a lid and simmer for 15 minutes.	2	Step 3	0	f	\N	1	\N	'15':46B '600ml':24B 'add':1B,12B,18B 'anoth':9B 'boil':34B 'bring':31B 'cold':26B 'cover':39B 'crumbl':20B 'cube':22B 'fri':7B 'heat':38B 'lid':42B 'minut':10B,47B 'reduc':36B 'rice':14B 'simmer':44B 'stir':6B,16B,28B 'stir-fri':5B 'stock':21B 'tomato':3B 'water':27B 'well':29B	t
7	1. Heat the oil and 15g butter in a large frying pan or sauté pan over a medium-high heat. Add the squash, cover with a lid and cook, stirring regularly, for 10 minutes until the squash is tender and turning golden.  \n2. Meanwhile, cook the pasta in a large pan of salted water for 1 minute less than the pack instructions. Before draining, scoop out a mugful of the cooking water and set aside.  \n3. Reduce the heat under the squash to medium and remove the lid. Add the shallots and garlic; season. Fry, stirring often, for 5 minutes until soft. In a separate pan, cook the remaining 45g butter over a high heat, swirling occasionally, until nutty and golden. Add the sage and remove from the heat.  \n4. Tip the cooked pasta into the pan with the squash and add the brown butter, lemon juice and a glug of the cooking water. Stir in the cheese and toss to coat over the heat for 1 minute, adding more cooking water to loosen the sauce if needed (it should be glossy and just coat the pasta). Divide between plates and serve with extra cheese on top.\n\nImported from: https://www.waitrose.com/home/recipes/recipe_directory/b/butternut-squashfettuccine.html	0		0	t	\N	1	\N	'/home/recipes/recipe_directory/b/butternut-squashfettuccine.html':203B '1':1B,57B,168B '10':34B '15g':6B '2':44B '3':77B '4':131B '45g':111B '5':100B 'ad':170B 'add':22B,90B,123B,143B 'asid':76B 'brown':145B 'butter':7B,112B,146B 'chees':159B,196B 'coat':163B,186B 'cook':30B,46B,72B,108B,134B,154B,172B 'cover':25B 'divid':189B 'drain':65B 'extra':195B 'fri':11B,96B 'garlic':94B 'glossi':183B 'glug':151B 'golden':43B,122B 'heat':2B,21B,80B,116B,130B,166B 'high':20B,115B 'import':199B 'instruct':63B 'juic':148B 'larg':10B,51B 'lemon':147B 'less':59B 'lid':28B,89B 'loosen':175B 'meanwhil':45B 'medium':19B,85B 'medium-high':18B 'minut':35B,58B,101B,169B 'mug':69B 'need':179B 'nutti':120B 'occasion':118B 'often':98B 'oil':4B 'pack':62B 'pan':12B,15B,52B,107B,138B 'pasta':48B,135B,188B 'plate':191B 'reduc':78B 'regular':32B 'remain':110B 'remov':87B,127B 'sage':125B 'salt':54B 'sauc':177B 'saut':14B 'scoop':66B 'season':95B 'separ':106B 'serv':193B 'set':75B 'shallot':92B 'soft':103B 'squash':24B,38B,83B,141B 'stir':31B,97B,156B 'swirl':117B 'tender':40B 'tip':132B 'top':198B 'toss':161B 'turn':42B 'water':55B,73B,155B,173B 'www.waitrose.com':202B 'www.waitrose.com/home/recipes/recipe_directory/b/butternut-squashfettuccine.html':201B	t
64	Lift the lid and stir, then scatter the green beans over the top, cover and cook for a further 3-4 minutes until the liquid has been absorbed and the rice and beans are tender.	3	Step 4	0	f	\N	1	\N	'-4':21B '3':20B 'absorb':28B 'bean':10B,33B 'cook':16B 'cover':14B 'green':9B 'lid':3B 'lift':1B 'liquid':25B 'minut':22B 'rice':31B 'scatter':7B 'stir':5B 'tender':35B 'top':13B	t
10	Prepare your vegetables. Chop 1 large onion into small dice, about 5mm square. The easiest way to do this is to cut the onion in half from root to tip, peel it and slice each half into thick matchsticks lengthways, not quite cutting all the way to the root end so they are still held together. Slice across the matchsticks into neat dice.  \nCut 1 red pepper in half lengthways, remove stalk and wash the seeds away, then chop. Peel and finely chop 2 garlic cloves.  \nStart cooking. Put your pan on the hob over a medium heat. Add 1 tbsp oil and leave it for 1-2 minutes until hot (a little longer for an electric hob).  \nAdd the onion and cook, stirring fairly frequently, for about 5 minutes, or until the onion is soft, squidgy and slightly translucent.  \nTip in the garlic, red pepper, 1 heaped tsp hot chilli powder or 1 level tbsp mild chilli powder, 1 tsp paprika and 1 tsp ground cumin.  \nGive it a good stir, then leave it to cook for another 5 minutes, stirring occasionally.  \nBrown 500g lean minced beef. Turn the heat up a bit, add the meat to the pan and break it up with your spoon or spatula. The mix should sizzle a bit when you add the mince.  \nKeep stirring and prodding for at least 5 minutes, until all the mince is in uniform, mince-sized lumps and there are no more pink bits. Make sure you keep the heat hot enough for the meat to fry and become brown, rather than just stew.  \nMake the sauce. Crumble 1 beef stock cube into 300ml hot water. Pour this into the pan with the mince mixture.  \nAdd a 400g can of chopped tomatoes. Tip in ½ tsp dried marjoram, 1 tsp sugar and add a good shake of salt and pepper. Squirt in about 2 tbsp tomato purée and stir the sauce well.  \nSimmer it gently. Bring the whole thing to the boil, give it a good stir and put a lid on the pan. Turn down the heat until it is gently bubbling and leave it for 20 minutes.  \nCheck on the pan occasionally to stir it and make sure the sauce doesn’t catch on the bottom of the pan or isn’t drying out. If it is, add a couple of tablespoons of water and make sure that the heat really is low enough. After simmering gently, the saucy mince mixture should look thick, moist and juicy.  \nDrain and rinse a 410g can of red kidney beans in a sieve and stir them into the chilli pot. Bring to the boil again, and gently bubble without the lid for another 10 minutes, adding a little more water if it looks too dry.  \nTaste a bit of the chilli and season. It will probably take a lot more seasoning than you think.  \nNow replace the lid, turn off the heat and leave your chilli to stand for 10 minutes before serving. This is really important as it allows the flavours to mingle.  \nServe with soured cream and plain boiled long grain rice.\n\nImported from: https://www.bbcgoodfood.com/recipes/chilli-con-carne-recipe	0		0	t	\N	1	\N	'-2':108B '/recipes/chilli-con-carne-recipe':531B '1':5B,65B,100B,107B,147B,154B,160B,164B,272B,302B '1/2':298B '10':456B,502B '2':84B,317B '20':361B '300ml':277B '400g':291B '410g':427B '5':129B,180B,228B '500g':185B '5mm':12B 'across':58B 'ad':458B 'add':99B,119B,195B,218B,289B,306B,393B 'allow':512B 'anoth':179B,455B 'away':77B 'bean':432B 'becom':262B 'beef':188B,273B 'bit':194B,215B,247B,470B 'boil':335B,446B,523B 'bottom':381B 'break':202B 'bring':329B,443B 'brown':184B,263B 'bubbl':356B,450B 'catch':378B 'check':363B 'chilli':151B,158B,441B,473B,498B 'chop':4B,79B,83B,294B 'clove':86B 'cook':88B,123B,177B 'coupl':395B 'cream':520B 'crumbl':271B 'cube':275B 'cumin':167B 'cut':22B,43B,64B 'dice':10B,63B 'doesn':376B 'drain':423B 'dri':300B,388B,467B 'easiest':15B 'electr':117B 'end':50B 'enough':255B,409B 'fair':125B 'fine':82B 'flavour':514B 'frequent':126B 'fri':260B 'garlic':85B,144B 'gentl':328B,355B,412B,449B 'give':168B,336B 'good':171B,308B,339B 'grain':525B 'ground':166B 'half':26B,36B,69B 'heap':148B 'heat':98B,191B,253B,351B,405B,494B 'held':55B 'hob':94B,118B 'hot':111B,150B,254B,278B 'import':509B,527B 'isn':386B 'juici':422B 'keep':221B,251B 'kidney':431B 'larg':6B 'lean':186B 'least':227B 'leav':104B,174B,358B,496B 'lengthway':40B,70B 'level':155B 'lid':344B,453B,490B 'littl':113B,460B 'long':524B 'longer':114B 'look':418B,465B 'lot':481B 'low':408B 'lump':240B 'make':248B,268B,372B,401B 'marjoram':301B 'matchstick':39B,60B 'meat':197B,258B 'medium':97B 'mild':157B 'minc':187B,220B,233B,238B,287B,415B 'mince-s':237B 'mingl':516B 'minut':109B,130B,181B,229B,362B,457B,503B 'mix':211B 'mixtur':288B,416B 'moist':420B 'neat':62B 'occasion':183B,367B 'oil':102B 'onion':7B,24B,121B,134B 'pan':91B,200B,284B,347B,366B,384B 'paprika':162B 'peel':31B,80B 'pepper':67B,146B,313B 'pink':246B 'plain':522B 'pot':442B 'pour':280B 'powder':152B,159B 'prepar':1B 'probabl':478B 'prod':224B 'pure':320B 'put':89B,342B 'quit':42B 'rather':264B 'realli':406B,508B 'red':66B,145B,430B 'remov':71B 'replac':488B 'rice':526B 'rins':425B 'root':28B,49B 'salt':311B 'sauc':270B,324B,375B 'sauci':414B 'season':475B,483B 'seed':76B 'serv':505B,517B 'shake':309B 'siev':435B 'simmer':326B,411B 'size':239B 'sizzl':213B 'slice':34B,57B 'slight':139B 'small':9B 'soft':136B 'sour':519B 'spatula':209B 'spoon':207B 'squar':13B 'squidgi':137B 'squirt':314B 'stalk':72B 'stand':500B 'start':87B 'stew':267B 'still':54B 'stir':124B,172B,182B,222B,322B,340B,369B,437B 'stock':274B 'sugar':304B 'sure':249B,373B,402B 'tablespoon':397B 'take':479B 'tast':468B 'tbsp':101B,156B,318B 'thick':38B,419B 'thing':332B 'think':486B 'tip':30B,141B,296B 'togeth':56B 'tomato':295B,319B 'transluc':140B 'tsp':149B,161B,165B,299B,303B 'turn':189B,348B,491B 'uniform':236B 'veget':3B 'wash':74B 'water':279B,399B,462B 'way':16B,46B 'well':325B 'whole':331B 'without':451B 'www.bbcgoodfood.com':530B 'www.bbcgoodfood.com/recipes/chilli-con-carne-recipe':529B	t
9	Preheat your oven to 220°C.Halve, peel and thinly slice the onion into half moons. Halve, then remove the core from the green pepper and thinly slice. Cut the chorizo stick in half lengthways, remove the skin and slice into ½cm wide half moons. Drain and rinse the black beans in a sieve. Finely chop the parsley (stalks and all). Grate the lime zest.  \nHeat a glug of oil in a frying pan on medium-high heat. Add the chorizo, cook for 5 mins. Remove from the pan, set aside. Add the onion and pepper to the pan. Cook until soft, 5 mins. Stir in the tomato purée and fajita seasoning (use less if you don't like spice), cook for 1 minute more. Add the black beans, chorizo, water (amount specified in the ingredient list) and pop on a lid. Reduce the heat to medium, cook for 5 mins.  \nOnce the 5 mins are up, remove the lid from your pan. Simmer until the liquid has almost evaporated, 3-4 mins, then remove from the heat. Roughly mash the mixture with a potato masher. Stir in the parsley and lime zest. Taste and season with salt and black pepper if needed. Lay the tortillas on a board (two per person), spoon the mixture down the centre of each, then roll them up into cylinders.  \nDrizzle a little oil over the bottom of an ovenproof dish, then lay in the tortillas. Pack them snugly side by side, with the folded edge downwards so they don't unroll. Spoon the crème fraîche over the top and then spread it out evenly. Grate the cheddar cheese and sprinkle on top, then bake on the top shelf of your oven until golden brown, 15-18 mins.  \nMeanwhile, squeeze the lime juice into a large bowl. Add the honey and olive oil (amount specified in ingredient list). Season with salt and black pepper. Whisk together with a fork and your dressing is made! Halve the cucumber lengthways, scrape out the seeds with a teaspoon (discard the seeds) and chop the flesh into 1cm chunks.  \nWhen the enchiladas are cooked, remove from the oven and leave to cool slightly for 2 mins. Toss the baby leaf mix and cucumber in the dressing. Serve the chorizo enchiladas on plates with the salad alongside. Enjoy!\n\nImported from: https://www.hellofresh.co.uk/recipes/enchiladas-with-black-beans-59551771c6243b447a424cc2	0		0	t	\N	1	\N	'-18':293B '-4':172B '/recipes/enchiladas-with-black-beans-59551771c6243b447a424cc2':394B '1':123B '1/2cm':41B '15':292B '1cm':350B '2':367B '220':5B '3':171B '5':84B,103B,150B,154B 'add':79B,92B,126B,304B 'almost':169B 'alongsid':388B 'amount':132B,310B 'asid':91B 'babi':371B 'bake':281B 'bean':50B,129B 'black':49B,128B,200B,319B 'board':209B 'bottom':233B 'bowl':303B 'brown':291B 'c.halve':6B 'centr':218B 'cheddar':274B 'chees':275B 'chop':55B,346B 'chorizo':30B,81B,130B,381B 'chunk':351B 'cook':82B,100B,121B,148B,356B 'cool':364B 'core':20B 'creme':261B 'cucumb':333B,375B 'cut':28B 'cylind':226B 'discard':342B 'dish':237B 'downward':253B 'drain':45B 'dress':328B,378B 'drizzl':227B 'edg':252B 'enchilada':354B,382B 'enjoy':389B 'evapor':170B 'even':271B 'fajita':111B 'fine':54B 'flesh':348B 'fold':251B 'fork':325B 'fraich':262B 'fri':72B 'glug':67B 'golden':290B 'grate':61B,272B 'green':23B 'half':14B,33B,43B 'halv':16B,331B 'heat':65B,78B,145B,178B 'high':77B 'honey':306B 'import':390B 'ingredi':136B,313B 'juic':299B 'larg':302B 'lay':204B,239B 'leaf':372B 'leav':362B 'lengthway':34B,334B 'less':114B 'lid':142B,160B 'like':119B 'lime':63B,192B,298B 'liquid':167B 'list':137B,314B 'littl':229B 'made':330B 'mash':180B 'masher':186B 'meanwhil':295B 'medium':76B,147B 'medium-high':75B 'min':85B,104B,151B,155B,173B,294B,368B 'minut':124B 'mix':373B 'mixtur':182B,215B 'moon':15B,44B 'need':203B 'oil':69B,230B,309B 'oliv':308B 'onion':12B,94B 'oven':3B,288B,360B 'ovenproof':236B 'pack':243B 'pan':73B,89B,99B,163B 'parsley':57B,190B 'peel':7B 'pepper':24B,96B,201B,320B 'per':211B 'person':212B 'plate':384B 'pop':139B 'potato':185B 'preheat':1B 'pure':109B 'reduc':143B 'remov':18B,35B,86B,158B,175B,357B 'rins':47B 'roll':222B 'rough':179B 'salad':387B 'salt':198B,317B 'scrape':335B 'season':112B,196B,315B 'seed':338B,344B 'serv':379B 'set':90B 'shelf':285B 'side':246B,248B 'siev':53B 'simmer':164B 'skin':37B 'slice':10B,27B,39B 'slight':365B 'snug':245B 'soft':102B 'specifi':133B,311B 'spice':120B 'spoon':213B,259B 'spread':268B 'sprinkl':277B 'squeez':296B 'stalk':58B 'stick':31B 'stir':105B,187B 'tast':194B 'teaspoon':341B 'thin':9B,26B 'togeth':322B 'tomato':108B 'top':265B,279B,284B 'tortilla':206B,242B 'toss':369B 'two':210B 'unrol':258B 'use':113B 'water':131B 'whisk':321B 'wide':42B 'www.hellofresh.co.uk':393B 'www.hellofresh.co.uk/recipes/enchiladas-with-black-beans-59551771c6243b447a424cc2':392B 'zest':64B,193B	t
16	1. Preheat the oven to 200ºC, gas mark 6, and lightly grease a large ovenproof dish (about 2 litres in volume). Put the cauliflower and any tender leaves in a large saucepan. Cover with cold water, add a pinch of salt and set over a high heat. Once at a rolling boil, add the pasta. Stir for 1 minute then drain over a large bowl, reserving 250ml of the cooking water. Arrange the penne and cauliflower evenly in the dish.  \n2. For the cheese sauce, return the pan to a medium heat with the 25g butter. Once foaming, add the flour and cook for 2-3 minutes, stirring regularly. Stir in the warm milk, a splash at a time, ensuring everything is incorporated before adding more. Once all the milk is combined, slowly stir in the reserved cauliflower water until you have a smooth sauce. Stir in the mustard and simmer for 1 minute.  \n3. Take the pan off the heat and stir in ¾ of the cheddar until you have a rich, smooth sauce; season. Spoon the sauce over the cauliflower and penne, stirring together until evenly coated. Sprinkle the remaining cheese over the top. Bake for 20 minutes until bubbling and golden. Stand for 5 minutes and serve with a green salad, if liked.\n\nImported from: https://www.waitrose.com/home/recipes/recipe_directory/t/truffle-mac-n-cheesewithcauliflower.html	0		0	t	\N	1	\N	'-3':106B '/home/recipes/recipe_directory/t/truffle-mac-n-cheesewithcauliflower.html':221B '1':1B,58B,153B '2':18B,81B,105B '20':199B '200ºc':6B '250ml':67B '25g':95B '3':155B '3/4':165B '5':207B '6':9B 'ad':125B 'add':37B,53B,99B 'arrang':72B 'bake':197B 'boil':52B 'bowl':65B 'bubbl':202B 'butter':96B 'cauliflow':24B,76B,138B,182B 'cheddar':168B 'chees':84B,193B 'coat':189B 'cold':35B 'combin':132B 'cook':70B,103B 'cover':33B 'dish':16B,80B 'drain':61B 'ensur':120B 'even':77B,188B 'everyth':121B 'flour':101B 'foam':98B 'gas':7B 'golden':204B 'greas':12B 'green':213B 'heat':47B,92B,161B 'high':46B 'import':217B 'incorpor':123B 'larg':14B,31B,64B 'leav':28B 'light':11B 'like':216B 'litr':19B 'mark':8B 'medium':91B 'milk':114B,130B 'minut':59B,107B,154B,200B,208B 'mustard':149B 'oven':4B 'ovenproof':15B 'pan':88B,158B 'pasta':55B 'penn':74B,184B 'pinch':39B 'preheat':2B 'put':22B 'regular':109B 'remain':192B 'reserv':66B,137B 'return':86B 'rich':173B 'roll':51B 'salad':214B 'salt':41B 'sauc':85B,145B,175B,179B 'saucepan':32B 'season':176B 'serv':210B 'set':43B 'simmer':151B 'slowli':133B 'smooth':144B,174B 'splash':116B 'spoon':177B 'sprinkl':190B 'stand':205B 'stir':56B,108B,110B,134B,146B,163B,185B 'take':156B 'tender':27B 'time':119B 'togeth':186B 'top':196B 'volum':21B 'warm':113B 'water':36B,71B,139B 'www.waitrose.com':220B 'www.waitrose.com/home/recipes/recipe_directory/t/truffle-mac-n-cheesewithcauliflower.html':219B	t
21	Heat the oil in a large high-sided frying pan over a medium heat. Squeeze the sausages straight from their skins into the pan, then use the back of a wooden spoon to break the meat up. Sprinkle in the chilli flakes and fennel seeds, if using, then fry until the sausagemeat is crisp around the edges. Remove from the pan with a slotted spoon.  \nTip the gnocchi into the pan, fry for a minute or so, then pour in the chicken stock. Once bubbling, cover the pan with a lid and cook for 3 mins, then stir in the kale. Cook for 2 mins more or until the gnocchi is tender and the kale has wilted. Stir in the parmesan, then season with black pepper and scatter the crisp sausagemeat over the top.\n\nImported from: https://www.bbcgoodfood.com/recipes/sausage-kale-gnocchi-one-pot	0		0	t	\N	1	\N	'/recipes/sausage-kale-gnocchi-one-pot':140B '2':105B '3':96B 'around':56B 'back':29B 'black':126B 'break':35B 'bubbl':86B 'chicken':83B 'chilli':42B 'cook':94B,103B 'cover':87B 'crisp':55B,131B 'edg':58B 'fennel':45B 'flake':43B 'fri':10B,50B,73B 'gnocchi':69B,111B 'heat':1B,15B 'high':8B 'high-sid':7B 'import':136B 'kale':102B,116B 'larg':6B 'lid':92B 'meat':37B 'medium':14B 'min':97B,106B 'minut':76B 'oil':3B 'pan':11B,25B,62B,72B,89B 'parmesan':122B 'pepper':127B 'pour':80B 'remov':59B 'sausag':18B 'sausagemeat':53B,132B 'scatter':129B 'season':124B 'seed':46B 'side':9B 'skin':22B 'slot':65B 'spoon':33B,66B 'sprinkl':39B 'squeez':16B 'stir':99B,119B 'stock':84B 'straight':19B 'tender':113B 'tip':67B 'top':135B 'use':27B,48B 'wilt':118B 'wooden':32B 'www.bbcgoodfood.com':139B 'www.bbcgoodfood.com/recipes/sausage-kale-gnocchi-one-pot':138B	t
11	Heat a large, deep-sided casserole or frying pan over a high heat, add the chorizo and cook for 2–3 minutes.  \nAdd the garlic, peppers and button mushrooms and cook for another 2–3 minutes, stirring occasionally.  \nAdd the chopped tomatoes, tomato purée, chilli flakes and red wine vinegar. Stir in the spaghetti, pour in the boiling water and stir well.  \nBring to the boil, reduce the heat, cover with a lid and simmer for 12–15 minutes, or until the pasta is al dente, and the liquid has reduced to a thick sauce. Stir the mixture occasionally to make sure that the pasta is under the liquid and not sticking together.  \nStir in three quarters of the basil and plenty of black pepper  \nServe with the Parmesan and remaining basil.\n\nImported from: https://www.bbc.co.uk/food/recipes/one_pot_chorizo_and_15611	0		0	t	\N	1	\N	'-15':79B '-3':22B,36B '/food/recipes/one_pot_chorizo_and_15611':138B '12':78B '2':21B,35B 'add':15B,24B,40B 'al':86B 'anoth':34B 'basil':121B,133B 'black':125B 'boil':59B,67B 'bring':64B 'button':29B 'casserol':7B 'chilli':46B 'chop':42B 'chorizo':17B 'cook':19B,32B 'cover':71B 'deep':5B 'deep-sid':4B 'dent':87B 'flake':47B 'fri':9B 'garlic':26B 'heat':1B,14B,70B 'high':13B 'import':134B 'larg':3B 'lid':74B 'liquid':90B,110B 'make':102B 'minut':23B,37B,80B 'mixtur':99B 'mushroom':30B 'occasion':39B,100B 'pan':10B 'parmesan':130B 'pasta':84B,106B 'pepper':27B,126B 'plenti':123B 'pour':56B 'pure':45B 'quarter':118B 'red':49B 'reduc':68B,92B 'remain':132B 'sauc':96B 'serv':127B 'side':6B 'simmer':76B 'spaghetti':55B 'stick':113B 'stir':38B,52B,62B,97B,115B 'sure':103B 'thick':95B 'three':117B 'togeth':114B 'tomato':43B,44B 'vinegar':51B 'water':60B 'well':63B 'wine':50B 'www.bbc.co.uk':137B 'www.bbc.co.uk/food/recipes/one_pot_chorizo_and_15611':136B	t
91	Whisk the olive oil, vinegar, thyme, paprika, garlic and 2 tbsp honey with plenty of black pepper. Pour ¾ of the marinade over the chicken and chorizo, reserving the rest to glaze the skewers later. Marinate for at least 2 hrs or overnight. Whisk the leftover 1 tbsp honey into the reserved marinade.  \n\nTo make the flatbreads, mix the flour, olive oil, salt and yeast in a large bowl. Add 700ml water and knead to a rough dough. Tip onto a floured work surface and knead for 10 mins until smooth and elastic. Transfer to an oiled bowl and cover. Leave to double in size, about 1 hr. \n \nKnock the dough back and divide into 16 small balls about 140g each. Roll each out on a floured work surface until a few millimetres thick and about 20cm wide. Heat a dry frying pan on a medium high heat and cook the dough for 3-4 mins until golden underneath and large bubbles start forming. Flip and cook for 1-2 mins more until lightly golden. You can keep the flatbreads warm in a low oven or on the barbecue, wrapped in foil.  \n\nThread the chicken, chorizo and peppers onto eight large or 16 small metal skewers. Season with salt. Light a barbecue, let the flames die down and the coals turn ashy white, or heat the grill to medium high. Grill the skewers for 8-10 mins, turning every few mins until the chicken is cooked through. Use the remaining marinade to glaze the meat when turning.  \n\nWith a fork, slide the meat and peppers off the skewers on to the flatbreads. Serve sides separately for guests to assemble their own kebabs.	0		0	t	\N	1	\N	'-10':236B '-2':170B '-4':155B '1':47B,107B,169B '10':88B '140g':120B '16':116B,203B '2':10B,40B '20cm':137B '3':154B '3/4':19B '700ml':71B '8':235B 'add':70B 'ashi':222B 'assembl':279B 'back':112B 'ball':118B 'barbecu':189B,212B 'black':16B 'bowl':69B,98B 'bubbl':162B 'chicken':25B,195B,244B 'chorizo':27B,196B 'coal':220B 'cook':150B,167B,246B 'cover':100B 'die':216B 'divid':114B 'doubl':103B 'dough':78B,111B,152B 'dri':141B 'eight':200B 'elast':93B 'everi':239B 'flame':215B 'flatbread':57B,180B,272B 'flip':165B 'flour':60B,82B,127B 'foil':192B 'fork':260B 'form':164B 'fri':142B 'garlic':8B 'glaze':32B,253B 'golden':158B,175B 'grill':227B,231B 'guest':277B 'heat':139B,148B,225B 'high':147B,230B 'honey':12B,49B 'hr':108B 'hrs':41B 'kebab':282B 'keep':178B 'knead':74B,86B 'knock':109B 'larg':68B,161B,201B 'later':35B 'least':39B 'leav':101B 'leftov':46B 'let':213B 'light':174B,210B 'low':184B 'make':55B 'marin':36B 'marinad':22B,53B,251B 'meat':255B,263B 'medium':146B,229B 'metal':205B 'millimetr':133B 'min':89B,156B,171B,237B,241B 'mix':58B 'oil':4B,62B,97B 'oliv':3B,61B 'onto':80B,199B 'oven':185B 'overnight':43B 'pan':143B 'paprika':7B 'pepper':17B,198B,265B 'plenti':14B 'pour':18B 'remain':250B 'reserv':28B,52B 'rest':30B 'roll':122B 'rough':77B 'salt':63B,209B 'season':207B 'separ':275B 'serv':273B 'side':274B 'size':105B 'skewer':34B,206B,233B,268B 'slide':261B 'small':117B,204B 'smooth':91B 'start':163B 'surfac':84B,129B 'tbsp':11B,48B 'thick':134B 'thread':193B 'thyme':6B 'tip':79B 'transfer':94B 'turn':221B,238B,257B 'underneath':159B 'use':248B 'vinegar':5B 'warm':181B 'water':72B 'whisk':1B,44B 'white':223B 'wide':138B 'work':83B,128B 'wrap':190B 'yeast':65B	t
12	Heat oven to 180C/fan 160C/gas 4. Cut the lamb into 4cm chunks, then spread over the base of a large, wide casserole dish. Add the onions, oregano, cinnamon sticks, ground cinnamon and olive oil, then stir well. Bake, uncovered, for 45 mins, stirring halfway.  \nPour over the chopped tomatoes and stock, cover tightly, then return to the oven for 1½ hrs, until the lamb is very tender.  \nRemove the cinnamon sticks, then stir in the orzo. Cover again, then cook for a further 20 mins, stirring halfway through. The orzo should be cooked and the sauce thickened. Sprinkle with grated Parmesan and serve with crusty bread.\n\nImported from: https://www.bbcgoodfood.com/recipes/greek-lamb-orzo	0		0	t	\N	1	\N	'/recipes/greek-lamb-orzo':111B '11/2':60B '160c/gas':5B '180c/fan':4B '20':84B '4':6B '45':41B '4cm':11B 'add':24B 'bake':38B 'base':17B 'bread':106B 'casserol':22B 'chop':48B 'chunk':12B 'cinnamon':28B,31B,70B 'cook':80B,93B 'cover':52B,77B 'crusti':105B 'cut':7B 'dish':23B 'grate':100B 'ground':30B 'halfway':44B,87B 'heat':1B 'hrs':61B 'import':107B 'lamb':9B,64B 'larg':20B 'min':42B,85B 'oil':34B 'oliv':33B 'onion':26B 'oregano':27B 'orzo':76B,90B 'oven':2B,58B 'parmesan':101B 'pour':45B 'remov':68B 'return':55B 'sauc':96B 'serv':103B 'spread':14B 'sprinkl':98B 'stick':29B,71B 'stir':36B,43B,73B,86B 'stock':51B 'tender':67B 'thicken':97B 'tight':53B 'tomato':49B 'uncov':39B 'well':37B 'wide':21B 'www.bbcgoodfood.com':110B 'www.bbcgoodfood.com/recipes/greek-lamb-orzo':109B	t
14	For the salmon:  \nIn an 11x7-inch baking dish whisk together olive oil, lime zest, lime juice, garlic and season with salt and pepper to taste (a fair amount of each).  \nPlace salmon in baking dish, cover and allow to marinate in refrigerator 15 - 30 minutes, then flip salmon to opposite side and allow to marinate 15 - 30 minutes longer. Preheat a grill over medium-high heat during last 10 minutes of marinating.  \nBrush grill grates with oil. Place salmon on grill and grill about 3 minutes per side or until just cooked through (turn carefully as the salmon will be fragile).  \nFor the coconut rice:  \nWhile salmon is marinating prepare coconut rice. In a medium saucepan bring coconut water, coconut milk, rice and salt to a full boil.  \nCover and simmer until liquid has been absorbed (there may be just a little bit of excess liquid in center which you can drain off), about 20 minutes. Fluff with a fork, then let rest 5 minutes.  \nFor the mango avocado salsa:  \nWhile the salmon is grilling prepare salsa. In a medium bowl toss together mango, bell pepper, cilantro, red onion, avocado, lime juice, olive oil and coconut water. Season with salt and pepper to taste.  \nServe salmon warm with coconut rice top with avocado mango salsa.\n\nImported from: https://www.cookingclassy.com/grilled-lime-salmon-avocado-mango-salsa-coconut-rice/	0		0	t	\N	1	\N	'/grilled-lime-salmon-avocado-mango-salsa-coconut-rice/':223B '10':72B '11x7':7B '11x7-inch':6B '15':45B,58B '20':158B '3':88B '30':46B,59B '5':167B 'absorb':139B 'allow':40B,55B 'amount':30B 'avocado':172B,193B,216B 'bake':9B,36B 'bell':188B 'bit':146B 'boil':131B 'bowl':184B 'bring':120B 'brush':76B 'care':98B 'center':151B 'cilantro':190B 'coconut':107B,114B,121B,123B,199B,212B 'cook':95B 'cover':38B,132B 'dish':10B,37B 'drain':155B 'excess':148B 'fair':29B 'flip':49B 'fluff':160B 'fork':163B 'fragil':104B 'full':130B 'garlic':19B 'grate':78B 'grill':64B,77B,84B,86B,178B 'heat':69B 'high':68B 'import':219B 'inch':8B 'juic':18B,195B 'last':71B 'let':165B 'lime':15B,17B,194B 'liquid':136B,149B 'littl':145B 'longer':61B 'mango':171B,187B,217B 'marin':42B,57B,75B,112B 'may':141B 'medium':67B,118B,183B 'medium-high':66B 'milk':124B 'minut':47B,60B,73B,89B,159B,168B 'oil':14B,80B,197B 'oliv':13B,196B 'onion':192B 'opposit':52B 'pepper':25B,189B,205B 'per':90B 'place':33B,81B 'preheat':62B 'prepar':113B,179B 'red':191B 'refriger':44B 'rest':166B 'rice':108B,115B,125B,213B 'salmon':3B,34B,50B,82B,101B,110B,176B,209B 'salsa':173B,180B,218B 'salt':23B,127B,203B 'saucepan':119B 'season':21B,201B 'serv':208B 'side':53B,91B 'simmer':134B 'tast':27B,207B 'togeth':12B,186B 'top':214B 'toss':185B 'turn':97B 'warm':210B 'water':122B,200B 'whisk':11B 'www.cookingclassy.com':222B 'www.cookingclassy.com/grilled-lime-salmon-avocado-mango-salsa-coconut-rice/':221B 'zest':16B	t
15	Cook the rice in boiling salted water, as per pack instructions. Meanwhile, heat the oil in a large frying pan and cook the butternut squash for 2-3 mins until lightly browned. Add the onion and the curry paste and fry for 3-4 mins more.  \nPour over the stock, then cover and simmer for 15-20 mins, or until the squash is tender. Add the tomatoes and chickpeas, then gently cook for 3-4 mins, until the tomatoes slightly soften.  \nTake off the heat and stir through the yogurt and coriander. Serve with the rice and some wholemeal chapattis if you like.\n\nImported from: https://www.bbcgoodfood.com/recipes/indian-butternut-squash-curry	0		0	t	\N	1	\N	'-20':57B '-3':28B '-4':44B,75B '/recipes/indian-butternut-squash-curry':108B '15':56B '2':27B '3':43B,74B 'add':33B,65B 'boil':5B 'brown':32B 'butternut':24B 'chapatti':100B 'chickpea':69B 'cook':1B,22B,72B 'coriand':92B 'cover':52B 'curri':38B 'fri':19B,41B 'gentl':71B 'heat':13B,85B 'import':104B 'instruct':11B 'larg':18B 'light':31B 'like':103B 'meanwhil':12B 'min':29B,45B,58B,76B 'oil':15B 'onion':35B 'pack':10B 'pan':20B 'past':39B 'per':9B 'pour':47B 'rice':3B,96B 'salt':6B 'serv':93B 'simmer':54B 'slight':80B 'soften':81B 'squash':25B,62B 'stir':87B 'stock':50B 'take':82B 'tender':64B 'tomato':67B,79B 'water':7B 'wholem':99B 'www.bbcgoodfood.com':107B 'www.bbcgoodfood.com/recipes/indian-butternut-squash-curry':106B 'yogurt':90B	t
48	After around 10 minutes, add the peas and asparagu and stir for another 2 minutes. Add the cream cheese, a handful of parsley and the lemon juice.	5	Step 6	0	f	\N	1	\N	'10':3B '2':14B 'add':5B,16B 'anoth':13B 'around':2B 'asparagu':9B 'chees':19B 'cream':18B 'hand':21B 'juic':27B 'lemon':26B 'minut':4B,15B 'parsley':23B 'pea':7B 'stir':11B	t
49	Divide between serving dishes and flake the salmon over each, then finish with the remaining parsley and lemon zest	6	Step 7	0	f	\N	1	\N	'dish':4B 'divid':1B 'finish':12B 'flake':6B 'lemon':18B 'parsley':16B 'remain':15B 'salmon':8B 'serv':3B 'zest':19B	t
17	Before you start cooking, take your chicken out of the fridge, open the packet and let it air Boil a kettle Deseed the red pepper[s] (scrape the seeds and pith out with a teaspoon) and cut into thin strips Peel and chop the red onion[s] into wedges  \nHeat a wide based pan (preferably non-stick with a matching lid) with a drizzle of olive oil over a medium heat Once hot, add the pepper strips and onion wedges with a pinch of salt Add the chicken breast portions and cook for 3-5 min on each side until golden, stirring the vegetables occasionally  \nDissolve the chicken stock mix in 550ml [1.1L] boiled water Add the pesto and tomato paste – this is your pesto stock Meanwhile, peel and finely chop (or grate) the garlic  \nOnce the chicken is golden, add the chopped garlic and cook for 1 min or until fragrant Once fragrant, add the orzo and pesto stock and bring to the boil over a high heat Once boiling, reduce the heat to medium-low and cook, covered, for 11-12 min or until the chicken is cooked through (no pink meat!) Tip: Stir the orzo occasionally to prevent it from sticking!  \nMeanwhile, grate the cheddar cheese Once cooked, remove the chicken from the pan (keep the orzo cooking!) and transfer it to a board, then shred it apart using two forks – this technique is known as ‘pulling’  \nOnce the orzo is tender, add most of the grated cheese (save some for garnish!) and give everything a good mix up Season with salt and pepper – this is your red pepper & pesto orzo Tip: Add a splash more water if your pan's looking a little dry!  \nRoughly chop the basil, including the stalks  \nServe the pulled chicken over the red pepper & pesto orzo Garnish with the chopped basil and remaining grated cheese Enjoy!\n\nImported from: https://www.gousto.co.uk/cookbook/chicken-recipes/one-pot-chicken-red-pepper-pesto-orzo	0		0	t	\N	1	\N	'-12':186B '-5':96B '/cookbook/chicken-recipes/one-pot-chicken-red-pepper-pesto-orzo':323B '1':150B '1.1':114B '11':185B '3':95B '550ml':113B 'add':75B,87B,118B,143B,157B,249B,279B 'air':18B 'apart':234B 'base':53B 'basil':295B,313B 'board':230B 'boil':19B,116B,167B,173B 'breast':90B 'bring':164B 'cheddar':211B 'chees':212B,254B,317B 'chicken':7B,89B,109B,140B,191B,217B,302B 'chop':43B,133B,145B,293B,312B 'cook':4B,93B,148B,182B,193B,214B,224B 'cover':183B 'cut':37B 'dese':22B 'dissolv':107B 'dri':291B 'drizzl':65B 'enjoy':318B 'everyth':261B 'fine':132B 'fork':237B 'fragrant':154B,156B 'fridg':11B 'garlic':137B,146B 'garnish':258B,309B 'give':260B 'golden':102B,142B 'good':263B 'grate':135B,209B,253B,316B 'heat':50B,72B,171B,176B 'high':170B 'hot':74B 'import':319B 'includ':296B 'keep':221B 'kettl':21B 'known':241B 'l':115B 'let':16B 'lid':62B 'littl':290B 'look':288B 'low':180B 'match':61B 'meanwhil':129B,208B 'meat':197B 'medium':71B,179B 'medium-low':178B 'min':97B,151B,187B 'mix':111B,264B 'non':57B 'non-stick':56B 'occasion':106B,202B 'oil':68B 'oliv':67B 'onion':46B,80B 'open':12B 'orzo':159B,201B,223B,246B,277B,308B 'packet':14B 'pan':54B,220B,286B 'past':123B 'peel':41B,130B 'pepper':25B,77B,270B,275B,306B 'pesto':120B,127B,161B,276B,307B 'pinch':84B 'pink':196B 'pith':31B 'portion':91B 'prefer':55B 'prevent':204B 'pull':243B,301B 'red':24B,45B,274B,305B 'reduc':174B 'remain':315B 'remov':215B 'rough':292B 'salt':86B,268B 'save':255B 'scrape':27B 'season':266B 'seed':29B 'serv':299B 'shred':232B 'side':100B 'splash':281B 'stalk':298B 'start':3B 'stick':58B,207B 'stir':103B,199B 'stock':110B,128B,162B 'strip':40B,78B 'take':5B 'teaspoon':35B 'techniqu':239B 'tender':248B 'thin':39B 'tip':198B,278B 'tomato':122B 'transfer':226B 'two':236B 'use':235B 'veget':105B 'water':117B,283B 'wedg':49B,81B 'wide':52B 'www.gousto.co.uk':322B 'www.gousto.co.uk/cookbook/chicken-recipes/one-pot-chicken-red-pepper-pesto-orzo':321B	t
65	Stir the lemon juice and chopped coriander gently through the rice, then spoon the biryani onto warm serving plates, Serve each portion with a dollop of yoghurt and mango chutney.	4	Step 5	0	f	\N	1	\N	'biryani':15B 'chop':6B 'chutney':30B 'coriand':7B 'dollop':25B 'gentl':8B 'juic':4B 'lemon':3B 'mango':29B 'onto':16B 'plate':19B 'portion':22B 'rice':11B 'serv':18B,20B 'spoon':13B 'stir':1B 'warm':17B 'yoghurt':27B	t
18	Heat oven to 200C/180C fan/gas 6. Put the potatoes in a large baking tray and toss with the olive oil and fennel seeds. Season, arrange in a single layer, then bake for 20 mins until softened and starting to crisp.  \nTurn the potatoes over and add the beetroot, season and return to the oven for 15 mins. Place the fish in the centre, season well and rub over a little oil from the tray. Return to the oven for 10 mins more.  \nMeanwhile, sprinkle the lemon zest over the crème fraîche with a good grind of black pepper. To serve, scatter the fish with basil and dollop with some of the lemony crème fraîche.\n\nImported from: https://www.bbcgoodfood.com/recipes/pollock-beetroot-potato-traybake-lemony-creme-fraiche	0		0	t	\N	1	\N	'/recipes/pollock-beetroot-potato-traybake-lemony-creme-fraiche':119B '10':80B '15':56B '20':33B '200c/180c':4B '6':6B 'add':46B 'arrang':25B 'bake':13B,31B 'basil':105B 'beetroot':48B 'black':97B 'centr':63B 'creme':90B,113B 'crisp':40B 'dollop':107B 'fan/gas':5B 'fennel':22B 'fish':60B,103B 'fraich':91B,114B 'good':94B 'grind':95B 'heat':1B 'import':115B 'larg':12B 'layer':29B 'lemon':86B 'lemoni':112B 'littl':70B 'meanwhil':83B 'min':34B,57B,81B 'oil':20B,71B 'oliv':19B 'oven':2B,54B,78B 'pepper':98B 'place':58B 'potato':9B,43B 'put':7B 'return':51B,75B 'rub':67B 'scatter':101B 'season':24B,49B,64B 'seed':23B 'serv':100B 'singl':28B 'soften':36B 'sprinkl':84B 'start':38B 'toss':16B 'tray':14B,74B 'turn':41B 'well':65B 'www.bbcgoodfood.com':118B 'www.bbcgoodfood.com/recipes/pollock-beetroot-potato-traybake-lemony-creme-fraiche':117B 'zest':87B	t
20	Heat oven to 200C/180C fan/gas 6. Mix the oil, maple syrup, thyme, cumin and red wine vinegar together with seasoning. Toss the swede and onions in the maple mix, then spread out in a large roasting tin and roast in the oven for 15 mins.  \nAdd the sausages and apple wedges, and cook for 30-45 mins more, stirring halfway through, until the vegetables are soft and caramelised, and the sausages are cooked through. Serve with broccoli.\n\nImported from: https://www.bbcgoodfood.com/recipes/sausage-maple-swede-traybake	0		0	t	\N	1	\N	'-45':56B '/recipes/sausage-maple-swede-traybake':82B '15':44B '200c/180c':4B '30':55B '6':6B 'add':46B 'appl':50B 'broccoli':77B 'caramelis':68B 'cook':53B,73B 'cumin':13B 'fan/gas':5B 'halfway':60B 'heat':1B 'import':78B 'larg':35B 'mapl':10B,28B 'min':45B,57B 'mix':7B,29B 'oil':9B 'onion':25B 'oven':2B,42B 'red':15B 'roast':36B,39B 'sausag':48B,71B 'season':20B 'serv':75B 'soft':66B 'spread':31B 'stir':59B 'swede':23B 'syrup':11B 'thyme':12B 'tin':37B 'togeth':18B 'toss':21B 'veget':64B 'vinegar':17B 'wedg':51B 'wine':16B 'www.bbcgoodfood.com':81B 'www.bbcgoodfood.com/recipes/sausage-maple-swede-traybake':80B	t
75	Tip the couscous into a large bowl and pour over the stock. Cover, then leave for 10 mins until fluffy and all the stock has been absorbed. Meanwhile, slice the onions and pepper, and dice the cucumber. Add these to the couscous, fork through the pesto, crumble in the feta, then sprinkle over pine nuts to serve.	0		0	t	\N	1	\N	'10':17B 'absorb':27B 'add':38B 'bowl':7B 'couscous':3B,42B 'cover':13B 'crumbl':47B 'cucumb':37B 'dice':35B 'feta':50B 'fluffi':20B 'fork':43B 'larg':6B 'leav':15B 'meanwhil':28B 'min':18B 'nut':55B 'onion':31B 'pepper':33B 'pesto':46B 'pine':54B 'pour':9B 'serv':57B 'slice':29B 'sprinkl':52B 'stock':12B,24B 'tip':1B	t
24	Heat 2 tablespoons of oil in a large saucepan over a medium heat.  \nPeel, finely slice and add the onion along with the curry paste, mix well, then cook for 10 minutes, or until the onion is soft and golden, stirring occasionally.  \nFinely chop the chilli, then peel and finely grate the ginger. Pick the coriander leaves and finely slice the stalks. Chop the sweet potatoes into 2cm chunks.  \nAdd the chilli, ginger, coriander stalks and sweet potato to the softened onion. Drain and tip in the chickpeas, then cook for 5 minutes.  \nRoughly chop and add the fresh tomatoes (if using) or tip in the tinned tomatoes. Add 200ml of water and bring to the boil.  \nReduce the heat to a simmer, then cover and cook for 10 to 15 minutes.  \nRemove the lid, then cook for a further 15 to 20 minutes, stirring occasionally, or until the sweet potato is cooked through and the sauce thickened.  \nStir in the coconut milk and cook for a couple of minutes, then stir in the spinach and cook until wilted.  \nScatter over the coriander leaves, then serve with poppadoms and rice, if you like.\n\nImported from: https://www.jamieoliver.com/recipes/vegetables-recipes/sweet-potato-chickpea-amp-spinach-curry/	0		0	t	\N	1	\N	'/recipes/vegetables-recipes/sweet-potato-chickpea-amp-spinach-curry/':198B '10':31B,129B '15':131B,141B '2':2B '20':143B '200ml':110B '2cm':68B '5':92B 'add':18B,70B,97B,109B 'along':21B 'boil':117B 'bring':114B 'chickpea':88B 'chilli':46B,72B 'chop':44B,63B,95B 'chunk':69B 'coconut':162B 'cook':29B,90B,127B,137B,153B,165B,177B 'coriand':56B,74B,183B 'coupl':168B 'cover':125B 'curri':24B 'drain':83B 'fine':15B,43B,50B,59B 'fresh':99B 'ginger':53B,73B 'golden':40B 'grate':51B 'heat':1B,13B,120B 'import':194B 'larg':8B 'leav':57B,184B 'lid':135B 'like':193B 'medium':12B 'milk':163B 'minut':32B,93B,132B,144B,170B 'mix':26B 'occasion':42B,146B 'oil':5B 'onion':20B,36B,82B 'past':25B 'peel':14B,48B 'pick':54B 'poppadom':188B 'potato':66B,78B,151B 'reduc':118B 'remov':133B 'rice':190B 'rough':94B 'sauc':157B 'saucepan':9B 'scatter':180B 'serv':186B 'simmer':123B 'slice':16B,60B 'soft':38B 'soften':81B 'spinach':175B 'stalk':62B,75B 'stir':41B,145B,159B,172B 'sweet':65B,77B,150B 'tablespoon':3B 'thicken':158B 'tin':107B 'tip':85B,104B 'tomato':100B,108B 'use':102B 'water':112B 'well':27B 'wilt':179B 'www.jamieoliver.com':197B 'www.jamieoliver.com/recipes/vegetables-recipes/sweet-potato-chickpea-amp-spinach-curry/':196B	t
23	Trim, wash and finely slice the leeks. Peel and finely slice the garlic and pick the thyme leaves, then place in a large casserole pan on a medium heat with the butter and 1 tablespoon of oil. Once sizzling, stir in the leeks and 400ml of water, then cover and simmer gently over a low heat for 40 minutes, or until sweet and soft, stirring occasionally. Season with sea salt and black pepper.\n  \nWhen the leeks are almost done, cook the pasta in a large pan of boiling salted water according to the packet instructions, then drain, reserving a mugful of starchy cooking water. Toss the drained pasta into the leek pan, then remove from the heat and wait 2 minutes for the pan to cool slightly while you finely grate the cheese and beat it with the egg (if the pan’s too hot, it’ll scramble; get it right and it’ll be smooth, silky and deliciously elegant).  \n\nLoosen the egg mixture with a splash of reserved cooking water, then pour over the pasta, tossing vigorously (the egg will cook in the residual heat). Season to absolute perfection, going a little OTT on the pepper. Adjust the consistency with extra cooking water, if needed, and finish with a little stroke of cheese.  \n\nTip: often I triple the leek base and freeze it for quick cooking another day.  \n\nImported from: https://thehappyfoodie.co.uk/recipes/jamie-olivers-sweet-leek-carbonara-with-fresh-thyme-garlic-cracked-black-pepper-and-parmesan/	0		0	t	\N	1	\N	'/recipes/jamie-olivers-sweet-leek-carbonara-with-fresh-thyme-garlic-cracked-black-pepper-and-parmesan/':234B '1':34B '2':120B '40':58B '400ml':45B 'absolut':189B 'accord':91B 'adjust':198B 'almost':78B 'anoth':228B 'base':221B 'beat':135B 'black':72B 'boil':88B 'butter':32B 'casserol':24B 'chees':133B,214B 'consist':200B 'cook':80B,103B,170B,182B,203B,227B 'cool':126B 'cover':49B 'day':229B 'delici':159B 'done':79B 'drain':97B,107B 'egg':139B,163B,180B 'eleg':160B 'extra':202B 'fine':4B,10B,130B 'finish':208B 'freez':223B 'garlic':13B 'gentl':52B 'get':149B 'go':191B 'grate':131B 'heat':29B,56B,117B,186B 'hot':145B 'import':230B 'instruct':95B 'larg':23B,85B 'leav':18B 'leek':7B,43B,76B,111B,220B 'littl':193B,211B 'll':147B,154B 'loosen':161B 'low':55B 'medium':28B 'minut':59B,121B 'mixtur':164B 'mug':100B 'need':206B 'occasion':66B 'often':216B 'oil':37B 'ott':194B 'packet':94B 'pan':25B,86B,112B,124B,142B 'pasta':82B,108B,176B 'peel':8B 'pepper':73B,197B 'perfect':190B 'pick':15B 'place':20B 'pour':173B 'quick':226B 'remov':114B 'reserv':98B,169B 'residu':185B 'right':151B 'salt':70B,89B 'scrambl':148B 'sea':69B 'season':67B,187B 'silki':157B 'simmer':51B 'sizzl':39B 'slice':5B,11B 'slight':127B 'smooth':156B 'soft':64B 'splash':167B 'starchi':102B 'stir':40B,65B 'stroke':212B 'sweet':62B 'tablespoon':35B 'thehappyfoodie.co.uk':233B 'thehappyfoodie.co.uk/recipes/jamie-olivers-sweet-leek-carbonara-with-fresh-thyme-garlic-cracked-black-pepper-and-parmesan/':232B 'thyme':17B 'tip':215B 'toss':105B,177B 'trim':1B 'tripl':218B 'vigor':178B 'wait':119B 'wash':2B 'water':47B,90B,104B,171B,204B	t
25		0		0	t	\N	1	\N		t
1	Before you start cooking, take your chicken out of the fridge, open the packet and let it air Boil a kettle Deseed the red pepper[s] (scrape the seeds and pith out with a teaspoon) and cut into thin strips Peel and chop the red onion[s] into wedges  \nHeat a wide based pan (preferably non-stick with a matching lid) with a drizzle of olive oil over a medium heat Once hot, add the pepper strips and onion wedges with a pinch of salt Add the chicken breast portions and cook for 3-5 min on each side until golden, stirring the vegetables occasionally  \nDissolve the chicken stock mix in 550ml [1.1L] boiled water Add the pesto and tomato paste – this is your pesto stock Meanwhile, peel and finely chop (or grate) the garlic  \nOnce the chicken is golden, add the chopped garlic and cook for 1 min or until fragrant Once fragrant, add the orzo and pesto stock and bring to the boil over a high heat Once boiling, reduce the heat to medium-low and cook, covered, for 11-12 min or until the chicken is cooked through (no pink meat!) Tip: Stir the orzo occasionally to prevent it from sticking!  \nMeanwhile, grate the cheddar cheese Once cooked, remove the chicken from the pan (keep the orzo cooking!) and transfer it to a board, then shred it apart using two forks – this technique is known as ‘pulling’  \nOnce the orzo is tender, add most of the grated cheese (save some for garnish!) and give everything a good mix up Season with salt and pepper – this is your red pepper & pesto orzo Tip: Add a splash more water if your pan's looking a little dry!  \nRoughly chop the basil, including the stalks  \nServe the pulled chicken over the red pepper & pesto orzo Garnish with the chopped basil and remaining grated cheese Enjoy!	0		0	t	\N	1	\N	'-12':186B '-5':96B '1':150B '1.1':114B '11':185B '3':95B '550ml':113B 'add':75B,87B,118B,143B,157B,249B,279B 'air':18B 'apart':234B 'base':53B 'basil':295B,313B 'board':230B 'boil':19B,116B,167B,173B 'breast':90B 'bring':164B 'cheddar':211B 'chees':212B,254B,317B 'chicken':7B,89B,109B,140B,191B,217B,302B 'chop':43B,133B,145B,293B,312B 'cook':4B,93B,148B,182B,193B,214B,224B 'cover':183B 'cut':37B 'dese':22B 'dissolv':107B 'dri':291B 'drizzl':65B 'enjoy':318B 'everyth':261B 'fine':132B 'fork':237B 'fragrant':154B,156B 'fridg':11B 'garlic':137B,146B 'garnish':258B,309B 'give':260B 'golden':102B,142B 'good':263B 'grate':135B,209B,253B,316B 'heat':50B,72B,171B,176B 'high':170B 'hot':74B 'includ':296B 'keep':221B 'kettl':21B 'known':241B 'l':115B 'let':16B 'lid':62B 'littl':290B 'look':288B 'low':180B 'match':61B 'meanwhil':129B,208B 'meat':197B 'medium':71B,179B 'medium-low':178B 'min':97B,151B,187B 'mix':111B,264B 'non':57B 'non-stick':56B 'occasion':106B,202B 'oil':68B 'oliv':67B 'onion':46B,80B 'open':12B 'orzo':159B,201B,223B,246B,277B,308B 'packet':14B 'pan':54B,220B,286B 'past':123B 'peel':41B,130B 'pepper':25B,77B,270B,275B,306B 'pesto':120B,127B,161B,276B,307B 'pinch':84B 'pink':196B 'pith':31B 'portion':91B 'prefer':55B 'prevent':204B 'pull':243B,301B 'red':24B,45B,274B,305B 'reduc':174B 'remain':315B 'remov':215B 'rough':292B 'salt':86B,268B 'save':255B 'scrape':27B 'season':266B 'seed':29B 'serv':299B 'shred':232B 'side':100B 'splash':281B 'stalk':298B 'start':3B 'stick':58B,207B 'stir':103B,199B 'stock':110B,128B,162B 'strip':40B,78B 'take':5B 'teaspoon':35B 'techniqu':239B 'tender':248B 'thin':39B 'tip':198B,278B 'tomato':122B 'transfer':226B 'two':236B 'use':235B 'veget':105B 'water':117B,283B 'wedg':49B,81B 'wide':52B	t
26		0		0	t	\N	1	\N		t
27		0		0	t	\N	1	\N		t
28	Put the stock, ginger, Chinese five-spice, star anise, soy and chicken in a small saucepan and bring to the boil. Reduce the heat, cover and simmer for 12–15 minutes, or until cooked through. Remove the chicken to a plate and drain the stock through a fine sieve, reserving about 100ml/3½fl oz of the drained stock.  \nFor the bang bang sauce, combine all the sauce ingredients in a small food processor. Whizz, adding the reserved stock a tablespoon at a time, until you have a sauce the consistency of pouring cream. Season to taste.  \nMix the cucumber, carrot, sugar snap peas and spring onions in a large serving bowl. Shred the chicken into large pieces and add to the vegetables with the coriander or Thai basil leaves. Stir in the bang bang sauce and toss well.  \nServe in 2 wide bowls or plates, garnished with the red chilli, peanuts and sesame seeds and served with lime wedges on the side to squeeze over.\n\nImported from: https://www.bbc.co.uk/food/recipes/bangbangchicken_82544	0		0	t	\N	1	\N	'-15':31B '/food/recipes/bangbangchicken_82544':170B '100ml/31/2fl':53B '12':30B '2':141B 'ad':75B 'add':119B 'anis':10B 'bang':61B,62B,133B,134B 'basil':128B 'boil':22B 'bowl':111B,143B 'bring':19B 'carrot':100B 'chicken':13B,39B,114B 'chilli':150B 'chines':5B 'combin':64B 'consist':90B 'cook':35B 'coriand':125B 'cover':26B 'cream':93B 'cucumb':99B 'drain':44B,57B 'fine':49B 'five':7B 'five-spic':6B 'food':72B 'garnish':146B 'ginger':4B 'heat':25B 'import':166B 'ingredi':68B 'larg':109B,116B 'leav':129B 'lime':158B 'minut':32B 'mix':97B 'onion':106B 'oz':54B 'pea':103B 'peanut':151B 'piec':117B 'plate':42B,145B 'pour':92B 'processor':73B 'put':1B 'red':149B 'reduc':23B 'remov':37B 'reserv':51B,77B 'sauc':63B,67B,88B,135B 'saucepan':17B 'season':94B 'seed':154B 'serv':110B,139B,156B 'sesam':153B 'shred':112B 'side':162B 'siev':50B 'simmer':28B 'small':16B,71B 'snap':102B 'soy':11B 'spice':8B 'spring':105B 'squeez':164B 'star':9B 'stir':130B 'stock':3B,46B,58B,78B 'sugar':101B 'tablespoon':80B 'tast':96B 'thai':127B 'time':83B 'toss':137B 'veget':122B 'wedg':159B 'well':138B 'whizz':74B 'wide':142B 'www.bbc.co.uk':169B 'www.bbc.co.uk/food/recipes/bangbangchicken_82544':168B	t
29	a) Add the boiling water to a large saucepan with a pinch of salt and bring to the boil. b) When boiling, add the rice and boil for 8-10 mins before draining in a sieve and returning to the pan with the lid on, off the heat.  \na) Meanwhile halve, peel and thinly slice the onion. b) Trim the green beans then chop into thirds. c) Roughly chop the coriander (stalks and all).  \na) Heat a splash of oil in a frying pan or wok over medium-high heat. b) Add the onion and stir-fry until starting to soften, 2-3 mins. c) Add the beef strips and stir-fry for 2-3 mins. d) Stir in the rendang paste and Thai garnish and cook for 30 seconds.  \na) Stir in the green beans and coconut milk, bring to a simmer and cook, with the lid on (or some foil), stirring occasionally, until thickened, 5-6 mins.  \na) Season the rendang with salt and pepper to taste.  \na) Serve the rice in bowls topped with the rendang and a sprinkle of chopped coriander. Enjoy!\n\nImported from: https://www.hellofresh.co.uk/recipes/beef-rendang-5aec7aa030006c63b5099b92	0		0	t	\N	1	\N	'-10':30B '-3':105B,118B '-6':161B '/recipes/beef-rendang-5aec7aa030006c63b5099b92':194B '2':104B,117B '30':132B '5':160B '8':29B 'add':2B,23B,93B,108B 'b':20B,58B,92B 'bean':62B,139B 'beef':110B 'boil':4B,19B,22B,27B 'bowl':178B 'bring':16B,143B 'c':67B,107B 'chop':64B,69B,187B 'coconut':141B 'cook':130B,148B 'coriand':71B,188B 'd':120B 'drain':33B 'enjoy':189B 'foil':155B 'fri':83B,99B,115B 'garnish':128B 'green':61B,138B 'halv':51B 'heat':48B,76B,91B 'high':90B 'import':190B 'larg':8B 'lid':44B,151B 'meanwhil':50B 'medium':89B 'medium-high':88B 'milk':142B 'min':31B,106B,119B,162B 'occasion':157B 'oil':80B 'onion':57B,95B 'pan':41B,84B 'past':125B 'peel':52B 'pepper':170B 'pinch':12B 'rendang':124B,166B,182B 'return':38B 'rice':25B,176B 'rough':68B 'salt':14B,168B 'saucepan':9B 'season':164B 'second':133B 'serv':174B 'siev':36B 'simmer':146B 'slice':55B 'soften':103B 'splash':78B 'sprinkl':185B 'stalk':72B 'start':101B 'stir':98B,114B,121B,135B,156B 'stir-fri':97B,113B 'strip':111B 'tast':172B 'thai':127B 'thicken':159B 'thin':54B 'third':66B 'top':179B 'trim':59B 'water':5B 'wok':86B 'www.hellofresh.co.uk':193B 'www.hellofresh.co.uk/recipes/beef-rendang-5aec7aa030006c63b5099b92':192B	t
31	Preheat your oven to 200°C, bring a large saucepan of water to the boil with 0.25 tsp salt for the orzo. Pop the diced sweet potato, cherry tomatoes and bacon lardons on a large baking tray and drizzle with oil. Season with salt and pepper, sprinkle over the thyme, toss to coat then spread out and roast on the top shelf of your oven until soft and golden, 20-25 mins, turning halfway.  \nMeanwhile, add the chicken stock and orzo to the boiling water, reduce the heat to medium and cook until just tender, 10-12 mins, then reserve the cooking water (see ingredients for amount) and drain the orzo in a sieve. Keep the pan, we will use it next!  \nWhen the orzo is done, allow it to drain really well. Return the (now empty) saucepan to medium heat and add the cider vinegar, drained orzo and a pinch of chilli flakes (careful, they're hot! You can always add more later). Cook, stirring, for a minute, then stir in the reserved water and spinach. Keep stirring until the spinach has wilted, 2-3 mins.  \nNow stir in the creme fraiche - keep stirring! TIP: The more you stir, the creamier the orzo will become! Cook for another 2-3 mins then remove the pan from the heat. TIP: Stir in a splash more hot water if it seems a bit dry - you are looking for the consistency of risotto!  \nCarefully fold through the roasted vegetables and bacon and the hard Italian cheese. Use scissors to snip in half the chives. Season to taste with salt, pepper or chilli flakes if needed.  \nServe the orzo in bowls. Snip over the remaining chives and finish with a sprinkle more chilli flakes, if liked. Enjoy!\n\nImported from: https://www.hellofresh.co.uk/recipes/superquick-sweetpotato-orzo-5cf1034f7eeae4000b7bfb62	0		0	t	\N	1	\N	'-12':97B '-25':71B '-3':186B,211B '/recipes/superquick-sweetpotato-orzo-5cf1034f7eeae4000b7bfb62':299B '0.25':17B '10':96B '2':185B,210B '20':70B '200':5B 'add':76B,143B,162B 'allow':128B 'alway':161B 'amount':107B 'anoth':209B 'bacon':31B,249B 'bake':36B 'becom':206B 'bit':232B 'boil':15B,84B 'bowl':278B 'bring':7B 'c':6B 'care':155B,242B 'chees':254B 'cherri':28B 'chicken':78B 'chilli':153B,270B,290B 'chive':262B,283B 'cider':145B 'coat':53B 'consist':239B 'cook':92B,102B,165B,207B 'creamier':202B 'creme':192B 'dice':25B 'done':127B 'drain':109B,131B,147B 'dri':233B 'drizzl':39B 'empti':137B 'enjoy':294B 'finish':285B 'flake':154B,271B,291B 'fold':243B 'fraich':193B 'golden':69B 'half':260B 'halfway':74B 'hard':252B 'heat':88B,141B,219B 'hot':158B,226B 'import':295B 'ingredi':105B 'italian':253B 'keep':115B,178B,194B 'lardon':32B 'larg':9B,35B 'later':164B 'like':293B 'look':236B 'meanwhil':75B 'medium':90B,140B 'min':72B,98B,187B,212B 'minut':169B 'need':273B 'next':122B 'oil':41B 'orzo':22B,81B,111B,125B,148B,204B,276B 'oven':3B,65B 'pan':117B,216B 'pepper':46B,268B 'pinch':151B 'pop':23B 'potato':27B 'preheat':1B 're':157B 'realli':132B 'reduc':86B 'remain':282B 'remov':214B 'reserv':100B,174B 'return':134B 'risotto':241B 'roast':58B,246B 'salt':19B,44B,267B 'saucepan':10B,138B 'scissor':256B 'season':42B,263B 'see':104B 'seem':230B 'serv':274B 'shelf':62B 'siev':114B 'snip':258B,279B 'soft':67B 'spinach':177B,182B 'splash':224B 'spread':55B 'sprinkl':47B,288B 'stir':166B,171B,179B,189B,195B,200B,221B 'stock':79B 'sweet':26B 'tast':265B 'tender':95B 'thyme':50B 'tip':196B,220B 'tomato':29B 'top':61B 'toss':51B 'tray':37B 'tsp':18B 'turn':73B 'use':120B,255B 'veget':247B 'vinegar':146B 'water':12B,85B,103B,175B,227B 'well':133B 'wilt':184B 'www.hellofresh.co.uk':298B 'www.hellofresh.co.uk/recipes/superquick-sweetpotato-orzo-5cf1034f7eeae4000b7bfb62':297B	t
32	Step 1) Start by cutting the chicken breasts into thin strips, this will help the chicken to fry quicker. Season and fry on a high heat, try not to over cook the chicken. Then add honey to add flavour to the chicken. Fry both sides of the chicken strips, and once ready tip the chicken onto a plate to cool.  \nStep 2) Now for the vegetables, add a large chopped onion into the pan, chop red pepper and crush three cloves of garlic. Fry all these ingredients for 5 minutes and then add the chopped button mushrooms.  \nStep 3) In separate pans cook the Long Grain Rice and Peas. Once cooked, drain the water from both and mix together the Rice and Peas into a bowl and leave to cool.  \nStep 3) You can choose your own spices really but whilst the vegetables are frying I added half a teaspoon of chili powder and a level tbsp of curry powder and started to mix it all together.  \nStep 4) Add your Rice and Peas into the pan and begin to mix! Then add 4 tbsp of soy sauce and fry on a high heat. Stir in your chicken and begin frying an egg for each person eating.  \nStep 5) Once you have finished the last step serve the dish and add the egg on top!\n\nImported from: https://www.bigoven.com/recipe/mary-berry-chicken-malay-rice/1928484	0		0	t	\N	1	\N	'/recipe/mary-berry-chicken-malay-rice/1928484':230B '1':2B '2':62B '3':99B,132B '4':169B,184B '5':89B,209B 'ad':147B 'add':35B,38B,67B,93B,170B,183B,221B 'begin':179B,200B 'bowl':126B 'breast':8B 'button':96B 'chicken':7B,16B,33B,42B,48B,55B,198B 'chili':152B 'choos':135B 'chop':70B,75B,95B 'clove':81B 'cook':31B,103B,111B 'cool':60B,130B 'crush':79B 'curri':159B 'cut':5B 'dish':219B 'drain':112B 'eat':207B 'egg':203B,223B 'finish':213B 'flavour':39B 'fri':18B,22B,43B,84B,145B,190B,201B 'garlic':83B 'grain':106B 'half':148B 'heat':26B,194B 'help':14B 'high':25B,193B 'honey':36B 'import':226B 'ingredi':87B 'larg':69B 'last':215B 'leav':128B 'level':156B 'long':105B 'minut':90B 'mix':118B,164B,181B 'mushroom':97B 'onion':71B 'onto':56B 'pan':74B,102B,177B 'pea':109B,123B,174B 'pepper':77B 'person':206B 'plate':58B 'powder':153B,160B 'quicker':19B 'readi':52B 'realli':139B 'red':76B 'rice':107B,121B,172B 'sauc':188B 'season':20B 'separ':101B 'serv':217B 'side':45B 'soy':187B 'spice':138B 'start':3B,162B 'step':1B,61B,98B,131B,168B,208B,216B 'stir':195B 'strip':11B,49B 'tbsp':157B,185B 'teaspoon':150B 'thin':10B 'three':80B 'tip':53B 'togeth':119B,167B 'top':225B 'tri':27B 'veget':66B,143B 'water':114B 'whilst':141B 'www.bigoven.com':229B 'www.bigoven.com/recipe/mary-berry-chicken-malay-rice/1928484':228B	t
59	Sprinkle with grated Parmesan and serve with crusty bread.	4	Step 5	0	f	\N	1	\N	'bread':9B 'crusti':8B 'grate':3B 'parmesan':4B 'serv':6B 'sprinkl':1B	t
57	Pour over the chopped tomatoes and stock, cover tightly, then return to the oven for 1½ hrs, until the lamb is very tender.	2	Step 3	0	f	\N	1	\N	'11/2':16B 'chop':4B 'cover':8B 'hrs':17B 'lamb':20B 'oven':14B 'pour':1B 'return':11B 'stock':7B 'tender':23B 'tight':9B 'tomato':5B	t
61	Heat a saute pan until hot, then add the rapeseed oil and onion and fry over a medium heat for 2-3 minutes until just softening.	0	Step 1	0	f	\N	1	\N	'-3':22B '2':21B 'add':8B 'fri':15B 'heat':1B,19B 'hot':6B 'medium':18B 'minut':23B 'oil':11B 'onion':13B 'pan':4B 'rapese':10B 'saut':3B 'soften':26B	t
30	Preheat your oven to 200 degrees. Cut the butternut squash in half lengthways and scoop out the seeds with a spoon (or a melon baller works well if you have one!). Slice it widthways to about 1cm thick (we want to be able to cook this nice and quickly). Now chop into 1cm cubes.  \n\nPut your butternut squash on a baking tray and drizzle over some oil, a sprinkling of salt and a good grind of black pepper. Pop in your oven on the top shelf for 25-30 mins. Then remove from your oven and keep to the side.  \n\nMeanwhile, cut the onion in half through the root, peel and chop into ½cm pieces. Roughly chop the parsley. Peel and grate the garlic (or use a garlic press if you have one). Cut the bacon into 1cm wide strips (use scissors for this if you want, it’s much easier!). Grate the parmesan.  \n\nPut a saucepan of water (amount specified in the ingredient list) on to boil with the vegetable stock pot and stir to dissolve.  \n\nPut half the butter in a large saucepan on medium heat along with a drizzle of oil. Add your onion and bacon and cook for 5 mins until your onion is soft and your bacon browned. Add the garlic and cook for 1 minute.  \n\nOnce the pan is smelling fragrant and garlicky, add the rice along with a good pinch of salt and a good grind of black pepper, stir and cook for 1-2 mins until your rice looks slightly translucent around the edges.  \n\nAfter a minute or two, add in a ladle of your stock, stir, and once absorbed, add another ladle of stock. Keep the pan on medium heat and continue adding stock (stirring now and again while it cooks), letting it absorb before adding another ladle. This should take 17-20 mins. Your risotto is ready when your rice is ‘al dente’. Tip: ‘Al dente’ simply means the rice is cooked through but has a tiny bit of firmness left in the middle.  \n\nOnce cooked, remove from the heat and add your butternut squash along with three-quarters of your parmesan, your remaining butter and three-quarters of your parsley. Squeeze in half the lemon juice, taste and add more lemon juice, salt and black pepper if necessary.  \nServe your risotto in bowls with the rest of your parsley and parmesan sprinkled over the top.\n\nImported from: https://www.hellofresh.co.uk/recipes/bacon-chilli-and-butternut-squas-57ecdda2d36aaa6aa10b4573	0		0	t	\N	1	\N	'-2':252B '-20':312B '-30':89B '/recipes/bacon-chilli-and-butternut-squas-57ecdda2d36aaa6aa10b4573':413B '1':220B,251B '1/2cm':114B '17':311B '1cm':37B,53B,138B '200':5B '25':88B '5':203B 'abl':43B 'absorb':278B,303B 'ad':292B,305B 'add':195B,214B,230B,268B,279B,352B,382B 'al':322B,325B 'along':189B,233B,356B 'amount':160B 'anoth':280B,306B 'around':260B 'bacon':136B,199B,212B 'bake':61B 'baller':25B 'bit':338B 'black':77B,245B,388B 'boil':168B 'bowl':396B 'brown':213B 'butter':181B,366B 'butternut':9B,57B,354B 'chop':51B,112B,117B 'continu':291B 'cook':45B,201B,218B,249B,300B,332B,346B 'cube':54B 'cut':7B,102B,134B 'degre':6B 'dent':323B,326B 'dissolv':177B 'drizzl':64B,192B 'easier':151B 'edg':262B 'firm':340B 'fragrant':227B 'garlic':124B,128B,216B 'garlicki':229B 'good':74B,236B,242B 'grate':122B,152B 'grind':75B,243B 'half':12B,106B,179B,376B 'heat':188B,289B,350B 'import':409B 'ingredi':164B 'juic':379B,385B 'keep':97B,284B 'ladl':271B,281B,307B 'larg':184B 'left':341B 'lemon':378B,384B 'lengthway':13B 'let':301B 'list':165B 'look':257B 'mean':328B 'meanwhil':101B 'medium':187B,288B 'melon':24B 'middl':344B 'min':90B,204B,253B,313B 'minut':221B,265B 'much':150B 'necessari':391B 'nice':47B 'oil':67B,194B 'one':31B,133B 'onion':104B,197B,207B 'oven':3B,82B,95B 'pan':224B,286B 'parmesan':154B,363B,404B 'parsley':119B,373B,402B 'peel':110B,120B 'pepper':78B,246B,389B 'piec':115B 'pinch':237B 'pop':79B 'pot':173B 'preheat':1B 'press':129B 'put':55B,155B,178B 'quarter':360B,370B 'quick':49B 'readi':317B 'remain':365B 'remov':92B,347B 'rest':399B 'rice':232B,256B,320B,330B 'risotto':315B,394B 'root':109B 'rough':116B 'salt':71B,239B,386B 'saucepan':157B,185B 'scissor':142B 'scoop':15B 'seed':18B 'serv':392B 'shelf':86B 'side':100B 'simpli':327B 'slice':32B 'slight':258B 'smell':226B 'soft':209B 'specifi':161B 'spoon':21B 'sprinkl':69B,405B 'squash':10B,58B,355B 'squeez':374B 'stir':175B,247B,275B,294B 'stock':172B,274B,283B,293B 'strip':140B 'take':310B 'tast':380B 'thick':38B 'three':359B,369B 'three-quart':358B,368B 'tini':337B 'tip':324B 'top':85B,408B 'transluc':259B 'tray':62B 'two':267B 'use':126B,141B 'veget':171B 'want':40B,147B 'water':159B 'well':27B 'wide':139B 'widthway':34B 'work':26B 'www.hellofresh.co.uk':412B 'www.hellofresh.co.uk/recipes/bacon-chilli-and-butternut-squas-57ecdda2d36aaa6aa10b4573':411B	t
58	Remove the cinnamon sticks, then stir in the orzo. Cover again, then cook for a further 20 mins, stirring halfway through. The orzo should be cooked and the sauce thickened.	3	Step 4	0	f	\N	1	\N	'20':17B 'cinnamon':3B 'cook':13B,26B 'cover':10B 'halfway':20B 'min':18B 'orzo':9B,23B 'remov':1B 'sauc':29B 'stick':4B 'stir':6B,19B 'thicken':30B	t
56	Cut the lamb into 4cm chunks, then spread over the base of a large, wide casserole dish. Add the onions, oregano, cinnamon sticks, ground cinnamon and olive oil, then stir well. Bake, uncovered, for 45 mins, stirring halfway.	1	Step 2	0	f	\N	1	\N	'45':35B '4cm':5B 'add':18B 'bake':32B 'base':11B 'casserol':16B 'chunk':6B 'cinnamon':22B,25B 'cut':1B 'dish':17B 'ground':24B 'halfway':38B 'lamb':3B 'larg':14B 'min':36B 'oil':28B 'oliv':27B 'onion':20B 'oregano':21B 'spread':8B 'stick':23B 'stir':30B,37B 'uncov':33B 'well':31B 'wide':15B	t
43	Bake the salmon for 20 minutes at 180^o^C fan.	0	Step 1	0	f	\N	1	\N	'180':8B '20':5B 'bake':1B 'c':10B 'fan':11B 'minut':6B 'o':9B 'salmon':3B	t
60		0		0	f	\N	1	\N		t
33	Heat the chicken stock in a pan until just boiling. Leave on simmer. Place four bowls (in which the risotto will be for served) somewhere to warm.  \nAs the stock is heating, in a separate large saucepan, heat butter and 2 tablespoons of olive oil. When hot, add the chicken breasts and seal all around until some of the flesh is browning slightly. Season the breast with a little salt and pepper as they cook. Remove the pan from the heat and remove the chicken breasts, placing them straight into the simmering stock. Retain butter, oil and chicken juices in the pan.  \nCook the chicken breasts in the stock for 10 minutes and then remove, placing them on a clean plate or chopping board to cool a little. Leave the stock on simmer.  \nWhilst the chicken is cooling, reheat the pan that the chicken was cooked in. Fry the cubed red pepper in this pan until the colour changes from bright red to a softer colour red (this will only take a minute or so). Add the cubed chorizo to the pepper and stir fry both together until the chorizo has released oil but is not overcooked (this will take about two minutes).  \nUse a straining spoon to remove the cooked pepper and chorizo from the pan and place it to one side in a clean dish.  \nAdd the chopped shallots (or onion) to the pan that the pepper and chorizo were cooked in and soften over a low heat for a few minutes. It will absorb the chorizo oil as it cooks so that no flavour is lost.  \nWhile the shallots (or onion) are cooking, tear the chicken breast into small pieces, less than bite size. This is best done with fingers or forks (not a knife) to get rough texture on the chicken surfaces. Leave the chicken pieces on the plate or board.  \nWhen the shallots (or onion) are cooked add a little more oil to the pan and turn up the heat. As soon as the pan is hot, add the rice to the pan and stir until the rice is translucent (about 2 minutes) then immediately add the glass of Vermouth/wine mixture - this will steam, so be ready for that - and continue to stir.  \nJust before all of the Vermouth/wine has been absorbed by the rice turn down the heat to medium and start adding the hot stock, one ladle at a time. Stir between additions of stock and add the next ladle just before the one before has been absorbed into the rice mixture.  \nAfter about 15 minutes, two thirds of the stock should have been added. At this point return the chicken, pepper and chorizo to the pan add continue to add the remaining stock, one ladle at a time.  \nAfter a further 8-10 minutes of cooking all of the stock should have been incorporated and the risotto should be creamy but still slightly wet. It is almost ready for serving. Turn the heat off.  \nImmediately add the Parmesan to the risotto and stir this in gently. It will create the final degree of creaminess needed.  \nServe the risotto into warm bowls, for eating with a spoon. No garnish is required because the risotto is packed with flavour, but if you want to garnish, top with some chopped flatleaf parsley This dish goes well with a glass of cold dry white Muscadet sur Lie or with a slightly peppery red Cotes du Rhone.\n\nImported from: https://www.bbcgoodfood.com/user/4145676/recipe/chicken-red-pepper-and-chorizo-risotto	0		0	t	\N	1	\N	'-10':471B '/user/4145676/recipe/chicken-red-pepper-and-chorizo-risotto':585B '10':111B '15':432B '2':41B,357B '8':470B 'absorb':257B,387B,425B 'ad':399B,442B 'add':48B,176B,228B,323B,343B,361B,414B,455B,458B,504B 'addit':410B 'almost':495B 'around':55B 'best':290B 'bite':286B 'board':124B,315B 'boil':10B 'bowl':16B,529B 'breast':51B,66B,86B,106B,280B 'bright':161B 'brown':62B 'butter':39B,95B 'chang':159B 'chicken':3B,50B,85B,98B,105B,136B,144B,279B,305B,309B,448B 'chop':123B,230B,555B 'chorizo':179B,190B,214B,241B,259B,451B 'clean':120B,226B 'cold':566B 'colour':158B,166B 'continu':376B,456B 'cook':75B,103B,146B,211B,243B,263B,276B,322B,474B 'cool':126B,138B 'cote':578B 'creami':488B,522B 'creat':517B 'cube':150B,178B 'degre':520B 'dish':227B,559B 'done':291B 'dri':567B 'du':579B 'eat':531B 'final':519B 'finger':293B 'flatleaf':556B 'flavour':267B,545B 'flesh':60B 'fork':295B 'four':15B 'fri':148B,185B 'garnish':536B,551B 'gentl':514B 'get':300B 'glass':363B,564B 'goe':560B 'heat':1B,32B,38B,81B,250B,335B,394B,501B 'hot':47B,342B,401B 'immedi':360B,503B 'import':581B 'incorpor':482B 'juic':99B 'knife':298B 'ladl':404B,417B,463B 'larg':36B 'leav':11B,129B,307B 'less':284B 'lie':571B 'littl':69B,128B,325B 'lost':269B 'low':249B 'medium':396B 'minut':112B,173B,203B,254B,358B,433B,472B 'mixtur':366B,429B 'muscadet':569B 'need':523B 'next':416B 'oil':45B,96B,193B,260B,327B 'oliv':44B 'one':222B,403B,421B,462B 'onion':233B,274B,320B 'overcook':197B 'pack':543B 'pan':7B,78B,102B,141B,155B,217B,236B,330B,340B,348B,454B 'parmesan':506B 'parsley':557B 'pepper':72B,152B,182B,212B,239B,449B 'pepperi':576B 'piec':283B,310B 'place':14B,87B,116B,219B 'plate':121B,313B 'point':445B 'readi':372B,496B 'red':151B,162B,167B,577B 'reheat':139B 'releas':192B 'remain':460B 'remov':76B,83B,115B,209B 'requir':538B 'retain':94B 'return':446B 'rhone':580B 'rice':345B,353B,390B,428B 'risotto':20B,485B,509B,526B,541B 'rough':301B 'salt':70B 'saucepan':37B 'seal':53B 'season':64B 'separ':35B 'serv':24B,498B,524B 'shallot':231B,272B,318B 'side':223B 'simmer':13B,92B,133B 'size':287B 'slight':63B,491B,575B 'small':282B 'soften':246B 'softer':165B 'somewher':25B 'soon':337B 'spoon':207B,534B 'start':398B 'steam':369B 'still':490B 'stir':184B,350B,378B,408B,511B 'stock':4B,30B,93B,109B,131B,402B,412B,438B,461B,478B 'straight':89B 'strain':206B 'sur':570B 'surfac':306B 'tablespoon':42B 'take':171B,200B 'tear':277B 'textur':302B 'third':435B 'time':407B,466B 'togeth':187B 'top':552B 'transluc':355B 'turn':332B,391B,499B 'two':202B,434B 'use':204B 'vermouth/wine':365B,384B 'want':549B 'warm':27B,528B 'well':561B 'wet':492B 'whilst':134B 'white':568B 'www.bbcgoodfood.com':584B 'www.bbcgoodfood.com/user/4145676/recipe/chicken-red-pepper-and-chorizo-risotto':583B	t
34	Before you start cooking, take your chicken out of the fridge, open the packet and let it air Boil a kettle Deseed the red pepper[s] (scrape the seeds and pith out with a teaspoon) and cut into thin strips Peel and chop the red onion[s] into wedges  \nHeat a wide based pan (preferably non-stick with a matching lid) with a drizzle of olive oil over a medium heat Once hot, add the pepper strips and onion wedges with a pinch of salt Add the chicken breast portions and cook for 3-5 min on each side until golden, stirring the vegetables occasionally  \nDissolve the chicken stock mix in 550ml [1.1L] boiled water Add the pesto and tomato paste – this is your pesto stock Meanwhile, peel and finely chop (or grate) the garlic  \nOnce the chicken is golden, add the chopped garlic and cook for 1 min or until fragrant Once fragrant, add the orzo and pesto stock and bring to the boil over a high heat Once boiling, reduce the heat to medium-low and cook, covered, for 11-12 min or until the chicken is cooked through (no pink meat!) Tip: Stir the orzo occasionally to prevent it from sticking!  \nMeanwhile, grate the cheddar cheese Once cooked, remove the chicken from the pan (keep the orzo cooking!) and transfer it to a board, then shred it apart using two forks – this technique is known as ‘pulling’  \nOnce the orzo is tender, add most of the grated cheese (save some for garnish!) and give everything a good mix up Season with salt and pepper – this is your red pepper & pesto orzo Tip: Add a splash more water if your pan's looking a little dry!  \nRoughly chop the basil, including the stalks  \nServe the pulled chicken over the red pepper & pesto orzo Garnish with the chopped basil and remaining grated cheese Enjoy!\n\nImported from: https://www.gousto.co.uk/cookbook/chicken-recipes/one-pot-chicken-red-pepper-pesto-orzo	0		0	t	\N	1	\N	'-12':186B '-5':96B '/cookbook/chicken-recipes/one-pot-chicken-red-pepper-pesto-orzo':323B '1':150B '1.1':114B '11':185B '3':95B '550ml':113B 'add':75B,87B,118B,143B,157B,249B,279B 'air':18B 'apart':234B 'base':53B 'basil':295B,313B 'board':230B 'boil':19B,116B,167B,173B 'breast':90B 'bring':164B 'cheddar':211B 'chees':212B,254B,317B 'chicken':7B,89B,109B,140B,191B,217B,302B 'chop':43B,133B,145B,293B,312B 'cook':4B,93B,148B,182B,193B,214B,224B 'cover':183B 'cut':37B 'dese':22B 'dissolv':107B 'dri':291B 'drizzl':65B 'enjoy':318B 'everyth':261B 'fine':132B 'fork':237B 'fragrant':154B,156B 'fridg':11B 'garlic':137B,146B 'garnish':258B,309B 'give':260B 'golden':102B,142B 'good':263B 'grate':135B,209B,253B,316B 'heat':50B,72B,171B,176B 'high':170B 'hot':74B 'import':319B 'includ':296B 'keep':221B 'kettl':21B 'known':241B 'l':115B 'let':16B 'lid':62B 'littl':290B 'look':288B 'low':180B 'match':61B 'meanwhil':129B,208B 'meat':197B 'medium':71B,179B 'medium-low':178B 'min':97B,151B,187B 'mix':111B,264B 'non':57B 'non-stick':56B 'occasion':106B,202B 'oil':68B 'oliv':67B 'onion':46B,80B 'open':12B 'orzo':159B,201B,223B,246B,277B,308B 'packet':14B 'pan':54B,220B,286B 'past':123B 'peel':41B,130B 'pepper':25B,77B,270B,275B,306B 'pesto':120B,127B,161B,276B,307B 'pinch':84B 'pink':196B 'pith':31B 'portion':91B 'prefer':55B 'prevent':204B 'pull':243B,301B 'red':24B,45B,274B,305B 'reduc':174B 'remain':315B 'remov':215B 'rough':292B 'salt':86B,268B 'save':255B 'scrape':27B 'season':266B 'seed':29B 'serv':299B 'shred':232B 'side':100B 'splash':281B 'stalk':298B 'start':3B 'stick':58B,207B 'stir':103B,199B 'stock':110B,128B,162B 'strip':40B,78B 'take':5B 'teaspoon':35B 'techniqu':239B 'tender':248B 'thin':39B 'tip':198B,278B 'tomato':122B 'transfer':226B 'two':236B 'use':235B 'veget':105B 'water':117B,283B 'wedg':49B,81B 'wide':52B 'www.gousto.co.uk':322B 'www.gousto.co.uk/cookbook/chicken-recipes/one-pot-chicken-red-pepper-pesto-orzo':321B	t
35		0		0	f	\N	1	\N		t
36		0		0	f	\N	1	\N		t
40	Spoon the salsa over the cooked sweet potatoes, then scatter the grated cheese evenly over the top. Place under the hot grill for a few minutes until the cheese has melted and is golden brown.	3	Step 4	0	f	\N	1	\N	'brown':35B 'chees':13B,29B 'cook':6B 'even':14B 'golden':34B 'grate':12B 'grill':22B 'hot':21B 'melt':31B 'minut':26B 'place':18B 'potato':8B 'salsa':3B 'scatter':10B 'spoon':1B 'sweet':7B 'top':17B	t
39	Meanwhile, preheat the grill to high and make the salsa. Put the tomatoes, spring onions and half of the coriander into a bowl and season with salt and black pepper. Toss together, then add half of the lime juice and toss again.	2	Step 3	0	f	\N	1	\N	'add':34B 'black':29B 'bowl':23B 'coriand':20B 'grill':4B 'half':17B,35B 'high':6B 'juic':39B 'lime':38B 'make':8B 'meanwhil':1B 'onion':15B 'pepper':30B 'preheat':2B 'put':11B 'salsa':10B 'salt':27B 'season':25B 'spring':14B 'togeth':32B 'tomato':13B 'toss':31B,41B	t
38	Sprinkle the garlic powder, onion salt, chilli powder and rapeseed oil onto a large baking tray or into an ovenproof dish and stir together, then add the sweet potato slices and toss together until the potatoes are coated. Bake in the oven for 15 minutes until just browning and softened.	1	Step 2	15	f	\N	1	\N	'15':44B 'add':26B 'bake':15B,39B 'brown':48B 'chilli':7B 'coat':38B 'dish':21B 'garlic':3B 'larg':14B 'minut':45B 'oil':11B 'onion':5B 'onto':12B 'oven':42B 'ovenproof':20B 'potato':29B,36B 'powder':4B,8B 'rapese':10B 'salt':6B 'slice':30B 'soften':50B 'sprinkl':1B 'stir':23B 'sweet':28B 'togeth':24B,33B 'toss':32B 'tray':16B	t
41	Meanwhile, toss the avocado with the remaining lime juice and coriander.	4	Step 5	0	f	\N	1	\N	'avocado':4B 'coriand':11B 'juic':9B 'lime':8B 'meanwhil':1B 'remain':7B 'toss':2B	t
37	Preheat the oven to 200^o^C/180^o^C fan	0	Step 1	0	f	\N	1	\N	'200':5B 'c':9B 'c/180':7B 'fan':10B 'o':6B,8B 'oven':3B 'preheat':1B	t
42	Serve the sweet potato 'nachos' topped with the chopped avocado.	5	Step 6	0	f	\N	1	\N	'avocado':10B 'chop':9B 'nacho':5B 'potato':4B 'serv':1B 'sweet':3B 'top':6B	t
44	In a saucepan, mix the stock cube with 1 litre of boiling water and cover to keep hot.	1	Step 2	0	f	\N	1	\N	'1':9B 'boil':12B 'cover':15B 'cube':7B 'hot':18B 'keep':17B 'litr':10B 'mix':4B 'saucepan':3B 'stock':6B 'water':13B	t
45	Heat 2 tbsp olive oil in a large pan over a medium heat. Add the onion and garlic, season and sweat for 3-5 minutes until they begin to soften.	2	Step 3	0	f	\N	1	\N	'-5':24B '2':2B '3':23B 'add':14B 'begin':28B 'garlic':18B 'heat':1B,13B 'larg':8B 'medium':12B 'minut':25B 'oil':5B 'oliv':4B 'onion':16B 'pan':9B 'season':19B 'soften':30B 'sweat':21B 'tbsp':3B	t
46	Add the risotto rice and stir continuously for a few minutes to toast the rice and coat each grain in oil.	3	Step 4	0	f	\N	1	\N	'add':1B 'coat':17B 'continu':7B 'grain':19B 'minut':11B 'oil':21B 'rice':4B,15B 'risotto':3B 'stir':6B 'toast':13B	t
47	Add the stock one ladle at a time until each ladleful has been absorbed by the rice, repeating the process until all the stock has been used  (15-18 mins).	4	Step 5	0	f	\N	1	\N	'-18':29B '15':28B 'absorb':14B 'add':1B 'ladl':5B,11B 'min':30B 'one':4B 'process':20B 'repeat':18B 'rice':17B 'stock':3B,24B 'time':8B 'use':27B	t
66	Put the pasta into the lidded pan, cover with boiling salted water and cook according to packet instructions\n\nFinely slice the chorizo and rosemary leaves and put into the frying pan with 1 teaspoon of olive oil and a pinch of pepper, then squash in the unpeeled garlic through a garlic crusher and move everything around until lightly golden\n\nBeat the egg, lemon juice, yoghurt and remaining finely grated Manchego together in a bowl\n\nDrain the pasta, reserving a cupful of the starchy cooking water. Toss the pasta into the chorizo pan, remove from the heat and mix well with the creamy sauce, loosening with a splash of cooking water, if needed, then season to taste	0		0	t	\N	1	\N	'1':33B 'accord':15B 'around':56B 'beat':60B 'boil':10B 'bowl':74B 'chorizo':22B,91B 'cook':14B,84B,109B 'cover':8B 'creami':102B 'crusher':52B 'cup':80B 'drain':75B 'egg':62B 'everyth':55B 'fine':19B,68B 'fri':30B 'garlic':48B,51B 'golden':59B 'grate':69B 'heat':96B 'instruct':18B 'juic':64B 'leav':25B 'lemon':63B 'lid':6B 'light':58B 'loosen':104B 'manchego':70B 'mix':98B 'move':54B 'need':112B 'oil':37B 'oliv':36B 'packet':17B 'pan':7B,31B,92B 'pasta':3B,77B,88B 'pepper':42B 'pinch':40B 'put':1B,27B 'remain':67B 'remov':93B 'reserv':78B 'rosemari':24B 'salt':11B 'sauc':103B 'season':114B 'slice':20B 'splash':107B 'squash':44B 'starchi':83B 'tast':116B 'teaspoon':34B 'togeth':71B 'toss':86B 'unpeel':47B 'water':12B,85B,110B 'well':99B 'yoghurt':65B	t
92	Heat the oil in a large shallow casserole or frying pan. Add the chicken and fry for 5 mins over a medium heat until golden all over. Remove and set aside on a plate.  \n\nPut the onion and peppers in the same pan and fry over a medium heat for 8-10 mins. Add the garlic, dried herbs and spices and cook for 1 min. Add the tomato purée and cook for 2 mins. Return the chicken to the pan and pour in the cream, stirring to combine. Season to taste. \n \nCook the pasta following pack instructions, then drain and reserve 150ml of the cooking water. Add the pasta to the pan with 50ml of the water and stir everything together over the heat. Add a little more water to loosen if needed. Season to taste and stir through the parsley. Divide between six bowls and top with a little cheese and extra chopped parsley, if you like. This can be packed into a lunchbox and eaten cold, too.	0		0	t	\N	1	\N	'-10':52B '1':64B '150ml':102B '2':73B '5':18B '50ml':114B '8':51B 'add':12B,54B,66B,107B,125B 'asid':31B 'bowl':145B 'casserol':8B 'chees':151B 'chicken':14B,77B 'chop':154B 'cold':168B 'combin':88B 'cook':62B,71B,92B,105B 'cream':85B 'divid':142B 'drain':99B 'dri':57B 'eaten':167B 'everyth':120B 'extra':153B 'follow':95B 'fri':10B,16B,45B 'garlic':56B 'golden':25B 'heat':1B,23B,49B,124B 'herb':58B 'instruct':97B 'larg':6B 'like':158B 'littl':127B,150B 'loosen':131B 'lunchbox':165B 'medium':22B,48B 'min':19B,53B,65B,74B 'need':133B 'oil':3B 'onion':37B 'pack':96B,162B 'pan':11B,43B,80B,112B 'parsley':141B,155B 'pasta':94B,109B 'pepper':39B 'plate':34B 'pour':82B 'pure':69B 'put':35B 'remov':28B 'reserv':101B 'return':75B 'season':89B,134B 'set':30B 'shallow':7B 'six':144B 'spice':60B 'stir':86B,119B,138B 'tast':91B,136B 'togeth':121B 'tomato':68B 'top':147B 'water':106B,117B,129B	t
99	Make the sweet & sour sauce by whisking together the pineapple juice, tomato ketchup, malt vinegar and cornflour. There should be 300ml – add water or stock if you’re short.  \n\nHeat the oil in a frying pan or wok over a high heat. Add the onion, chilli, peppers, carrots and chicken and stir-fry for 3-5 mins until the vegetables are starting to soften and the chicken is almost cooked.  \n\nAdd the corn, pineapple and sauce. Bubble for 2 mins, add tomatoes and cook for 2 mins until the sauce thickens, the chicken is cooked and the vegetables are tender. Serve with rice, if you like.	0		0	t	\N	1	\N	'-5':57B '2':80B,87B '3':56B '300ml':21B 'add':22B,43B,72B,82B 'almost':70B 'bubbl':78B 'carrot':48B 'chicken':50B,68B,94B 'chilli':46B 'cook':71B,85B,96B 'corn':74B 'cornflour':17B 'fri':35B,54B 'heat':30B,42B 'high':41B 'juic':11B 'ketchup':13B 'like':107B 'make':1B 'malt':14B 'min':58B,81B,88B 'oil':32B 'onion':45B 'pan':36B 'pepper':47B 'pineappl':10B,75B 're':28B 'rice':104B 'sauc':5B,77B,91B 'serv':102B 'short':29B 'soften':65B 'sour':4B 'start':63B 'stir':53B 'stir-fri':52B 'stock':25B 'sweet':3B 'tender':101B 'thicken':92B 'togeth':8B 'tomato':12B,83B 'veget':61B,99B 'vinegar':15B 'water':23B 'whisk':7B 'wok':38B	t
110	a) Fill and boil your kettle. b) Pour the boiled water into a medium saucepan with 1/4 tsp salt on high heat. c) Add the noodles and cook until tender, 4 mins. d) Once cooked, drain in a sieve and run under cold water to stop them sticking together.  \na) Meanwhile, heat a large frying pan on medium-high heat (no oil). b) Once hot, add the pork mince and sprinkle over the Indonesian style spice mix. c) Fry the mince until browned, 5-6 mins. Use a spoon to break it up as it cooks. IMPORTANT: Wash your hands and equipment after handling raw mince. It's cooked when no longer pink in the middle.  \na) While the pork cooks, halve the bell pepper and remove the core and seeds. Slice into thin strips. b) Crush the peanuts in the unopened sachet using a rolling pin. Halve the lime. c) Once the mince is cooked, drain and discard any excess fat. Add the sliced pepper and cook until softened, 3-4 mins.  \na) Meanwhile, in a small bowl, mix the ketjap manis with the rice vinegar, honey and water for the sauce (see pantry for amount). Squeeze in the lime juice, then combine well. TIP: If your honey has hardened, pop it in a bowl of hot water for 1 min. b) Bubble until thickened and glossy, 2-3 mins.  \na) When the sauce has thickened, add the cooked noodles and half the peanuts. b) Stir to coat the noodles in the sauce and cook until everything's piping hot, 1-2 mins. c) Taste and season with salt and pepper if needed. Add a splash more water if the noodles look a little dry.  \na) Share the pork noodles between your bowls. b) Finish with a sprinkle of the remaining peanuts for those who'd like them. Enjoy!	0		0	t	\N	1	\N	'-2':264B '-3':231B '-4':173B '-6':86B '1':222B,263B '1/4':17B '2':230B '3':172B '4':31B '5':85B 'add':24B,67B,164B,239B,276B 'amount':198B 'b':7B,64B,137B,224B,247B,296B 'bell':125B 'boil':4B,10B 'bowl':180B,217B,295B 'break':92B 'brown':84B 'bubbl':225B 'c':23B,79B,152B,266B 'coat':250B 'cold':43B 'combin':205B 'cook':28B,35B,97B,110B,122B,157B,169B,241B,257B 'core':130B 'crush':138B 'd':33B,308B 'discard':160B 'drain':36B,158B 'dri':287B 'enjoy':311B 'equip':103B 'everyth':259B 'excess':162B 'fat':163B 'fill':2B 'finish':297B 'fri':55B,80B 'glossi':229B 'half':244B 'halv':123B,149B 'hand':101B 'handl':105B 'harden':212B 'heat':22B,52B,61B 'high':21B,60B 'honey':189B,210B 'hot':66B,219B,262B 'import':98B 'indonesian':75B 'juic':203B 'ketjap':183B 'kettl':6B 'larg':54B 'like':309B 'lime':151B,202B 'littl':286B 'longer':113B 'look':284B 'mani':184B 'meanwhil':51B,176B 'medium':14B,59B 'medium-high':58B 'middl':117B 'min':32B,87B,174B,223B,232B,265B 'minc':70B,82B,107B,155B 'mix':78B,181B 'need':275B 'noodl':26B,242B,252B,283B,292B 'oil':63B 'pan':56B 'pantri':196B 'peanut':140B,246B,304B 'pepper':126B,167B,273B 'pin':148B 'pink':114B 'pipe':261B 'pop':213B 'pork':69B,121B,291B 'pour':8B 'raw':106B 'remain':303B 'remov':128B 'rice':187B 'roll':147B 'run':41B 'sachet':144B 'salt':19B,271B 'sauc':194B,236B,255B 'saucepan':15B 'season':269B 'see':195B 'seed':132B 'share':289B 'siev':39B 'slice':133B,166B 'small':179B 'soften':171B 'spice':77B 'splash':278B 'spoon':90B 'sprinkl':72B,300B 'squeez':199B 'stick':48B 'stir':248B 'stop':46B 'strip':136B 'style':76B 'tast':267B 'tender':30B 'thicken':227B,238B 'thin':135B 'tip':207B 'togeth':49B 'tsp':18B 'unopen':143B 'use':88B,145B 'vinegar':188B 'wash':99B 'water':11B,44B,191B,220B,280B 'well':206B	t
87	Peel the garlic cloves, cut in half lengthways and remove the green shoot at the centre. Gently warm the garlic and oil in a large frying pan (big enough to toss the pasta in later). As it starts to colour, take off the heat and let the garlic infuse for 5 minutes, then discard it.  \n\nTip the onion and celery into the garlic scented oil, sprinkle with a little salt and return to a gentle heat. Let them soften, without colouring, for 8-10 minutes. They should sweat rather than fry, so if you hear sizzling add water, a tablespoon at a time.  \n\nAdd the pancetta and cook for another 6minutes, adding water as before. Stir in the pork and turn the heat up. Don’t colour the meat too much and avoid breaking it up. Add the wine and let it evaporate, then season. Pour in the water, cover and simmer for 20-25 minutes. Mix in a little water if the mixture gets too dry.  \n\nWhile the ragù is cooking, put a pan with plenty of water on to boil. Grate the Parmesan and the zest from the lemon.  \n\nWhen the water is at a rolling boil add 2 tsp salt, then the pasta. Partly cover, bring back to the boil, give it a good stir and reduce the heat so the water boils gently. Taste the pasta 2 minutes before the timing on the packet – remember it will keep cooking while it is tossed with the ragù.  \nDrain the pasta, reserving some pasta water. Immediately transfer the pasta to the frying pan and toss well over a low heat. Tip in the parmesan and toss well. Add pasta water to dilute, or extra cheese to absorb excess liquid, and mix again.  \n\nToss in the lemon zest and parsley. Serve immediately.	0		0	t	\N	1	\N	'-10':84B '-25':155B '2':201B,231B '20':154B '5':51B '6minutes':111B '8':83B 'absorb':289B 'ad':112B 'add':97B,104B,137B,200B,280B 'anoth':110B 'avoid':133B 'back':210B 'big':28B 'boil':182B,199B,213B,226B 'break':134B 'bring':209B 'celeri':60B 'centr':16B 'chees':287B 'clove':4B 'colour':40B,81B,127B 'cook':108B,172B,243B 'cover':150B,208B 'cut':5B 'dilut':284B 'discard':54B 'drain':251B 'dri':167B 'enough':29B 'evapor':143B 'excess':290B 'extra':286B 'fri':26B,91B,264B 'garlic':3B,20B,48B,63B 'gentl':17B,75B,227B 'get':165B 'give':214B 'good':217B 'grate':183B 'green':12B 'half':7B 'hear':95B 'heat':44B,76B,123B,222B,272B 'immedi':258B,303B 'infus':49B 'keep':242B 'larg':25B 'later':35B 'lemon':191B,298B 'lengthway':8B 'let':46B,77B,141B 'liquid':291B 'littl':69B,160B 'low':271B 'meat':129B 'minut':52B,85B,156B,232B 'mix':157B,293B 'mixtur':164B 'much':131B 'oil':22B,65B 'onion':58B 'packet':238B 'pan':27B,175B,265B 'pancetta':106B 'parmesan':185B,276B 'parsley':301B 'part':207B 'pasta':33B,206B,230B,253B,256B,261B,281B 'peel':1B 'plenti':177B 'pork':119B 'pour':146B 'put':173B 'ragu':170B,250B 'rather':89B 'reduc':220B 'rememb':239B 'remov':10B 'reserv':254B 'return':72B 'roll':198B 'salt':70B,203B 'scent':64B 'season':145B 'serv':302B 'shoot':13B 'simmer':152B 'sizzl':96B 'soften':79B 'sprinkl':66B 'start':38B 'stir':116B,218B 'sweat':88B 'tablespoon':100B 'take':41B 'tast':228B 'time':103B,235B 'tip':56B,273B 'toss':31B,247B,267B,278B,295B 'transfer':259B 'tsp':202B 'turn':121B 'warm':18B 'water':98B,113B,149B,161B,179B,194B,225B,257B,282B 'well':268B,279B 'wine':139B 'without':80B 'zest':188B,299B	t
67	Peel and finely dice the brown onion[s]\n\nHeat a large, wide-based pan (preferably non-stick) with 1 tbsp [2 tbsp] vegetable oil and a knob of butter over a medium heat\n\nOnce hot, add the diced onion and cook for 4-6 min or until soft and starting to brown \n \nMeanwhile, add the linguine to a pot of boiled water with a large pinch of salt and bring to the boil over a high heat\n\nCook the linguine for 8-10 min or until cooked with a slight bite\n\nOnce done, drain the cooked linguine, reserving a cup of the starchy pasta water\n\nWhile the linguine is cooking, peel and finely chop (or grate) the garlic and slice the chestnut mushrooms finely  \nAdd the smoked paprika, Dijon mustard and a generous pinch of salt and pepper to a bowl\n\nCut the chicken breast portions into large, bite-sized pieces and add them to the bowl, then mix well and set aside – this is your smoky chicken  \n\nOnce the onion has softened, increase the heat to medium-high\n\nAdd the sliced mushrooms and chopped garlic and cook for 1-2 min or until the mushrooms start to soften and brown slightly\n\n\nWhile the mushrooms are softening, chop the parsley finely, including the stalks \n \nOnce the mushrooms have started to soften, add the smoky chicken to the pan\n\nAdd half the chopped parsley to the pan (save the rest for garnish!)\n\nCook for a further 5-6 min or until the chicken is beginning to brown  \n\nMeanwhile, dissolve the chicken stock mix in 100ml [200ml] reserved starchy pasta waterAdd the chicken stock to the pan and cook for a further 3-4 min or until the liquid has reduced by half \n \nAdd the drained linguine to the pan Tip: Give it a good stir to release the starch in the pasta and make the sauce naturally creamy\n\nBefore the liquid has fully reduced, remove the linguine from the heat and stir in the soft cheese – this is your smoky chicken & mushroom linguine  \n\nServe the smoky chicken & mushroom linguineGarnish with the remaining chopped parsley	0		0	t	\N	1	\N	'-10':85B '-2':195B '-4':286B '-6':46B,251B '1':21B,194B '100ml':268B '2':23B '200ml':269B '3':285B '4':45B '5':250B '8':84B 'add':38B,56B,127B,156B,184B,226B,233B,296B 'asid':166B 'base':14B 'begin':258B 'bite':93B,152B 'bite-s':151B 'boil':63B,75B 'bowl':143B,160B 'breast':147B 'bring':72B 'brown':6B,54B,205B,260B 'butter':31B 'chees':339B 'chestnut':124B 'chicken':146B,171B,229B,256B,264B,275B,344B,350B 'chop':116B,189B,212B,236B,356B 'cook':43B,80B,89B,98B,112B,192B,246B,281B 'creami':321B 'cup':102B 'cut':144B 'dice':4B,40B 'dijon':131B 'dissolv':262B 'done':95B 'drain':96B,298B 'fine':3B,115B,126B,215B 'fulli':326B 'garlic':120B,190B 'garnish':245B 'generous':135B 'give':304B 'good':307B 'grate':118B 'half':234B,295B 'heat':9B,35B,79B,179B,333B 'high':78B,183B 'hot':37B 'includ':216B 'increas':177B 'knob':29B 'larg':11B,67B,150B 'linguin':58B,82B,99B,110B,299B,330B,346B 'linguinegarnish':352B 'liquid':291B,324B 'make':317B 'meanwhil':55B,261B 'medium':34B,182B 'medium-high':181B 'min':47B,86B,196B,252B,287B 'mix':162B,266B 'mushroom':125B,187B,200B,209B,221B,345B,351B 'mustard':132B 'natur':320B 'non':18B 'non-stick':17B 'oil':26B 'onion':7B,41B,174B 'pan':15B,232B,240B,279B,302B 'paprika':130B 'parsley':214B,237B,357B 'pasta':106B,272B,315B 'peel':1B,113B 'pepper':140B 'piec':154B 'pinch':68B,136B 'portion':148B 'pot':61B 'prefer':16B 'reduc':293B,327B 'releas':310B 'remain':355B 'remov':328B 'reserv':100B,270B 'rest':243B 'salt':70B,138B 'sauc':319B 'save':241B 'serv':347B 'set':165B 'size':153B 'slice':122B,186B 'slight':92B,206B 'smoke':129B 'smoki':170B,228B,343B,349B 'soft':50B,338B 'soften':176B,203B,211B,225B 'stalk':218B 'starch':312B 'starchi':105B,271B 'start':52B,201B,223B 'stick':19B 'stir':308B,335B 'stock':265B,276B 'tbsp':22B,24B 'tip':303B 'veget':25B 'water':64B,107B 'wateradd':273B 'well':163B 'wide':13B 'wide-bas':12B	t
73	Preheat the oven to 200ºC/400ºF/gas 6.\n  \nScrub the root veg and cut into bite-sized pieces along with the peppers, discarding the seeds. Cut the broccoli or cauliflower into florets.  \n\nSpread the veg out in a large roasting tray, drizzle with 3 tablespoons of oil, season with sea salt and black pepper and toss well to coat. Roast for 20 minutes, or until the vegetables are tender and coloured. \n \nCut the halloumi into 2cm pieces and scatter over the veg. Switch the oven to grill, increase the temperature and grill for 5 to 10 minutes, or until the cheese is soft and golden.  \n\nSpiralise the courgette (or other chosen vegetables), then core and finely slice the apple. Combine the apple with the roasted veggies, then stir through the courgetti and spinach.  \n\nMix the pesto with 2 tablespoons of oil and drizzle over to serve.	0		0	t	\N	1	\N	'/gas':7B '10':97B '2':139B '20':63B '200ºc/400':5B '2cm':77B '3':45B '5':95B '6':8B 'along':20B 'appl':120B,123B 'bite':17B 'bite-s':16B 'black':54B 'broccoli':29B 'cauliflow':31B 'chees':102B 'chosen':112B 'coat':60B 'colour':72B 'combin':121B 'core':115B 'courgett':109B 'courgetti':132B 'cut':14B,27B,73B 'discard':24B 'drizzl':43B,144B 'fine':117B 'floret':33B 'golden':106B 'grill':88B,93B 'halloumi':75B 'increas':89B 'larg':40B 'minut':64B,98B 'mix':135B 'oil':48B,142B 'oven':3B,86B 'pepper':23B,55B 'pesto':137B 'piec':19B,78B 'preheat':1B 'roast':41B,61B,126B 'root':11B 'salt':52B 'scatter':80B 'scrub':9B 'sea':51B 'season':49B 'seed':26B 'serv':147B 'size':18B 'slice':118B 'soft':104B 'spinach':134B 'spiralis':107B 'spread':34B 'stir':129B 'switch':84B 'tablespoon':46B,140B 'temperatur':91B 'tender':70B 'toss':57B 'tray':42B 'veg':12B,36B,83B 'veget':68B,113B 'veggi':127B 'well':58B 'ºf':6B	t
69	1. Heat the milk with the onion until just boiling. Turn off the heat and leave to infuse for 20 mins \n\n2. In another saucepan cook the pasta according to the package directions then drain well \n\n3. Melt the butter in another saucepan, then add the flour. Stir continuously until a paste forms (you now have a roux) \n\n4. Remove the onion from the milk and discard. Add the infused milk to the roux gradually, stirring as you go, until you get a smooth sauce. Cook for 5-10 mins, whisking continuously, until the sauce has thickened. \n\n5. Preheat your oven to 180°C \n\n6. Add the pesto into the béchamel and mix well. \n\n7. Add the mushrooms, onion, torn cooked chicken and pasta. Mix well and place in an oven-proof dish. \n\n8. Top with torn or grated mozzarella and 1/2 the grated Parmesan cheese \n\n9. Bake for 20-25 minutes or until the pasta is hot all the way through and the cheese has melted \n\n10. Spoon into a bowl and top with the remaining Parmesan cheese and a basil leaf	0		0	f	\N	1	\N	'-10':89B '-25':152B '1':1B '1/2':143B '10':169B '180':103B '2':22B '20':20B,151B '3':37B '4':59B '5':88B,98B '6':105B '7':115B '8':135B '9':148B 'accord':29B 'add':45B,68B,106B,116B 'anoth':24B,42B 'bake':149B 'basil':183B 'bechamel':111B 'boil':10B 'bowl':173B 'butter':40B 'c':104B 'chees':147B,166B,180B 'chicken':122B 'continu':49B,92B 'cook':26B,86B,121B 'direct':33B 'discard':67B 'dish':134B 'drain':35B 'flour':47B 'form':53B 'get':82B 'go':79B 'gradual':75B 'grate':140B,145B 'heat':2B,14B 'hot':159B 'infus':18B,70B 'leaf':184B 'leav':16B 'melt':38B,168B 'milk':4B,65B,71B 'min':21B,90B 'minut':153B 'mix':113B,125B 'mozzarella':141B 'mushroom':118B 'onion':7B,62B,119B 'oven':101B,132B 'oven-proof':131B 'packag':32B 'parmesan':146B,179B 'past':52B 'pasta':28B,124B,157B 'pesto':108B 'place':128B 'preheat':99B 'proof':133B 'remain':178B 'remov':60B 'roux':58B,74B 'sauc':85B,95B 'saucepan':25B,43B 'smooth':84B 'spoon':170B 'stir':48B,76B 'thicken':97B 'top':136B,175B 'torn':120B,138B 'turn':11B 'way':162B 'well':36B,114B,126B 'whisk':91B	t
76	Slice the baguette in half lengthways. Spread the bottom half with the pesto. Slice the mozzarella and add in a layer over the pesto.  \nFinish with layers of spinach and basil, plus the salami, folded in half if necessary to fit the width of the baguette.	0		0	t	\N	1	\N	'add':18B 'baguett':3B,46B 'basil':31B 'bottom':9B 'finish':25B 'fit':41B 'fold':35B 'half':5B,10B,37B 'layer':21B,27B 'lengthway':6B 'mozzarella':16B 'necessari':39B 'pesto':13B,24B 'plus':32B 'salami':34B 'slice':1B,14B 'spinach':29B 'spread':7B 'width':43B	t
90	Heat the oil in a large casserole dish. Brown the chicken until golden on all sides – you might have to do this in batches – remove the chicken from the pan as you go and set aside.  \n\nAdd the lardons to the pan and sizzle for a few mins, then add the onion, celery and leeks, and cook over a medium heat for 8-10 mins until the vegetables have softened. Stir in the flour, season and cook for a further 2 mins.  \n\nGradually stir in the wine and allow it to bubble away, then stir in the stock. Return the chicken to the pan with the bay leaves and cover with a lid. Reduce the heat and simmer gently for 1½ hrs or until the chicken is tender. The stew can now be cooled and frozen if you’re making ahead. Just defrost thoroughly, then gently warm through back in the pan before continuing.  \n\nHeat oven to 200C/180C fan/gas 6. Add the peas, sundried tomatoes, pesto and basil to the stew. To make the dumplings, rub the butter into the flour until it resembles fine breadcrumbs. Mix in the grated cheese and add 150ml water, mixing with a cutlery knife to bring the crumbs together to form a light and sticky dough. Break off walnut-sized lumps and shape into small balls. Roll the tops of the dumplings in the pine nuts so a few stick to the outside, then place the dumplings on top of the stew and scatter with any remaining nuts. Put the dish in the oven and bake for 25 mins until the dumplings are golden brown and cooked through. Serve with mashed potato and extra veg if you like.	0		0	t	\N	1	\N	'-10':64B '11/2':121B '150ml':194B '2':81B '200c/180c':158B '25':265B '6':160B '8':63B 'add':37B,50B,161B,193B 'ahead':141B 'allow':89B 'asid':36B 'away':93B 'back':149B 'bake':263B 'ball':223B 'basil':168B 'batch':24B 'bay':107B 'breadcrumb':186B 'break':213B 'bring':202B 'brown':9B,272B 'bubbl':92B 'butter':178B 'casserol':7B 'celeri':53B 'chees':191B 'chicken':11B,27B,101B,126B 'continu':154B 'cook':57B,77B,274B 'cool':134B 'cover':110B 'crumb':204B 'cutleri':199B 'defrost':143B 'dish':8B,258B 'dough':212B 'dumpl':175B,229B,244B,269B 'extra':281B 'fan/gas':159B 'fine':185B 'flour':74B,181B 'form':207B 'frozen':136B 'gentl':119B,146B 'go':33B 'golden':13B,271B 'gradual':83B 'grate':190B 'heat':1B,61B,116B,155B 'hrs':122B 'knife':200B 'lardon':39B 'larg':6B 'leav':108B 'leek':55B 'lid':113B 'light':209B 'like':285B 'lump':218B 'make':140B,173B 'mash':278B 'medium':60B 'might':18B 'min':48B,65B,82B,266B 'mix':187B,196B 'nut':233B,255B 'oil':3B 'onion':52B 'outsid':240B 'oven':156B,261B 'pan':30B,42B,104B,152B 'pea':163B 'pesto':166B 'pine':232B 'place':242B 'potato':279B 'put':256B 're':139B 'reduc':114B 'remain':254B 'remov':25B 'resembl':184B 'return':99B 'roll':224B 'rub':176B 'scatter':251B 'season':75B 'serv':276B 'set':35B 'shape':220B 'side':16B 'simmer':118B 'size':217B 'sizzl':44B 'small':222B 'soften':70B 'stew':130B,171B,249B 'stick':237B 'sticki':211B 'stir':71B,84B,95B 'stock':98B 'sundri':164B 'tender':128B 'thorough':144B 'togeth':205B 'tomato':165B 'top':226B,246B 'veg':282B 'veget':68B 'walnut':216B 'walnut-s':215B 'warm':147B 'water':195B 'wine':87B	t
68	Preheat your oven to 200°C. Pop the butternut squash on a baking tray with a little olive oil. Sprinkle over half the curry powder and season with salt and pepper. Use your hands to coat the squash in the spices. Roast on the top shelf of your oven until soft and golden, 25-30 mins. Turn halfway through to ensure even cooking.  \nHalve, peel and thinly slice the onion. Halve the chilli lengthways, deseed then finely chop. Chop the vine tomato into 2cm chunks. Roughly chop the coriander (stalks and all).  \nHeat a splash of oil in a large saucepan on medium heat, add the curry powder, tomato and as much chilli as you dare. Cook for 1 minute. Add the water (see ingredients for amount), vegetable stock powder, coconut milk and red lentils to the saucepan. Simmer until the lentils are soft, 20-25 mins. Stir every couple of minutes to check the lentils don't catch on the bottom of the pan.  \nSeparate the onion slices. Toss them in the flour and season with a pinch of salt and pepper. Heat a splash of oil in a frying pan on high heat. When hot, fry the onion until coloured and crispy, 2-3 mins. Turn once or twice, then transfer to some kitchen paper to absorb any excess oil.  \nMeanwhile, pop the naans into the oven to warm through for 2-3 mins.  \nOnce the coconut dal has thickened and the lentils are cooked, taste for seasoning and add salt and black pepper if needed. Stir in half the coriander. Serve in big bowls with the roasted butternut squash, crispy onions and pumpkin seeds stacked on top. Sprinkle over the remaining coriander and mop up with your naans. Enjoy!	0		0	t	\N	1	\N	'-25':146B '-3':206B,235B '-30':55B '1':119B '2':205B,234B '20':145B '200':5B '25':54B '2cm':84B 'absorb':219B 'add':105B,121B,252B 'amount':127B 'bake':13B 'big':266B 'black':255B 'bottom':162B 'bowl':267B 'butternut':9B,271B 'c':6B 'catch':159B 'check':154B 'chilli':73B,113B 'chop':78B,79B,87B 'chunk':85B 'coat':36B 'coconut':131B,239B 'colour':202B 'cook':63B,117B,247B 'coriand':89B,263B,285B 'coupl':150B 'crispi':204B,273B 'curri':24B,107B 'dal':240B 'dare':116B 'dese':75B 'enjoy':292B 'ensur':61B 'even':62B 'everi':149B 'excess':221B 'fine':77B 'flour':174B 'fri':191B,198B 'golden':53B 'half':22B,261B 'halfway':58B 'halv':64B,71B 'hand':34B 'heat':93B,104B,184B,195B 'high':194B 'hot':197B 'ingredi':125B 'kitchen':216B 'larg':100B 'lengthway':74B 'lentil':135B,142B,156B,245B 'littl':17B 'meanwhil':223B 'medium':103B 'milk':132B 'min':56B,147B,207B,236B 'minut':120B,152B 'mop':287B 'much':112B 'naan':226B,291B 'need':258B 'oil':19B,97B,188B,222B 'oliv':18B 'onion':70B,168B,200B,274B 'oven':3B,49B,229B 'pan':165B,192B 'paper':217B 'peel':65B 'pepper':31B,183B,256B 'pinch':179B 'pop':7B,224B 'powder':25B,108B,130B 'preheat':1B 'pumpkin':276B 'red':134B 'remain':284B 'roast':42B,270B 'rough':86B 'salt':29B,181B,253B 'saucepan':101B,138B 'season':27B,176B,250B 'see':124B 'seed':277B 'separ':166B 'serv':264B 'shelf':46B 'simmer':139B 'slice':68B,169B 'soft':51B,144B 'spice':41B 'splash':95B,186B 'sprinkl':20B,281B 'squash':10B,38B,272B 'stack':278B 'stalk':90B 'stir':148B,259B 'stock':129B 'tast':248B 'thicken':242B 'thin':67B 'tomato':82B,109B 'top':45B,280B 'toss':170B 'transfer':213B 'tray':14B 'turn':57B,208B 'twice':211B 'use':32B 'veget':128B 'vine':81B 'warm':231B 'water':123B	t
93	Set a large casserole dish on a medium heat.\n\nCut the casing off the sausages, tear into small pieces and add to the hot pan with a little oil. Season the sausage with salt and pepper.\n\nFry until golden brown on the outside (you might need to do this in batches if using a small pan), whilst breaking up any large pieces of sausage in the pan. Once browned, set aside the sausage, keeping the excess fat and oil in the pan.\n\nIn the same pan with heat down to low, add a couple tablespoons of olive oil and the onion/carrot. Gently fry for 5 minutes, then add the garlic. Reduce the heat to low and let the onion and garlic soften for another 5 minutes.\n\nAdd the tomato puree and gently heat together for another 8 minutes.\n\nAdd the cooked sausage to the onion/garlic pan, along with the chopped tomatoes, a little more salt and pepper, and the fennel seeds. Half fill the chopped tomato tin with water and add this to the pan.\n\nLet this simmer on a low heat for 15 minutes - with no lid, so it reduces to a sauce thickness.\n\nCook the orecchiette as per pack instructions (11 minutes-ish, save a mug of the pasta water at the end).\n\nOnce cooked, add the pasta to the sausage ragu with a splash of the pasta water. Stir together for a minute, allowing the pasta to absorb some of the sauce. Add more pasta water if necessary.\n\nServe with grated parmesan on top. Loads of it.	0		0	f	\N	1	\N	'11':203B '15':184B '5':105B,125B '8':137B 'absorb':242B 'add':21B,92B,108B,127B,139B,171B,219B,247B 'allow':238B 'along':147B 'anoth':124B,136B 'asid':71B 'batch':51B 'break':58B 'brown':40B,69B 'case':12B 'casserol':4B 'chop':150B,165B 'cook':141B,196B,218B 'coupl':94B 'cut':10B 'dish':5B 'end':216B 'excess':76B 'fat':77B 'fennel':160B 'fill':163B 'fri':37B,103B 'garlic':110B,121B 'gentl':102B,132B 'golden':39B 'grate':255B 'half':162B 'heat':9B,88B,113B,133B,182B 'hot':24B 'instruct':202B 'ish':206B 'keep':74B 'larg':3B,61B 'let':117B,176B 'lid':188B 'littl':28B,153B 'load':259B 'low':91B,115B,181B 'medium':8B 'might':45B 'minut':106B,126B,138B,185B,205B,237B 'minutes-ish':204B 'mug':209B 'necessari':252B 'need':46B 'oil':29B,79B,98B 'oliv':97B 'onion':119B 'onion/carrot':101B 'onion/garlic':145B 'orecchiett':198B 'outsid':43B 'pack':201B 'pan':25B,56B,67B,82B,86B,146B,175B 'parmesan':256B 'pasta':212B,221B,231B,240B,249B 'pepper':36B,157B 'per':200B 'piec':19B,62B 'pure':130B 'ragu':225B 'reduc':111B,191B 'salt':34B,155B 'sauc':194B,246B 'sausag':15B,32B,64B,73B,142B,224B 'save':207B 'season':30B 'seed':161B 'serv':253B 'set':1B,70B 'simmer':178B 'small':18B,55B 'soften':122B 'splash':228B 'stir':233B 'tablespoon':95B 'tear':16B 'thick':195B 'tin':167B 'togeth':134B,234B 'tomato':129B,151B,166B 'top':258B 'use':53B 'water':169B,213B,232B,250B 'whilst':57B	t
100	Put the oil and the onion in a saucepan, and cook for 5 mins. \n\nStir in the garlic and cook for a further 1 min, then stir in the spices and butternut squash. Combine everything together.  \n\nTip in the chopped tomatoes, stock and chutney, and season well. Bring to the boil, then gently simmer for about 10 mins. Add the lentils and simmer for another 20 mins until the lentils and squash are tender. Stir in the coriander and serve with warmed naan bread.	0		0	t	\N	1	\N	'1':24B '10':57B '20':66B '5':13B 'add':59B 'anoth':65B 'boil':51B 'bread':84B 'bring':48B 'butternut':32B 'chop':40B 'chutney':44B 'combin':34B 'cook':11B,20B 'coriand':78B 'everyth':35B 'garlic':18B 'gentl':53B 'lentil':61B,70B 'min':14B,25B,58B,67B 'naan':83B 'oil':3B 'onion':6B 'put':1B 'saucepan':9B 'season':46B 'serv':80B 'simmer':54B,63B 'spice':30B 'squash':33B,72B 'stir':15B,27B,75B 'stock':42B 'tender':74B 'tip':37B 'togeth':36B 'tomato':41B 'warm':82B 'well':47B	t
105	Bring a large saucepan of water to the boil with 1/4 tsp salt for the noodles. Halve the bell pepper and discard the core and seeds. Slice into thin strips, then chop into thirds. Halve the mangetout lengthways. Trim and thinly slice the spring onion. Peel and grate the garlic (or use a garlic press).  \n\nMeanwhile, heat a drizzle of oil in a large frying pan on medium-high heat. Once hot, add the sliced pepper and season with salt and pepper. Fry until starting to soften, 3-4 mins. Add the mangetout, stirring occasionally until softened, 2-3 mins more. Stir in the garlic, cook for 1 min, then transfer the cooked veg to a medium bowl. Set aside.  \n\nIn a large bowl, add the diced chicken, cornflour and a pinch of salt and pepper. Toss to coat. IMPORTANT: Wash your hands and equipment after handling raw chicken and its packaging. Pop your (now empty) frying pan back on medium-high heat with a drizzle of oil if needed. Once hot, add the chicken. Fry until golden brown on the outside and cooked through, 8-10 mins. IMPORTANT: The chicken is cooked when no longer pink in the middle.  \n\nWhile the chicken cooks, add the noodles to the pan of boiling water. Cook until tender, 4 mins. Once cooked, drain in a sieve and run under cold water to stop them sticking together. \n \nOnce the chicken is cooked, add the cooked veg back into the pan. Lower the heat to medium, then add the ketjap manis, rice vinegar, ketchup, sugar and water for the sauce (see pantry for amounts). Stir to combine and simmer until the sauce has reduced slightly, 2-3 mins. Remove from the heat and season to taste.  \n\nAdd the cooked noodles to the chicken stir-fry and toss to coat well in the sauce. Add a splash of water if it needs loosening. Share between your bowls and sprinkle over the spring onion to finish. Enjoy!	0		0	t	\N	1	\N	'-10':189B '-3':100B,285B '-4':90B '1':109B '1/4':11B '2':99B,284B '3':89B '4':219B '8':188B 'add':74B,92B,126B,175B,207B,242B,256B,295B,313B 'amount':272B 'asid':121B 'back':160B,246B 'bell':19B 'boil':9B,214B 'bowl':119B,125B,325B 'bring':1B 'brown':181B 'chicken':129B,150B,177B,193B,205B,239B,301B 'chop':32B 'coat':140B,308B 'cold':230B 'combin':275B 'cook':107B,114B,186B,195B,206B,216B,222B,241B,244B,297B 'core':24B 'cornflour':130B 'dice':128B 'discard':22B 'drain':223B 'drizzl':59B,168B 'empti':157B 'enjoy':334B 'equip':146B 'finish':333B 'fri':65B,84B,158B,178B,304B 'garlic':50B,54B,106B 'golden':180B 'grate':48B 'halv':17B,35B 'hand':144B 'handl':148B 'heat':57B,71B,165B,252B,290B 'high':70B,164B 'hot':73B,174B 'import':141B,191B 'ketchup':262B 'ketjap':258B 'larg':3B,64B,124B 'lengthway':38B 'longer':198B 'loosen':321B 'lower':250B 'mangetout':37B,94B 'mani':259B 'meanwhil':56B 'medium':69B,118B,163B,254B 'medium-high':68B,162B 'middl':202B 'min':91B,101B,110B,190B,220B,286B 'need':172B,320B 'noodl':16B,209B,298B 'occasion':96B 'oil':61B,170B 'onion':45B,331B 'outsid':184B 'packag':153B 'pan':66B,159B,212B,249B 'pantri':270B 'peel':46B 'pepper':20B,77B,83B,137B 'pinch':133B 'pink':199B 'pop':154B 'press':55B 'raw':149B 'reduc':282B 'remov':287B 'rice':260B 'run':228B 'salt':13B,81B,135B 'sauc':268B,280B,312B 'saucepan':4B 'season':79B,292B 'see':269B 'seed':26B 'set':120B 'share':322B 'siev':226B 'simmer':277B 'slice':27B,42B,76B 'slight':283B 'soften':88B,98B 'splash':315B 'spring':44B,330B 'sprinkl':327B 'start':86B 'stick':235B 'stir':95B,103B,273B,303B 'stir-fri':302B 'stop':233B 'strip':30B 'sugar':263B 'tast':294B 'tender':218B 'thin':29B,41B 'third':34B 'togeth':236B 'toss':138B,306B 'transfer':112B 'trim':39B 'tsp':12B 'use':52B 'veg':115B,245B 'vinegar':261B 'wash':142B 'water':6B,215B,231B,265B,317B 'well':309B	t
108	Pour the water for the bulgur (see pantry for amount) into a large saucepan, stir in half the chicken stock paste and bring to the boil. Stir in the bulgur, bring back up to the boil and simmer for 1 min. Pop a lid on the pan and remove from the heat. Leave to the side for 12-15 mins or until ready to serve.  \nMeanwhile, trim the green beans, then cut into thirds. Halve the bell pepper and discard the core and seeds. Chop into 1cm chunks. Peel and grate the garlic (or use a garlic press).  \nHeat a drizzle of oil in a large frying pan on medium-high heat. Once hot, add the diced chicken, green beans and pepper chunks. Season with salt and pepper. Fry until the veg has softened and the chicken is golden brown on the outside and cooked through, 8-10 mins. IMPORTANT: Wash your hands and equipment after handling raw chicken and its packaging. It's cooked when no longer pink in the middle.  \nAdd the garlic, tomato puree and roasted spice and herb blend to the chicken pan. Cook, stirring, for 30 secs. Stir in the remaining chicken stock paste and sugar and water for the sauce (see pantry for both amounts) until combined. Bring to the boil, then turn the heat down to medium and simmer until thickened slightly, 3-4 mins.  \nMeanwhile, zest and halve the lemon. When the bulgur is cooked, stir through the lemon zest and a squeeze of juice. Reheat if needed. Add a squeeze of lemon juice to the chicken. Taste and season with more lemon juice, salt and pepper if needed. Add a splash of water if it's a little too thick.  \nShare the zesty bulgur between your bowls. Top with the saucy chicken and tuck in. Enjoy!	0		0	t	\N	1	\N	'-10':149B '-15':59B '-4':232B '1':40B '12':58B '1cm':87B '3':231B '30':192B '8':148B 'add':116B,174B,258B,279B 'amount':10B,212B 'back':32B 'bean':70B,121B 'bell':77B 'blend':184B 'boil':26B,36B,218B 'bowl':297B 'bring':23B,31B,215B 'brown':141B 'bulgur':6B,30B,242B,294B 'chicken':19B,119B,138B,160B,187B,198B,266B,302B 'chop':85B 'chunk':88B,124B 'combin':214B 'cook':146B,166B,189B,244B 'core':82B 'cut':72B 'dice':118B 'discard':80B 'drizzl':101B 'enjoy':306B 'equip':156B 'fri':107B,130B 'garlic':93B,97B,176B 'golden':140B 'grate':91B 'green':69B,120B 'half':17B 'halv':75B,237B 'hand':154B 'handl':158B 'heat':52B,99B,113B,222B 'herb':183B 'high':112B 'hot':115B 'import':151B 'juic':254B,263B,273B 'larg':13B,106B 'leav':53B 'lemon':239B,248B,262B,272B 'lid':44B 'littl':288B 'longer':169B 'meanwhil':66B,234B 'medium':111B,225B 'medium-high':110B 'middl':173B 'min':41B,60B,150B,233B 'need':257B,278B 'oil':103B 'outsid':144B 'packag':163B 'pan':47B,108B,188B 'pantri':8B,209B 'past':21B,200B 'peel':89B 'pepper':78B,123B,129B,276B 'pink':170B 'pop':42B 'pour':1B 'press':98B 'pure':178B 'raw':159B 'readi':63B 'reheat':255B 'remain':197B 'remov':49B 'roast':180B 'salt':127B,274B 'sauc':207B 'saucepan':14B 'sauci':301B 'season':125B,269B 'sec':193B 'see':7B,208B 'seed':84B 'serv':65B 'share':291B 'side':56B 'simmer':38B,227B 'slight':230B 'soften':135B 'spice':181B 'splash':281B 'squeez':252B,260B 'stir':15B,27B,190B,194B,245B 'stock':20B,199B 'sugar':202B 'tast':267B 'thick':290B 'thicken':229B 'third':74B 'tomato':177B 'top':298B 'trim':67B 'tuck':304B 'turn':220B 'use':95B 'veg':133B 'wash':152B 'water':3B,204B,283B 'zest':235B,249B 'zesti':293B	t
94	Heat the oil in a shallow saucepan or casserole dish with a lid. Tip in the onions and cook over a medium-low heat for 5 mins until softened. Add the chicken and turn up the heat to medium. Stir in the garlic, a small pinch of sugar, the oregano, cumin seeds and some seasoning. Cook for a couple of minutes, then add the chipotle and cook for a few minutes more. Pour in the passata, water and add the stock. Season and bring to a simmer.  \n\nCover with a lid and cook for 40-50 mins, stirring occasionally until the chicken is tender. Shred the chicken into the sauce using two forks, then stir through the beans. Simmer for 5 mins more, then turn off the heat. Squeeze in the lime juice. \n\nCan be kept chilled for three days and frozen for up to two months. Defrost thoroughly and reheat. \n\nServe with rice or tortilla wraps, and some coriander, feta, lime wedges and red onion on the side, if you like.	0		0	t	\N	1	\N	'-50':97B '40':96B '5':27B,122B 'add':31B,64B,80B 'bean':119B 'bring':85B 'casserol':9B 'chicken':33B,103B,108B 'chill':138B 'chipotl':66B 'cook':19B,57B,68B,94B 'coriand':161B 'coupl':60B 'cover':89B 'cumin':52B 'day':141B 'defrost':149B 'dish':10B 'feta':162B 'fork':114B 'frozen':143B 'garlic':44B 'heat':1B,25B,38B,129B 'juic':134B 'kept':137B 'lid':13B,92B 'like':173B 'lime':133B,163B 'low':24B 'medium':23B,40B 'medium-low':22B 'min':28B,98B,123B 'minut':62B,72B 'month':148B 'occasion':100B 'oil':3B 'onion':17B,167B 'oregano':51B 'passata':77B 'pinch':47B 'pour':74B 'red':166B 'reheat':152B 'rice':155B 'sauc':111B 'saucepan':7B 'season':56B,83B 'seed':53B 'serv':153B 'shallow':6B 'shred':106B 'side':170B 'simmer':88B,120B 'small':46B 'soften':30B 'squeez':130B 'stir':41B,99B,116B 'stock':82B 'sugar':49B 'tender':105B 'thorough':150B 'three':140B 'tip':14B 'tortilla':157B 'turn':35B,126B 'two':113B,147B 'use':112B 'water':78B 'wedg':164B 'wrap':158B	t
70	Heat the oil in a large non-stick flameproof casserole dish or saucepan. Fry the onions with a pinch of salt for 10 mins, or until softened. Add the garlic and fry for 1 min more. Tip in the chipotle paste, tomatoes and sugar with half a can of water. Sit the chicken thighs in the sauce. Bring to a low simmer and cook, covered, for 20-25 mins, stirring often, until the liquid has reduced slightly and the chicken is cooked through.  \n\nUsing two forks, shred the chicken and stir it back through the sauce. Season to taste. If the sauce is too thin, return to the heat and simmer for 5 mins until the sauce has reduced more. To freeze, leave to cool completely and transfer to large freezerproof bags.  \n\nTo make the salsa, combine the red onion, tomatoes, lime zest and juice, coriander leaves and stalks. Season to taste. Serve the chicken with the tomato salsa, tortilla chips, guacamole and a scattering of coriander leaves.	0		0	t	\N	1	\N	'-25':69B '1':35B '10':24B '20':68B '5':114B 'add':29B 'back':94B 'bag':133B 'bring':59B 'casserol':11B 'chicken':54B,81B,90B,156B 'chip':162B 'chipotl':41B 'combin':138B 'complet':127B 'cook':65B,83B 'cool':126B 'coriand':147B,168B 'cover':66B 'dish':12B 'flameproof':10B 'fork':87B 'freez':123B 'freezerproof':132B 'fri':15B,33B 'garlic':31B 'guacamol':163B 'half':47B 'heat':1B,110B 'juic':146B 'larg':6B,131B 'leav':124B,148B,169B 'lime':143B 'liquid':75B 'low':62B 'make':135B 'min':25B,36B,70B,115B 'non':8B 'non-stick':7B 'often':72B 'oil':3B 'onion':17B,141B 'past':42B 'pinch':20B 'red':140B 'reduc':77B,120B 'return':107B 'salsa':137B,160B 'salt':22B 'sauc':58B,97B,103B,118B 'saucepan':14B 'scatter':166B 'season':98B,151B 'serv':154B 'shred':88B 'simmer':63B,112B 'sit':52B 'slight':78B 'soften':28B 'stalk':150B 'stick':9B 'stir':71B,92B 'sugar':45B 'tast':100B,153B 'thigh':55B 'thin':106B 'tip':38B 'tomato':43B,142B,159B 'tortilla':161B 'transfer':129B 'two':86B 'use':85B 'water':51B 'zest':144B	t
96	Heat oven to 200C/180C fan/gas 6. Heat the oil in a large flameproof casserole with a lid. Fry the chicken pieces in batches for 5 mins on each side until well browned, then transfer to a plate. \n\nSizzle the bacon in the casserole for a few mins until beginning to crisp. Stir in the carrots and onions, then cook for 5 mins until starting to soften. Stir in the flour and tomato purée and cook for 1 min more. Finally, splash in the vinegar and stir well.  \n\nPour in the stock and bring to a simmer. Add the bay, cream and seasoning. Slide in the chicken pieces and scatter over the potatoes, turning everything over a few times so that the potatoes are immersed in the sauce. Put the lid on and place in the oven. After 40 mins, remove from the oven and stir in the mushrooms. Cover again and cook in the oven for 10 mins more until the chicken is cooked through and tender but not completely falling off the bone. You can now turn off the heat, and chill and freeze some or all of it (see freezing tips, below). If eating straight away, cook for 10 mins more, then sprinkle over the herbs and serve.\n\nReheating:\nIf in a suitable container, defrost in the microwave, then reheat in the microwave until piping hot. Alternatively, defrost in the fridge overnight and reheat in a casserole dish at 160C/140C fan/gas 3 for 30-40 mins until piping hot.	0		0	t	\N	1	\N	'-40':247B '1':77B '10':157B,201B '160c/140c':242B '200c/180c':4B '3':244B '30':246B '40':138B '5':25B,61B '6':6B 'add':97B 'altern':229B 'away':198B 'bacon':40B 'batch':23B 'bay':99B 'begin':49B 'bone':174B 'bring':93B 'brown':32B 'carrot':55B 'casserol':14B,43B,239B 'chicken':20B,106B,162B 'chill':183B 'complet':170B 'contain':216B 'cook':59B,75B,152B,164B,199B 'cover':149B 'cream':100B 'crisp':51B 'defrost':217B,230B 'dish':240B 'eat':196B 'everyth':114B 'fall':171B 'fan/gas':5B,243B 'final':80B 'flameproof':13B 'flour':70B 'freez':185B,192B 'fri':18B 'fridg':233B 'heat':1B,7B,181B 'herb':208B 'hot':228B,251B 'immers':124B 'larg':12B 'lid':17B,130B 'microwav':220B,225B 'min':26B,47B,62B,78B,139B,158B,202B,248B 'mushroom':148B 'oil':9B 'onion':57B 'oven':2B,136B,143B,155B 'overnight':234B 'piec':21B,107B 'pipe':227B,250B 'place':133B 'plate':37B 'potato':112B,122B 'pour':88B 'pure':73B 'put':128B 'reheat':211B,222B,236B 'remov':140B 'sauc':127B 'scatter':109B 'season':102B 'see':191B 'serv':210B 'side':29B 'simmer':96B 'sizzl':38B 'slide':103B 'soften':66B 'splash':81B 'sprinkl':205B 'start':64B 'stir':52B,67B,86B,145B 'stock':91B 'straight':197B 'suitabl':215B 'tender':167B 'time':118B 'tip':193B 'tomato':72B 'transfer':34B 'turn':113B,178B 'vinegar':84B 'well':31B,87B	t
106	Preheat your oven to 220°C/200°C fan/gas mark 7. Pour the water for the rice (see pantry for amount) into a medium saucepan with a tight-fitting lid. Stir in the rice and 1/4 tsp salt and bring to the boil. Once boiling, turn the heat down to medium and cover with the lid. Leave to cook for 10 mins, then remove the pan from the heat (still covered) and leave to the side for another 10 mins or until ready to serve (the rice will continue to cook in its own steam). \n \nMeanwhile, trim the butternut squash, halve lengthways, then scoop out the seeds (peel first if you prefer). Cut into 2cm chunks. Pop the diced butternut onto a large baking tray. Drizzle with oil, season with salt and pepper, then sprinkle over the Thai style spice blend. Toss to coat, then spread out in a single layer and sprinkle over the black sesame seeds. TIP: Use two baking trays if necessary. When the oven is hot, roast on the top shelf until golden and cooked through, 25-30 mins. Turn halfway through.  \n\nMeanwhile, halve, peel and thinly slice the shallot. Peel and grate the garlic (or use a garlic press). Zest and cut the lime into wedges (see ingredients for amount).  \n\nHeat a drizzle of oil in a large frying pan on medium-high heat. Once hot, add the shallot and cook until softened, 3-4 mins. Add the garlic and Thai green curry paste. Fry, stirring, for 30 secs. Stir in the vegetable stock paste, coconut milk and water for the sauce (see pantry for amount). Bring to a boil, then turn the heat down to medium and simmer, stirring occasionally, until thickened, 4-5 mins.  \n\nOnce the rice is cooked, fluff up the rice using a fork. Stir through the lime zest and peas. Once the curry sauce has thickened, taste and season with salt, pepper and sugar (if you have any) if needed. Remove from the heat and add a squeeze of lime juice. Add half of the roasted black sesame butternut to the curry and stir until coated, adding a splash of water if it's a little too thick.  \nShare the zesty pea rice between your bowls. Spoon the Thai green style curry over the rice and top with the remaining roasted black sesame butternut. Serve with any remaining lime wedges for squeezing over. Enjoy!	0		0	t	\N	1	\N	'-30':182B '-4':241B '-5':291B '1/4':36B '10':61B,79B '220':5B '25':181B '2cm':115B '3':240B '30':254B '4':290B '7':10B 'ad':358B 'add':233B,243B,337B,343B 'amount':20B,215B,272B 'anoth':78B 'bake':124B,162B 'black':156B,348B,393B 'blend':141B 'boil':43B,45B,276B 'bowl':377B 'bring':40B,273B 'butternut':99B,120B,350B,395B 'c':7B 'c/200':6B 'chunk':116B 'coat':144B,357B 'coconut':262B 'continu':89B 'cook':59B,91B,179B,237B,297B 'cover':53B,71B 'curri':249B,314B,353B,383B 'cut':113B,207B 'dice':119B 'drizzl':126B,218B 'enjoy':405B 'fan/gas':8B 'first':109B 'fit':29B 'fluff':298B 'fork':304B 'fri':224B,251B 'garlic':199B,203B,245B 'golden':177B 'grate':197B 'green':248B,381B 'half':344B 'halfway':185B 'halv':101B,188B 'heat':48B,69B,216B,230B,280B,335B 'high':229B 'hot':170B,232B 'ingredi':213B 'juic':342B 'larg':123B,223B 'layer':151B 'leav':57B,73B 'lengthway':102B 'lid':30B,56B 'lime':209B,308B,341B,400B 'littl':367B 'mark':9B 'meanwhil':96B,187B 'medium':23B,51B,228B,283B 'medium-high':227B 'milk':263B 'min':62B,80B,183B,242B,292B 'necessari':165B 'need':331B 'occasion':287B 'oil':128B,220B 'onto':121B 'oven':3B,168B 'pan':66B,225B 'pantri':18B,270B 'past':250B,261B 'pea':311B,373B 'peel':108B,189B,195B 'pepper':133B,323B 'pop':117B 'pour':11B 'prefer':112B 'preheat':1B 'press':204B 'readi':83B 'remain':391B,399B 'remov':64B,332B 'rice':16B,34B,87B,295B,301B,374B,386B 'roast':171B,347B,392B 'salt':38B,131B,322B 'sauc':268B,315B 'saucepan':24B 'scoop':104B 'season':129B,320B 'sec':255B 'see':17B,212B,269B 'seed':107B,158B 'serv':85B,396B 'sesam':157B,349B,394B 'shallot':194B,235B 'share':370B 'shelf':175B 'side':76B 'simmer':285B 'singl':150B 'slice':192B 'soften':239B 'spice':140B 'splash':360B 'spoon':378B 'spread':146B 'sprinkl':135B,153B 'squash':100B 'squeez':339B,403B 'steam':95B 'still':70B 'stir':31B,252B,256B,286B,305B,355B 'stock':260B 'style':139B,382B 'sugar':325B 'tast':318B 'thai':138B,247B,380B 'thick':369B 'thicken':289B,317B 'thin':191B 'tight':28B 'tight-fit':27B 'tip':159B 'top':174B,388B 'toss':142B 'tray':125B,163B 'trim':97B 'tsp':37B 'turn':46B,184B,278B 'two':161B 'use':160B,201B,302B 'veget':259B 'water':13B,265B,362B 'wedg':211B,401B 'zest':205B,309B 'zesti':372B	t
111	Pour the water for the rice (see pantry for amount) into a medium saucepan with a tight-fitting lid. Stir in the rice and 1/4 tsp salt and bring to the boil. Once boiling, turn the heat down to medium and cover with the lid. Leave to cook for 10 mins, then remove the pan from the heat (still covered) and leave to the side for another 10 mins or until ready to serve (the rice will continue to cook in its own steam).  \nMeanwhile, halve, peel and chop the shallot into small pieces. Peel and grate the garlic (or use a garlic press). Halve the red chilli lengthways, deseed and finely chop. Trim the pak choi, then separate the leaves. Cut each leaf in half lengthways down the middle.  \nHeat a drizzle of oil in a frying pan on medium-high heat. Once hot, add the pork mince and fry until browned, 5-6 mins. Use a spoon to break it up as it cooks, then drain and discard any excess fat. IMPORTANT: Wash your hands and equipment after handling raw mince. It's cooked when no longer pink in the middle.  \nOnce the mince has browned, add the pak choi and stir-fry until just soft, 3-4 mins. Add the shallot, garlic and as much chilli as you'd like (add less if you'd prefer things milder). Cook until fragrant, another 2-3 mins.  \nAdd the ketjap manis and soy sauce, then stir everything together until piping hot. Remove from the heat. Add a splash of water if it's a little thick.  \nFluff up the rice with a fork and share between your bowls. Top with the Thai style beef stir-fry. Enjoy!\n\n\nCan be done with pork mince	0		0	t	\N	1	\N	'-3':240B '-4':213B '-6':157B '1/4':26B '10':51B,69B '2':239B '3':212B '5':156B 'add':148B,201B,215B,227B,242B,260B 'amount':10B 'anoth':68B,238B 'beef':288B 'boil':33B,35B 'bowl':282B 'break':163B 'bring':30B 'brown':155B,200B 'chilli':109B,222B 'choi':118B,204B 'chop':90B,114B 'continu':79B 'cook':49B,81B,168B,188B,235B 'cover':43B,61B 'cut':123B 'd':225B,231B 'dese':111B 'discard':172B 'done':295B 'drain':170B 'drizzl':134B 'enjoy':292B 'equip':181B 'everyth':251B 'excess':174B 'fat':175B 'fine':113B 'fit':19B 'fluff':271B 'fork':277B 'fragrant':237B 'fri':139B,153B,208B,291B 'garlic':100B,104B,218B 'grate':98B 'half':127B 'halv':87B,106B 'hand':179B 'handl':183B 'heat':38B,59B,132B,145B,259B 'high':144B 'hot':147B,255B 'import':176B 'ketjap':244B 'leaf':125B 'leav':47B,63B,122B 'lengthway':110B,128B 'less':228B 'lid':20B,46B 'like':226B 'littl':269B 'longer':191B 'mani':245B 'meanwhil':86B 'medium':13B,41B,143B 'medium-high':142B 'middl':131B,195B 'milder':234B 'min':52B,70B,158B,214B,241B 'minc':151B,185B,198B,298B 'much':221B 'oil':136B 'pak':117B,203B 'pan':56B,140B 'pantri':8B 'peel':88B,96B 'piec':95B 'pink':192B 'pipe':254B 'pork':150B,297B 'pour':1B 'prefer':232B 'press':105B 'raw':184B 'readi':73B 'red':108B 'remov':54B,256B 'rice':6B,24B,77B,274B 'salt':28B 'sauc':248B 'saucepan':14B 'see':7B 'separ':120B 'serv':75B 'shallot':92B,217B 'share':279B 'side':66B 'small':94B 'soft':211B 'soy':247B 'splash':262B 'spoon':161B 'steam':85B 'still':60B 'stir':21B,207B,250B,290B 'stir-fri':206B,289B 'style':287B 'thai':286B 'thick':270B 'thing':233B 'tight':18B 'tight-fit':17B 'togeth':252B 'top':283B 'trim':115B 'tsp':27B 'turn':36B 'use':102B,159B 'wash':177B 'water':3B,264B	t
71	To make the fajita mix, take two or three strips from each colour of pepper and finely chop them. Set aside. Heat the oil in a frying pan and fry the remaining pepper strips and the onion until soft and starting to brown at the edges. Cool slightly and mix in the chopped raw peppers. Add the garlic and cook for 1 min, then add the spices and stir. Cook for a couple of mins more until the spices become aromatic, then add half the lime juice and season. Transfer to a dish, leaving any juices behind, and keep warm. \n \nTip the black beans into the same pan, then add the remaining lime juice and plenty of seasoning. Stir the beans around the pan to warm them through and help them absorb any flavours of the fajita mix, then stir through the coriander.  \n\nWarm the tortillas in a microwave or in a low oven, then wrap them so they don’t dry out. Serve the tortillas with the fajita mix, beans, avocado and soured cream for everyone to help themselves.	0		0	t	\N	1	\N	'1':62B 'absorb':132B 'add':56B,65B,83B,110B 'aromat':81B 'around':122B 'asid':21B 'avocado':172B 'bean':104B,121B,171B 'becom':80B 'behind':97B 'black':103B 'brown':43B 'chop':18B,53B 'colour':13B 'cook':60B,70B 'cool':47B 'coriand':143B 'coupl':73B 'cream':175B 'dish':93B 'dri':162B 'edg':46B 'everyon':177B 'fajita':4B,137B,169B 'fine':17B 'flavour':134B 'fri':27B,30B 'garlic':58B 'half':84B 'heat':22B 'help':130B,179B 'juic':87B,96B,114B 'keep':99B 'leav':94B 'lime':86B,113B 'low':153B 'make':2B 'microwav':149B 'min':63B,75B 'mix':5B,50B,138B,170B 'oil':24B 'onion':37B 'oven':154B 'pan':28B,108B,124B 'pepper':15B,33B,55B 'plenti':116B 'raw':54B 'remain':32B,112B 'season':89B,118B 'serv':164B 'set':20B 'slight':48B 'soft':39B 'sour':174B 'spice':67B,79B 'start':41B 'stir':69B,119B,140B 'strip':10B,34B 'take':6B 'three':9B 'tip':101B 'tortilla':146B,166B 'transfer':90B 'two':7B 'warm':100B,126B,144B 'wrap':156B	t
72	Heat oven to 180C/160C fan/gas 4. Heat the oil in a casserole and brown the lamb on all sides. Scoop the lamb out onto a plate, then add the onion and carrots and cook for 2-3 mins until golden. Add the garlic and cook for 1 min more. Stir in the spices and tomatoes, and season. Tip the lamb back in with the chickpeas and apricots. Pour over the stock, stir and bring to a simmer. Cover the dish and place in the oven for 1 hr. \n \nIf the lamb is still a little tough, give it 20 mins more until tender. When ready, leave it to rest so it’s not piping hot, then serve scattered with pomegranate and herbs, with couscous or rice alongside.	0		0	t	\N	1	\N	'-3':37B '1':47B,87B '180c/160c':4B '2':36B '20':99B '4':6B 'add':28B,41B 'alongsid':127B 'apricot':67B 'back':61B 'bring':74B 'brown':14B 'carrot':32B 'casserol':12B 'chickpea':65B 'cook':34B,45B 'couscous':124B 'cover':78B 'dish':80B 'fan/gas':5B 'garlic':43B 'give':97B 'golden':40B 'heat':1B,7B 'herb':122B 'hot':115B 'hr':88B 'lamb':16B,22B,60B,91B 'leav':106B 'littl':95B 'min':38B,48B,100B 'oil':9B 'onion':30B 'onto':24B 'oven':2B,85B 'pipe':114B 'place':82B 'plate':26B 'pomegran':120B 'pour':68B 'readi':105B 'rest':109B 'rice':126B 'scatter':118B 'scoop':20B 'season':57B 'serv':117B 'side':19B 'simmer':77B 'spice':53B 'still':93B 'stir':50B,72B 'stock':71B 'tender':103B 'tip':58B 'tomato':55B 'tough':96B	t
74	Cook the fusilli following pack instructions, then drain well.  \n\nHeat the oven to 190C/fan 170C/gas 5. Heat the olive oil in a pan and cook the onion for 10 minutes until softened a little. Add the garlic and chilli flakes, and cook for 3 minutes. Add the tomatoes and half a tin of water, then simmer for 10 minutes. Season.  \n\nStir the tuna into the sauce with the rosemary (if using) and drained pasta, and tip into a 26cm x 18cm baking dish. Scatter over the cheese then bake for 20-25 minutes or until piping hot and bubbling.	0		0	t	\N	1	\N	'-25':92B '10':29B,58B '170c/gas':15B '18cm':81B '190c/fan':14B '20':91B '26cm':79B '3':44B '5':16B 'add':35B,46B 'bake':82B,89B 'bubbl':99B 'chees':87B 'chilli':39B 'cook':1B,25B,42B 'dish':83B 'drain':8B,73B 'flake':40B 'follow':4B 'fusilli':3B 'garlic':37B 'half':50B 'heat':10B,17B 'hot':97B 'instruct':6B 'littl':34B 'minut':30B,45B,59B,93B 'oil':20B 'oliv':19B 'onion':27B 'oven':12B 'pack':5B 'pan':23B 'pasta':74B 'pipe':96B 'rosemari':69B 'sauc':66B 'scatter':84B 'season':60B 'simmer':56B 'soften':32B 'stir':61B 'tin':52B 'tip':76B 'tomato':48B 'tuna':63B 'use':71B 'water':54B 'well':9B 'x':80B	t
79	Heat the olive oil in a frying pan and fry the onions until softened but not coloured. Add the cumin and cook for 1 min, then scrape the mixture into a food processor with the chickpeas, two-thirds of the grated beetroot, the breadcrumbs, egg and tahini. Whizz to a rough paste, then scrape into a bowl and stir in the remaining grated beetroot with plenty of seasoning. \n \nWith damp hands, shape into about 20 balls and space on baking parchment-lined baking sheets. Chill until ready to serve. \n \nHeat oven to 200C/180C fan/gas 6. Brush the falafels with a little vegetable oil and bake for 20-25 mins until crisp and hot through. Alternatively, heat 2.5cm oil in a deep wok and fry in batches, turning, until crisp and hot.  \n\nTo serve, mix the tahini with the yogurt, sugar and some seasoning, then dollop onto the flatbreads with the warm or room-temperature falafels, diced beetroot and beet leaves or salad.	0		0	t	\N	1	\N	'-25':110B '1':24B '2.5':119B '20':76B,109B '200c/180c':95B '6':97B 'add':18B 'altern':117B 'bake':81B,85B,107B 'ball':77B 'batch':129B 'beet':163B 'beetroot':43B,65B,161B 'bowl':58B 'breadcrumb':45B 'brush':98B 'chickpea':36B 'chill':87B 'cm':120B 'colour':17B 'cook':22B 'crisp':113B,132B 'cumin':20B 'damp':71B 'deep':124B 'dice':160B 'dollop':148B 'egg':46B 'falafel':100B,159B 'fan/gas':96B 'flatbread':151B 'food':32B 'fri':7B,10B,127B 'grate':42B,64B 'hand':72B 'heat':1B,92B,118B 'hot':115B,134B 'leav':164B 'line':84B 'littl':103B 'min':25B,111B 'mix':137B 'mixtur':29B 'oil':4B,105B,121B 'oliv':3B 'onion':12B 'onto':149B 'oven':93B 'pan':8B 'parchment':83B 'parchment-lin':82B 'past':53B 'plenti':67B 'processor':33B 'readi':89B 'remain':63B 'room':157B 'room-temperatur':156B 'rough':52B 'salad':166B 'scrape':27B,55B 'season':69B,146B 'serv':91B,136B 'shape':73B 'sheet':86B 'soften':14B 'space':79B 'stir':60B 'sugar':143B 'tahini':48B,139B 'temperatur':158B 'third':39B 'turn':130B 'two':38B 'two-third':37B 'veget':104B 'warm':154B 'whizz':49B 'wok':125B 'yogurt':142B	t
77	Heat 2 tbsp of the oil in a saucepan over a medium heat. Fry the onion with a pinch of salt for 7 mins. Add the garlic, chilli and rosemary, and cook for 1 min more. Tip in the tomatoes and sugar, and simmer for 20 mins.  \n\nHeat the remaining oil in a medium frying pan over a medium heat. Squeeze the sausagemeat from the skins and fry, breaking it up with a wooden spoon, for 5-7 mins until golden. Add to the sauce with the milk and lemon zest, then simmer for a further 5 mins. To freeze, leave to cool completely and transfer to large freezerproof bags.  \n\nCook the pasta following pack instructions. Drain and toss with the sauce. Scatter over the parmesan and parsley leaves to serve.	0		0	t	\N	1	\N	'-7':78B '1':34B '2':2B '20':46B '5':77B,97B '7':23B 'add':25B,82B 'bag':110B 'break':69B 'chilli':28B 'complet':104B 'cook':32B,111B 'cool':103B 'drain':117B 'follow':114B 'freez':100B 'freezerproof':109B 'fri':14B,55B,68B 'garlic':27B 'golden':81B 'heat':1B,13B,48B,60B 'instruct':116B 'larg':108B 'leav':101B,129B 'lemon':90B 'medium':12B,54B,59B 'milk':88B 'min':24B,35B,47B,79B,98B 'oil':6B,51B 'onion':16B 'pack':115B 'pan':56B 'parmesan':126B 'parsley':128B 'pasta':113B 'pinch':19B 'remain':50B 'rosemari':30B 'salt':21B 'sauc':85B,122B 'saucepan':9B 'sausagemeat':63B 'scatter':123B 'serv':131B 'simmer':44B,93B 'skin':66B 'spoon':75B 'squeez':61B 'sugar':42B 'tbsp':3B 'tip':37B 'tomato':40B 'toss':119B 'transfer':106B 'wooden':74B 'zest':91B	t
95	Heat 2 tbsp of the oil in a saucepan over a medium heat. Fry the onion with a pinch of salt for 7 mins. Add the garlic, chilli and rosemary, and cook for 1 min more. Tip in the tomatoes and sugar, and simmer for 20 mins.  \n\nHeat the remaining oil in a medium frying pan over a medium heat. Squeeze the sausagemeat from the skins and fry, breaking it up with a wooden spoon, for 5-7 mins until golden. Add to the sauce with the milk and lemon zest, then simmer for a further 5 mins. To freeze, leave to cool completely and transfer to large freezerproof bags.  \n\nCook the pasta following pack instructions. Drain and toss with the sauce. Scatter over the parmesan and parsley leaves to serve.	0		0	t	\N	1	\N	'-7':78B '1':34B '2':2B '20':46B '5':77B,97B '7':23B 'add':25B,82B 'bag':110B 'break':69B 'chilli':28B 'complet':104B 'cook':32B,111B 'cool':103B 'drain':117B 'follow':114B 'freez':100B 'freezerproof':109B 'fri':14B,55B,68B 'garlic':27B 'golden':81B 'heat':1B,13B,48B,60B 'instruct':116B 'larg':108B 'leav':101B,129B 'lemon':90B 'medium':12B,54B,59B 'milk':88B 'min':24B,35B,47B,79B,98B 'oil':6B,51B 'onion':16B 'pack':115B 'pan':56B 'parmesan':126B 'parsley':128B 'pasta':113B 'pinch':19B 'remain':50B 'rosemari':30B 'salt':21B 'sauc':85B,122B 'saucepan':9B 'sausagemeat':63B 'scatter':123B 'serv':131B 'simmer':44B,93B 'skin':66B 'spoon':75B 'squeez':61B 'sugar':42B 'tbsp':3B 'tip':37B 'tomato':40B 'toss':119B 'transfer':106B 'wooden':74B 'zest':91B	t
78	Put the chicken breasts between two pieces of baking parchment and bash with a rolling pin until 1cm thick. Cut each into two even pieces.  \n\nHeat two frying pans over a medium-high heat, heating the oil in one. Fry the chicken in the oiled pan for 3-4 mins on each side until cooked through. Season. Reduce the heat, drizzle in the chilli sauce and half the lemon juice and cook for 1-2 mins more until the sauce is reduced. Remove from the heat. \n \nWhile the chicken cooks, toast the buns in the dry frying pan for 30 secs. Transfer to a plate, then fry the halloumi in the pan (add a bit of oil if the pan is not non-stick) for 30 secs on each side until golden. Toss the cabbage with the mayo and remaining lemon juice.  \n\nSpoon the hummus (or dip of your choice) into the toasted buns, then top with the rocket, chilli chicken, halloumi and peppers. Drizzle with a little more chilli sauce, spoon over the cabbage, season with black pepper, and top with the bun lids. Serve with any extra cabbage on the side, or a green salad.	0		0	t	\N	1	\N	'-2':76B '-4':50B '1':75B '1cm':18B '3':49B '30':101B,128B 'add':114B 'bake':9B 'bash':12B 'bit':116B 'black':180B 'breast':4B 'bun':94B,156B,186B 'cabbag':137B,177B,192B 'chicken':3B,43B,90B,163B 'chilli':65B,162B,172B 'choic':152B 'cook':56B,73B,91B 'cut':20B 'dip':149B 'dri':97B 'drizzl':62B,167B 'even':24B 'extra':191B 'fri':28B,41B,98B,108B 'golden':134B 'green':198B 'half':68B 'halloumi':110B,164B 'heat':26B,35B,36B,61B,87B 'high':34B 'hummus':147B 'juic':71B,144B 'lemon':70B,143B 'lid':187B 'littl':170B 'mayo':140B 'medium':33B 'medium-high':32B 'min':51B,77B 'non':125B 'non-stick':124B 'oil':38B,46B,118B 'one':40B 'pan':29B,47B,99B,113B,121B 'parchment':10B 'pepper':166B,181B 'piec':7B,25B 'pin':16B 'plate':106B 'put':1B 'reduc':59B,83B 'remain':142B 'remov':84B 'rocket':161B 'roll':15B 'salad':199B 'sauc':66B,81B,173B 'season':58B,178B 'sec':102B,129B 'serv':188B 'side':54B,132B,195B 'spoon':145B,174B 'stick':126B 'thick':19B 'toast':92B,155B 'top':158B,183B 'toss':135B 'transfer':103B 'two':6B,23B,27B	t
101	Heat the oil in a large, shallow casserole dish or deep frying pan. Add the meatballs and fry for 3-4 mins, turning regularly, until golden. Remove and set aside.  \n\nTip the onion into the pan and fry for 7 mins until softened. Stir through the garlic cumin, coriander and cinnamon, and cook for 1 min. Add the harissa, tomatoes and lamb stock, and bring to a simmer. Stir though the chickpeas and meatballs, season and simmer for 10-15 mins until slightly reduced and the meatballs are cooked through.  \n\nStir through half the herbs, then scatter the rest on top along with the pomegranate seeds.	0		0	t	\N	1	\N	'-15':80B '-4':21B '1':55B '10':79B '3':20B '7':40B 'add':14B,57B 'along':102B 'asid':30B 'bring':65B 'casserol':8B 'chickpea':72B 'cinnamon':51B 'cook':53B,89B 'coriand':49B 'cumin':48B 'deep':11B 'dish':9B 'fri':12B,18B,38B 'garlic':47B 'golden':26B 'half':93B 'harissa':59B 'heat':1B 'herb':95B 'lamb':62B 'larg':6B 'meatbal':16B,74B,87B 'min':22B,41B,56B,81B 'oil':3B 'onion':33B 'pan':13B,36B 'pomegran':105B 'reduc':84B 'regular':24B 'remov':27B 'rest':99B 'scatter':97B 'season':75B 'seed':106B 'set':29B 'shallow':7B 'simmer':68B,77B 'slight':83B 'soften':43B 'stir':44B,69B,91B 'stock':63B 'though':70B 'tip':31B 'tomato':60B 'top':101B 'turn':23B	t
80	For the sauce, start to soften the onions, garlic and ginger. Then add curry powder, turmeric. Allow to sit on a low to medium heat. Add the flour, cook for 1 minute with the spices. Add the chicken stock slowly, followed by the 100ml coconut milk. Add pinch of sugar, salt and dash of soy sauce.  \n\nSplit chicken fillets in half and coat in flour. Soak each one in egg, then dip into breadcrumbs. Make sure all sides of the chicken are covered, then put into the pan. Cook fillets until golden brown.  \n\nStrain curry sauce through a sieve, a little bit at a time.  \n\nSlice the chicken into lengths and plate up next to the rice. Add salad, or wok-fried greens to the plate alongside, then drench in curry sauce. Serve hot and enjoy!	0		0	t	\N	1	\N	'1':31B '100ml':44B 'add':13B,26B,36B,47B,118B 'allow':17B 'alongsid':128B 'bit':102B 'breadcrumb':74B 'brown':93B 'chicken':38B,58B,81B,108B 'coat':63B 'coconut':45B 'cook':29B,89B 'cover':83B 'curri':14B,95B,132B 'dash':53B 'dip':72B 'drench':130B 'egg':70B 'enjoy':137B 'fillet':59B,90B 'flour':28B,65B 'follow':41B 'fri':123B 'garlic':9B 'ginger':11B 'golden':92B 'green':124B 'half':61B 'heat':25B 'hot':135B 'length':110B 'littl':101B 'low':22B 'make':75B 'medium':24B 'milk':46B 'minut':32B 'next':114B 'one':68B 'onion':8B 'pan':88B 'pinch':48B 'plate':112B,127B 'powder':15B 'put':85B 'rice':117B 'salad':119B 'salt':51B 'sauc':3B,56B,96B,133B 'serv':134B 'side':78B 'siev':99B 'sit':19B 'slice':106B 'slowli':40B 'soak':66B 'soften':6B 'soy':55B 'spice':35B 'split':57B 'start':4B 'stock':39B 'strain':94B 'sugar':50B 'sure':76B 'time':105B 'turmer':16B 'wok':122B 'wok-fri':121B	t
102	Heat the vegetable oil and butter in a large, lidded casserole on the hob, then add the onions and a pinch of salt. Cook for 15-20 mins until soft and golden.  \n\nAdd the tikka masala paste and peppers, then cook for 5 mins more to cook out the rawness of the spices.  \n\nAdd the chicken breasts and stir well to coat in the paste. Cook for 2 mins, then tip in the chopped tomatoes, tomato purée and 200ml water. Cover with a lid and gently simmer for 15 mins, stirring occasionally, until the chicken is cooked through.  \n\nRemove the lid, stir through the mango chutney, double cream and natural yogurt, then gently warm through. Season, then set aside whatever you want to freeze. Will keep, in an airtight container, in the freezer for up to three months. Scatter the rest with coriander leaves and serve with basmati rice and naan bread.	0		0	t	\N	1	\N	'-20':27B '15':26B,89B '2':68B '200ml':79B '5':43B 'add':16B,33B,54B 'airtight':129B 'asid':119B 'basmati':148B 'bread':152B 'breast':57B 'butter':6B 'casserol':11B 'chicken':56B,95B 'chop':74B 'chutney':106B 'coat':62B 'contain':130B 'cook':24B,41B,47B,66B,97B 'coriand':143B 'cover':81B 'cream':108B 'doubl':107B 'freez':124B 'freezer':133B 'gentl':86B,113B 'golden':32B 'heat':1B 'hob':14B 'keep':126B 'larg':9B 'leav':144B 'lid':10B,84B,101B 'mango':105B 'masala':36B 'min':28B,44B,69B,90B 'month':138B 'naan':151B 'natur':110B 'occasion':92B 'oil':4B 'onion':18B 'past':37B,65B 'pepper':39B 'pinch':21B 'pure':77B 'raw':50B 'remov':99B 'rest':141B 'rice':149B 'salt':23B 'scatter':139B 'season':116B 'serv':146B 'set':118B 'simmer':87B 'soft':30B 'spice':53B 'stir':59B,91B,102B 'three':137B 'tikka':35B 'tip':71B 'tomato':75B,76B 'veget':3B 'want':122B 'warm':114B 'water':80B 'well':60B 'whatev':120B 'yogurt':111B	t
81	Preheat the oven to 220C/200C Fan/Gas 7.  \n\nSpread the vegetables across a large baking tray and toss with the oil and a generous amount of salt and pepper. Roast for 25 minutes, or until the vegetables are slightly browned and tender.  \n\nHeat the grill to it's highest setting.  \n\nRemove the tray from the oven and give it a big toss. Lay the halloumi slices on top of the vegetables, seasoning each with black pepper and an extra drizzle of olive oil.  \n\nTransfer the tray to the grill and cook for a further 5 minutes, or until the cheese has just started to turn golden brown.  \n\nRoughly tear the basil leaves and scatter over the halloumi bake just before serving.	0		0	t	\N	1	\N	'220c/200c':5B '25':31B '5':94B '7':7B 'across':11B 'amount':24B 'bake':14B,117B 'basil':110B 'big':60B 'black':74B 'brown':39B,106B 'chees':99B 'cook':90B 'drizzl':79B 'extra':78B 'fan/gas':6B 'generous':23B 'give':57B 'golden':105B 'grill':44B,88B 'halloumi':64B,116B 'heat':42B 'highest':48B 'larg':13B 'lay':62B 'leav':111B 'minut':32B,95B 'oil':20B,82B 'oliv':81B 'oven':3B,55B 'pepper':28B,75B 'preheat':1B 'remov':50B 'roast':29B 'rough':107B 'salt':26B 'scatter':113B 'season':71B 'serv':120B 'set':49B 'slice':65B 'slight':38B 'spread':8B 'start':102B 'tear':108B 'tender':41B 'top':67B 'toss':17B,61B 'transfer':83B 'tray':15B,52B,85B 'turn':104B 'veget':10B,36B,70B	t
83	Tip the onions and celery into a food processor and blitz until roughly chopped. Heat a saute pan until hot, add the olive oil and chopped onions and celery and fry over a medium heat for 3-4 minutes until just softening, stirring occasionally.\n\nMeanwhile, tip the garlic, carrots and courgettes into the processor and blitz until they are roughly chopped too. Add them to the pan and cook for another 2-3 minutes.\n\nAdd the oregano and tomato puree to the pan and mix well, then tip in the tomatoes and bring to the boil. Reduce the heat and simmer, uncovered, for 10 minutes until all the vegetables are tender, stirring occasionally. Season.\n\nRemove from the heat and either carefully decant in batches into a blender, or use a hand-held stick blender in the pan, and blitz to a fine puree.\n\nSet aside to cool, then decant any passata you're not using straightaway for the fridge/freezer.	0		0	f	\N	1	\N	'-3':73B '-4':38B '10':104B '2':72B '3':37B 'add':21B,63B,75B 'anoth':71B 'asid':146B 'batch':124B 'blender':127B,135B 'blitz':11B,56B,140B 'boil':96B 'bring':93B 'care':121B 'carrot':49B 'celeri':5B,29B 'chop':14B,26B,61B 'cook':69B 'cool':148B 'courgett':51B 'decant':122B,150B 'either':120B 'fine':143B 'food':8B 'fri':31B 'fridge/freezer':160B 'garlic':48B 'hand':132B 'hand-held':131B 'heat':15B,35B,99B,118B 'held':133B 'hot':20B 'meanwhil':45B 'medium':34B 'minut':39B,74B,105B 'mix':85B 'occasion':44B,113B 'oil':24B 'oliv':23B 'onion':3B,27B 'oregano':77B 'pan':18B,67B,83B,138B 'passata':152B 'processor':9B,54B 'pure':80B,144B 're':154B 'reduc':97B 'remov':115B 'rough':13B,60B 'saut':17B 'season':114B 'set':145B 'simmer':101B 'soften':42B 'stick':134B 'stir':43B,112B 'straightaway':157B 'tender':111B 'tip':1B,46B,88B 'tomato':79B,91B 'uncov':102B 'use':129B,156B 'veget':109B 'well':86B	t
97	Heat the oil in a large saucepan and add the onions, carrots, celery and garlic. Cook gently for 15-20 mins until everything is softened. Stir in the lentils, chopped tomatoes, tomato purée, herbs and stock. Bring to a simmer, then cook for 40-50 mins until the lentils are tender and saucy – splash in water if you need. Season.  \n\nIf eating straight away, keep on a low heat while you cook the spaghetti, following pack instructions. Drain well, divide between pasta bowls or plates, spoon sauce over the top and grate over some cheese. \n\nAlternatively, cool the sauce and chill for up to 3 days. Or freeze for up to 3 months. Simply defrost portions overnight at room temperature, then reheat gently to serve.	0		0	t	\N	1	\N	'-20':20B '-50':45B '15':19B '3':105B,112B '40':44B 'add':9B 'altern':96B 'away':64B 'bowl':83B 'bring':37B 'carrot':12B 'celeri':13B 'chees':95B 'chill':101B 'chop':30B 'cook':16B,42B,72B 'cool':97B 'day':106B 'defrost':115B 'divid':80B 'drain':78B 'eat':62B 'everyth':23B 'follow':75B 'freez':108B 'garlic':15B 'gentl':17B,123B 'grate':92B 'heat':1B,69B 'herb':34B 'instruct':77B 'keep':65B 'larg':6B 'lentil':29B,49B 'low':68B 'min':21B,46B 'month':113B 'need':59B 'oil':3B 'onion':11B 'overnight':117B 'pack':76B 'pasta':82B 'plate':85B 'portion':116B 'pure':33B 'reheat':122B 'room':119B 'sauc':87B,99B 'saucepan':7B 'sauci':53B 'season':60B 'serv':125B 'simmer':40B 'simpli':114B 'soften':25B 'spaghetti':74B 'splash':54B 'spoon':86B 'stir':26B 'stock':36B 'straight':63B 'temperatur':120B 'tender':51B 'tomato':31B,32B 'top':90B 'water':56B 'well':79B	t
82	Begin by preparing all the ingredients.\n\nRemove the skin from the chorizo and slice it into ¼ inch (5 mm) rounds. The onion needs to be peeled, sliced in half and then each half sliced as thinly as possible so you end up with little half-moon shapes. Remove the stalk from the pepper and then halve it, scooping out the seeds. Slice it first into quarters and then each quarter into thin slices. The tomatoes need to be skinned, so pour boiling water over them, leave for 30 seconds, then drain and slip off their skins. Slice each tomato in half, squeeze each half gently to remove the seeds, then chop the flesh into small cubes. Peel and finely chop the garlic. You can watch how to skin tomatoes in our Cookery School Video\n\nNext take a large, heavy-based frying pan, place it over a high heat and add the olive oil. When the oil is really hot, brown the chorizo pieces, tossing and turning them around until they turn slightly brown at the edges. Using a slotted spoon, transfer the chorizo from the pan to a plate. Next add the onion and pepper to the pan and toss these around, keeping the heat high, until they're nicely tinged brown at the edges and softened, which will take 5-10 minutes. Now add the tomatoes and garlic and cook for 1 minute more, then return the chorizo to join the rest of the ingredients. Finally, give everything a good mix and season with salt and freshly milled black pepper.\n\nThen remove the pan from the heat and divide the mixture between the two gratin dishes. Carefully break two eggs side by side on top of the mixture in each dish, season them, then sprinkle them with the grated cheese. Place the dishes on the baking sheet on the top shelf of the oven to cook for 12-15 minutes (or a little longer, depending on how you like your eggs). I think this needs some quite robust red wine and some warm crusty baguette served alongside.	0		0	t	\N	1	\N	'-10':225B '-15':323B '1':236B '1/4':17B '12':322B '30':90B '5':19B,224B 'add':153B,194B,228B 'alongsid':351B 'around':171B,205B 'baguett':349B 'bake':310B 'base':143B 'begin':1B 'black':263B 'boil':84B 'break':282B 'brown':163B,176B,215B 'care':281B 'chees':304B 'chop':113B,122B 'chorizo':12B,165B,186B,242B 'cook':234B,320B 'cookeri':134B 'crusti':348B 'cube':118B 'depend':329B 'dish':280B,295B,307B 'divid':273B 'drain':93B 'edg':179B,218B 'egg':284B,335B 'end':42B 'everyth':252B 'final':250B 'fine':121B 'first':66B 'flesh':115B 'fresh':261B 'fri':144B 'garlic':124B,232B 'gentl':107B 'give':251B 'good':254B 'grate':303B 'gratin':279B 'half':30B,34B,47B,103B,106B 'half-moon':46B 'halv':58B 'heat':151B,208B,271B 'heavi':142B 'heavy-bas':141B 'high':150B,209B 'hot':162B 'inch':18B 'ingredi':6B,249B 'join':244B 'keep':206B 'larg':140B 'leav':88B 'like':333B 'littl':45B,327B 'longer':328B 'mill':262B 'minut':226B,237B,324B 'mix':255B 'mixtur':275B,292B 'mm':20B 'moon':48B 'need':24B,78B,339B 'next':137B,193B 'nice':213B 'oil':156B,159B 'oliv':155B 'onion':23B,196B 'oven':318B 'pan':145B,189B,201B,268B 'peel':27B,119B 'pepper':55B,198B,264B 'piec':166B 'place':146B,305B 'plate':192B 'possibl':39B 'pour':83B 'prepar':3B 'quarter':68B,72B 'quit':341B 're':212B 'realli':161B 'red':343B 'remov':7B,50B,109B,266B 'rest':246B 'return':240B 'robust':342B 'round':21B 'salt':259B 'school':135B 'scoop':60B 'season':257B,296B 'second':91B 'seed':63B,111B 'serv':350B 'shape':49B 'sheet':311B 'shelf':315B 'side':285B,287B 'skin':9B,81B,98B,130B 'slice':14B,28B,35B,64B,75B,99B 'slight':175B 'slip':95B 'slot':182B 'small':117B 'soften':220B 'spoon':183B 'sprinkl':299B 'squeez':104B 'stalk':52B 'take':138B,223B 'thin':37B,74B 'think':337B 'ting':214B 'tomato':77B,101B,131B,230B 'top':289B,314B 'toss':167B,203B 'transfer':184B 'turn':169B,174B 'two':278B,283B 'use':180B 'video':136B 'warm':347B 'watch':127B 'water':85B 'wine':344B	t
107	Heat half the oil in a frying pan over a medium-high heat and fry the ciabatta pieces until crisp and golden. Set aside on kitchen paper.  \n\nHeat the remaining oil in the pan over a medium heat. Add the onion and garlic, then fry for 10 minutes until soft and golden. Add the mince and fry until browned. Add the stock and simmer for 15–20 minutes.  \n\nMeanwhile, preheat the oven to 200°C/fan180°C/gas 6. Halve the peppers, deseed them and place cut-side up on a baking sheet.  \n\nAdd the spring onion, sweet chilli, dark soy and coriander to the mince. Adjust the seasoning and stir in the ciabatta pieces. Spoon into the pepper halves and roast in the oven for 15-20 minutes. Scatter with the extra coriander leaves and serve with the chilli slaw, if you like.	0		0	t	\N	1	\N	'-20':68B,128B '10':48B '15':67B,127B '200':75B '6':78B 'add':40B,54B,61B,94B 'adjust':107B 'asid':25B 'bake':92B 'brown':60B 'c/fan180':76B 'c/gas':77B 'chilli':99B,140B 'ciabatta':18B,114B 'coriand':103B,134B 'crisp':21B 'cut':87B 'cut-sid':86B 'dark':100B 'dese':82B 'extra':133B 'fri':7B,16B,46B,58B 'garlic':44B 'golden':23B,53B 'half':2B 'halv':79B,120B 'heat':1B,14B,29B,39B 'high':13B 'kitchen':27B 'leav':135B 'like':144B 'meanwhil':70B 'medium':12B,38B 'medium-high':11B 'minc':56B,106B 'minut':49B,69B,129B 'oil':4B,32B 'onion':42B,97B 'oven':73B,125B 'pan':8B,35B 'paper':28B 'pepper':81B,119B 'piec':19B,115B 'place':85B 'preheat':71B 'remain':31B 'roast':122B 'scatter':130B 'season':109B 'serv':137B 'set':24B 'sheet':93B 'side':88B 'simmer':65B 'slaw':141B 'soft':51B 'soy':101B 'spoon':116B 'spring':96B 'stir':111B 'stock':63B 'sweet':98B	t
112	Preheat your oven to 200°C. Chop the potatoes into 2cm wide wedges (no need to peel!). Pop the wedges on a large baking tray in a single layer. Drizzle with oil, then season with salt and pepper. Toss to coat, then spread out in a single layer and roast on the top shelf of your oven until golden, 25-30 mins. Turn halfway through cooking.  \nMeanwhile, put the water (see ingredients for amount) in a large saucepan over high heat. Add the BBQ sauce, cider vinegar, chipotle paste and a pinch of salt and pepper. Bring the sauce to the boil, giving it a good stir to ensure everything is combined.  \nOnce the sauce is boiling, lower the heat to medium, stir in the chicken and cover the pan with a lid. Simmer until the chicken is cooked and tender, 15-20 mins, stirring halfway and lowering the heat if necessary. IMPORTANT: The chicken safe to eat when no longer pink in the middle. Once cooked, remove the pan from the heat and transfer just the chicken to a board with a slotted spoon. Roughly chop the chicken.  \nWhile everything cooks, trim and thinly slice the spring onion. Trim and coarsely grate the carrot (no need to peel). Grate the cheddar. Drain and rinse the blackbeans in a colander (see ingredients for amount you need). Pop half of them in a medium bowl and roughly mash with a fork. Once the chicken is cooked and out of your pan, add the black beans (both whole and crushed) and carrot to the remaining liquid in the pan.  \nStir everything together, then boil the mixture vigorously on high heat until reduced to a thick sauce, 4-5 mins. TIP: Stir frequently to stop it burning! Stir in the chicken and simmer for 2 mins, then remove from the heat. Taste and add salt and pepper if you feel it needs it.  \nWhen the wedges are ready, transfer them to an ovenproof dish. Spoon the chicken mixture on top of the wedges. Sprinkle on the cheese and bake in the oven until the cheese is golden and bubbly, 5-6 mins. Remove from the oven, sprinkle over the spring onion and serve!	0		0	t	\N	1	\N	'-20':143B '-30':61B '-5':286B '-6':358B '15':142B '2':302B '200':5B '25':60B '2cm':11B '4':285B '5':357B 'add':82B,251B,311B 'amount':74B,224B 'bake':24B,346B 'bbq':84B 'bean':254B 'black':253B 'blackbean':217B 'board':181B 'boil':102B,117B,272B 'bowl':234B 'bring':97B 'bubbl':356B 'burn':294B 'c':6B 'carrot':205B,260B 'cheddar':212B 'chees':344B,352B 'chicken':126B,137B,155B,178B,189B,243B,298B,334B 'chipotl':88B 'chop':7B,187B 'cider':86B 'coars':202B 'coat':41B 'coland':220B 'combin':112B 'cook':66B,139B,167B,192B,245B 'cover':128B 'crush':258B 'dish':331B 'drain':213B 'drizzl':30B 'eat':158B 'ensur':109B 'everyth':110B,191B,269B 'feel':317B 'fork':240B 'frequent':290B 'give':103B 'golden':59B,354B 'good':106B 'grate':203B,210B 'half':228B 'halfway':64B,146B 'heat':81B,120B,150B,173B,278B,308B 'high':80B,277B 'import':153B 'ingredi':72B,222B 'larg':23B,77B 'layer':29B,48B 'lid':133B 'liquid':264B 'longer':161B 'lower':118B,148B 'mash':237B 'meanwhil':67B 'medium':122B,233B 'middl':165B 'min':62B,144B,287B,303B,359B 'mixtur':274B,335B 'necessari':152B 'need':15B,207B,226B,319B 'oil':32B 'onion':199B,368B 'oven':3B,57B,349B,363B 'ovenproof':330B 'pan':130B,170B,250B,267B 'past':89B 'peel':17B,209B 'pepper':38B,96B,314B 'pinch':92B 'pink':162B 'pop':18B,227B 'potato':9B 'preheat':1B 'put':68B 'readi':325B 'reduc':280B 'remain':263B 'remov':168B,305B,360B 'rins':215B 'roast':50B 'rough':186B,236B 'safe':156B 'salt':36B,94B,312B 'sauc':85B,99B,115B,284B 'saucepan':78B 'season':34B 'see':71B,221B 'serv':370B 'shelf':54B 'simmer':134B,300B 'singl':28B,47B 'slice':196B 'slot':184B 'spoon':185B,332B 'spread':43B 'spring':198B,367B 'sprinkl':341B,364B 'stir':107B,123B,145B,268B,289B,295B 'stop':292B 'tast':309B 'tender':141B 'thick':283B 'thin':195B 'tip':288B 'togeth':270B 'top':53B,337B 'toss':39B 'transfer':175B,326B 'tray':25B 'trim':193B,200B 'turn':63B 'vigor':275B 'vinegar':87B 'water':70B 'wedg':13B,20B,323B,340B 'whole':256B 'wide':12B	t
85	To make the peanut butter, put the nuts into a food processor with the salt (if using) and honey and blend until it starts to change texture. Add the oil gradually and as soon as the texture is smooth and shiny, stop and transfer the mixture to a jar.  \n\nFor the chicken, preheat the oven to 200C/180C Fan/Gas 6 and have a roasting dish (about 30x22x5cm/12x8½x2in) at the ready.  \n\nBring a pan of water to the boil, then add the gnocchi. Boil until the gnocchi come to the surface, then take off the heat, drain and set aside.  \n\nPut the chicken into a large bowl. Add the honey, oil, curry paste, peanut butter and salt, and mix it well with your hands. Add the chicken to the roasting dish along with the broccoli, onions and gnocchi and bake for 30 minutes, giving it a stir halfway through.  \n\nServe topped with the chopped nuts, coriander and a squeeze of lime.	0		0	t	\N	1	\N	'200c/180c':57B '30':140B '30x22x5cm/12x81/2x2in':66B '6':59B 'add':28B,79B,106B,123B 'along':130B 'asid':98B 'bake':138B 'blend':21B 'boil':77B,82B 'bowl':105B 'bring':70B 'broccoli':133B 'butter':5B,113B 'chang':26B 'chicken':52B,101B,125B 'chop':152B 'come':86B 'coriand':154B 'curri':110B 'dish':64B,129B 'drain':95B 'fan/gas':58B 'food':11B 'give':142B 'gnocchi':81B,85B,136B 'gradual':31B 'halfway':146B 'hand':122B 'heat':94B 'honey':19B,108B 'jar':49B 'larg':104B 'lime':159B 'make':2B 'minut':141B 'mix':117B 'mixtur':46B 'nut':8B,153B 'oil':30B,109B 'onion':134B 'oven':55B 'pan':72B 'past':111B 'peanut':4B,112B 'preheat':53B 'processor':12B 'put':6B,99B 'readi':69B 'roast':63B,128B 'salt':15B,115B 'serv':148B 'set':97B 'shini':41B 'smooth':39B 'soon':34B 'squeez':157B 'start':24B 'stir':145B 'stop':42B 'surfac':89B 'take':91B 'textur':27B,37B 'top':149B 'transfer':44B 'use':17B 'water':74B 'well':119B	t
103	Preheat the oven to 200C/180C Fan/Gas 6. Heat the oil in a frying pan over a medium heat, add the onion and cook for 3–5 minutes until soft and translucent.  \n\nIncrease the heat and add the beef, paprika, cumin and chilli powder. Cook for 5-10 minutes, stirring occasionally, until the beef is browned.  \n\nReduce the heat to medium and add the black beans, stirring gently, until the beans are heated through. Season with salt and pepper.  \n\nLine the base of a 1.5 litre/2¾ pint ovenproof dish or baking tray with a single layer of tortilla chips, then top with half of the beef mixture, then half the cheddar and half the cherry tomatoes. Add a second layer of tortilla chips, then top with the remaining beef and cheese. Transfer to the oven and cook for 8–10 mins, until the cheese has melted.  \n\nRemove the nachos from the oven and top with the remaining cherry tomatoes, spring onions, coriander and chilli, if using. Serve hot with the soured cream and lime wedges.	0		0	t	\N	1	\N	'-10':47B,139B '-5':26B '1.5':84B '200c/180c':5B '3':25B '5':46B '6':7B '8':138B 'add':19B,36B,62B,116B 'bake':90B 'base':81B 'bean':65B,70B 'beef':38B,53B,105B,128B 'black':64B 'brown':55B 'cheddar':110B 'chees':130B,143B 'cherri':114B,157B 'chilli':42B,163B 'chip':98B,122B 'cook':23B,44B,136B 'coriand':161B 'cream':171B 'cumin':40B 'dish':88B 'fan/gas':6B 'fri':13B 'gentl':67B 'half':102B,108B,112B 'heat':8B,18B,34B,58B,72B 'hot':167B 'increas':32B 'layer':95B,119B 'lime':173B 'line':79B 'litre/23/4':85B 'medium':17B,60B 'melt':145B 'min':140B 'minut':27B,48B 'mixtur':106B 'nacho':148B 'occasion':50B 'oil':10B 'onion':21B,160B 'oven':3B,134B,151B 'ovenproof':87B 'pan':14B 'paprika':39B 'pepper':78B 'pint':86B 'powder':43B 'preheat':1B 'reduc':56B 'remain':127B,156B 'remov':146B 'salt':76B 'season':74B 'second':118B 'serv':166B 'singl':94B 'soft':29B 'sour':170B 'spring':159B 'stir':49B,66B 'tomato':115B,158B 'top':100B,124B,153B 'tortilla':97B,121B 'transfer':131B 'transluc':31B 'tray':91B 'use':165B 'wedg':174B	t
86	Make the base: Put the flour into a large bowl, then stir in the yeast and salt. Make a well, pour in 200ml warm water and the olive oil and bring together with a wooden spoon until you have a soft, fairly wet dough. Turn onto a lightly floured surface and knead for 5 mins until smooth. Cover with a tea towel and set aside. You can leave the dough to rise if you like, but it’s not essential for a thin crust. \n \nMake the sauce: Mix the passata, basil and crushed garlic together, then season to taste. Leave to stand at room temperature while you get on with shaping the base. \n \nRoll out the dough: if you’ve let the dough rise, give it a quick knead, then split into two balls. On a floured surface, roll out the dough into large rounds, about 25cm across, using a rolling pin. The dough needs to be very thin as it will rise in the oven. Lift the rounds onto two floured baking sheets.  \n\nTop and bake: heat the oven to 240C/220C fan/gas 8. Put another baking sheet or an upturned baking tray in the oven on the top shelf. Smooth sauce over bases with the back of a spoon. Scatter with cheese and tomatoes, drizzle with olive oil and season. Put one pizza, still on its baking sheet, on top of the preheated sheet or tray. Bake for 8-10 mins until crisp. Serve with a little more olive oil, and basil leaves if using. Repeat step for remaining pizza.	0		0	t	\N	1	\N	'-10':241B '200ml':23B '240c/220c':182B '25cm':147B '5':54B '8':184B,240B 'across':148B 'anoth':186B 'asid':65B 'back':207B 'bake':173B,177B,187B,192B,228B,238B 'ball':134B 'base':3B,113B,204B 'basil':91B,253B 'bowl':10B 'bring':31B 'chees':213B 'cover':58B 'crisp':244B 'crush':93B 'crust':84B 'dough':44B,70B,117B,123B,142B,154B 'drizzl':216B 'essenti':80B 'fair':42B 'fan/gas':183B 'flour':6B,49B,137B,172B 'garlic':94B 'get':108B 'give':125B 'heat':178B 'knead':52B,129B 'larg':9B,144B 'leav':68B,100B,254B 'let':121B 'lift':167B 'light':48B 'like':75B 'littl':248B 'make':1B,18B,85B 'min':55B,242B 'mix':88B 'need':155B 'oil':29B,219B,251B 'oliv':28B,218B,250B 'one':223B 'onto':46B,170B 'oven':166B,180B,196B 'passata':90B 'pin':152B 'pizza':224B,261B 'pour':21B 'preheat':234B 'put':4B,185B,222B 'quick':128B 'remain':260B 'repeat':257B 'rise':72B,124B,163B 'roll':114B,139B,151B 'room':104B 'round':145B,169B 'salt':17B 'sauc':87B,202B 'scatter':211B 'season':97B,221B 'serv':245B 'set':64B 'shape':111B 'sheet':174B,188B,229B,235B 'shelf':200B 'smooth':57B,201B 'soft':41B 'split':131B 'spoon':36B,210B 'stand':102B 'step':258B 'still':225B 'stir':12B 'surfac':50B,138B 'tast':99B 'tea':61B 'temperatur':105B 'thin':83B,159B 'togeth':32B,95B 'tomato':215B 'top':175B,199B,231B 'towel':62B 'tray':193B,237B 'turn':45B 'two':133B,171B 'upturn':191B 'use':149B,256B 've':120B 'warm':24B 'water':25B 'well':20B 'wet':43B 'wooden':35B 'yeast':15B	t
89	To prepare the asparagus, cut off and discard the woody ends, then neatly cut the tips away from the stalks. Keep the tips and stalks separate. In a small saucepan bring the cream and garlic to the boil. Take off the heat, remove the garlic, then set the pan aside.  \n\nCook the stalks in boiling salted water for about 4-5 mins until tender, drain, then tip into the cream with the grated parmesan. Blitz with a hand blender until smooth.  \n\nCook the pasta according to pack instructions, then throw in the tips 2 mins before the end of cooking time. Gently reheat the cream, drain pasta, then tip into a bowl with the cream. Toss, divide into pasta bowls, top with parmesan shavings and serve.	0		0	t	\N	1	\N	'-5':61B '2':94B '4':60B 'accord':85B 'asid':50B 'asparagus':4B 'away':17B 'blender':79B 'blitz':75B 'boil':38B,55B 'bowl':112B,120B 'bring':31B 'cook':51B,82B,100B 'cream':33B,70B,105B,115B 'cut':5B,14B 'discard':8B 'divid':117B 'drain':65B,106B 'end':11B,98B 'garlic':35B,45B 'gentl':102B 'grate':73B 'hand':78B 'heat':42B 'instruct':88B 'keep':21B 'min':62B,95B 'neat':13B 'pack':87B 'pan':49B 'parmesan':74B,123B 'pasta':84B,107B,119B 'prepar':2B 'reheat':103B 'remov':43B 'salt':56B 'saucepan':30B 'separ':26B 'serv':126B 'set':47B 'shave':124B 'small':29B 'smooth':81B 'stalk':20B,25B,53B 'take':39B 'tender':64B 'throw':90B 'time':101B 'tip':16B,23B,67B,93B,109B 'top':121B 'toss':116B 'water':57B 'woodi':10B	t
6	Method\n\nHeat your oven to 200°C/Fan 180°C/Gas 6. \n\nGive the beetroot a good wash, then slice them into wedges. Tumble the beetroot into a roasting tin. Drizzle over 2 tbsp olive oil and season with salt and pepper. Turn to coat, then pour 100ml water into the tin. Cover the tin with foil, crimping it to the edges to seal it, or use a lid. Slide the beetroot into the oven and roast for 30 mins till tender – a skewer or knife should be easily able to pierce the beetroot.  \n\nWhile the beetroot roasts, fill a large pan with water. Add a pinch of salt, cover and set on a high heat to come to the boil.  \n\nWhen the beetroot have roasted for 30 mins, remove the foil and drizzle over 1 tbsp balsamic vinegar. Return to the oven and roast for 10 mins more.  \n\nWhen the water in the pan is boiling, add the gnocchi and simmer for 3-4 mins, till the gnocchi bob to the surface of the pan. Drain them and set aside.  \n\nTake the roasting tin out of the oven and tip in the gnocchi. Toss gently to mix. Drizzle over 2 tbsp pesto and serve, garnished with a few basil leaves.\n\nImported from: https://www.abelandcole.co.uk/recipes/gnocchi-with-roast-rainbow-beetroot--pesto	0		0	t	\N	1	\N	'-4':163B '/recipes/gnocchi-with-roast-rainbow-beetroot--pesto':214B '1':134B '10':145B '100ml':46B '180':8B '2':31B,199B '200':6B '3':162B '30':77B,126B '6':10B 'abl':88B 'add':103B,156B 'asid':179B 'balsam':136B 'basil':208B 'beetroot':13B,24B,70B,92B,95B,122B 'bob':168B 'boil':119B,155B 'c/fan':7B 'c/gas':9B 'coat':43B 'come':116B 'cover':51B,108B 'crimp':56B 'drain':175B 'drizzl':29B,132B,197B 'easili':87B 'edg':60B 'fill':97B 'foil':55B,130B 'garnish':204B 'gentl':194B 'give':11B 'gnocchi':158B,167B,192B 'good':15B 'heat':2B,114B 'high':113B 'import':210B 'knife':84B 'larg':99B 'leav':209B 'lid':67B 'method':1B 'min':78B,127B,146B,164B 'mix':196B 'oil':34B 'oliv':33B 'oven':4B,73B,141B,187B 'pan':100B,153B,174B 'pepper':40B 'pesto':201B 'pierc':90B 'pinch':105B 'pour':45B 'remov':128B 'return':138B 'roast':27B,75B,96B,124B,143B,182B 'salt':38B,107B 'seal':62B 'season':36B 'serv':203B 'set':110B,178B 'simmer':160B 'skewer':82B 'slice':18B 'slide':68B 'surfac':171B 'take':180B 'tbsp':32B,135B,200B 'tender':80B 'till':79B,165B 'tin':28B,50B,53B,183B 'tip':189B 'toss':193B 'tumbl':22B 'turn':41B 'use':65B 'vinegar':137B 'wash':16B 'water':47B,102B,150B 'wedg':21B 'www.abelandcole.co.uk':213B 'www.abelandcole.co.uk/recipes/gnocchi-with-roast-rainbow-beetroot--pesto':212B	t
88	Heat oven to 200C/180C fan/gas 6. Pierce the potatoes a few times each and put on a baking tray. Cook for 50 mins until really soft. Leave to cool slightly.  \n\nScoop the sweet potato flesh out of the skins into a bowl. Mash with the coriander, season and gently fold through the feta. This can be done earlier in the day – cover and keep in the fridge. \n\nHeat a large griddle pan.\n  \nSpread the sweet potato mixture over half of each tortilla, top with chorizo slices and fold the other side over. Cook on the hot griddle pan for 3 mins each side until golden. Cut each tortilla in half and serve.	0		0	t	\N	1	\N	'200c/180c':4B '3':100B '50':22B '6':6B 'bake':18B 'bowl':42B 'chorizo':85B 'cook':20B,93B 'cool':29B 'coriand':46B 'cover':62B 'cut':106B 'day':61B 'done':57B 'earlier':58B 'fan/gas':5B 'feta':53B 'flesh':35B 'fold':50B,88B 'fridg':67B 'gentl':49B 'golden':105B 'griddl':71B,97B 'half':79B,110B 'heat':1B,68B 'hot':96B 'keep':64B 'larg':70B 'leav':27B 'mash':43B 'min':23B,101B 'mixtur':77B 'oven':2B 'pan':72B,98B 'pierc':7B 'potato':9B,34B,76B 'put':15B 'realli':25B 'scoop':31B 'season':47B 'serv':112B 'side':91B,103B 'skin':39B 'slice':86B 'slight':30B 'soft':26B 'spread':73B 'sweet':33B,75B 'time':12B 'top':83B 'tortilla':82B,108B 'tray':19B	t
104	Preheat your oven to 220°C/200°C fan/gas mark 7. Peel and grate the garlic (or use a garlic press). In a large bowl, combine half the garlic, honey, breadcrumbs, salt and water for the breadcrumbs (see pantry for both amounts), then add the pork mince. TIP: If your honey has hardened, pop it in a bowl of hot water for 1 min. Season with pepper and mix together with your hands. Roll into evenly-sized balls, 5 per person. IMPORTANT: Wash your hands and equipment after handling raw mince. \n \nPop the meatballs onto a large baking tray. When the oven is hot, bake on the top shelf until browned on the outside and cooked through, 12-15 mins. IMPORTANT: The meatballs are cooked when no longer pink in the middle. Once cooked, remove from the oven and set aside.  \n\nMeanwhile, bring a large saucepan of water to the boil with 1/4 tsp salt for the noodles. Halve the green pepper and discard the core and seeds. Chop into 3cm chunks. Halve and peel the onion, then cut each half into 3 wedges. When boiling, add the noodles to the water and cook until tender, 4 mins. Once cooked, drain in a sieve and run under cold water to stop them sticking together.  \n\nHeat a drizzle of oil in a large frying pan on medium-high heat. Once hot, add the pepper chunks and onion, season with salt and pepper and fry until softened, 4-5 mins. Put the hoisin sauce and soy sauce in a small bowl. Add the water for the sauce (see pantry for amount) and mix together.  \n\nStir the remaining garlic into the veg pan and cook for 1 minute, then add the noodles, cooked meatballs and hoisin sauce. Mix well to combine and cook until everything's piping hot and the sauce has thickened to coat the noodles. Taste and season with salt and pepper if needed. Add a splash of water if you feel it needs it.  \n\nRemove the pan from the heat and stir in a splash of the rice vinegar. Taste and add more vinegar, salt and pepper if you feel it needs it. Share the noodles and meatballs between your serving bowls and sprinkle over the sesame seeds. Enjoy!	0		0	t	\N	1	\N	'-15':119B '-5':248B '1':62B,285B '1/4':153B '12':118B '220':5B '3':183B '3cm':171B '4':197B,247B '5':79B '7':10B 'add':43B,187B,232B,261B,288B,325B,353B 'amount':41B,270B 'asid':141B 'bake':98B,105B 'ball':78B 'boil':151B,186B 'bowl':24B,57B,260B,373B 'breadcrumb':30B,36B 'bring':143B 'brown':111B 'c':7B 'c/200':6B 'chop':169B 'chunk':172B,235B 'coat':313B 'cold':208B 'combin':25B,299B 'cook':116B,125B,134B,194B,200B,283B,291B,301B 'core':166B 'cut':179B 'discard':164B 'drain':201B 'drizzl':217B 'enjoy':380B 'equip':87B 'even':76B 'evenly-s':75B 'everyth':303B 'fan/gas':8B 'feel':332B,361B 'fri':223B,244B 'garlic':15B,19B,28B,277B 'grate':13B 'green':161B 'half':26B,181B 'halv':159B,173B 'hand':72B,85B 'handl':89B 'harden':52B 'heat':215B,229B,341B 'high':228B 'hoisin':252B,294B 'honey':29B,50B 'hot':59B,104B,231B,306B 'import':82B,121B 'larg':23B,97B,145B,222B 'longer':128B 'mark':9B 'meanwhil':142B 'meatbal':94B,123B,292B,369B 'medium':227B 'medium-high':226B 'middl':132B 'min':63B,120B,198B,249B 'minc':46B,91B 'minut':286B 'mix':68B,272B,296B 'need':324B,334B,363B 'noodl':158B,189B,290B,315B,367B 'oil':219B 'onion':177B,237B 'onto':95B 'outsid':114B 'oven':3B,102B,138B 'pan':224B,281B,338B 'pantri':38B,268B 'peel':11B,175B 'pepper':66B,162B,234B,242B,322B,358B 'per':80B 'person':81B 'pink':129B 'pipe':305B 'pop':53B,92B 'pork':45B 'preheat':1B 'press':20B 'put':250B 'raw':90B 'remain':276B 'remov':135B,336B 'rice':349B 'roll':73B 'run':206B 'salt':31B,155B,240B,320B,356B 'sauc':253B,256B,266B,295B,309B 'saucepan':146B 'season':64B,238B,318B 'see':37B,267B 'seed':168B,379B 'serv':372B 'sesam':378B 'set':140B 'share':365B 'shelf':109B 'siev':204B 'size':77B 'small':259B 'soften':246B 'soy':255B 'splash':327B,346B 'sprinkl':375B 'stick':213B 'stir':274B,343B 'stop':211B 'tast':316B,351B 'tender':196B 'thicken':311B 'tip':47B 'togeth':69B,214B,273B 'top':108B 'tray':99B 'tsp':154B 'use':17B 'veg':280B 'vinegar':350B,355B 'wash':83B 'water':33B,60B,148B,192B,209B,263B,329B 'wedg':184B 'well':297B	t
109	Put a large saucepan of water on to boil. Halve the green pepper and discard the core and seeds. Slice into thin strips, then chop into thirds. Halve the mangetout lengthways. Trim and thinly slice the spring onion. Peel and grate the garlic (or use a garlic press). Put the cornflour into a large bowl and season with salt and pepper. Add the diced chicken and toss to completely coat. IMPORTANT: Wash your hands and equipment after handling raw chicken and its packaging.  \nHeat a drizzle of oil in a large frying pan on medium-high heat. Once hot, add the pepper and season with salt and pepper. Fry until starting to soften, 3-4 mins. Add the mangetout, then cook, stirring occasionally, until softened, 2-3 mins more. Stir in the garlic, cook for 1 min, then transfer the cooked veg to another bowl. Set aside with your pan.  \nWhile the veg cooks, add the noodles and 1/4 tsp salt to the pan of boiling water. Cook until tender, 4 mins. Once cooked, drain in a sieve and run under cold water to stop them sticking together.  \nPop your (now empty) frying pan back on medium-high heat with a drizzle of oil if needed. Once hot, add the chicken. Fry until golden brown on the outside and cooked through, 8-10 mins. IMPORTANT: The chicken is cooked when no longer pink in the middle. Meanwhile, in a small bowl, combine the ketjap manis, rice vinegar, ketchup, sugar and water for the sauce (see pantry for all three amounts). Stir well to make your sticky sauce.  \nOnce the chicken is cooked, add the veg back into the pan and stir together for 1 min. Pour the sticky sauce into your frying pan, then lower the heat to medium. Simmer, stirring occasionally, until the sauce has reduced slightly, 2-3 mins. Remove from the heat and season to taste.  \nAdd the cooked noodles to the chicken stir-fry and toss to coat well in the sauce. Add a splash of water if it needs loosening. Share between your bowls and sprinkle with the spring onion to finish. Enjoy!	0		0	t	\N	1	\N	'-10':225B '-3':128B,312B '-4':116B '1':137B,286B '1/4':160B '2':127B,311B '3':115B '4':172B '8':224B 'add':62B,101B,118B,156B,211B,275B,322B,340B 'amount':262B 'anoth':145B 'asid':148B 'back':196B,278B 'boil':9B,167B 'bowl':55B,146B,243B,352B 'brown':217B 'chicken':65B,80B,213B,229B,272B,328B 'chop':25B 'coat':70B,335B 'cold':183B 'combin':244B 'complet':69B 'cook':122B,135B,142B,155B,169B,175B,222B,231B,274B,324B 'core':17B 'cornflour':51B 'dice':64B 'discard':15B 'drain':176B 'drizzl':86B,204B 'empti':193B 'enjoy':361B 'equip':76B 'finish':360B 'fri':92B,110B,194B,214B,294B,331B 'garlic':43B,47B,134B 'golden':216B 'grate':41B 'green':12B 'halv':10B,28B 'hand':74B 'handl':78B 'heat':84B,98B,201B,299B,317B 'high':97B,200B 'hot':100B,210B 'import':71B,227B 'ketchup':250B 'ketjap':246B 'larg':3B,54B,91B 'lengthway':31B 'longer':234B 'loosen':348B 'lower':297B 'make':266B 'mangetout':30B,120B 'mani':247B 'meanwhil':239B 'medium':96B,199B,301B 'medium-high':95B,198B 'middl':238B 'min':117B,129B,138B,173B,226B,287B,313B 'need':208B,347B 'noodl':158B,325B 'occasion':124B,304B 'oil':88B,206B 'onion':38B,358B 'outsid':220B 'packag':83B 'pan':93B,151B,165B,195B,281B,295B 'pantri':258B 'peel':39B 'pepper':13B,61B,103B,109B 'pink':235B 'pop':190B 'pour':288B 'press':48B 'put':1B,49B 'raw':79B 'reduc':309B 'remov':314B 'rice':248B 'run':181B 'salt':59B,107B,162B 'sauc':256B,269B,291B,307B,339B 'saucepan':4B 'season':57B,105B,319B 'see':257B 'seed':19B 'set':147B 'share':349B 'siev':179B 'simmer':302B 'slice':20B,35B 'slight':310B 'small':242B 'soften':114B,126B 'splash':342B 'spring':37B,357B 'sprinkl':354B 'start':112B 'stick':188B 'sticki':268B,290B 'stir':123B,131B,263B,283B,303B,330B 'stir-fri':329B 'stop':186B 'strip':23B 'sugar':251B 'tast':321B 'tender':171B 'thin':22B,34B 'third':27B 'three':261B 'togeth':189B,284B 'toss':67B,333B 'transfer':140B 'trim':32B 'tsp':161B 'use':45B 'veg':143B,154B,277B 'vinegar':249B 'wash':72B 'water':6B,168B,184B,253B,344B 'well':264B,336B	t
113	Preheat your oven to 210°C and pop your sweet potato fries on a roasting tray, drizzle with oil and season with salt and pepper. Roast on the top shelf of your oven for 18 mins, turning halfway,  \nTrim the spring onions then slice thinly. Trim the cucumber then halve lengthways. Chop into roughly 1cm wide 5cm long batons. Peel and grate the garlic (or use a garlic press). Roughly chop the peanuts.  \nHeat a drizzle of oil in a large pan on high heat, Once hot, add the pork mince and cook until browned, 4-5 mins. Break it up with a wooden spoon as it cooks. Add the garlic and easy ginger, cook for 1 min, stirring, then add the hoisin and soy sauce and cook for a further 2-3 mins, until sticky and reduced. IMPORTANT: The pork mince is cooked when it is no longer pink in the middle.  \nAbout 2 mins before the potatoes are done, pop the taco wraps onto a baking tray and bake until warmed through, 2 mins.  \nWarm the pork through if needed. Remove the sweet potato fries from the oven once they are done.  \nDivide the pork mixture between the tacos and top with the cucumber, spring onion and peanuts. Serve with the sweet potato fries. Enjoy!	0		0	t	\N	1	\N	'-3':133B '-5':97B '1':117B '18':35B '1cm':55B '2':132B,155B,175B '210':5B '4':96B '5cm':57B 'add':88B,109B,121B 'bake':168B,171B 'baton':59B 'break':99B 'brown':95B 'c':6B 'chop':52B,71B 'cook':93B,108B,115B,128B,144B 'cucumb':48B,206B 'divid':195B 'done':161B,194B 'drizzl':17B,76B 'easi':113B 'enjoy':217B 'fri':12B,187B,216B 'garlic':64B,68B,111B 'ginger':114B 'grate':62B 'halfway':38B 'halv':50B 'heat':74B,85B 'high':84B 'hoisin':123B 'hot':87B 'import':139B 'larg':81B 'lengthway':51B 'long':58B 'longer':149B 'middl':153B 'min':36B,98B,118B,134B,156B,176B 'minc':91B,142B 'mixtur':198B 'need':182B 'oil':19B,78B 'onion':42B,208B 'onto':166B 'oven':3B,33B,190B 'pan':82B 'peanut':73B,210B 'peel':60B 'pepper':25B 'pink':150B 'pop':8B,162B 'pork':90B,141B,179B,197B 'potato':11B,159B,186B,215B 'preheat':1B 'press':69B 'reduc':138B 'remov':183B 'roast':15B,26B 'rough':54B,70B 'salt':23B 'sauc':126B 'season':21B 'serv':211B 'shelf':30B 'slice':44B 'soy':125B 'spoon':105B 'spring':41B,207B 'sticki':136B 'stir':119B 'sweet':10B,185B,214B 'taco':164B,201B 'thin':45B 'top':29B,203B 'tray':16B,169B 'trim':39B,46B 'turn':37B 'use':66B 'warm':173B,177B 'wide':56B 'wooden':104B 'wrap':165B	t
114	*Mexican food is recognised by UNESCO as an 'Intangible Cultural Heritage of Humanity'. We're not entirely sure what that means but we're in favour of anything that gives props to things that are delicious. And Mexican food is undenably delicious. Like this enchilada recipe which is bursting with black beans and chorizo. Buen provecho!*  \n\nPreheat your oven to 220°C.Halve, peel and thinly slice the onion into half moons. Halve, then remove the core from the green pepper and thinly slice. Cut the chorizo stick in half lengthways, remove the skin and slice into ½cm wide half moons. Drain and rinse the black beans in a sieve. Finely chop the parsley (stalks and all). Grate the lime zest.  \nHeat a glug of oil in a frying pan on medium-high heat. Add the chorizo, cook for 5 mins. Remove from the pan, set aside. Add the onion and pepper to the pan. Cook until soft, 5 mins. Stir in the tomato purée and fajita seasoning (use less if you don't like spice), cook for 1 minute more. Add the black beans, chorizo, water (amount specified in the ingredient list) and pop on a lid. Reduce the heat to medium, cook for 5 mins.  \nOnce the 5 mins are up, remove the lid from your pan. Simmer until the liquid has almost evaporated, 3-4 mins, then remove from the heat. Roughly mash the mixture with a potato masher. Stir in the parsley and lime zest. Taste and season with salt and black pepper if needed. Lay the tortillas on a board (two per person), spoon the mixture down the centre of each, then roll them up into cylinders.  \nDrizzle a little oil over the bottom of an ovenproof dish, then lay in the tortillas. Pack them snugly side by side, with the folded edge downwards so they don't unroll. Spoon the crème fraîche over the top and then spread it out evenly. Grate the cheddar cheese and sprinkle on top, then bake on the top shelf of your oven until golden brown, 15-18 mins.  \nMeanwhile, squeeze the lime juice into a large bowl. Add the honey and olive oil (amount specified in ingredient list). Season with salt and black pepper. Whisk together with a fork and your dressing is made! Halve the cucumber lengthways, scrape out the seeds with a teaspoon (discard the seeds) and chop the flesh into 1cm chunks.  \nWhen the enchiladas are cooked, remove from the oven and leave to cool slightly for 2 mins. Toss the baby leaf mix and cucumber in the dressing. Serve the chorizo enchiladas on plates with the salad alongside. Enjoy!	0		0	t	\N	1	\N	'-18':349B '-4':228B '1':179B '1/2cm':97B '15':348B '1cm':406B '2':423B '220':61B '3':227B '5':140B,159B,206B,210B 'add':135B,148B,182B,360B 'almost':225B 'alongsid':444B 'amount':188B,366B 'anyth':28B 'asid':147B 'babi':427B 'bake':337B 'bean':52B,106B,185B 'black':51B,105B,184B,256B,375B 'board':265B 'bottom':289B 'bowl':359B 'brown':347B 'buen':55B 'burst':49B 'c.halve':62B 'centr':274B 'cheddar':330B 'chees':331B 'chop':111B,402B 'chorizo':54B,86B,137B,186B,437B 'chunk':407B 'cook':138B,156B,177B,204B,412B 'cool':420B 'core':76B 'creme':317B 'cucumb':389B,431B 'cultur':10B 'cut':84B 'cylind':282B 'delici':36B,42B 'discard':398B 'dish':293B 'downward':309B 'drain':101B 'dress':384B,434B 'drizzl':283B 'edg':308B 'enchilada':45B,410B,438B 'enjoy':445B 'entir':17B 'evapor':226B 'even':327B 'fajita':167B 'favour':26B 'fine':110B 'flesh':404B 'fold':307B 'food':2B,39B 'fork':381B 'fraich':318B 'fri':128B 'give':30B 'glug':123B 'golden':346B 'grate':117B,328B 'green':79B 'half':70B,89B,99B 'halv':72B,387B 'heat':121B,134B,201B,234B 'heritag':11B 'high':133B 'honey':362B 'human':13B 'ingredi':192B,369B 'intang':9B 'juic':355B 'larg':358B 'lay':260B,295B 'leaf':428B 'leav':418B 'lengthway':90B,390B 'less':170B 'lid':198B,216B 'like':43B,175B 'lime':119B,248B,354B 'liquid':223B 'list':193B,370B 'littl':285B 'made':386B 'mash':236B 'masher':242B 'mean':21B 'meanwhil':351B 'medium':132B,203B 'medium-high':131B 'mexican':1B,38B 'min':141B,160B,207B,211B,229B,350B,424B 'minut':180B 'mix':429B 'mixtur':238B,271B 'moon':71B,100B 'need':259B 'oil':125B,286B,365B 'oliv':364B 'onion':68B,150B 'oven':59B,344B,416B 'ovenproof':292B 'pack':299B 'pan':129B,145B,155B,219B 'parsley':113B,246B 'peel':63B 'pepper':80B,152B,257B,376B 'per':267B 'person':268B 'plate':440B 'pop':195B 'potato':241B 'preheat':57B 'prop':31B 'provecho':56B 'pure':165B 're':15B,24B 'recip':46B 'recognis':4B 'reduc':199B 'remov':74B,91B,142B,214B,231B,413B 'rins':103B 'roll':278B 'rough':235B 'salad':443B 'salt':254B,373B 'scrape':391B 'season':168B,252B,371B 'seed':394B,400B 'serv':435B 'set':146B 'shelf':341B 'side':302B,304B 'siev':109B 'simmer':220B 'skin':93B 'slice':66B,83B,95B 'slight':421B 'snug':301B 'soft':158B 'specifi':189B,367B 'spice':176B 'spoon':269B,315B 'spread':324B 'sprinkl':333B 'squeez':352B 'stalk':114B 'stick':87B 'stir':161B,243B 'sure':18B 'tast':250B 'teaspoon':397B 'thin':65B,82B 'thing':33B 'togeth':378B 'tomato':164B 'top':321B,335B,340B 'tortilla':262B,298B 'toss':425B 'two':266B 'unden':41B 'unesco':6B 'unrol':314B 'use':169B 'water':187B 'whisk':377B 'wide':98B 'zest':120B,249B	t
22	Heat the oil in a large frying pan, add the onion and cook for 5 mins until softened. Sprinkle over the spices and cook for 1 min more. Add the mince, breaking it up with the back of a wooden spoon, and stir until cooked through. \n \nStir the passata and barbecue sauce into the pan along with 4 tbsp water. Increase the heat and allow the sauce to bubble and reduce until it clings to the meat. Add the beans, season and cook for a further 2 mins, then stir in the coriander. \n\nHeat the tacos following pack instructions.  \n\nUse the pork and bean mix to fill the tacos, top with slices of avocado, shredded iceberg lettuce and a dollop of soured cream, if you like.\n\nImported from: https://www.bbcgoodfood.com/recipes/smoky-pork-black-bean-tacos	0		0	t	\N	1	\N	'/recipes/smoky-pork-black-bean-tacos':131B '1':26B '2':87B '4':58B '5':15B 'add':9B,29B,78B 'allow':65B 'along':56B 'avocado':114B 'back':37B 'barbecu':51B 'bean':80B,104B 'break':32B 'bubbl':69B 'cling':74B 'cook':13B,24B,45B,83B 'coriand':93B 'cream':123B 'dollop':120B 'fill':107B 'follow':97B 'fri':7B 'heat':1B,63B,94B 'iceberg':116B 'import':127B 'increas':61B 'instruct':99B 'larg':6B 'lettuc':117B 'like':126B 'meat':77B 'min':16B,27B,88B 'minc':31B 'mix':105B 'oil':3B 'onion':11B 'pack':98B 'pan':8B,55B 'passata':49B 'pork':102B 'reduc':71B 'sauc':52B,67B 'season':81B 'shred':115B 'slice':112B 'soften':18B 'sour':122B 'spice':22B 'spoon':41B 'sprinkl':19B 'stir':43B,47B,90B 'taco':96B,109B 'tbsp':59B 'top':110B 'use':100B 'water':60B 'wooden':40B 'www.bbcgoodfood.com':130B 'www.bbcgoodfood.com/recipes/smoky-pork-black-bean-tacos':129B	t
19	Heat oven to 200C/180C fan/gas 6. Toss the chips in a roasting tin with 1 tsp oil. Season and bake for 20-25 mins.  \nChop the salmon as finely as you can and place in a bowl with the ginger, lime zest and seasoning. Heat 1 tsp oil in a non-stick pan and soften the spring onions for 2 mins. Stir into the salmon, mix well and shape into 4 patties.  \nHeat remaining oil in the pan and cook the patties for 3-4 mins each side until golden and cooked through. Cover with a lid and leave to rest for a few mins. Serve 2 patties each with the chips, mayo and lime wedges for squeezing.\n\nImported from: https://www.bbcgoodfood.com/recipes/salmon-ginger-fish-cakes	0		0	t	\N	1	\N	'-25':23B '-4':86B '/recipes/salmon-ginger-fish-cakes':124B '1':15B,46B '2':61B,108B '20':22B '200c/180c':4B '3':85B '4':72B '6':6B 'bake':20B 'bowl':37B 'chip':9B,113B 'chop':25B 'cook':81B,93B 'cover':95B 'fan/gas':5B 'fine':29B 'ginger':40B 'golden':91B 'heat':1B,45B,74B 'import':120B 'leav':100B 'lid':98B 'lime':41B,116B 'mayo':114B 'min':24B,62B,87B,106B 'mix':67B 'non':52B 'non-stick':51B 'oil':17B,48B,76B 'onion':59B 'oven':2B 'pan':54B,79B 'patti':73B,83B,109B 'place':34B 'remain':75B 'rest':102B 'roast':12B 'salmon':27B,66B 'season':18B,44B 'serv':107B 'shape':70B 'side':89B 'soften':56B 'spring':58B 'squeez':119B 'stick':53B 'stir':63B 'tin':13B 'toss':7B 'tsp':16B,47B 'wedg':117B 'well':68B 'www.bbcgoodfood.com':123B 'www.bbcgoodfood.com/recipes/salmon-ginger-fish-cakes':122B 'zest':42B	t
2	Heat oven to 180C/fan 160C/gas 4.\n\nCut the lamb into 4cm chunks, then spread over the base of a large, wide casserole dish. Add the onions, oregano, cinnamon sticks, ground cinnamon and olive oil, then stir well. Bake, uncovered, for 45 mins, stirring halfway.\n\nPour over the chopped tomatoes and stock, cover tightly, then return to the oven for 1½ hrs, until the lamb is very tender.\n\nRemove the cinnamon sticks, then stir in the orzo. Cover again, then cook for a further 20 mins, stirring halfway through. The orzo should be cooked and the sauce thickened.\n\nSprinkle with grated Parmesan and serve with crusty bread.	0	Step 1	0	t	\N	1	\N	'11/2':60B '160c/gas':5B '180c/fan':4B '20':84B '4':6B '45':41B '4cm':11B 'add':24B 'bake':38B 'base':17B 'bread':106B 'casserol':22B 'chop':48B 'chunk':12B 'cinnamon':28B,31B,70B 'cook':80B,93B 'cover':52B,77B 'crusti':105B 'cut':7B 'dish':23B 'grate':100B 'ground':30B 'halfway':44B,87B 'heat':1B 'hrs':61B 'lamb':9B,64B 'larg':20B 'min':42B,85B 'oil':34B 'oliv':33B 'onion':26B 'oregano':27B 'orzo':76B,90B 'oven':2B,58B 'parmesan':101B 'pour':45B 'remov':68B 'return':55B 'sauc':96B 'serv':103B 'spread':14B 'sprinkl':98B 'stick':29B,71B 'stir':36B,43B,73B,86B 'stock':51B 'tender':67B 'thicken':97B 'tight':53B 'tomato':49B 'uncov':39B 'well':37B 'wide':21B	t
13	Use a teaspoon or melon baller to hollow out the courgette halves, ensuring there is a 1cm border left. Finely chop the scooped-out courgette flesh.  \nHeat 2 tbsp of the olive oil in a non-stick frying pan over a medium-high heat and fry the lamb mince until really crisp. Turn down the heat and add the onion, courgette flesh and a pinch of salt. Cook gently for 10 minutes or until softened. Add the garlic, cinnamon and oregano, and cook for a few minutes before tipping in the chopped tomatoes and simmering for 15 minutes or until thickened. Season and stir in the raisins, pine nuts and flat-leaf parsley.  \nHeat the oven to 200C/fan 180C/gas 6. Put the courgette halves onto a baking tray and fill with the lamb and tomato sauce. Crumble over the feta and drizzle over the remaining olive oil. Bake for 25 30 minutes or until the courgettes are cooked through. Sprinkle with mint and serve with a green salad, if you like.\n\nImported from: https://www.olivemagazine.com/recipes/meat-and-poultry/greek-lamb-stuffed-courgettes/	0		0	t	\N	1	\N	'/recipes/meat-and-poultry/greek-lamb-stuffed-courgettes/':180B '10':74B '15':100B '180c/gas':123B '1cm':17B '2':29B '200c/fan':122B '25':154B '30':155B '6':124B 'add':61B,79B 'bake':131B,152B 'baller':6B 'border':18B 'chop':21B,95B 'cinnamon':82B 'cook':71B,86B,162B 'courgett':11B,26B,64B,127B,160B 'crisp':55B 'crumbl':141B 'drizzl':146B 'ensur':13B 'feta':144B 'fill':134B 'fine':20B 'flat':115B 'flat-leaf':114B 'flesh':27B,65B 'fri':40B,49B 'garlic':81B 'gentl':72B 'green':171B 'halv':12B,128B 'heat':28B,47B,59B,118B 'high':46B 'hollow':8B 'import':176B 'lamb':51B,137B 'leaf':116B 'left':19B 'like':175B 'medium':45B 'medium-high':44B 'melon':5B 'minc':52B 'mint':166B 'minut':75B,90B,101B,156B 'non':38B 'non-stick':37B 'nut':112B 'oil':34B,151B 'oliv':33B,150B 'onion':63B 'onto':129B 'oregano':84B 'oven':120B 'pan':41B 'parsley':117B 'pinch':68B 'pine':111B 'put':125B 'raisin':110B 'realli':54B 'remain':149B 'salad':172B 'salt':70B 'sauc':140B 'scoop':24B 'scooped-out':23B 'season':105B 'serv':168B 'simmer':98B 'soften':78B 'sprinkl':164B 'stick':39B 'stir':107B 'tbsp':30B 'teaspoon':3B 'thicken':104B 'tip':92B 'tomato':96B,139B 'tray':132B 'turn':56B 'use':1B 'www.olivemagazine.com':179B 'www.olivemagazine.com/recipes/meat-and-poultry/greek-lamb-stuffed-courgettes/':178B	t
115	*Quick, easy, fresh and bursting with flavour, what more can you ask for? The Middle Eastern Lamb Stew brings you great fresh flavours with minimal hassle. While your couscous soaks up your chicken stock broth the lamb is combined with the courgettes, tagine and chopped tomatoes and left to simmer to maximise the flavours. This produces a great tasting dish, which can be made from box to plate in just 20 minutes.*  \n\na) Pour the boiling water (see ingredients for amount) into a large saucepan. b) Add half the stock powder, stir well to dissolve. c) Remove from the heat and stir in the couscous. Cover with a lid and leave to one side.  \na) Heat a large frying pan over high heat (no oil). b) Add the lamb mince and cook until browned, 3-5 mins. c) Break up with a wooden spoon as it cooks and drain off any excess fat.  \na) Meanwhile, trim the courgette then halve lengthways. Thinly slice widthways. b) Roughly chop the coriander (stalks and all).  \na) Lower the heat to medium and add the courgette to the lamb. Cook for 2 mins. b) Add the remaining stock powder, the tagine paste and garnish and the chopped tomatoes. c) Bring to the boil and stir well to dissolve the stock powder.  \na) Reduce the heat again to medium and simmer until the sauce is nice and thick and the courgette is tender, 8-10 mins. b) Stir occasionally to make sure it isn't catching to the bottom of the pan. IMPORTANT: The lamb mince is cooked when it is no longer pink in the middle.  \na) Fluff the couscous up with a fork and season with salt and pepperto taste. b) Stir half the chopped coriander through the stew. c) Taste and season with salt and pepper if necessary. d) Share the couscous between your plates and top with the lamb stew and a sprinkling of remaining coriander. Enjoy!	0		0	t	\N	1	\N	'-10':240B '-5':136B '2':188B '20':71B '3':135B '8':239B 'add':87B,127B,180B,191B 'amount':81B 'ask':12B 'b':86B,126B,165B,190B,242B,288B 'boil':76B,209B 'bottom':254B 'box':66B 'break':139B 'bring':19B,206B 'broth':35B 'brown':134B 'burst':5B 'c':96B,138B,205B,297B 'catch':251B 'chicken':33B 'chop':45B,167B,203B,292B 'combin':39B 'cook':132B,147B,186B,263B 'coriand':169B,293B,325B 'courgett':42B,158B,182B,236B 'couscous':29B,105B,276B,310B 'cover':106B 'd':307B 'dish':60B 'dissolv':95B,214B 'drain':149B 'easi':2B 'eastern':16B 'enjoy':326B 'excess':152B 'fat':153B 'flavour':7B,23B,54B 'fluff':274B 'fork':280B 'fresh':3B,22B 'fri':119B 'garnish':200B 'great':21B,58B 'half':88B,290B 'halv':160B 'hassl':26B 'heat':100B,116B,123B,176B,221B 'high':122B 'import':258B 'ingredi':79B 'isn':249B 'lamb':17B,37B,129B,185B,260B,318B 'larg':84B,118B 'leav':111B 'left':48B 'lengthway':161B 'lid':109B 'longer':268B 'lower':174B 'made':64B 'make':246B 'maximis':52B 'meanwhil':155B 'medium':178B,224B 'middl':15B,272B 'min':137B,189B,241B 'minc':130B,261B 'minim':25B 'minut':72B 'necessari':306B 'nice':231B 'occasion':244B 'oil':125B 'one':113B 'pan':120B,257B 'past':198B 'pepper':304B 'pepperto':286B 'pink':269B 'plate':68B,313B 'pour':74B 'powder':91B,195B,217B 'produc':56B 'quick':1B 'reduc':219B 'remain':193B,324B 'remov':97B 'rough':166B 'salt':284B,302B 'sauc':229B 'saucepan':85B 'season':282B,300B 'see':78B 'share':308B 'side':114B 'simmer':50B,226B 'slice':163B 'soak':30B 'spoon':144B 'sprinkl':322B 'stalk':170B 'stew':18B,296B,319B 'stir':92B,102B,211B,243B,289B 'stock':34B,90B,194B,216B 'sure':247B 'tagin':43B,197B 'tast':59B,287B,298B 'tender':238B 'thick':233B 'thin':162B 'tomato':46B,204B 'top':315B 'trim':156B 'water':77B 'well':93B,212B 'widthway':164B 'wooden':143B	t
116	Put the vegetable oil in a large heavy-based saucepan and set over a medium-high heat. When hot, add the cumin seeds and green chilli and fry until the cumin seeds turn deep golden brown and become fragrant. Turn the heat down to low and add the cubed potato, cooking gently for 8 minutes until it starts to soften at the edges.   \nAdd the cauliflower florets, ground turmeric, chilli powder, salt and sugar and give everything a good mix together until the cauliflower is fully coated with the spices.  \nCover with a lid and cook gently for 15-20 minutes, adding a splash of water only if absolutely necessary and stirring occasionally, until the cauliflower is tender and cooked through. Stir through the chopped coriander leaves, then serve.	0		0	t	\N	1	\N	'-20':102B '15':101B '8':56B 'absolut':111B 'ad':104B 'add':22B,49B,66B 'base':10B 'becom':40B 'brown':38B 'cauliflow':68B,86B,118B 'chilli':28B,72B 'chop':127B 'coat':89B 'cook':53B,98B,122B 'coriand':128B 'cover':93B 'cube':51B 'cumin':24B,33B 'deep':36B 'edg':65B 'everyth':79B 'floret':69B 'fragrant':41B 'fri':30B 'fulli':88B 'gentl':54B,99B 'give':78B 'golden':37B 'good':81B 'green':27B 'ground':70B 'heat':19B,44B 'heavi':9B 'heavy-bas':8B 'high':18B 'hot':21B 'larg':7B 'leav':129B 'lid':96B 'low':47B 'medium':17B 'medium-high':16B 'minut':57B,103B 'mix':82B 'necessari':112B 'occasion':115B 'oil':4B 'potato':52B 'powder':73B 'put':1B 'salt':74B 'saucepan':11B 'seed':25B,34B 'serv':131B 'set':13B 'soften':62B 'spice':92B 'splash':106B 'start':60B 'stir':114B,124B 'sugar':76B 'tender':120B 'togeth':83B 'turmer':71B 'turn':35B,42B 'veget':3B 'water':108B	t
\.


--
-- Data for Name: cookbook_step_ingredients; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_step_ingredients (id, step_id, ingredient_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	2	11
12	2	12
13	2	13
14	2	14
15	2	15
16	2	16
17	2	17
18	2	18
19	2	19
20	2	20
31	3	21
32	3	22
33	3	23
34	3	24
35	3	25
36	3	26
37	3	27
38	3	28
39	3	29
40	3	30
41	3	31
42	3	32
43	3	33
44	3	34
45	3	35
46	3	36
47	3	37
48	3	38
49	3	39
50	3	40
51	3	41
52	3	42
53	3	43
54	4	44
55	4	45
56	4	46
57	4	47
58	4	48
59	4	49
60	4	50
61	4	51
70	5	52
71	5	53
72	5	54
73	5	55
74	5	56
75	5	57
76	5	58
77	5	59
78	6	60
79	6	61
80	6	62
81	6	63
82	6	64
83	7	65
85	7	66
86	7	67
87	7	68
88	7	69
89	7	70
90	7	71
91	7	72
92	7	73
102	8	74
103	8	75
104	8	76
105	8	77
106	8	78
107	8	79
108	8	80
109	8	81
110	8	82
111	8	83
112	8	84
113	8	85
114	8	86
115	8	87
116	9	88
117	9	89
118	9	90
119	9	91
120	9	92
121	9	93
122	9	94
123	9	95
124	9	96
125	9	97
126	9	98
127	9	99
128	9	100
129	9	101
130	9	102
131	9	103
132	10	104
133	10	105
134	10	106
135	10	107
136	10	108
137	10	109
138	10	110
139	10	111
140	10	112
141	10	113
142	10	114
143	10	115
144	10	116
145	10	117
146	10	118
147	10	119
148	11	120
149	11	121
150	11	122
151	11	123
152	11	124
153	11	125
154	11	126
155	11	127
156	11	128
157	11	129
158	11	130
159	11	131
160	11	132
161	12	133
162	12	134
163	12	135
164	12	136
165	12	137
166	12	138
167	12	139
168	12	140
169	12	141
170	12	142
171	13	143
172	13	144
173	13	145
174	13	146
175	13	147
176	13	148
177	13	149
178	13	150
179	13	151
180	13	152
181	13	153
182	13	154
183	13	155
184	14	156
185	14	157
186	14	158
187	14	159
188	14	160
189	14	161
190	14	162
191	14	163
192	14	164
193	14	165
194	14	166
195	14	167
196	14	168
197	14	169
198	14	170
199	14	171
200	14	172
201	14	173
202	14	174
203	15	175
204	15	176
205	15	177
206	15	178
207	15	179
208	15	180
209	15	181
210	15	182
211	15	183
212	15	184
213	16	185
214	16	186
215	16	187
216	16	188
217	16	189
218	16	190
219	16	191
220	17	192
221	17	193
222	17	194
223	17	195
224	17	196
225	17	197
226	17	198
227	17	199
228	17	200
229	17	201
230	18	202
231	18	203
232	18	204
233	18	205
234	18	206
235	18	207
236	18	208
237	18	209
238	19	210
239	19	211
240	19	212
241	19	213
242	19	214
243	19	215
245	20	217
246	20	218
247	20	219
248	20	220
249	20	221
250	20	222
251	20	223
252	20	224
253	20	225
254	20	226
255	21	227
256	21	228
257	21	229
258	21	230
259	21	231
260	21	232
261	21	233
262	21	234
263	22	235
264	22	236
265	22	237
266	22	238
267	22	239
268	22	240
269	22	241
270	22	242
271	22	243
272	22	244
273	22	245
274	22	246
275	23	247
276	23	248
277	23	249
278	23	250
279	23	251
280	23	252
281	23	253
282	24	254
283	24	255
284	24	256
285	24	257
286	24	258
287	24	259
288	24	260
289	24	261
290	24	262
291	24	263
292	24	264
293	25	265
294	26	266
295	26	267
296	27	268
297	27	269
298	28	270
299	28	271
300	28	272
301	28	273
302	28	274
303	28	275
304	28	276
305	28	277
306	28	278
307	28	279
308	28	280
309	28	281
310	28	282
311	28	283
312	28	284
313	28	285
314	28	286
315	28	287
316	28	288
317	28	289
318	28	290
319	28	291
320	28	292
321	29	293
322	29	294
323	29	295
324	29	296
325	29	297
326	29	298
327	29	299
328	29	300
329	30	301
330	30	302
331	30	303
333	30	305
334	30	306
335	30	307
336	30	308
337	30	309
338	30	310
339	30	311
340	30	312
341	31	313
342	31	314
343	31	315
344	31	316
345	31	317
346	31	318
347	31	319
348	31	320
349	31	321
350	31	322
351	31	323
352	31	324
353	31	325
354	32	326
355	32	327
356	32	328
357	32	329
358	32	330
359	32	331
360	32	332
361	32	333
362	32	334
363	32	335
364	32	336
365	32	337
366	32	338
367	33	339
368	33	340
369	33	341
370	33	342
371	33	343
372	33	344
373	33	345
374	33	346
375	33	347
376	34	348
377	34	349
378	34	350
379	34	351
380	34	352
381	34	353
382	34	354
383	34	355
384	34	356
385	34	357
386	38	358
387	38	359
388	38	360
389	38	361
390	38	362
391	38	363
392	38	364
393	38	365
394	38	366
395	38	367
396	38	368
420	44	370
421	45	371
422	45	372
423	46	373
424	48	374
425	48	375
426	48	376
427	48	377
428	48	378
429	43	379
430	50	380
431	51	381
432	51	382
433	52	383
434	54	384
435	54	385
436	54	386
437	54	387
438	54	388
489	61	389
490	61	390
491	62	391
492	62	392
493	62	393
494	62	394
495	62	395
496	62	396
497	62	397
498	63	400
499	63	398
500	63	399
501	64	401
502	65	402
503	65	403
516	66	416
517	66	417
519	66	419
520	66	420
521	66	421
522	66	422
523	66	423
524	66	424
541	67	425
542	67	426
543	67	427
544	67	428
545	67	429
546	67	430
547	67	431
549	67	433
550	67	434
551	67	435
572	68	448
573	68	436
574	68	437
575	68	438
576	68	439
577	68	440
578	68	441
579	68	442
580	68	443
581	68	444
582	68	445
583	68	446
584	68	447
598	69	449
599	69	450
600	69	451
601	69	452
602	69	453
603	69	454
604	69	455
605	69	456
606	69	457
607	69	458
608	69	459
609	70	460
610	70	461
611	70	462
612	70	463
613	70	464
614	70	465
615	70	466
616	70	467
617	70	468
618	70	469
619	70	470
620	70	471
633	71	480
634	71	481
635	71	482
636	71	483
637	71	484
638	71	472
639	71	473
640	71	474
641	71	475
642	71	476
643	71	477
644	71	478
645	71	479
659	72	485
660	72	486
661	72	487
662	72	488
663	72	489
664	72	490
665	72	491
666	72	492
667	72	493
668	72	494
669	72	495
670	72	496
683	73	497
684	73	498
685	73	499
686	73	500
687	73	501
688	73	502
689	73	503
690	73	504
691	73	505
701	74	512
702	74	513
703	74	514
704	74	506
705	74	507
706	74	508
707	74	509
708	74	510
709	74	511
719	75	515
720	75	516
721	75	517
722	75	518
723	75	519
724	75	520
725	75	521
726	75	522
735	76	523
736	76	524
738	76	526
739	76	527
740	76	528
741	76	529
748	77	530
749	77	531
750	77	532
751	77	533
752	77	534
753	77	535
754	77	536
755	77	537
756	77	538
757	77	539
758	77	540
759	77	541
772	78	544
773	78	545
774	78	546
775	78	547
776	78	548
777	78	549
778	78	550
779	78	551
780	78	552
781	78	542
782	78	543
794	79	553
795	79	554
796	79	555
797	79	556
798	79	557
799	79	558
800	79	559
801	79	560
802	79	561
803	79	562
804	79	563
805	79	564
806	79	565
807	79	566
808	79	567
839	80	576
840	80	577
841	80	578
842	80	568
843	80	569
844	80	570
845	80	571
846	80	572
847	80	573
848	80	574
849	80	575
861	81	579
862	81	580
863	81	581
864	81	582
865	81	583
866	81	584
867	81	585
875	82	586
876	82	587
877	82	588
878	82	589
879	82	590
880	82	591
881	82	592
882	82	593
883	82	594
893	83	595
894	83	596
895	83	597
896	83	598
897	83	599
898	83	600
899	83	601
900	83	602
901	83	603
902	83	604
903	84	608
904	84	609
905	84	610
906	84	611
907	84	612
908	84	613
909	84	605
910	84	606
911	84	607
912	85	614
913	85	615
914	85	616
915	85	617
916	85	618
917	85	619
918	85	620
919	85	621
920	85	622
921	85	623
922	85	624
923	85	625
924	85	626
925	85	627
926	85	628
942	86	629
943	86	630
944	86	631
945	86	632
946	86	633
947	86	634
948	86	635
949	86	636
950	86	637
951	86	638
952	86	639
974	87	640
975	87	641
976	87	642
977	87	643
978	87	644
979	87	645
980	87	646
981	87	647
982	87	648
983	87	649
984	87	650
1007	88	651
1008	88	652
1009	88	653
1010	88	654
1011	88	655
1027	22	656
1092	89	657
1093	89	658
1094	89	659
1095	89	660
1096	89	661
1205	90	672
1206	90	673
1207	90	674
1208	90	675
1209	90	676
1210	90	677
1211	90	678
1212	90	679
1213	90	662
1214	90	663
1215	90	664
1216	90	665
1217	90	666
1218	90	667
1219	90	668
1220	90	669
1221	90	670
1222	90	671
1292	91	680
1293	91	681
1294	91	682
1295	91	683
1296	91	684
1297	91	685
1298	91	686
1299	91	687
1300	91	688
1301	91	689
1302	91	690
1303	91	691
1304	91	692
1305	91	693
1320	92	704
1321	92	705
1322	92	706
1323	92	707
1324	92	708
1325	92	709
1326	92	694
1327	92	695
1328	92	696
1329	92	697
1331	92	699
1332	92	700
1333	92	701
1334	92	702
1335	92	703
1374	87	711
1400	93	736
1401	93	737
1402	93	738
1403	93	739
1404	93	740
1405	93	741
1406	93	732
1407	93	733
1408	93	734
1409	93	735
1410	94	742
1411	94	743
1412	94	744
1413	94	745
1414	94	746
1415	94	747
1416	94	748
1417	94	749
1418	94	750
1419	94	751
1420	94	752
1433	94	754
1434	95	755
1435	95	756
1436	95	757
1437	95	758
1438	95	759
1439	95	760
1440	95	761
1441	95	762
1442	95	763
1443	95	764
1444	95	765
1445	95	766
1458	96	768
1459	96	769
1460	96	770
1461	96	771
1462	96	772
1463	96	773
1464	96	774
1465	96	775
1466	96	776
1467	96	777
1468	96	778
1469	96	779
1470	96	780
1471	96	767
1486	97	781
1487	97	782
1488	97	783
1489	97	784
1490	97	785
1491	97	786
1492	97	787
1493	97	788
1494	97	789
1495	97	790
1496	97	791
1497	97	792
1498	97	793
1512	98	800
1513	98	801
1514	98	802
1515	98	803
1516	98	804
1517	98	805
1518	98	806
1519	98	807
1520	98	808
1521	98	794
1522	98	795
1523	98	796
1524	98	797
1525	98	798
1526	98	799
1568	98	811
1575	99	812
1576	99	813
1577	99	814
1578	99	815
1579	99	816
1580	99	817
1581	99	818
1582	99	819
1583	99	820
1584	99	821
1585	99	822
1608	100	832
1609	100	833
1610	100	834
1611	100	835
1612	100	836
1613	100	823
1614	100	824
1615	100	825
1616	100	826
1617	100	827
1618	100	828
1619	100	829
1620	100	830
1621	100	831
1636	101	837
1637	101	838
1638	101	839
1639	101	840
1640	101	841
1641	101	842
1642	101	843
1643	101	844
1644	101	845
1645	101	846
1646	101	847
1647	101	848
1648	101	849
1649	101	850
1664	102	851
1665	102	852
1666	102	853
1667	102	854
1668	102	855
1669	102	856
1670	102	857
1671	102	858
1672	102	859
1673	102	860
1674	102	861
1675	102	862
1676	103	864
1677	103	865
1678	103	866
1679	103	867
1680	103	868
1681	103	869
1682	103	870
1683	103	871
1684	103	872
1685	103	873
1686	103	874
1691	103	863
1704	104	879
1705	104	880
1706	104	881
1707	104	882
1708	104	883
1709	104	884
1710	104	885
1711	104	886
1712	104	887
1713	104	888
1714	104	889
1715	104	890
1716	104	891
1717	104	892
1732	105	896
1733	105	897
1734	105	898
1735	105	899
1736	105	900
1737	105	901
1738	105	902
1739	105	903
1740	105	904
1741	105	893
1742	105	894
1743	105	895
1756	106	905
1757	106	906
1758	106	907
1759	106	908
1760	106	909
1761	106	910
1762	106	911
1763	106	912
1764	106	913
1765	106	914
1766	106	915
1767	106	916
1768	106	917
1782	107	928
1783	107	918
1784	107	919
1785	107	920
1786	107	921
1787	107	922
1788	107	923
1789	107	924
1790	107	925
1791	107	926
1792	107	927
1804	108	929
1805	108	930
1806	108	931
1807	108	932
1808	108	933
1809	108	934
1810	108	935
1811	108	936
1812	108	937
1813	108	938
1814	108	939
1815	108	940
1816	109	941
1817	109	942
1818	109	943
1819	109	944
1820	109	945
1821	109	946
1822	109	947
1823	109	948
1824	109	949
1825	109	950
1826	109	951
1827	109	952
1828	110	960
1829	110	961
1830	110	962
1831	110	953
1832	110	954
1833	110	955
1834	110	956
1835	110	957
1836	110	958
1837	110	959
1838	111	963
1839	111	964
1840	111	965
1841	111	966
1842	111	967
1843	111	968
1844	111	969
1845	111	970
1846	111	971
1847	112	972
1848	112	973
1849	112	974
1850	112	975
1851	112	976
1852	112	977
1853	112	978
1854	112	979
1855	112	980
1856	112	981
1857	113	982
1858	113	983
1859	113	984
1860	113	985
1861	113	986
1862	113	987
1863	113	988
1864	113	989
1865	113	990
1866	113	991
1867	114	992
1868	114	993
1869	114	994
1870	114	995
1871	114	996
1872	114	997
1873	114	998
1874	114	999
1875	114	1000
1876	114	1001
1877	114	1002
1878	114	1003
1879	114	1004
1880	114	1005
1881	114	1006
1882	114	1007
1883	115	1008
1884	115	1009
1885	115	1010
1886	115	1011
1887	115	1012
1888	115	1013
1889	115	1014
1890	115	1015
1891	115	1016
1892	116	1024
1893	116	1025
1894	116	1026
1895	116	1027
1896	116	1017
1897	116	1018
1898	116	1019
1899	116	1020
1900	116	1021
1901	116	1022
1902	116	1023
\.


--
-- Data for Name: cookbook_storage; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_storage (id, name, method, username, password, token, url, created_by_id, path, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_supermarket; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_supermarket (id, name, description, space_id, open_data_slug) FROM stdin;
1	Sainsbury	\N	1	\N
\.


--
-- Data for Name: cookbook_supermarketcategory; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_supermarketcategory (id, name, description, space_id, open_data_slug) FROM stdin;
\.


--
-- Data for Name: cookbook_supermarketcategoryrelation; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_supermarketcategoryrelation (id, "order", category_id, supermarket_id) FROM stdin;
\.


--
-- Data for Name: cookbook_sync; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_sync (id, path, active, last_checked, created_at, updated_at, storage_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_synclog; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_synclog (id, status, msg, created_at, sync_id) FROM stdin;
\.


--
-- Data for Name: cookbook_telegrambot; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_telegrambot (id, token, name, chat_id, webhook_token, created_by_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_unit; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_unit (id, name, description, space_id, plural_name, base_unit, open_data_slug) FROM stdin;
2	British	\N	1	\N	\N	\N
73	ball	\N	1	\N	\N	\N
75	slices	\N	1	\N	\N	\N
76	rosemary	\N	1	\N	\N	\N
52	cm	\N	1	\N	\N	\N
67	green	\N	1	\N	\N	\N
69	–1	\N	1	\N	\N	\N
77	soft	\N	1	\N	\N	\N
9	l	\N	1	\N	\N	\N
87	flour	\N	1	\N	\N	\N
55	star	\N	1	\N	\N	\N
94	shop-bought	\N	1	\N	\N	\N
70	a	\N	1	\N	\N	\N
11	butter	\N	1	\N	\N	\N
13	long	\N	1	\N	\N	\N
30	heaped	\N	1	\N	\N	\N
3	red	\N	1	\N	\N	\N
37	cloves	\N	1	\N	\N	\N
14	clove	\N	1	\N	\N	\N
16	tablespoons	\N	1	\N	\N	\N
17	tablepsoon	\N	1	\N	\N	\N
18	teaspoon	\N	1	\N	\N	\N
19	tablespoon	\N	1	\N	\N	\N
95	g/7oz	\N	1	\N	\N	\N
96	g/3½oz	\N	1	\N	\N	\N
47	taco	\N	1	\N	\N	\N
48	ripe	\N	1	\N	\N	\N
49	iceberg	\N	1	\N	\N	\N
74	handfuls	\N	1	\N	\N	\N
78	piece	\N	1	\N	\N	\N
15	x	\N	1	\N	\N	\N
62	chicken	\N	1	\N	\N	\N
4	garlic	\N	1	\N	\N	\N
21	lasagne	\N	1	\N	\N	\N
31	beef	\N	1	\N	\N	\N
32	g/5½oz	\N	1	\N	\N	\N
33	peppers	\N	1	\N	\N	\N
34	g/1lb	\N	1	\N	\N	\N
35	litre/1¾	\N	1	\N	\N	\N
36	g/1oz	\N	1	\N	\N	\N
38	skinless	\N	1	\N	\N	\N
40	cups	\N	1	\N	\N	\N
41	cup	\N	1	\N	\N	\N
42	butternut	\N	1	\N	\N	\N
43	pollock	\N	1	\N	\N	\N
45	pork	\N	1	\N	\N	\N
46	sharp	\N	1	\N	\N	\N
51	fresh	\N	1	\N	\N	\N
53	sweet	\N	1	\N	\N	\N
54	ml/18fl	\N	1	\N	\N	\N
56	g/1¾oz	\N	1	\N	\N	\N
57	spring	\N	1	\N	\N	\N
58	g/2½oz	\N	1	\N	\N	\N
59	pack(s)	\N	1	\N	\N	\N
61	pinch	\N	1	\N	\N	\N
63	egg	\N	1	\N	\N	\N
64	litre	\N	1	\N	\N	\N
65	or	\N	1	\N	\N	\N
66	of	\N	1	\N	\N	\N
71	brown	\N	1	\N	\N	\N
50	knob	\N	1	\N	\N	\N
20	medium	\N	1	\N	\N	\N
25	bunch(es)	\N	1	\N	\N	\N
26	grams	\N	1	\N	\N	\N
60	sachet	\N	1	\N	\N	\N
27	milliliter(s)	\N	1	\N	\N	\N
28	pot(s)	\N	1	\N	\N	\N
24	tin(s)	\N	1	\N	\N	\N
10	small	\N	1	\N	\N	\N
79	mixed	\N	1	\N	\N	\N
39	Tbsp	\N	1	\N	\N	\N
80	g/9oz	\N	1	\N	\N	\N
82	fat	\N	1	\N	\N	\N
88	bay	\N	1	\N	\N	\N
81	oz	\N	1	\N	\N	\N
5	kg	\N	1	\N	\N	\N
12	large	\N	1	\N	\N	\N
68	sprigs	\N	1	\N	\N	\N
89	yellow	\N	1	\N	\N	\N
83	–5	\N	1	\N	\N	\N
84	kg/2lb	\N	1	\N	\N	\N
85	heads	\N	1	\N	\N	\N
90	⁄4	\N	1	\N	\N	\N
91	⁄2	\N	1	\N	\N	\N
8	cinnamon	\N	1	\N	\N	\N
92	each	\N	1	\N	\N	\N
29	bag(s)	\N	1	\N	\N	\N
93	sticks	\N	1	\N	\N	\N
97	*	\N	1	\N	\N	\N
72	white	\N	1	\N	\N	\N
44	bunch	\N	1	\N	\N	\N
23	unit(s)	\N	1	\N	\N	\N
7	tsp	\N	1	\N	\N	\N
86	celery	\N	1	\N	\N	\N
98	romano	\N	1	\N	\N	\N
1	g	\N	1	\N	\N	\N
22	ml	\N	1	\N	\N	\N
6	tbsp	\N	1	\N	\N	\N
\.


--
-- Data for Name: cookbook_unitconversion; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_unitconversion (id, base_amount, converted_amount, created_at, updated_at, open_data_slug, base_unit_id, converted_unit_id, created_by_id, food_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_userfile; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_userfile (id, name, file, file_size_kb, created_at, created_by_id, space_id) FROM stdin;
\.


--
-- Data for Name: cookbook_userpreference; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_userpreference (theme, user_id, nav_color, default_unit, default_page, ingredient_decimals, comments, shopping_auto_sync, use_fractions, sticky_navbar, created_at, use_kj, mealplan_autoadd_shopping, mealplan_autoexclude_onhand, mealplan_autoinclude_related, default_delay, filter_to_supermarket, shopping_recent_days, csv_delim, csv_prefix, shopping_add_onhand, left_handed, image_id, show_step_ingredients) FROM stdin;
TANDOOR	1	PRIMARY	g	SEARCH	2	t	5	t	t	2022-03-14 10:15:08.541052+00	f	t	t	t	4.0000	f	7	,		f	f	\N	t
TANDOOR	2	PRIMARY	g	SEARCH	2	t	5	f	t	2022-03-24 21:46:21.764287+00	f	f	t	t	4.0000	f	7	,		f	f	\N	t
\.


--
-- Data for Name: cookbook_userpreference_plan_share; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_userpreference_plan_share (id, userpreference_id, user_id) FROM stdin;
\.


--
-- Data for Name: cookbook_userpreference_shopping_share; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_userpreference_shopping_share (id, userpreference_id, user_id) FROM stdin;
\.


--
-- Data for Name: cookbook_userspace; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_userspace (id, active, created_at, updated_at, space_id, user_id, internal_note, invite_link_id) FROM stdin;
1	t	2022-07-07 18:08:12.243324+00	2022-07-07 18:08:12.243354+00	1	1	\N	\N
2	t	2022-07-07 18:08:12.37111+00	2022-07-07 18:08:12.371136+00	1	2	\N	\N
\.


--
-- Data for Name: cookbook_userspace_groups; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_userspace_groups (id, userspace_id, group_id) FROM stdin;
1	1	3
2	2	3
\.


--
-- Data for Name: cookbook_viewlog; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.cookbook_viewlog (id, created_at, created_by_id, recipe_id, space_id) FROM stdin;
1	2022-03-14 10:59:52.316937+00	1	1	1
2	2022-03-14 11:08:30.372016+00	1	1	1
3	2022-03-14 11:14:47.790764+00	1	1	1
4	2022-03-14 11:27:13.127864+00	1	1	1
5	2022-03-14 11:29:42.084232+00	1	2	1
6	2022-03-14 11:39:00.680843+00	1	2	1
7	2022-03-14 11:39:05.267273+00	1	1	1
8	2022-03-14 17:24:23.247046+00	1	3	1
9	2022-03-24 20:42:45.221044+00	1	4	1
10	2022-03-24 20:45:02.172818+00	1	5	1
11	2022-03-24 20:47:06.58824+00	1	6	1
12	2022-03-24 20:51:41.737208+00	1	7	1
13	2022-03-24 20:58:01.97767+00	1	8	1
14	2022-03-24 20:58:39.016855+00	1	9	1
15	2022-03-24 20:59:25.149282+00	1	10	1
16	2022-03-24 21:00:19.333388+00	1	11	1
17	2022-03-24 21:02:13.505487+00	1	12	1
18	2022-03-24 21:02:58.010463+00	1	13	1
19	2022-03-24 21:04:04.296751+00	1	14	1
20	2022-03-24 21:04:58.394099+00	1	15	1
21	2022-03-24 21:09:00.033213+00	1	16	1
22	2022-03-24 21:11:14.344194+00	1	17	1
23	2022-03-24 21:12:50.419871+00	1	18	1
24	2022-03-24 21:13:23.733537+00	1	19	1
25	2022-03-24 21:14:43.971116+00	1	20	1
26	2022-03-24 21:15:22.79196+00	1	21	1
27	2022-03-24 21:16:30.139314+00	1	22	1
28	2022-03-24 21:21:28.490625+00	1	23	1
29	2022-03-24 21:22:16.486645+00	1	24	1
30	2022-03-24 21:26:14.273375+00	1	25	1
32	2022-03-24 21:27:55.484299+00	1	27	1
33	2022-03-24 21:28:46.308609+00	1	28	1
34	2022-03-24 21:31:31.580762+00	1	29	1
35	2022-03-24 21:32:40.280848+00	1	30	1
36	2022-03-24 21:33:26.331416+00	1	31	1
37	2022-03-24 21:34:45.52132+00	1	32	1
38	2022-03-24 21:36:15.871904+00	1	33	1
39	2022-03-24 21:46:27.185381+00	1	34	1
40	2022-03-24 21:48:27.533378+00	2	25	1
41	2022-03-24 21:49:18.350186+00	1	28	1
42	2022-03-24 21:50:39.135155+00	1	29	1
43	2022-07-24 20:43:45.080702+00	2	1	1
44	2022-07-26 18:38:51.972583+00	2	25	1
45	2022-07-26 18:39:27.16643+00	2	13	1
46	2022-07-26 18:41:07.362702+00	2	1	1
47	2022-07-26 18:44:41.530294+00	2	3	1
48	2022-07-26 20:00:39.418191+00	2	37	1
49	2022-07-26 20:29:50.973829+00	2	1	1
50	2022-07-26 20:31:44.047565+00	2	2	1
51	2022-07-26 20:37:21.319872+00	2	17	1
52	2022-07-26 20:40:39.389112+00	2	9	1
53	2022-07-26 20:41:16.871763+00	2	5	1
54	2022-07-26 20:42:06.473474+00	2	8	1
55	2022-07-26 20:42:31.633798+00	2	38	1
56	2022-07-26 20:44:39.743951+00	2	22	1
57	2022-07-27 14:42:37.147822+00	2	40	1
58	2022-07-27 19:58:59.67461+00	2	41	1
59	2022-07-28 07:31:44.95912+00	2	44	1
60	2022-07-28 20:13:05.594812+00	2	34	1
61	2022-08-05 10:39:49.815521+00	2	55	1
62	2022-08-06 16:38:46.155469+00	1	54	1
63	2022-08-07 19:10:39.785525+00	2	19	1
64	2022-08-07 19:11:44.202589+00	2	22	1
65	2022-08-07 19:19:07.081387+00	2	22	1
66	2022-08-07 19:20:38.714819+00	2	4	1
67	2022-08-07 19:22:01.526997+00	2	43	1
68	2022-08-07 19:23:24.067772+00	2	58	1
69	2022-08-07 19:28:59.147107+00	2	62	1
70	2022-08-08 19:15:05.068045+00	2	22	1
71	2022-08-08 19:18:06.859615+00	2	19	1
72	2022-08-08 19:19:48.380255+00	2	62	1
73	2022-08-10 17:12:21.287428+00	2	22	1
74	2022-08-11 08:12:17.529114+00	2	22	1
75	2022-08-11 08:13:35.285128+00	2	62	1
76	2022-08-11 08:14:31.436525+00	2	19	1
77	2022-08-11 08:15:39.972044+00	2	63	1
78	2022-08-11 08:15:55.128533+00	2	50	1
79	2022-08-11 08:17:07.616642+00	2	41	1
80	2022-08-11 08:18:36.852281+00	2	9	1
81	2022-08-11 13:48:43.528841+00	2	40	1
82	2022-08-11 13:49:16.131696+00	2	50	1
83	2022-08-11 13:50:14.870363+00	2	53	1
84	2022-08-11 13:50:37.306279+00	2	4	1
85	2022-08-11 13:51:20.754805+00	2	25	1
87	2022-08-11 13:53:55.872068+00	2	30	1
88	2022-08-11 13:56:19.649291+00	2	28	1
89	2022-08-11 13:58:30.497981+00	2	29	1
90	2022-08-11 13:59:39.347549+00	2	6	1
91	2022-08-11 14:01:27.97028+00	2	2	1
92	2022-08-11 14:08:45.321231+00	2	13	1
93	2022-08-11 16:46:11.587949+00	2	23	1
94	2022-08-11 17:56:15.028248+00	2	22	1
95	2022-08-11 17:57:46.802955+00	2	19	1
96	2022-08-12 12:22:05.754702+00	2	66	1
97	2022-08-12 12:53:30.943361+00	2	38	1
98	2022-08-12 12:57:00.289511+00	2	53	1
99	2022-08-12 12:58:58.603482+00	2	60	1
100	2022-08-13 12:37:17.338398+00	2	58	1
101	2022-08-13 15:16:52.016086+00	2	58	1
102	2022-08-13 20:35:46.811943+00	2	58	1
103	2022-08-13 20:35:56.359852+00	2	62	1
104	2022-08-14 09:25:05.086138+00	2	53	1
105	2022-08-14 12:16:55.32839+00	2	2	1
106	2022-08-14 14:58:27.551353+00	2	66	1
107	2022-08-14 15:01:30.036214+00	2	60	1
108	2022-08-14 15:05:59.307015+00	2	46	1
109	2022-08-14 17:41:44.471412+00	2	62	1
110	2022-08-15 09:17:18.816079+00	2	62	1
111	2022-08-15 09:21:34.29764+00	2	6	1
112	2022-08-16 08:06:14.980267+00	2	58	1
113	2022-08-16 19:25:09.581838+00	2	10	1
114	2022-08-16 19:27:19.251151+00	2	44	1
115	2022-08-16 19:28:04.676999+00	2	32	1
116	2022-08-17 11:45:19.244665+00	2	60	1
117	2022-08-23 16:55:19.498627+00	2	6	1
118	2022-08-23 17:27:22.119309+00	1	6	1
119	2022-08-28 19:11:31.731488+00	2	9	1
120	2022-08-30 07:18:38.160884+00	2	32	1
121	2022-08-31 17:42:44.499987+00	2	46	1
122	2022-08-31 17:42:44.803653+00	2	67	1
123	2022-09-01 17:28:21.449753+00	2	23	1
124	2022-09-02 09:42:28.58285+00	2	32	1
125	2022-09-02 20:05:13.826174+00	2	32	1
126	2022-09-06 18:54:11.902983+00	2	54	1
127	2022-09-07 17:09:21.186084+00	2	54	1
128	2022-09-07 17:43:28.258505+00	1	54	1
129	2022-09-09 18:06:38.838698+00	1	54	1
130	2022-09-09 18:06:55.146699+00	2	6	1
131	2022-09-09 18:06:59.523447+00	1	6	1
132	2022-09-17 19:16:47.383188+00	2	67	1
133	2022-09-17 19:17:38.792829+00	2	31	1
134	2022-09-17 19:18:32.626774+00	2	59	1
135	2022-09-17 19:23:09.231953+00	2	44	1
136	2022-09-17 19:24:54.493558+00	2	50	1
137	2022-09-18 17:12:47.669491+00	2	2	1
138	2022-09-19 14:48:26.32716+00	2	59	1
139	2022-09-19 14:52:32.964155+00	2	9	1
140	2022-09-19 14:58:51.610391+00	2	44	1
141	2022-09-19 15:02:02.26996+00	2	69	1
142	2022-09-20 18:04:31.166727+00	2	59	1
143	2022-09-20 19:10:01.403934+00	2	59	1
144	2022-09-23 17:43:49.636931+00	2	44	1
145	2022-09-24 08:00:50.358869+00	2	69	1
146	2022-09-24 16:52:01.802047+00	2	69	1
147	2022-10-02 19:08:25.136544+00	2	68	1
148	2022-10-02 19:13:07.355233+00	2	70	1
149	2022-10-02 19:18:17.038471+00	2	66	1
150	2022-10-02 20:05:42.437848+00	2	6	1
151	2022-10-05 17:39:51.477728+00	2	6	1
152	2022-10-05 18:31:46.348278+00	1	6	1
153	2022-10-07 18:30:03.900994+00	2	9	1
154	2022-10-10 18:22:51.885115+00	2	19	1
155	2022-10-17 13:11:50.890413+00	2	69	1
156	2022-10-19 17:19:04.320285+00	2	69	1
157	2022-10-20 18:13:17.751575+00	2	69	1
158	2022-10-20 18:13:33.897639+00	2	37	1
159	2022-11-14 20:32:33.677098+00	2	69	1
160	2022-11-20 10:27:02.402697+00	2	69	1
161	2022-11-28 19:50:00.787174+00	1	47	1
162	2022-11-28 19:51:11.237787+00	1	12	1
163	2022-11-28 19:58:02.111114+00	1	22	1
164	2022-11-28 19:58:34.62856+00	1	38	1
165	2022-11-28 20:02:45.100806+00	1	14	1
166	2022-11-28 20:06:13.676848+00	1	3	1
167	2022-11-29 20:27:29.674214+00	2	47	1
168	2022-11-30 09:33:10.943563+00	2	47	1
169	2022-12-05 08:43:01.252426+00	2	58	1
170	2022-12-05 14:17:03.434664+00	2	62	1
171	2022-12-05 14:20:41.947944+00	2	48	1
172	2022-12-05 14:35:16.14747+00	2	4	1
173	2022-12-05 14:37:50.161543+00	2	69	1
174	2022-12-05 18:21:21.255439+00	2	6	1
175	2022-12-07 17:57:03.138868+00	2	68	1
176	2022-12-07 18:59:19.219401+00	2	58	1
177	2022-12-08 15:24:54.000676+00	2	69	1
178	2022-12-09 20:06:34.554698+00	2	74	1
179	2022-12-12 19:29:55.250655+00	2	22	1
180	2022-12-12 19:31:55.080445+00	2	42	1
181	2022-12-12 19:32:39.219861+00	2	17	1
182	2022-12-27 20:59:58.561522+00	2	42	1
183	2022-12-29 16:25:37.544278+00	1	24	1
184	2022-12-31 17:37:24.051972+00	2	42	1
185	2023-01-02 12:50:25.762855+00	2	17	1
186	2023-01-03 19:58:36.171898+00	2	75	1
187	2023-01-03 19:59:01.789759+00	2	73	1
188	2023-01-03 20:10:25.376716+00	2	73	1
189	2023-01-03 20:28:29.777197+00	2	69	1
190	2023-01-03 20:31:42.771619+00	2	19	1
191	2023-01-03 20:33:37.389997+00	2	75	1
192	2023-01-03 20:39:10.242878+00	2	50	1
193	2023-01-03 20:43:13.344331+00	2	24	1
194	2023-01-08 09:18:15.510823+00	2	75	1
195	2023-01-10 20:22:56.736982+00	2	69	1
196	2023-01-10 20:25:28.34169+00	2	43	1
197	2023-01-16 12:14:45.838533+00	2	69	1
198	2023-01-16 13:36:48.369501+00	2	43	1
199	2023-01-16 17:02:13.330048+00	2	43	1
200	2023-01-16 20:00:39.116648+00	2	73	1
201	2023-01-16 20:01:06.133537+00	2	31	1
202	2023-01-17 15:44:34.99162+00	2	69	1
203	2023-01-25 07:08:34.919829+00	2	60	1
204	2023-01-25 07:09:03.416883+00	2	75	1
205	2023-01-25 20:03:59.755859+00	2	75	1
206	2023-01-25 20:29:46.422893+00	2	77	1
207	2023-01-27 14:08:12.615533+00	2	75	1
208	2023-01-27 17:46:16.014146+00	2	77	1
209	2023-01-31 20:15:38.362629+00	2	69	1
210	2023-02-04 09:57:53.669802+00	2	69	1
211	2023-02-04 17:00:08.986992+00	2	69	1
212	2023-02-07 19:12:57.055665+00	2	46	1
213	2023-02-07 19:18:10.832786+00	2	24	1
214	2023-02-13 17:41:18.733233+00	2	52	1
215	2023-02-13 17:45:45.193663+00	2	47	1
216	2023-02-14 17:21:49.630426+00	2	24	1
217	2023-02-18 11:26:00.709185+00	2	47	1
218	2023-02-27 17:47:45.963857+00	2	52	1
219	2023-02-27 21:17:33.935926+00	2	59	1
220	2023-03-07 16:36:44.374265+00	2	52	1
221	2023-03-29 19:13:11.817837+00	2	59	1
222	2023-03-29 19:13:59.858809+00	2	24	1
223	2023-03-29 19:24:19.207241+00	2	24	1
224	2023-03-31 10:33:30.505261+00	2	24	1
225	2023-04-19 18:58:35.699413+00	2	59	1
226	2023-04-19 19:06:17.698913+00	2	75	1
227	2023-04-19 19:06:23.367033+00	2	43	1
228	2023-04-26 19:44:55.633344+00	1	77	1
229	2023-04-26 19:47:29.834068+00	1	75	1
230	2023-04-26 19:50:03.683324+00	1	69	1
231	2023-04-26 19:51:41.905456+00	1	52	1
232	2023-04-26 19:52:38.644544+00	1	5	1
233	2023-04-26 19:53:08.784937+00	2	69	1
234	2023-04-26 19:55:15.64359+00	2	77	1
235	2023-04-26 20:00:08.897946+00	2	52	1
236	2023-04-26 20:28:35.094529+00	2	4	1
237	2023-04-28 14:07:42.725588+00	2	77	1
238	2023-04-29 18:15:12.293522+00	2	75	1
239	2023-05-01 20:14:57.488688+00	2	23	1
240	2023-05-02 16:46:30.057605+00	1	52	1
241	2023-05-02 17:22:03.749884+00	2	52	1
242	2023-05-02 19:26:06.766756+00	2	23	1
243	2023-05-08 19:05:15.605859+00	2	79	1
244	2023-05-08 19:17:02.182302+00	2	17	1
245	2023-05-09 19:03:56.460799+00	2	43	1
246	2023-05-11 17:12:33.796789+00	2	23	1
247	2023-05-14 06:58:42.338627+00	2	75	1
248	2023-05-15 17:11:05.97856+00	2	79	1
249	2023-05-16 18:25:24.306913+00	1	41	1
250	2023-05-16 19:26:29.799743+00	1	24	1
251	2023-05-16 19:29:34.445335+00	1	19	1
252	2023-05-24 16:48:01.296536+00	2	17	1
253	2023-05-30 20:07:49.053+00	2	81	1
254	2023-05-31 11:33:26.269131+00	2	81	1
255	2023-05-31 18:59:33.912601+00	2	58	1
256	2023-06-06 17:31:33.39968+00	2	79	1
257	2023-06-06 17:33:35.342053+00	2	58	1
258	2023-06-06 17:33:45.855363+00	2	69	1
259	2023-06-07 17:05:05.753586+00	2	69	1
260	2023-06-07 17:05:55.03518+00	2	79	1
261	2023-06-07 17:08:37.994218+00	2	78	1
262	2023-06-08 16:44:31.065328+00	2	81	1
263	2023-06-12 13:20:59.283488+00	2	78	1
264	2023-06-12 18:39:40.860156+00	1	78	1
265	2023-06-13 07:05:56.230856+00	2	78	1
266	2023-06-13 11:24:48.339745+00	2	58	1
267	2023-06-26 19:15:38.713444+00	1	79	1
268	2023-06-27 18:26:52.378126+00	2	79	1
269	2023-07-03 18:47:03.54792+00	2	81	1
270	2023-07-03 18:52:14.095113+00	2	10	1
271	2023-07-03 18:52:45.086335+00	1	10	1
272	2023-07-06 18:32:30.553679+00	1	81	1
273	2023-07-06 18:47:35.299188+00	2	81	1
274	2023-07-08 15:02:13.289302+00	2	10	1
275	2023-07-09 07:07:47.433551+00	2	58	1
276	2023-07-09 11:30:36.289497+00	2	58	1
277	2023-07-09 12:22:29.650588+00	2	10	1
278	2023-07-09 13:54:04.703145+00	2	58	1
279	2023-07-09 14:24:18.376442+00	2	10	1
280	2023-07-10 16:31:27.600057+00	2	58	1
281	2023-07-11 19:24:00.2275+00	1	19	1
282	2023-07-11 19:25:42.155495+00	1	43	1
283	2023-07-11 19:26:55.752228+00	1	79	1
284	2023-07-11 19:27:48.052089+00	1	41	1
285	2023-07-11 19:28:27.920884+00	1	17	1
286	2023-07-11 19:32:55.282992+00	1	5	1
287	2023-07-11 19:34:21.376515+00	1	49	1
288	2023-07-11 19:35:37.852032+00	1	59	1
289	2023-07-11 19:37:20.327548+00	1	69	1
290	2023-07-11 19:39:38.342327+00	1	46	1
291	2023-07-11 19:40:45.20798+00	1	23	1
292	2023-07-11 19:49:06.9427+00	1	77	1
293	2023-07-11 19:50:37.846712+00	1	75	1
294	2023-07-11 19:51:13.394051+00	1	61	1
295	2023-07-11 19:51:58.122507+00	1	52	1
296	2023-07-11 19:56:35.872914+00	1	78	1
297	2023-07-11 19:58:18.537622+00	1	81	1
298	2023-07-12 17:11:37.5984+00	2	81	1
299	2023-07-12 18:01:01.894044+00	1	81	1
300	2023-07-12 19:05:53.202431+00	1	69	1
301	2023-07-17 16:45:03.701239+00	2	69	1
302	2023-07-19 17:39:22.639868+00	1	81	1
303	2023-07-28 12:37:54.59541+00	2	59	1
304	2023-08-01 11:37:49.892204+00	2	41	1
305	2023-08-01 11:38:54.29738+00	2	24	1
306	2023-08-01 11:41:09.474849+00	2	79	1
307	2023-08-02 16:32:22.000408+00	1	83	1
308	2023-08-02 16:33:23.474741+00	1	84	1
309	2023-08-02 16:34:12.948175+00	1	85	1
310	2023-08-04 05:28:26.025347+00	2	24	1
311	2023-08-16 10:48:37.671587+00	1	17	1
312	2023-08-16 10:55:28.030278+00	1	81	1
313	2023-08-16 11:17:57.805589+00	1	59	1
314	2023-08-16 18:10:29.869881+00	1	23	1
315	2023-08-20 15:15:48.748789+00	1	59	1
316	2023-08-22 11:42:14.949453+00	1	52	1
317	2023-08-25 10:14:49.34768+00	1	52	1
318	2023-08-25 11:12:09.512286+00	1	79	1
319	2023-08-29 11:34:25.516501+00	1	79	1
320	2023-08-29 19:30:04.222522+00	1	79	1
321	2023-08-31 11:44:59.628173+00	1	52	1
322	2023-09-26 19:11:53.479716+00	1	1	1
323	2023-09-26 19:14:39.909026+00	1	79	1
324	2023-11-09 19:35:52.280571+00	1	88	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	authtoken	token
9	authtoken	tokenproxy
10	account	emailaddress
11	account	emailconfirmation
12	socialaccount	socialaccount
13	socialaccount	socialapp
14	socialaccount	socialtoken
15	cookbook	keyword
16	cookbook	recipe
17	cookbook	storage
18	cookbook	sync
19	cookbook	synclog
20	cookbook	recipeimport
21	cookbook	comment
22	cookbook	recipebook
23	cookbook	recipebookentry
24	cookbook	mealplan
25	cookbook	unit
26	cookbook	userpreference
27	cookbook	cooklog
28	cookbook	viewlog
29	cookbook	mealtype
30	cookbook	sharelink
31	cookbook	food
32	cookbook	ingredient
33	cookbook	step
34	cookbook	shoppinglistrecipe
35	cookbook	shoppinglistentry
36	cookbook	shoppinglist
37	cookbook	invitelink
38	cookbook	space
39	cookbook	nutritioninformation
40	cookbook	supermarket
41	cookbook	supermarketcategory
42	cookbook	supermarketcategoryrelation
43	cookbook	importlog
44	cookbook	telegrambot
45	cookbook	bookmarkletimport
46	cookbook	userfile
47	cookbook	searchfields
48	cookbook	searchpreference
49	cookbook	automation
50	cookbook	foodinheritfield
51	cookbook	exportlog
52	cookbook	customfilter
53	cookbook	userspace
54	oauth2_provider	application
55	oauth2_provider	accesstoken
56	oauth2_provider	grant
57	oauth2_provider	refreshtoken
58	oauth2_provider	idtoken
59	cookbook	property
60	cookbook	propertytype
61	cookbook	unitconversion
62	cookbook	foodproperty
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-14 10:02:29.530706+00
2	auth	0001_initial	2022-03-14 10:02:29.695178+00
3	account	0001_initial	2022-03-14 10:02:29.743743+00
4	account	0002_email_max_length	2022-03-14 10:02:29.760659+00
5	admin	0001_initial	2022-03-14 10:02:29.793201+00
6	admin	0002_logentry_remove_auto_add	2022-03-14 10:02:29.811433+00
7	admin	0003_logentry_add_action_flag_choices	2022-03-14 10:02:29.830584+00
8	contenttypes	0002_remove_content_type_name	2022-03-14 10:02:29.861324+00
9	auth	0002_alter_permission_name_max_length	2022-03-14 10:02:29.882648+00
10	auth	0003_alter_user_email_max_length	2022-03-14 10:02:29.906605+00
11	auth	0004_alter_user_username_opts	2022-03-14 10:02:29.928552+00
12	auth	0005_alter_user_last_login_null	2022-03-14 10:02:29.955565+00
13	auth	0006_require_contenttypes_0002	2022-03-14 10:02:29.968378+00
14	auth	0007_alter_validators_add_error_messages	2022-03-14 10:02:29.981915+00
15	auth	0008_alter_user_username_max_length	2022-03-14 10:02:30.0103+00
16	auth	0009_alter_user_last_name_max_length	2022-03-14 10:02:30.027668+00
17	auth	0010_alter_group_name_max_length	2022-03-14 10:02:30.04431+00
18	auth	0011_update_proxy_permissions	2022-03-14 10:02:30.060053+00
19	auth	0012_alter_user_first_name_max_length	2022-03-14 10:02:30.095808+00
20	authtoken	0001_initial	2022-03-14 10:02:30.133905+00
21	authtoken	0002_auto_20160226_1747	2022-03-14 10:02:30.190358+00
22	authtoken	0003_tokenproxy	2022-03-14 10:02:30.195317+00
23	cookbook	0001_initial	2022-03-14 10:02:30.458223+00
24	cookbook	0002_auto_20191119_2035	2022-03-14 10:02:30.472744+00
25	cookbook	0003_enable_pgtrm	2022-03-14 10:02:30.555465+00
26	cookbook	0004_storage_created_by	2022-03-14 10:02:30.587962+00
27	cookbook	0005_recipebook_recipebookentry	2022-03-14 10:02:30.662465+00
28	cookbook	0006_recipe_image	2022-03-14 10:02:30.686169+00
29	cookbook	0007_auto_20191226_0852	2022-03-14 10:02:30.733541+00
30	cookbook	0008_mealplan	2022-03-14 10:02:30.775287+00
31	cookbook	0009_auto_20200130_1056	2022-03-14 10:02:30.822027+00
32	cookbook	0010_auto_20200130_1059	2022-03-14 10:02:30.851023+00
33	cookbook	0011_remove_recipeingredients_unit	2022-03-14 10:02:30.882721+00
34	cookbook	0012_auto_20200130_1116	2022-03-14 10:02:30.916075+00
35	cookbook	0013_userpreference	2022-03-14 10:02:30.958927+00
36	cookbook	0014_auto_20200213_2332	2022-03-14 10:02:31.028942+00
37	cookbook	0015_auto_20200213_2334	2022-03-14 10:02:31.067662+00
38	cookbook	0016_auto_20200213_2335	2022-03-14 10:02:31.150687+00
39	cookbook	0017_auto_20200216_2257	2022-03-14 10:02:31.176564+00
40	cookbook	0018_auto_20200216_2303	2022-03-14 10:02:31.228969+00
41	cookbook	0019_ingredient	2022-03-14 10:02:31.254254+00
42	cookbook	0020_recipeingredient_ingredient	2022-03-14 10:02:31.294228+00
43	cookbook	0021_auto_20200216_2309	2022-03-14 10:02:31.327289+00
44	cookbook	0022_remove_recipeingredient_name	2022-03-14 10:02:31.346064+00
45	cookbook	0023_auto_20200216_2311	2022-03-14 10:02:31.385001+00
46	cookbook	0024_auto_20200216_2313	2022-03-14 10:02:31.418437+00
47	cookbook	0025_userpreference_nav_color	2022-03-14 10:02:31.447521+00
48	cookbook	0026_auto_20200219_1605	2022-03-14 10:02:31.498311+00
49	cookbook	0027_ingredient_recipe	2022-03-14 10:02:31.647515+00
50	cookbook	0028_auto_20200317_1901	2022-03-14 10:02:31.687268+00
51	cookbook	0029_auto_20200317_1901	2022-03-14 10:02:31.725387+00
52	cookbook	0030_recipeingredient_note	2022-03-14 10:02:31.746662+00
53	cookbook	0031_auto_20200407_1841	2022-03-14 10:02:31.778683+00
54	cookbook	0032_userpreference_default_unit	2022-03-14 10:02:31.800574+00
55	cookbook	0033_userpreference_default_page	2022-03-14 10:02:31.824217+00
56	cookbook	0034_auto_20200426_1614	2022-03-14 10:02:31.854115+00
57	cookbook	0035_auto_20200427_1637	2022-03-14 10:02:31.936805+00
58	cookbook	0036_auto_20200427_1800	2022-03-14 10:02:31.965877+00
59	cookbook	0037_userpreference_search_style	2022-03-14 10:02:31.991072+00
60	cookbook	0038_auto_20200502_1259	2022-03-14 10:02:32.035467+00
61	cookbook	0039_recipebook_shared	2022-03-14 10:02:32.082205+00
62	cookbook	0040_auto_20200502_1433	2022-03-14 10:02:32.121827+00
63	cookbook	0041_auto_20200502_1446	2022-03-14 10:02:32.187826+00
64	cookbook	0042_cooklog	2022-03-14 10:02:32.230426+00
65	cookbook	0043_auto_20200507_2302	2022-03-14 10:02:32.321295+00
66	cookbook	0044_viewlog	2022-03-14 10:02:32.37002+00
67	cookbook	0045_userpreference_show_recent	2022-03-14 10:02:32.39722+00
68	cookbook	0046_auto_20200602_1133	2022-03-14 10:02:32.454115+00
69	cookbook	0047_auto_20200602_1133	2022-03-14 10:02:32.492764+00
70	cookbook	0048_auto_20200602_1140	2022-03-14 10:02:32.567938+00
71	cookbook	0049_mealtype_created_by	2022-03-14 10:02:32.741984+00
72	cookbook	0050_auto_20200611_1509	2022-03-14 10:02:32.781253+00
73	cookbook	0051_auto_20200611_1518	2022-03-14 10:02:32.828395+00
74	cookbook	0052_userpreference_ingredient_decimals	2022-03-14 10:02:32.856231+00
75	cookbook	0053_auto_20200611_2217	2022-03-14 10:02:32.885886+00
76	cookbook	0054_sharelink	2022-03-14 10:02:32.935404+00
77	cookbook	0055_auto_20200616_1236	2022-03-14 10:02:32.992528+00
78	cookbook	0056_auto_20200625_2118	2022-03-14 10:02:33.15889+00
79	cookbook	0057_auto_20200625_2127	2022-03-14 10:02:33.238679+00
80	cookbook	0058_auto_20200625_2128	2022-03-14 10:02:33.371275+00
81	cookbook	0059_auto_20200625_2137	2022-03-14 10:02:33.410705+00
82	cookbook	0060_auto_20200625_2144	2022-03-14 10:02:33.486501+00
83	cookbook	0056_auto_20200625_2157	2022-03-14 10:02:33.684661+00
84	cookbook	0061_merge_20200625_2209	2022-03-14 10:02:33.687669+00
85	cookbook	0062_auto_20200625_2219	2022-03-14 10:02:33.865673+00
86	cookbook	0063_auto_20200625_2230	2022-03-14 10:02:33.942967+00
87	cookbook	0064_auto_20200625_2329	2022-03-14 10:02:34.015262+00
88	cookbook	0065_auto_20200626_1444	2022-03-14 10:02:34.042292+00
89	cookbook	0066_auto_20200626_1455	2022-03-14 10:02:34.076664+00
90	cookbook	0067_auto_20200629_1508	2022-03-14 10:02:34.118991+00
91	cookbook	0068_auto_20200629_2127	2022-03-14 10:02:34.282898+00
92	cookbook	0069_auto_20200629_2134	2022-03-14 10:02:34.324556+00
93	cookbook	0070_auto_20200701_2007	2022-03-14 10:02:34.374148+00
94	cookbook	0071_auto_20200701_2048	2022-03-14 10:02:34.415945+00
95	cookbook	0072_step_show_as_header	2022-03-14 10:02:34.430949+00
96	cookbook	0073_auto_20200708_2311	2022-03-14 10:02:34.453675+00
97	cookbook	0074_remove_keyword_created_by	2022-03-14 10:02:34.465056+00
98	cookbook	0075_shoppinglist_shoppinglistentry_shoppinglistrecipe	2022-03-14 10:02:34.775202+00
99	cookbook	0076_shoppinglist_entries	2022-03-14 10:02:34.840879+00
100	cookbook	0077_invitelink	2022-03-14 10:02:34.897113+00
101	cookbook	0078_invitelink_used_by	2022-03-14 10:02:34.948765+00
102	cookbook	0079_invitelink_group	2022-03-14 10:02:35.001607+00
103	cookbook	0080_auto_20200921_2331	2022-03-14 10:02:35.069294+00
104	cookbook	0081_auto_20200921_2349	2022-03-14 10:02:35.108565+00
105	cookbook	0082_auto_20200922_1143	2022-03-14 10:02:35.19581+00
106	cookbook	0083_space	2022-03-14 10:02:35.208295+00
107	cookbook	0084_auto_20200922_1233	2022-03-14 10:02:35.255562+00
108	cookbook	0085_auto_20200922_1235	2022-03-14 10:02:35.263506+00
109	cookbook	0086_auto_20200929_1143	2022-03-14 10:02:35.346737+00
110	cookbook	0087_auto_20200929_1152	2022-03-14 10:02:35.446639+00
111	cookbook	0088_shoppinglist_finished	2022-03-14 10:02:35.629545+00
112	cookbook	0089_auto_20201117_2222	2022-03-14 10:02:35.72321+00
113	cookbook	0090_auto_20201214_1359	2022-03-14 10:02:35.790223+00
114	cookbook	0091_auto_20201226_1551	2022-03-14 10:02:35.836939+00
115	cookbook	0092_recipe_servings	2022-03-14 10:02:35.882047+00
116	cookbook	0093_auto_20201231_1236	2022-03-14 10:02:35.961286+00
117	cookbook	0094_auto_20201231_1238	2022-03-14 10:02:36.01227+00
118	cookbook	0095_auto_20210107_1804	2022-03-14 10:02:36.080944+00
119	cookbook	0096_auto_20210109_2044	2022-03-14 10:02:36.154899+00
120	cookbook	0097_auto_20210113_1315	2022-03-14 10:02:36.223019+00
121	cookbook	0098_auto_20210113_1320	2022-03-14 10:02:36.260071+00
122	cookbook	0099_auto_20210113_1518	2022-03-14 10:02:36.300323+00
123	cookbook	0100_recipe_servings_text	2022-03-14 10:02:36.472897+00
124	cookbook	0101_storage_path	2022-03-14 10:02:36.51173+00
125	cookbook	0102_auto_20210125_1147	2022-03-14 10:02:36.649958+00
126	cookbook	0103_food_ignore_shopping	2022-03-14 10:02:36.682368+00
127	cookbook	0104_auto_20210125_2133	2022-03-14 10:02:36.79087+00
128	cookbook	0105_auto_20210126_1604	2022-03-14 10:02:36.888128+00
129	cookbook	0106_shoppinglist_supermarket	2022-03-14 10:02:36.945094+00
130	cookbook	0107_auto_20210128_1535	2022-03-14 10:02:36.958726+00
131	cookbook	0108_auto_20210219_1410	2022-03-14 10:02:38.498469+00
132	cookbook	0109_auto_20210221_1204	2022-03-14 10:02:39.209901+00
133	cookbook	0110_auto_20210221_1406	2022-03-14 10:02:39.276591+00
134	cookbook	0111_space_created_by	2022-03-14 10:02:39.389822+00
135	cookbook	0112_remove_synclog_space	2022-03-14 10:02:39.453276+00
136	cookbook	0113_auto_20210317_2017	2022-03-14 10:02:39.57775+00
137	cookbook	0114_importlog	2022-03-14 10:02:39.652301+00
138	cookbook	0115_telegrambot	2022-03-14 10:02:39.725898+00
139	cookbook	0116_auto_20210319_0012	2022-03-14 10:02:39.782586+00
140	cookbook	0117_space_max_recipes	2022-03-14 10:02:39.831611+00
141	cookbook	0118_auto_20210406_1805	2022-03-14 10:02:40.043619+00
142	cookbook	0119_auto_20210411_2101	2022-03-14 10:02:40.138961+00
143	cookbook	0120_bookmarklet	2022-03-14 10:02:40.284565+00
144	cookbook	0121_auto_20210518_1638	2022-03-14 10:02:40.37386+00
145	cookbook	0122_auto_20210527_1712	2022-03-14 10:02:40.470482+00
146	cookbook	0123_invitelink_email	2022-03-14 10:02:40.523075+00
147	cookbook	0124_alter_userpreference_theme	2022-03-14 10:02:40.5697+00
148	cookbook	0125_space_demo	2022-03-14 10:02:40.620099+00
149	cookbook	0126_alter_userpreference_theme	2022-03-14 10:02:40.670244+00
150	cookbook	0127_remove_invitelink_username	2022-03-14 10:02:40.719612+00
151	cookbook	0128_userfile	2022-03-14 10:02:40.792078+00
152	cookbook	0129_auto_20210608_1233	2022-03-14 10:02:41.033623+00
153	cookbook	0130_alter_userfile_file_size_kb	2022-03-14 10:02:41.17737+00
154	cookbook	0131_auto_20210608_1929	2022-03-14 10:02:41.295745+00
155	cookbook	0132_sharelink_request_count	2022-03-14 10:02:41.350636+00
156	cookbook	0133_sharelink_abuse_blocked	2022-03-14 10:02:41.40557+00
157	cookbook	0134_space_allow_sharing	2022-03-14 10:02:41.45655+00
158	cookbook	0135_auto_20210615_2210	2022-03-14 10:02:41.64379+00
159	cookbook	0136_auto_20210617_1343	2022-03-14 10:02:41.74859+00
160	cookbook	0137_auto_20210617_1501	2022-03-14 10:02:41.968252+00
161	cookbook	0138_auto_20210617_1602	2022-03-14 10:02:42.245593+00
162	cookbook	0139_space_created_at	2022-03-14 10:02:42.307901+00
163	cookbook	0140_userpreference_created_at	2022-03-14 10:02:42.373528+00
164	cookbook	0141_auto_20210713_1042	2022-03-14 10:02:42.501677+00
165	cookbook	0142_alter_userpreference_search_style	2022-03-14 10:02:42.556871+00
166	cookbook	0143_build_full_text_index	2022-03-14 10:02:43.541172+00
167	cookbook	0144_create_searchfields	2022-03-14 10:02:43.766838+00
168	cookbook	0145_alter_userpreference_search_style	2022-03-14 10:02:43.936637+00
169	cookbook	0146_alter_userpreference_use_fractions	2022-03-14 10:02:43.997236+00
170	cookbook	0147_keyword_to_tree	2022-03-14 10:02:44.431677+00
171	cookbook	0148_auto_20210813_1829	2022-03-14 10:02:45.249704+00
172	cookbook	0149_fix_leading_trailing_spaces	2022-03-14 10:02:45.324465+00
173	cookbook	0150_food_to_tree	2022-03-14 10:02:45.749149+00
174	cookbook	0151_auto_20210915_1037	2022-03-14 10:02:46.199199+00
175	cookbook	0152_automation	2022-03-14 10:02:46.293104+00
176	cookbook	0153_auto_20210915_2327	2022-03-14 10:02:48.253595+00
177	cookbook	0154_auto_20210922_1705	2022-03-14 10:02:48.378882+00
178	cookbook	0155_mealtype_default	2022-03-14 10:02:48.444157+00
179	cookbook	0156_searchpreference_trigram_threshold	2022-03-14 10:02:48.498647+00
180	cookbook	0157_alter_searchpreference_trigram	2022-03-14 10:02:48.637329+00
181	cookbook	0158_userpreference_use_kj	2022-03-14 10:02:48.704471+00
182	cookbook	0159_add_shoppinglistentry_fields	2022-03-14 10:02:50.574936+00
183	cookbook	0160_delete_shoppinglist_orphans	2022-03-14 10:02:50.928364+00
184	cookbook	0161_alter_shoppinglistentry_food	2022-03-14 10:02:51.009582+00
185	cookbook	0162_userpreference_csv_delim	2022-03-14 10:02:51.18184+00
186	cookbook	0163_auto_20220105_0758	2022-03-14 10:02:51.661532+00
187	cookbook	0164_space_show_facet_count	2022-03-14 10:02:51.664394+00
188	cookbook	0165_remove_step_type	2022-03-14 10:02:51.725447+00
189	cookbook	0166_alter_userpreference_shopping_add_onhand	2022-03-14 10:02:51.872438+00
190	cookbook	0167_userpreference_left_handed	2022-03-14 10:02:51.943986+00
191	cookbook	0168_add_unit_searchfields	2022-03-14 10:02:52.017081+00
192	cookbook	0169_exportlog	2022-03-14 10:02:52.110997+00
193	cookbook	0170_auto_20220207_1848	2022-03-14 10:02:52.95632+00
194	cookbook	0171_alter_searchpreference_trigram_threshold	2022-03-14 10:02:53.022392+00
195	cookbook	0172_ingredient_original_text	2022-03-14 10:02:53.090682+00
196	sessions	0001_initial	2022-03-14 10:02:53.107827+00
197	sites	0001_initial	2022-03-14 10:02:53.118509+00
198	sites	0002_alter_domain_unique	2022-03-14 10:02:53.131934+00
199	socialaccount	0001_initial	2022-03-14 10:02:53.679239+00
200	socialaccount	0002_token_max_lengths	2022-03-14 10:02:53.776639+00
201	socialaccount	0003_extra_data_default_dict	2022-03-14 10:02:53.844215+00
202	cookbook	0173_recipe_source_url	2022-05-01 22:13:21.744367+00
203	cookbook	0174_alter_food_substitute_userspace	2022-07-07 18:08:13.532911+00
204	cookbook	0175_remove_userpreference_space	2022-07-07 18:08:14.100341+00
205	cookbook	0176_alter_searchpreference_icontains_and_more	2022-07-07 18:08:14.46108+00
206	cookbook	0177_recipe_show_ingredient_overview	2022-07-07 18:08:14.795938+00
207	cookbook	0178_remove_userpreference_search_style_and_more	2022-08-01 18:07:38.494986+00
208	cookbook	0179_recipe_private_recipe_shared	2022-08-01 18:07:40.798011+00
209	cookbook	0180_invitelink_reusable	2022-08-01 18:07:41.002642+00
210	cookbook	0181_space_image	2022-08-01 18:07:41.374017+00
211	cookbook	0182_userpreference_image	2022-08-01 18:07:41.932004+00
212	cookbook	0183_alter_space_image	2022-09-21 16:07:37.821711+00
213	cookbook	0184_alter_userpreference_image	2022-09-21 16:07:38.175937+00
214	oauth2_provider	0001_initial	2022-09-21 16:07:48.897488+00
215	oauth2_provider	0002_auto_20190406_1805	2022-09-21 16:07:50.032881+00
216	oauth2_provider	0003_auto_20201211_1314	2022-09-21 16:07:50.353077+00
217	oauth2_provider	0004_auto_20200902_2022	2022-09-21 16:07:52.290397+00
218	oauth2_provider	0005_auto_20211222_2352	2022-09-21 16:07:53.102701+00
219	oauth2_provider	0006_alter_application_client_secret	2022-09-21 16:07:53.377318+00
220	cookbook	0185_food_plural_name_ingredient_always_use_plural_food_and_more	2023-02-03 16:08:03.137651+00
221	cookbook	0186_automation_order_alter_automation_type	2023-02-03 16:08:03.750685+00
222	cookbook	0187_alter_space_use_plural	2023-02-03 16:08:03.872296+00
223	cookbook	0188_space_no_sharing_limit	2023-02-13 00:07:25.613595+00
224	cookbook	0189_property_propertytype_unitconversion_food_fdc_id_and_more	2023-06-21 14:06:43.88128+00
225	cookbook	0190_auto_20230525_1506	2023-06-21 14:06:44.259933+00
226	cookbook	0191_foodproperty_property_import_food_id_and_more	2023-06-21 14:06:45.011949+00
227	cookbook	0192_food_food_unique_open_data_slug_per_space_and_more	2023-06-21 14:06:46.007107+00
228	cookbook	0193_space_internal_note	2023-06-22 10:08:07.798582+00
229	cookbook	0194_alter_food_properties_food_amount	2023-06-26 20:06:10.293961+00
230	cookbook	0195_invitelink_internal_note_userspace_internal_note_and_more	2023-07-05 16:06:17.746403+00
231	cookbook	0196_food_url	2023-08-14 08:07:12.496848+00
232	cookbook	0197_step_show_ingredients_table_and_more	2023-08-29 14:08:32.699444+00
233	cookbook	0198_propertytype_order	2023-08-29 14:08:32.903714+00
234	cookbook	0199_alter_propertytype_options_alter_automation_type_and_more	2023-08-29 14:08:33.066486+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
oeeroi0kge2ht5ia6lq2evqveepf1mx4	.eJxVjMEOwiAQBf-FsyGULVh69O43kAUWixpoSptojP-uJD3o9c28eTGL2zrZrdJiU2Aj69jhd3Pob5QbCFfMl8J9yeuSHG8K32nl5xLoftrdv8CEdfq-o4oGZR_l4KQDJBnBgT4a8iDDQGgEaBy0EQ3pEFEF5ftgtICONPoWrVRrKtnSY07Lk43QKdBCiPcHdMRBNQ:1nThjQ:mwIn_XZFOYdMArto-fh_4vdWnjBfqVAbafynmRI6zxg	2023-03-14 10:15:16.875295+00
h15cy73qdvrx6spdgdozb4gvfp4413yb	.eJxVjMEOwiAQBf-FsyGULVh69O43kAUWixpoSptojP-uJD3o9c28eTGL2zrZrdJiU2Aj69jhd3Pob5QbCFfMl8J9yeuSHG8K32nl5xLoftrdv8CEdfq-o4oGZR_l4KQDJBnBgT4a8iDDQGgEaBy0EQ3pEFEF5ftgtICONPoWrVRrKtnSY07Lk43QKdBCiPcHdMRBNQ:1nTiJJ:fNZRQ7D24rdvJAFz8lhNbkq7_-gFe0ETKuMkIgaL2G4	2023-03-14 10:52:21.27917+00
1srwy3hrbvr7zdbh8r97zfxp8axx0u1u	.eJxVjMEOwiAQBf-FsyGULVh69O43kAUWixpoSptojP-uJD3o9c28eTGL2zrZrdJiU2Aj69jhd3Pob5QbCFfMl8J9yeuSHG8K32nl5xLoftrdv8CEdfq-o4oGZR_l4KQDJBnBgT4a8iDDQGgEaBy0EQ3pEFEF5ftgtICONPoWrVRrKtnSY07Lk43QKdBCiPcHdMRBNQ:1nTiMX:VEtL_ePoKkF6EHnH-cOj5jegrNpdjytnG72-1tpYEao	2023-03-14 10:55:41.799142+00
qdm9db0nb3r3vu7k88tt5f2anx04kb07	.eJxVjMEOwiAQBf-FsyEUWiw9evcbyMIuFjXQQJtojP-uJD3o9c28eTEL2zrbrVKxEdnEOnb43Rz4G6UG8ArpkrnPaS3R8abwnVZ-zkj30-7-BWao8_cdhmBA9kGOTjoFJINySh8NeSVxJDBCaRi1EQ1pDDDg4Hs0WqiONPgWrVRrzMnSY4nlySbx_gCyRj_T:1nToPh:X00MFRUEJVSCfl4YnsDRa1CHOStSwrTHTMX_ekQMqE0	2023-03-14 17:23:21.57582+00
uaa1dboythwm2dx557w4xtvbwkq724ak	.eJxljEEOgyAQRe_C2hgQUHFXL0KGYYykFBOFbprevWpMk6bLee_PezFAXErK9klrmAJ5Sw8IkQ2pxFh9bdloZQNrWMUslDyfwAb_zxzgndIhIMYD11ejPjeX3urbflHKASGHJY3X109qhm3eO51WrULFnWukQa6lRnIotRat98ZxcqJzptc4KcV7g51SjeQSgYToBSJ7fwDpiE1n:1nXVHh:84DeNNO4mhe30vq028PCXH0BObMF__04VW_hm-NAHOQ	2023-03-24 21:46:21.7722+00
sah6w6o6klco77dsoh50or9jpgizykvr	.eJxVjMEOwiAQBf-FsyGULVh69O43kAUWixpoSptojP-uJD3o9c28eTGL2zrZrdJiU2Aj69jhd3Pob5QbCFfMl8J9yeuSHG8K32nl5xLoftrdv8CEdfq-o4oGZR_l4KQDJBnBgT4a8iDDQGgEaBy0EQ3pEFEF5ftgtICONPoWrVRrKtnSY07Lk43QKdBCiPcHdMRBNQ:1npQaN:_zvnD7KCBjUUJT5pLrw7jX3SRPOg1sSSA7QSqp4nZuk	2023-05-13 08:23:43.440434+00
eaeuhokeu6l1vdompeh0qfyu3njnje94	.eJxVjMsOwiAQRf-FtSFAC30s3fsNZIAZixpoSptojP9uSbrQ7T3nnjezsK2T3QouNgY2MsVOv5sDf8dUQbhBumbuc1qX6HhV-EELv-SAj_Ph_gUmKFN9dzR4ETDoRgBI3XgwFMhoCCiHXhvqhaAdq35QsnWOvDJOQovYoWupRguWEnOy-Jzj8mJjs2eMEOLzBZaNQcE:1oFiQp:luadpazimiBQV1wgKTx2pA3S5Dr9GWHcq0-C2DTIvGg	2023-07-24 20:42:31.59779+00
2d0cv05thiunebqeanksnmviprjzy3vs	.eJxVjMsOwiAQRf-FtSEwvGqX7v0GMpTBogZMaRON8d9tjQvd3nPueTKPyzz6pdHkc2Q9k2z3uwUcLlQ2EM9YTpUPtcxTDnxT-Jc2fqyRroev-xcYsY3rOynpiIQ1sAdwOAASaDQpAKHRCUlIaS2RU1pZEXUMSskEHRmtY-c-0Uat5Vo83W95erBeSbO6QrzeQ6pAYg:1oKMoB:5HtSo9lE-K1RqLZwpDVcP-lzqCe8JEt0p2JMJsXQl9w	2023-08-06 16:37:51.57421+00
0qgres8akcgqpbafg6xy511gwbtlbshr	.eJxVjMsOwiAQRf-FtSEwvGqX7v0GMpTBogZMaRON8d9tjQvd3nPueTKPyzz6pdHkc2Q9k2z3uwUcLlQ2EM9YTpUPtcxTDnxT-Jc2fqyRroev-xcYsY3rOynpiIQ1sAdwOAASaDQpAKHRCUlIaS2RU1pZEXUMSskEHRmtY-c-0Uat5Vo83W95erBeSbO6QrzeQ6pAYg:1oKxOe:Lv_NdecySog9EKvr2exNeX7jJImcz0vS69ZZKkzTv3c	2023-08-08 07:41:56.064196+00
z42xa4yzpxjkiglmqsyoi7qu8qkcakmv	.eJxVjMsOwiAQRf-FtSFAC30s3fsNZIAZixpoSptojP9uSbrQ7T3nnjezsK2T3QouNgY2MsVOv5sDf8dUQbhBumbuc1qX6HhV-EELv-SAj_Ph_gUmKFN9dzR4ETDoRgBI3XgwFMhoCCiHXhvqhaAdq35QsnWOvDJOQovYoWupRguWEnOy-Jzj8mJjs2eMEOLzBZaNQcE:1oLpFc:ikfhzfgHVQhfEk1pqtYFFTAlLBASeyPLpOb5rigfvJA	2023-08-10 17:12:12.488886+00
dwp9sc4hq6yeliyffw3nwg6lfrpxiij0	.eJxVjMsOwiAQRf-FtSEwvGqX7v0GMpTBogZMaRON8d9tjQvd3nPueTKPyzz6pdHkc2Q9k2z3uwUcLlQ2EM9YTpUPtcxTDnxT-Jc2fqyRroev-xcYsY3rOynpiIQ1sAdwOAASaDQpAKHRCUlIaS2RU1pZEXUMSskEHRmtY-c-0Uat5Vo83W95erBeSbO6QrzeQ6pAYg:1oMsoE:tKK-SUHTSYsH-fW-SWtt0IX-O8iqDC8yFj8qGzzhuHA	2023-08-13 15:12:18.220846+00
bhzg06yfla6spsgiry96kw2qa8s5td1v	.eJxVjcsKwjAQRf8layl5TUi60x8JkxcNllSaFBTx301LF7qb-5hz38Ti1ia71bjaHMhIGLn8eg79PZY9wHne7QG9X7bShqNzxnW4dhVLyx5bXsrt_PpDTVinzhEGuHcKk5P94Fo6CDIGJgVLAEpQik7zqJV3RnMGzICXPEhDUzKGHtAaa-0zNj4feX2RUTAQilL6-QJ4CERW:1prl42:VLucDJV88cJM3JoEEiywmAcwygVzV9IrWJjil3xGXRw	2024-04-25 19:44:30.735561+00
6xmciophsge2cu7w6ixqqnj48wc46qrs	.eJxVjMsKwjAURP8lawk3T5Iu3fsNIY8bG5VEmhYU8d9tpQvdDTNnzos4v8yjWzpOriQyEEYOv13w8Yp1G9LF13OjsdV5KoFuCN3XTk8t4e24s3-C0fdxfQureAza5yDXwI0MKklMTAqWldICwAfD0egYrOFMMaui5ElayNla-Eo79l5adfi4l-lJBsGU0ADw_gAn0D_i:1pz0Gr:msRmNETKaRg3PZjnHbtMqmXLL3BJKrpQRXUipAZzl5Q	2024-05-15 19:23:41.244314+00
skxlv4n1unrv402j6ggw9c0mozq82qx6	.eJxVjMsKwjAURP8lawk3T5Iu3fsNIY8bG5VEmhYU8d9tpQvdDTNnzos4v8yjWzpOriQyEEYOv13w8Yp1G9LF13OjsdV5KoFuCN3XTk8t4e24s3-C0fdxfQureAza5yDXwI0MKklMTAqWldICwAfD0egYrOFMMaui5ElayNla-Eo79l5adfi4l-lJBsGU0ADw_gAn0D_i:1qRElS:xMfpfRn0jwFoNCa0ml3hcUw8eucl1tQMmbRIpe8BvEo	2024-08-01 16:31:58.298772+00
n1d8xopgrz3vc8x3co8mpysbavllb7hv	.eJxVjcsKwjAQRf8layl5TUi60x8JkxcNllSaFBTx301LF7qb-5hz38Ti1ia71bjaHMhIGLn8eg79PZY9wHne7QG9X7bShqNzxnW4dhVLyx5bXsrt_PpDTVinzhEGuHcKk5P94Fo6CDIGJgVLAEpQik7zqJV3RnMGzICXPEhDUzKGHtAaa-0zNj4feX2RUTAQilL6-QJ4CERW:1qXk9W:JHocFjqufHJy925vP0ue8SSQHRCiUThJ6Lin2c2XxnQ	2024-08-19 15:15:42.515211+00
h3qta7hdc9x3yv1jw7jvhfu1yboi5qrj	.eJxVjcsKwjAQRf8layl5TUi60x8JkxcNllSaFBTx301LF7qb-5hz38Ti1ia71bjaHMhIGLn8eg79PZY9wHne7QG9X7bShqNzxnW4dhVLyx5bXsrt_PpDTVinzhEGuHcKk5P94Fo6CDIGJgVLAEpQik7zqJV3RnMGzICXPEhDUzKGHtAaa-0zNj4feX2RUTAQilL6-QJ4CERW:1qm9vb:2FuZX3LQJtZmFI_SflD0UNyySnx8sAdVdUcEBHLPFWs	2024-09-28 09:36:55.655468+00
73m5unmz7itok2xy3tv2tgzy9ejf18lh	.eJxVjcsKwjAQRf8layl5TUi60x8JkxcNllSaFBTx301LF7qb-5hz38Ti1ia71bjaHMhIGLn8eg79PZY9wHne7QG9X7bShqNzxnW4dhVLyx5bXsrt_PpDTVinzhEGuHcKk5P94Fo6CDIGJgVLAEpQik7zqJV3RnMGzICXPEhDUzKGHtAaa-0zNj4feX2RUTAQilL6-QJ4CERW:1r1AoR:aR8bLDqZKbad05xWk1D4P3CuRLFNITq6vIQcfkJNJp8	2024-11-08 19:35:35.599768+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id, id_token_id) FROM stdin;
1	tda_72f2eebb_c3bb_402a_8214_fca6f86f3dd8	2032-09-26 09:05:22.57955+00	bookmarklet	\N	2	2022-09-29 09:05:22.581286+00	2022-09-29 09:05:22.581301+00	\N	\N
2	tda_0a6387d9_df0c_419f_8496_bff818cd5763	2033-07-30 16:32:05.677686+00	bookmarklet	\N	1	2023-08-02 16:32:05.679726+00	2023-08-02 16:32:05.679773+00	\N	\N
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated, algorithm) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated, code_challenge, code_challenge_method, nonce, claims) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_idtoken; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.oauth2_provider_idtoken (id, jti, expires, scope, created, updated, application_id, user_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: djangouser
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 248, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 2, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cookbook_automation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_automation_id_seq', 1, false);


--
-- Name: cookbook_bookmarkletimport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_bookmarkletimport_id_seq', 1, false);


--
-- Name: cookbook_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_comment_id_seq', 1, false);


--
-- Name: cookbook_cooklog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_cooklog_id_seq', 1, false);


--
-- Name: cookbook_customfilter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_customfilter_id_seq', 1, false);


--
-- Name: cookbook_customfilter_shared_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_customfilter_shared_id_seq', 1, false);


--
-- Name: cookbook_exportlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_exportlog_id_seq', 1, false);


--
-- Name: cookbook_food_child_inherit_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_food_child_inherit_fields_id_seq', 1, false);


--
-- Name: cookbook_food_inherit_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_food_inherit_fields_id_seq', 1, false);


--
-- Name: cookbook_food_onhand_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_food_onhand_users_id_seq', 21, true);


--
-- Name: cookbook_food_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_food_properties_id_seq', 1, false);


--
-- Name: cookbook_food_substitute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_food_substitute_id_seq', 1, false);


--
-- Name: cookbook_foodinheritfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_foodinheritfield_id_seq', 6, true);


--
-- Name: cookbook_importlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_importlog_id_seq', 1, false);


--
-- Name: cookbook_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_ingredient_id_seq', 584, true);


--
-- Name: cookbook_invitelink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_invitelink_id_seq', 1, true);


--
-- Name: cookbook_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_keyword_id_seq', 1, false);


--
-- Name: cookbook_mealplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_mealplan_id_seq', 9, true);


--
-- Name: cookbook_mealplan_shared_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_mealplan_shared_id_seq', 1, false);


--
-- Name: cookbook_mealtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_mealtype_id_seq', 8, true);


--
-- Name: cookbook_nutritioninformation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_nutritioninformation_id_seq', 1, false);


--
-- Name: cookbook_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_property_id_seq', 1, false);


--
-- Name: cookbook_propertytype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_propertytype_id_seq', 4, true);


--
-- Name: cookbook_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipe_id_seq', 91, true);


--
-- Name: cookbook_recipe_keywords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipe_keywords_id_seq', 1, false);


--
-- Name: cookbook_recipe_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipe_properties_id_seq', 1, false);


--
-- Name: cookbook_recipe_shared_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipe_shared_id_seq', 1, false);


--
-- Name: cookbook_recipe_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipe_steps_id_seq', 228, true);


--
-- Name: cookbook_recipebook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipebook_id_seq', 2, true);


--
-- Name: cookbook_recipebook_shared_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipebook_shared_id_seq', 1, false);


--
-- Name: cookbook_recipebookentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipebookentry_id_seq', 1, false);


--
-- Name: cookbook_recipeimport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipeimport_id_seq', 1, false);


--
-- Name: cookbook_recipeingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_recipeingredients_id_seq', 1027, true);


--
-- Name: cookbook_searchfields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_searchfields_id_seq', 6, true);


--
-- Name: cookbook_searchpreference_fulltext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_searchpreference_fulltext_id_seq', 4, true);


--
-- Name: cookbook_searchpreference_icontains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_searchpreference_icontains_id_seq', 2, true);


--
-- Name: cookbook_searchpreference_istartswith_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_searchpreference_istartswith_id_seq', 1, false);


--
-- Name: cookbook_searchpreference_trigram_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_searchpreference_trigram_id_seq', 7, true);


--
-- Name: cookbook_searchpreference_unaccent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_searchpreference_unaccent_id_seq', 7, true);


--
-- Name: cookbook_sharelink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_sharelink_id_seq', 1, false);


--
-- Name: cookbook_shoppinglist_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_shoppinglist_entries_id_seq', 30, true);


--
-- Name: cookbook_shoppinglist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_shoppinglist_id_seq', 2, true);


--
-- Name: cookbook_shoppinglist_recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_shoppinglist_recipes_id_seq', 5, true);


--
-- Name: cookbook_shoppinglist_shared_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_shoppinglist_shared_id_seq', 1, false);


--
-- Name: cookbook_shoppinglistentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_shoppinglistentry_id_seq', 165, true);


--
-- Name: cookbook_shoppinglistrecipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_shoppinglistrecipe_id_seq', 16, true);


--
-- Name: cookbook_space_food_inherit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_space_food_inherit_id_seq', 1, false);


--
-- Name: cookbook_space_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_space_id_seq', 1, true);


--
-- Name: cookbook_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_step_id_seq', 116, true);


--
-- Name: cookbook_step_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_step_ingredients_id_seq', 1902, true);


--
-- Name: cookbook_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_storage_id_seq', 1, false);


--
-- Name: cookbook_supermarket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_supermarket_id_seq', 1, true);


--
-- Name: cookbook_supermarketcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_supermarketcategory_id_seq', 1, false);


--
-- Name: cookbook_supermarketcategoryrelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_supermarketcategoryrelation_id_seq', 1, false);


--
-- Name: cookbook_sync_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_sync_id_seq', 1, false);


--
-- Name: cookbook_synclog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_synclog_id_seq', 1, false);


--
-- Name: cookbook_telegrambot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_telegrambot_id_seq', 1, false);


--
-- Name: cookbook_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_unit_id_seq', 98, true);


--
-- Name: cookbook_unitconversion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_unitconversion_id_seq', 1, false);


--
-- Name: cookbook_userfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_userfile_id_seq', 1, false);


--
-- Name: cookbook_userpreference_plan_share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_userpreference_plan_share_id_seq', 1, false);


--
-- Name: cookbook_userpreference_shopping_share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_userpreference_shopping_share_id_seq', 1, false);


--
-- Name: cookbook_userspace_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_userspace_groups_id_seq', 2, true);


--
-- Name: cookbook_userspace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_userspace_id_seq', 2, true);


--
-- Name: cookbook_viewlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.cookbook_viewlog_id_seq', 324, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 62, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 234, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 2, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_idtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.oauth2_provider_idtoken_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: djangouser
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: cookbook_customfilter cf_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter
    ADD CONSTRAINT cf_unique_name_per_space UNIQUE (space_id, name);


--
-- Name: cookbook_automation cookbook_automation_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_automation
    ADD CONSTRAINT cookbook_automation_pkey PRIMARY KEY (id);


--
-- Name: cookbook_bookmarkletimport cookbook_bookmarkletimport_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_bookmarkletimport
    ADD CONSTRAINT cookbook_bookmarkletimport_pkey PRIMARY KEY (id);


--
-- Name: cookbook_comment cookbook_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_comment
    ADD CONSTRAINT cookbook_comment_pkey PRIMARY KEY (id);


--
-- Name: cookbook_cooklog cookbook_cooklog_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_cooklog
    ADD CONSTRAINT cookbook_cooklog_pkey PRIMARY KEY (id);


--
-- Name: cookbook_customfilter cookbook_customfilter_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter
    ADD CONSTRAINT cookbook_customfilter_pkey PRIMARY KEY (id);


--
-- Name: cookbook_customfilter_shared cookbook_customfilter_sh_customfilter_id_user_id_342df8ce_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter_shared
    ADD CONSTRAINT cookbook_customfilter_sh_customfilter_id_user_id_342df8ce_uniq UNIQUE (customfilter_id, user_id);


--
-- Name: cookbook_customfilter_shared cookbook_customfilter_shared_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter_shared
    ADD CONSTRAINT cookbook_customfilter_shared_pkey PRIMARY KEY (id);


--
-- Name: cookbook_exportlog cookbook_exportlog_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_exportlog
    ADD CONSTRAINT cookbook_exportlog_pkey PRIMARY KEY (id);


--
-- Name: cookbook_food_child_inherit_fields cookbook_food_child_inhe_food_id_foodinheritfield_30dde67b_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_child_inherit_fields
    ADD CONSTRAINT cookbook_food_child_inhe_food_id_foodinheritfield_30dde67b_uniq UNIQUE (food_id, foodinheritfield_id);


--
-- Name: cookbook_food_child_inherit_fields cookbook_food_child_inherit_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_child_inherit_fields
    ADD CONSTRAINT cookbook_food_child_inherit_fields_pkey PRIMARY KEY (id);


--
-- Name: cookbook_food_inherit_fields cookbook_food_inherit_fi_food_id_foodinheritfield_023b1d4a_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_inherit_fields
    ADD CONSTRAINT cookbook_food_inherit_fi_food_id_foodinheritfield_023b1d4a_uniq UNIQUE (food_id, foodinheritfield_id);


--
-- Name: cookbook_food_inherit_fields cookbook_food_inherit_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_inherit_fields
    ADD CONSTRAINT cookbook_food_inherit_fields_pkey PRIMARY KEY (id);


--
-- Name: cookbook_food_onhand_users cookbook_food_onhand_users_food_id_user_id_d771bbfc_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_onhand_users
    ADD CONSTRAINT cookbook_food_onhand_users_food_id_user_id_d771bbfc_uniq UNIQUE (food_id, user_id);


--
-- Name: cookbook_food_onhand_users cookbook_food_onhand_users_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_onhand_users
    ADD CONSTRAINT cookbook_food_onhand_users_pkey PRIMARY KEY (id);


--
-- Name: cookbook_food cookbook_food_path_1ddf3234_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_food_path_1ddf3234_uniq UNIQUE (path);


--
-- Name: cookbook_foodproperty cookbook_food_properties_food_id_property_id_9b9884de_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodproperty
    ADD CONSTRAINT cookbook_food_properties_food_id_property_id_9b9884de_uniq UNIQUE (food_id, property_id);


--
-- Name: cookbook_foodproperty cookbook_food_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodproperty
    ADD CONSTRAINT cookbook_food_properties_pkey PRIMARY KEY (id);


--
-- Name: cookbook_food_substitute cookbook_food_substitute_from_food_id_to_food_id_248a7c72_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_substitute
    ADD CONSTRAINT cookbook_food_substitute_from_food_id_to_food_id_248a7c72_uniq UNIQUE (from_food_id, to_food_id);


--
-- Name: cookbook_food_substitute cookbook_food_substitute_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_substitute
    ADD CONSTRAINT cookbook_food_substitute_pkey PRIMARY KEY (id);


--
-- Name: cookbook_foodinheritfield cookbook_foodinheritfield_field_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodinheritfield
    ADD CONSTRAINT cookbook_foodinheritfield_field_key UNIQUE (field);


--
-- Name: cookbook_foodinheritfield cookbook_foodinheritfield_name_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodinheritfield
    ADD CONSTRAINT cookbook_foodinheritfield_name_key UNIQUE (name);


--
-- Name: cookbook_foodinheritfield cookbook_foodinheritfield_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodinheritfield
    ADD CONSTRAINT cookbook_foodinheritfield_pkey PRIMARY KEY (id);


--
-- Name: cookbook_importlog cookbook_importlog_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_importlog
    ADD CONSTRAINT cookbook_importlog_pkey PRIMARY KEY (id);


--
-- Name: cookbook_food cookbook_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_ingredient_pkey PRIMARY KEY (id);


--
-- Name: cookbook_invitelink cookbook_invitelink_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_invitelink
    ADD CONSTRAINT cookbook_invitelink_pkey PRIMARY KEY (id);


--
-- Name: cookbook_keyword cookbook_keyword_path_2b09efce_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_keyword
    ADD CONSTRAINT cookbook_keyword_path_2b09efce_uniq UNIQUE (path);


--
-- Name: cookbook_keyword cookbook_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_keyword
    ADD CONSTRAINT cookbook_keyword_pkey PRIMARY KEY (id);


--
-- Name: cookbook_mealplan cookbook_mealplan_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan
    ADD CONSTRAINT cookbook_mealplan_pkey PRIMARY KEY (id);


--
-- Name: cookbook_mealplan_shared cookbook_mealplan_shared_mealplan_id_user_id_2781d748_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan_shared
    ADD CONSTRAINT cookbook_mealplan_shared_mealplan_id_user_id_2781d748_uniq UNIQUE (mealplan_id, user_id);


--
-- Name: cookbook_mealplan_shared cookbook_mealplan_shared_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan_shared
    ADD CONSTRAINT cookbook_mealplan_shared_pkey PRIMARY KEY (id);


--
-- Name: cookbook_mealtype cookbook_mealtype_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealtype
    ADD CONSTRAINT cookbook_mealtype_pkey PRIMARY KEY (id);


--
-- Name: cookbook_nutritioninformation cookbook_nutritioninformation_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_nutritioninformation
    ADD CONSTRAINT cookbook_nutritioninformation_pkey PRIMARY KEY (id);


--
-- Name: cookbook_property cookbook_property_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_property
    ADD CONSTRAINT cookbook_property_pkey PRIMARY KEY (id);


--
-- Name: cookbook_propertytype cookbook_propertytype_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_propertytype
    ADD CONSTRAINT cookbook_propertytype_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipe_keywords cookbook_recipe_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_keywords
    ADD CONSTRAINT cookbook_recipe_keywords_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipe_keywords cookbook_recipe_keywords_recipe_id_keyword_id_2a0d5c69_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_keywords
    ADD CONSTRAINT cookbook_recipe_keywords_recipe_id_keyword_id_2a0d5c69_uniq UNIQUE (recipe_id, keyword_id);


--
-- Name: cookbook_recipe cookbook_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe
    ADD CONSTRAINT cookbook_recipe_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipe_properties cookbook_recipe_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_properties
    ADD CONSTRAINT cookbook_recipe_properties_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipe_properties cookbook_recipe_properties_recipe_id_property_id_91323f5f_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_properties
    ADD CONSTRAINT cookbook_recipe_properties_recipe_id_property_id_91323f5f_uniq UNIQUE (recipe_id, property_id);


--
-- Name: cookbook_recipe_shared cookbook_recipe_shared_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_shared
    ADD CONSTRAINT cookbook_recipe_shared_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipe_shared cookbook_recipe_shared_recipe_id_user_id_b83779d6_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_shared
    ADD CONSTRAINT cookbook_recipe_shared_recipe_id_user_id_b83779d6_uniq UNIQUE (recipe_id, user_id);


--
-- Name: cookbook_recipe_steps cookbook_recipe_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_steps
    ADD CONSTRAINT cookbook_recipe_steps_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipe_steps cookbook_recipe_steps_recipe_id_step_id_5c618396_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_steps
    ADD CONSTRAINT cookbook_recipe_steps_recipe_id_step_id_5c618396_uniq UNIQUE (recipe_id, step_id);


--
-- Name: cookbook_recipebook cookbook_recipebook_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook
    ADD CONSTRAINT cookbook_recipebook_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipebook_shared cookbook_recipebook_shared_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook_shared
    ADD CONSTRAINT cookbook_recipebook_shared_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipebook_shared cookbook_recipebook_shared_recipebook_id_user_id_fa35bdff_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook_shared
    ADD CONSTRAINT cookbook_recipebook_shared_recipebook_id_user_id_fa35bdff_uniq UNIQUE (recipebook_id, user_id);


--
-- Name: cookbook_recipebookentry cookbook_recipebookentry_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebookentry
    ADD CONSTRAINT cookbook_recipebookentry_pkey PRIMARY KEY (id);


--
-- Name: cookbook_recipeimport cookbook_recipeimport_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipeimport
    ADD CONSTRAINT cookbook_recipeimport_pkey PRIMARY KEY (id);


--
-- Name: cookbook_ingredient cookbook_recipeingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_ingredient
    ADD CONSTRAINT cookbook_recipeingredients_pkey PRIMARY KEY (id);


--
-- Name: cookbook_searchfields cookbook_searchfields_field_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchfields
    ADD CONSTRAINT cookbook_searchfields_field_key UNIQUE (field);


--
-- Name: cookbook_searchfields cookbook_searchfields_name_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchfields
    ADD CONSTRAINT cookbook_searchfields_name_key UNIQUE (name);


--
-- Name: cookbook_searchfields cookbook_searchfields_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchfields
    ADD CONSTRAINT cookbook_searchfields_pkey PRIMARY KEY (id);


--
-- Name: cookbook_searchpreference_unaccent cookbook_searchpreferenc_searchpreference_id_sear_4a78952e_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_unaccent
    ADD CONSTRAINT cookbook_searchpreferenc_searchpreference_id_sear_4a78952e_uniq UNIQUE (searchpreference_id, searchfields_id);


--
-- Name: cookbook_searchpreference_fulltext cookbook_searchpreferenc_searchpreference_id_sear_5eaa3e80_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_fulltext
    ADD CONSTRAINT cookbook_searchpreferenc_searchpreference_id_sear_5eaa3e80_uniq UNIQUE (searchpreference_id, searchfields_id);


--
-- Name: cookbook_searchpreference_istartswith cookbook_searchpreferenc_searchpreference_id_sear_a16e210b_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_istartswith
    ADD CONSTRAINT cookbook_searchpreferenc_searchpreference_id_sear_a16e210b_uniq UNIQUE (searchpreference_id, searchfields_id);


--
-- Name: cookbook_searchpreference_trigram cookbook_searchpreferenc_searchpreference_id_sear_bc7bfba8_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_trigram
    ADD CONSTRAINT cookbook_searchpreferenc_searchpreference_id_sear_bc7bfba8_uniq UNIQUE (searchpreference_id, searchfields_id);


--
-- Name: cookbook_searchpreference_icontains cookbook_searchpreferenc_searchpreference_id_sear_ebce340f_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_icontains
    ADD CONSTRAINT cookbook_searchpreferenc_searchpreference_id_sear_ebce340f_uniq UNIQUE (searchpreference_id, searchfields_id);


--
-- Name: cookbook_searchpreference_fulltext cookbook_searchpreference_fulltext_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_fulltext
    ADD CONSTRAINT cookbook_searchpreference_fulltext_pkey PRIMARY KEY (id);


--
-- Name: cookbook_searchpreference_icontains cookbook_searchpreference_icontains_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_icontains
    ADD CONSTRAINT cookbook_searchpreference_icontains_pkey PRIMARY KEY (id);


--
-- Name: cookbook_searchpreference_istartswith cookbook_searchpreference_istartswith_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_istartswith
    ADD CONSTRAINT cookbook_searchpreference_istartswith_pkey PRIMARY KEY (id);


--
-- Name: cookbook_searchpreference cookbook_searchpreference_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference
    ADD CONSTRAINT cookbook_searchpreference_pkey PRIMARY KEY (user_id);


--
-- Name: cookbook_searchpreference_trigram cookbook_searchpreference_trigram_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_trigram
    ADD CONSTRAINT cookbook_searchpreference_trigram_pkey PRIMARY KEY (id);


--
-- Name: cookbook_searchpreference_unaccent cookbook_searchpreference_unaccent_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_unaccent
    ADD CONSTRAINT cookbook_searchpreference_unaccent_pkey PRIMARY KEY (id);


--
-- Name: cookbook_sharelink cookbook_sharelink_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sharelink
    ADD CONSTRAINT cookbook_sharelink_pkey PRIMARY KEY (id);


--
-- Name: cookbook_shoppinglist_entries cookbook_shoppinglist_en_shoppinglist_id_shopping_34a2ae06_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_entries
    ADD CONSTRAINT cookbook_shoppinglist_en_shoppinglist_id_shopping_34a2ae06_uniq UNIQUE (shoppinglist_id, shoppinglistentry_id);


--
-- Name: cookbook_shoppinglist_entries cookbook_shoppinglist_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_entries
    ADD CONSTRAINT cookbook_shoppinglist_entries_pkey PRIMARY KEY (id);


--
-- Name: cookbook_shoppinglist cookbook_shoppinglist_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist
    ADD CONSTRAINT cookbook_shoppinglist_pkey PRIMARY KEY (id);


--
-- Name: cookbook_shoppinglist_recipes cookbook_shoppinglist_re_shoppinglist_id_shopping_4b78b48e_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_recipes
    ADD CONSTRAINT cookbook_shoppinglist_re_shoppinglist_id_shopping_4b78b48e_uniq UNIQUE (shoppinglist_id, shoppinglistrecipe_id);


--
-- Name: cookbook_shoppinglist_recipes cookbook_shoppinglist_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_recipes
    ADD CONSTRAINT cookbook_shoppinglist_recipes_pkey PRIMARY KEY (id);


--
-- Name: cookbook_shoppinglist_shared cookbook_shoppinglist_sh_shoppinglist_id_user_id_8d158586_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_shared
    ADD CONSTRAINT cookbook_shoppinglist_sh_shoppinglist_id_user_id_8d158586_uniq UNIQUE (shoppinglist_id, user_id);


--
-- Name: cookbook_shoppinglist_shared cookbook_shoppinglist_shared_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_shared
    ADD CONSTRAINT cookbook_shoppinglist_shared_pkey PRIMARY KEY (id);


--
-- Name: cookbook_shoppinglistentry cookbook_shoppinglistentry_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry
    ADD CONSTRAINT cookbook_shoppinglistentry_pkey PRIMARY KEY (id);


--
-- Name: cookbook_shoppinglistrecipe cookbook_shoppinglistrecipe_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistrecipe
    ADD CONSTRAINT cookbook_shoppinglistrecipe_pkey PRIMARY KEY (id);


--
-- Name: cookbook_space_food_inherit cookbook_space_food_inhe_space_id_foodinheritfiel_7baf6565_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space_food_inherit
    ADD CONSTRAINT cookbook_space_food_inhe_space_id_foodinheritfiel_7baf6565_uniq UNIQUE (space_id, foodinheritfield_id);


--
-- Name: cookbook_space_food_inherit cookbook_space_food_inherit_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space_food_inherit
    ADD CONSTRAINT cookbook_space_food_inherit_pkey PRIMARY KEY (id);


--
-- Name: cookbook_space cookbook_space_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space
    ADD CONSTRAINT cookbook_space_pkey PRIMARY KEY (id);


--
-- Name: cookbook_step_ingredients cookbook_step_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step_ingredients
    ADD CONSTRAINT cookbook_step_ingredients_pkey PRIMARY KEY (id);


--
-- Name: cookbook_step_ingredients cookbook_step_ingredients_step_id_ingredient_id_3dda6a66_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step_ingredients
    ADD CONSTRAINT cookbook_step_ingredients_step_id_ingredient_id_3dda6a66_uniq UNIQUE (step_id, ingredient_id);


--
-- Name: cookbook_step cookbook_step_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step
    ADD CONSTRAINT cookbook_step_pkey PRIMARY KEY (id);


--
-- Name: cookbook_storage cookbook_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_storage
    ADD CONSTRAINT cookbook_storage_pkey PRIMARY KEY (id);


--
-- Name: cookbook_supermarket cookbook_supermarket_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarket
    ADD CONSTRAINT cookbook_supermarket_pkey PRIMARY KEY (id);


--
-- Name: cookbook_supermarketcategory cookbook_supermarketcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategory
    ADD CONSTRAINT cookbook_supermarketcategory_pkey PRIMARY KEY (id);


--
-- Name: cookbook_supermarketcategoryrelation cookbook_supermarketcategoryrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategoryrelation
    ADD CONSTRAINT cookbook_supermarketcategoryrelation_pkey PRIMARY KEY (id);


--
-- Name: cookbook_sync cookbook_sync_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sync
    ADD CONSTRAINT cookbook_sync_pkey PRIMARY KEY (id);


--
-- Name: cookbook_synclog cookbook_synclog_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_synclog
    ADD CONSTRAINT cookbook_synclog_pkey PRIMARY KEY (id);


--
-- Name: cookbook_telegrambot cookbook_telegrambot_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_telegrambot
    ADD CONSTRAINT cookbook_telegrambot_pkey PRIMARY KEY (id);


--
-- Name: cookbook_unit cookbook_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unit
    ADD CONSTRAINT cookbook_unit_pkey PRIMARY KEY (id);


--
-- Name: cookbook_unitconversion cookbook_unitconversion_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT cookbook_unitconversion_pkey PRIMARY KEY (id);


--
-- Name: cookbook_userfile cookbook_userfile_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userfile
    ADD CONSTRAINT cookbook_userfile_pkey PRIMARY KEY (id);


--
-- Name: cookbook_userpreference_plan_share cookbook_userpreference__userpreference_id_user_i_ae6e1d34_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_plan_share
    ADD CONSTRAINT cookbook_userpreference__userpreference_id_user_i_ae6e1d34_uniq UNIQUE (userpreference_id, user_id);


--
-- Name: cookbook_userpreference_shopping_share cookbook_userpreference__userpreference_id_user_i_b2bc39f7_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_shopping_share
    ADD CONSTRAINT cookbook_userpreference__userpreference_id_user_i_b2bc39f7_uniq UNIQUE (userpreference_id, user_id);


--
-- Name: cookbook_userpreference_plan_share cookbook_userpreference_plan_share_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_plan_share
    ADD CONSTRAINT cookbook_userpreference_plan_share_pkey PRIMARY KEY (id);


--
-- Name: cookbook_userpreference_shopping_share cookbook_userpreference_shopping_share_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_shopping_share
    ADD CONSTRAINT cookbook_userpreference_shopping_share_pkey PRIMARY KEY (id);


--
-- Name: cookbook_userpreference cookbook_userpreference_user_id_6f5d0c9f_pk; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference
    ADD CONSTRAINT cookbook_userpreference_user_id_6f5d0c9f_pk PRIMARY KEY (user_id);


--
-- Name: cookbook_userspace_groups cookbook_userspace_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace_groups
    ADD CONSTRAINT cookbook_userspace_groups_pkey PRIMARY KEY (id);


--
-- Name: cookbook_userspace_groups cookbook_userspace_groups_userspace_id_group_id_c0f03c1d_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace_groups
    ADD CONSTRAINT cookbook_userspace_groups_userspace_id_group_id_c0f03c1d_uniq UNIQUE (userspace_id, group_id);


--
-- Name: cookbook_userspace cookbook_userspace_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace
    ADD CONSTRAINT cookbook_userspace_pkey PRIMARY KEY (id);


--
-- Name: cookbook_viewlog cookbook_viewlog_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_viewlog
    ADD CONSTRAINT cookbook_viewlog_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: cookbook_unitconversion f_unique_conversion_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT f_unique_conversion_per_space UNIQUE (space_id, base_unit_id, converted_unit_id, food_id);


--
-- Name: cookbook_food f_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT f_unique_name_per_space UNIQUE (space_id, name);


--
-- Name: cookbook_food food_unique_open_data_slug_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT food_unique_open_data_slug_per_space UNIQUE (space_id, open_data_slug);


--
-- Name: cookbook_keyword kw_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_keyword
    ADD CONSTRAINT kw_unique_name_per_space UNIQUE (space_id, name);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_id_token_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_id_token_id_key UNIQUE (id_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_key UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_key UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_jti_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_jti_key UNIQUE (jti);


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: cookbook_propertytype property_type_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_propertytype
    ADD CONSTRAINT property_type_unique_name_per_space UNIQUE (space_id, name);


--
-- Name: cookbook_propertytype property_type_unique_open_data_slug_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_propertytype
    ADD CONSTRAINT property_type_unique_open_data_slug_per_space UNIQUE (space_id, open_data_slug);


--
-- Name: cookbook_foodproperty property_unique_food; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodproperty
    ADD CONSTRAINT property_unique_food UNIQUE (food_id, property_id);


--
-- Name: cookbook_property property_unique_import_food_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_property
    ADD CONSTRAINT property_unique_import_food_per_space UNIQUE (space_id, property_type_id, import_food_id);


--
-- Name: cookbook_recipebookentry rbe_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebookentry
    ADD CONSTRAINT rbe_unique_name_per_space UNIQUE (recipe_id, book_id);


--
-- Name: cookbook_supermarket sm_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarket
    ADD CONSTRAINT sm_unique_name_per_space UNIQUE (space_id, name);


--
-- Name: cookbook_supermarketcategory smc_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategory
    ADD CONSTRAINT smc_unique_name_per_space UNIQUE (space_id, name);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: cookbook_supermarketcategory supermarket_category_unique_open_data_slug_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategory
    ADD CONSTRAINT supermarket_category_unique_open_data_slug_per_space UNIQUE (space_id, open_data_slug);


--
-- Name: cookbook_supermarket supermarket_unique_open_data_slug_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarket
    ADD CONSTRAINT supermarket_unique_open_data_slug_per_space UNIQUE (space_id, open_data_slug);


--
-- Name: cookbook_unit u_unique_name_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unit
    ADD CONSTRAINT u_unique_name_per_space UNIQUE (space_id, name);


--
-- Name: cookbook_supermarketcategoryrelation unique_sm_category_relation; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategoryrelation
    ADD CONSTRAINT unique_sm_category_relation UNIQUE (supermarket_id, category_id);


--
-- Name: cookbook_unitconversion unit_conversion_unique_open_data_slug_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT unit_conversion_unique_open_data_slug_per_space UNIQUE (space_id, open_data_slug);


--
-- Name: cookbook_unit unit_unique_open_data_slug_per_space; Type: CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unit
    ADD CONSTRAINT unit_unique_open_data_slug_per_space UNIQUE (space_id, open_data_slug);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: cookbook_automation_created_by_id_751d239f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_automation_created_by_id_751d239f ON public.cookbook_automation USING btree (created_by_id);


--
-- Name: cookbook_automation_space_id_8b5f56ea; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_automation_space_id_8b5f56ea ON public.cookbook_automation USING btree (space_id);


--
-- Name: cookbook_bookmarkletimport_created_by_id_bc6f07c3; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_bookmarkletimport_created_by_id_bc6f07c3 ON public.cookbook_bookmarkletimport USING btree (created_by_id);


--
-- Name: cookbook_bookmarkletimport_space_id_66ae4586; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_bookmarkletimport_space_id_66ae4586 ON public.cookbook_bookmarkletimport USING btree (space_id);


--
-- Name: cookbook_co_created_7ea086_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_co_created_7ea086_idx ON public.cookbook_cooklog USING btree (created_by_id);


--
-- Name: cookbook_co_created_f5ccd7_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_co_created_f5ccd7_idx ON public.cookbook_cooklog USING btree (created_by_id, rating);


--
-- Name: cookbook_co_created_f6e244_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_co_created_f6e244_idx ON public.cookbook_cooklog USING btree (created_at DESC);


--
-- Name: cookbook_co_id_553a6d_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_co_id_553a6d_idx ON public.cookbook_cooklog USING btree (id);


--
-- Name: cookbook_co_rating_aa7662_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_co_rating_aa7662_idx ON public.cookbook_cooklog USING btree (rating);


--
-- Name: cookbook_co_recipe__8ec719_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_co_recipe__8ec719_idx ON public.cookbook_cooklog USING btree (recipe_id);


--
-- Name: cookbook_comment_created_by_id_e88e3920; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_comment_created_by_id_e88e3920 ON public.cookbook_comment USING btree (created_by_id);


--
-- Name: cookbook_comment_recipe_id_89daaae3; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_comment_recipe_id_89daaae3 ON public.cookbook_comment USING btree (recipe_id);


--
-- Name: cookbook_cooklog_created_by_id_e442291b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_cooklog_created_by_id_e442291b ON public.cookbook_cooklog USING btree (created_by_id);


--
-- Name: cookbook_cooklog_recipe_id_a8259608; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_cooklog_recipe_id_a8259608 ON public.cookbook_cooklog USING btree (recipe_id);


--
-- Name: cookbook_cooklog_space_id_7d005ce1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_cooklog_space_id_7d005ce1 ON public.cookbook_cooklog USING btree (space_id);


--
-- Name: cookbook_customfilter_created_by_id_83409b14; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_customfilter_created_by_id_83409b14 ON public.cookbook_customfilter USING btree (created_by_id);


--
-- Name: cookbook_customfilter_shared_customfilter_id_95b15fc2; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_customfilter_shared_customfilter_id_95b15fc2 ON public.cookbook_customfilter_shared USING btree (customfilter_id);


--
-- Name: cookbook_customfilter_shared_user_id_9473d70e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_customfilter_shared_user_id_9473d70e ON public.cookbook_customfilter_shared USING btree (user_id);


--
-- Name: cookbook_customfilter_space_id_ab8c10e8; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_customfilter_space_id_ab8c10e8 ON public.cookbook_customfilter USING btree (space_id);


--
-- Name: cookbook_exportlog_created_by_id_0bbeae7a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_exportlog_created_by_id_0bbeae7a ON public.cookbook_exportlog USING btree (created_by_id);


--
-- Name: cookbook_exportlog_space_id_eaf55b2b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_exportlog_space_id_eaf55b2b ON public.cookbook_exportlog USING btree (space_id);


--
-- Name: cookbook_fo_id_3c379b_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_fo_id_3c379b_idx ON public.cookbook_food USING btree (id);


--
-- Name: cookbook_fo_name_c848b6_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_fo_name_c848b6_idx ON public.cookbook_food USING btree (name);


--
-- Name: cookbook_food_child_inherit_fields_food_id_867e4ef9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_child_inherit_fields_food_id_867e4ef9 ON public.cookbook_food_child_inherit_fields USING btree (food_id);


--
-- Name: cookbook_food_child_inherit_fields_foodinheritfield_id_46ced68c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_child_inherit_fields_foodinheritfield_id_46ced68c ON public.cookbook_food_child_inherit_fields USING btree (foodinheritfield_id);


--
-- Name: cookbook_food_inherit_fields_food_id_c401a750; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_inherit_fields_food_id_c401a750 ON public.cookbook_food_inherit_fields USING btree (food_id);


--
-- Name: cookbook_food_inherit_fields_foodinheritfield_id_4897e0ea; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_inherit_fields_foodinheritfield_id_4897e0ea ON public.cookbook_food_inherit_fields USING btree (foodinheritfield_id);


--
-- Name: cookbook_food_onhand_users_food_id_307e2861; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_onhand_users_food_id_307e2861 ON public.cookbook_food_onhand_users USING btree (food_id);


--
-- Name: cookbook_food_onhand_users_user_id_7cd9fdd1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_onhand_users_user_id_7cd9fdd1 ON public.cookbook_food_onhand_users USING btree (user_id);


--
-- Name: cookbook_food_path_1ddf3234_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_path_1ddf3234_like ON public.cookbook_food USING btree (path varchar_pattern_ops);


--
-- Name: cookbook_food_preferred_shopping_unit_id_26e5c310; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_preferred_shopping_unit_id_26e5c310 ON public.cookbook_food USING btree (preferred_shopping_unit_id);


--
-- Name: cookbook_food_preferred_unit_id_2f418c4b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_preferred_unit_id_2f418c4b ON public.cookbook_food USING btree (preferred_unit_id);


--
-- Name: cookbook_food_properties_food_id_4c533fef; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_properties_food_id_4c533fef ON public.cookbook_foodproperty USING btree (food_id);


--
-- Name: cookbook_food_properties_food_unit_id_d7b17c55; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_properties_food_unit_id_d7b17c55 ON public.cookbook_food USING btree (properties_food_unit_id);


--
-- Name: cookbook_food_properties_property_id_d079e963; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_properties_property_id_d079e963 ON public.cookbook_foodproperty USING btree (property_id);


--
-- Name: cookbook_food_space_id_7506856c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_space_id_7506856c ON public.cookbook_food USING btree (space_id);


--
-- Name: cookbook_food_substitute_from_food_id_4ef3bd19; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_substitute_from_food_id_4ef3bd19 ON public.cookbook_food_substitute USING btree (from_food_id);


--
-- Name: cookbook_food_substitute_to_food_id_a780feca; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_substitute_to_food_id_a780feca ON public.cookbook_food_substitute USING btree (to_food_id);


--
-- Name: cookbook_food_supermarket_category_id_1eb69e11; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_food_supermarket_category_id_1eb69e11 ON public.cookbook_food USING btree (supermarket_category_id);


--
-- Name: cookbook_foodinheritfield_field_4ede416a_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_foodinheritfield_field_4ede416a_like ON public.cookbook_foodinheritfield USING btree (field varchar_pattern_ops);


--
-- Name: cookbook_foodinheritfield_name_2bb09280_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_foodinheritfield_name_2bb09280_like ON public.cookbook_foodinheritfield USING btree (name varchar_pattern_ops);


--
-- Name: cookbook_importlog_created_by_id_7317acea; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_importlog_created_by_id_7317acea ON public.cookbook_importlog USING btree (created_by_id);


--
-- Name: cookbook_importlog_keyword_id_5d78d756; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_importlog_keyword_id_5d78d756 ON public.cookbook_importlog USING btree (keyword_id);


--
-- Name: cookbook_importlog_space_id_237e01cd; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_importlog_space_id_237e01cd ON public.cookbook_importlog USING btree (space_id);


--
-- Name: cookbook_in_id_2c1f57_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_in_id_2c1f57_idx ON public.cookbook_ingredient USING btree (id);


--
-- Name: cookbook_ingredient_name_ca3c37c7_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_ingredient_name_ca3c37c7_like ON public.cookbook_food USING btree (name varchar_pattern_ops);


--
-- Name: cookbook_ingredient_recipe_id_8a38f9bf; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_ingredient_recipe_id_8a38f9bf ON public.cookbook_food USING btree (recipe_id);


--
-- Name: cookbook_ingredient_space_id_8af9a53c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_ingredient_space_id_8af9a53c ON public.cookbook_ingredient USING btree (space_id);


--
-- Name: cookbook_invitelink_created_by_id_95f9aed6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_invitelink_created_by_id_95f9aed6 ON public.cookbook_invitelink USING btree (created_by_id);


--
-- Name: cookbook_invitelink_group_id_b93a5dc8; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_invitelink_group_id_b93a5dc8 ON public.cookbook_invitelink USING btree (group_id);


--
-- Name: cookbook_invitelink_space_id_70340e84; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_invitelink_space_id_70340e84 ON public.cookbook_invitelink USING btree (space_id);


--
-- Name: cookbook_invitelink_used_by_id_8a3cdc6d; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_invitelink_used_by_id_8a3cdc6d ON public.cookbook_invitelink USING btree (used_by_id);


--
-- Name: cookbook_ke_id_ebc03f_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_ke_id_ebc03f_idx ON public.cookbook_keyword USING btree (id, name);


--
-- Name: cookbook_keyword_path_2b09efce_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_keyword_path_2b09efce_like ON public.cookbook_keyword USING btree (path varchar_pattern_ops);


--
-- Name: cookbook_keyword_space_id_7b44ffc9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_keyword_space_id_7b44ffc9 ON public.cookbook_keyword USING btree (space_id);


--
-- Name: cookbook_mealplan_meal_type_id_34ede76c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealplan_meal_type_id_34ede76c ON public.cookbook_mealplan USING btree (meal_type_id);


--
-- Name: cookbook_mealplan_recipe_id_6cefb069; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealplan_recipe_id_6cefb069 ON public.cookbook_mealplan USING btree (recipe_id);


--
-- Name: cookbook_mealplan_shared_mealplan_id_45732190; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealplan_shared_mealplan_id_45732190 ON public.cookbook_mealplan_shared USING btree (mealplan_id);


--
-- Name: cookbook_mealplan_shared_user_id_8715cd4d; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealplan_shared_user_id_8715cd4d ON public.cookbook_mealplan_shared USING btree (user_id);


--
-- Name: cookbook_mealplan_space_id_83d1a9a7; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealplan_space_id_83d1a9a7 ON public.cookbook_mealplan USING btree (space_id);


--
-- Name: cookbook_mealplan_user_id_38c171b1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealplan_user_id_38c171b1 ON public.cookbook_mealplan USING btree (created_by_id);


--
-- Name: cookbook_mealtype_created_by_id_bd5877ee; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealtype_created_by_id_bd5877ee ON public.cookbook_mealtype USING btree (created_by_id);


--
-- Name: cookbook_mealtype_space_id_edaaeb6c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_mealtype_space_id_edaaeb6c ON public.cookbook_mealtype USING btree (space_id);


--
-- Name: cookbook_nutritioninformation_space_id_942c878e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_nutritioninformation_space_id_942c878e ON public.cookbook_nutritioninformation USING btree (space_id);


--
-- Name: cookbook_property_property_type_id_4184de5b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_property_property_type_id_4184de5b ON public.cookbook_property USING btree (property_type_id);


--
-- Name: cookbook_property_space_id_9845a1fd; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_property_space_id_9845a1fd ON public.cookbook_property USING btree (space_id);


--
-- Name: cookbook_propertytype_space_id_c7f65948; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_propertytype_space_id_c7f65948 ON public.cookbook_propertytype USING btree (space_id);


--
-- Name: cookbook_re_desc_se_fdee30_gin; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_re_desc_se_fdee30_gin ON public.cookbook_recipe USING gin (desc_search_vector);


--
-- Name: cookbook_re_id_b2bdcf_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_re_id_b2bdcf_idx ON public.cookbook_recipe USING btree (id);


--
-- Name: cookbook_re_name_94cc63_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_re_name_94cc63_idx ON public.cookbook_recipebook USING btree (name);


--
-- Name: cookbook_re_name_b8a027_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_re_name_b8a027_idx ON public.cookbook_recipe USING btree (name);


--
-- Name: cookbook_re_name_se_5dbbd5_gin; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_re_name_se_5dbbd5_gin ON public.cookbook_recipe USING gin (name_search_vector);


--
-- Name: cookbook_recipe_created_by_id_9deb3c0c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_created_by_id_9deb3c0c ON public.cookbook_recipe USING btree (created_by_id);


--
-- Name: cookbook_recipe_keywords_keyword_id_94a6e96a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_keywords_keyword_id_94a6e96a ON public.cookbook_recipe_keywords USING btree (keyword_id);


--
-- Name: cookbook_recipe_keywords_recipe_id_87bc53ad; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_keywords_recipe_id_87bc53ad ON public.cookbook_recipe_keywords USING btree (recipe_id);


--
-- Name: cookbook_recipe_nutrition_id_54975a42; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_nutrition_id_54975a42 ON public.cookbook_recipe USING btree (nutrition_id);


--
-- Name: cookbook_recipe_properties_property_id_2302b4a9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_properties_property_id_2302b4a9 ON public.cookbook_recipe_properties USING btree (property_id);


--
-- Name: cookbook_recipe_properties_recipe_id_e148c678; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_properties_recipe_id_e148c678 ON public.cookbook_recipe_properties USING btree (recipe_id);


--
-- Name: cookbook_recipe_shared_recipe_id_00bf8a92; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_shared_recipe_id_00bf8a92 ON public.cookbook_recipe_shared USING btree (recipe_id);


--
-- Name: cookbook_recipe_shared_user_id_167b85d2; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_shared_user_id_167b85d2 ON public.cookbook_recipe_shared USING btree (user_id);


--
-- Name: cookbook_recipe_space_id_26762ca7; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_space_id_26762ca7 ON public.cookbook_recipe USING btree (space_id);


--
-- Name: cookbook_recipe_steps_recipe_id_cb98d48a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_steps_recipe_id_cb98d48a ON public.cookbook_recipe_steps USING btree (recipe_id);


--
-- Name: cookbook_recipe_steps_step_id_5565a252; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_steps_step_id_5565a252 ON public.cookbook_recipe_steps USING btree (step_id);


--
-- Name: cookbook_recipe_storage_id_38e8031f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipe_storage_id_38e8031f ON public.cookbook_recipe USING btree (storage_id);


--
-- Name: cookbook_recipebook_filter_id_b6f8cab0; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipebook_filter_id_b6f8cab0 ON public.cookbook_recipebook USING btree (filter_id);


--
-- Name: cookbook_recipebook_shared_recipebook_id_4b306f2e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipebook_shared_recipebook_id_4b306f2e ON public.cookbook_recipebook_shared USING btree (recipebook_id);


--
-- Name: cookbook_recipebook_shared_user_id_43985dd2; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipebook_shared_user_id_43985dd2 ON public.cookbook_recipebook_shared USING btree (user_id);


--
-- Name: cookbook_recipebook_space_id_bccb4e49; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipebook_space_id_bccb4e49 ON public.cookbook_recipebook USING btree (space_id);


--
-- Name: cookbook_recipebook_user_id_2a8a0905; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipebook_user_id_2a8a0905 ON public.cookbook_recipebook USING btree (created_by_id);


--
-- Name: cookbook_recipebookentry_book_id_748059dd; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipebookentry_book_id_748059dd ON public.cookbook_recipebookentry USING btree (book_id);


--
-- Name: cookbook_recipebookentry_recipe_id_c5a18fb2; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipebookentry_recipe_id_c5a18fb2 ON public.cookbook_recipebookentry USING btree (recipe_id);


--
-- Name: cookbook_recipeimport_space_id_ce243a93; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipeimport_space_id_ce243a93 ON public.cookbook_recipeimport USING btree (space_id);


--
-- Name: cookbook_recipeimport_storage_id_82a4d44b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipeimport_storage_id_82a4d44b ON public.cookbook_recipeimport USING btree (storage_id);


--
-- Name: cookbook_recipeingredient_ingredient_id_e81099ac; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipeingredient_ingredient_id_e81099ac ON public.cookbook_ingredient USING btree (food_id);


--
-- Name: cookbook_recipeingredients_unit_key_id_0ac3a92c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_recipeingredients_unit_key_id_0ac3a92c ON public.cookbook_ingredient USING btree (unit_id);


--
-- Name: cookbook_searchfields_field_93c41a66_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchfields_field_93c41a66_like ON public.cookbook_searchfields USING btree (field varchar_pattern_ops);


--
-- Name: cookbook_searchfields_name_963f1eab_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchfields_name_963f1eab_like ON public.cookbook_searchfields USING btree (name varchar_pattern_ops);


--
-- Name: cookbook_searchpreference__searchpreference_id_0306cc90; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference__searchpreference_id_0306cc90 ON public.cookbook_searchpreference_icontains USING btree (searchpreference_id);


--
-- Name: cookbook_searchpreference__searchpreference_id_15af2dd9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference__searchpreference_id_15af2dd9 ON public.cookbook_searchpreference_istartswith USING btree (searchpreference_id);


--
-- Name: cookbook_searchpreference_fulltext_searchfields_id_aa8cc3ab; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_fulltext_searchfields_id_aa8cc3ab ON public.cookbook_searchpreference_fulltext USING btree (searchfields_id);


--
-- Name: cookbook_searchpreference_fulltext_searchpreference_id_9a3d14f4; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_fulltext_searchpreference_id_9a3d14f4 ON public.cookbook_searchpreference_fulltext USING btree (searchpreference_id);


--
-- Name: cookbook_searchpreference_icontains_searchfields_id_472706b6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_icontains_searchfields_id_472706b6 ON public.cookbook_searchpreference_icontains USING btree (searchfields_id);


--
-- Name: cookbook_searchpreference_istartswith_searchfields_id_591bfddd; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_istartswith_searchfields_id_591bfddd ON public.cookbook_searchpreference_istartswith USING btree (searchfields_id);


--
-- Name: cookbook_searchpreference_trigram_searchfields_id_b9288b9d; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_trigram_searchfields_id_b9288b9d ON public.cookbook_searchpreference_trigram USING btree (searchfields_id);


--
-- Name: cookbook_searchpreference_trigram_searchpreference_id_7884147e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_trigram_searchpreference_id_7884147e ON public.cookbook_searchpreference_trigram USING btree (searchpreference_id);


--
-- Name: cookbook_searchpreference_unaccent_searchfields_id_51b33696; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_unaccent_searchfields_id_51b33696 ON public.cookbook_searchpreference_unaccent USING btree (searchfields_id);


--
-- Name: cookbook_searchpreference_unaccent_searchpreference_id_c2c5cb8c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_searchpreference_unaccent_searchpreference_id_c2c5cb8c ON public.cookbook_searchpreference_unaccent USING btree (searchpreference_id);


--
-- Name: cookbook_sharelink_created_by_id_727060e1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_sharelink_created_by_id_727060e1 ON public.cookbook_sharelink USING btree (created_by_id);


--
-- Name: cookbook_sharelink_recipe_id_4745561e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_sharelink_recipe_id_4745561e ON public.cookbook_sharelink USING btree (recipe_id);


--
-- Name: cookbook_sharelink_space_id_057148be; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_sharelink_space_id_057148be ON public.cookbook_sharelink USING btree (space_id);


--
-- Name: cookbook_shoppinglist_created_by_id_8deb115f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_created_by_id_8deb115f ON public.cookbook_shoppinglist USING btree (created_by_id);


--
-- Name: cookbook_shoppinglist_entries_shoppinglist_id_fe682466; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_entries_shoppinglist_id_fe682466 ON public.cookbook_shoppinglist_entries USING btree (shoppinglist_id);


--
-- Name: cookbook_shoppinglist_entries_shoppinglistentry_id_17d2a305; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_entries_shoppinglistentry_id_17d2a305 ON public.cookbook_shoppinglist_entries USING btree (shoppinglistentry_id);


--
-- Name: cookbook_shoppinglist_recipes_shoppinglist_id_96036b98; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_recipes_shoppinglist_id_96036b98 ON public.cookbook_shoppinglist_recipes USING btree (shoppinglist_id);


--
-- Name: cookbook_shoppinglist_recipes_shoppinglistrecipe_id_20d550a1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_recipes_shoppinglistrecipe_id_20d550a1 ON public.cookbook_shoppinglist_recipes USING btree (shoppinglistrecipe_id);


--
-- Name: cookbook_shoppinglist_shared_shoppinglist_id_7c59c8fb; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_shared_shoppinglist_id_7c59c8fb ON public.cookbook_shoppinglist_shared USING btree (shoppinglist_id);


--
-- Name: cookbook_shoppinglist_shared_user_id_ddb3de18; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_shared_user_id_ddb3de18 ON public.cookbook_shoppinglist_shared USING btree (user_id);


--
-- Name: cookbook_shoppinglist_space_id_63817551; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_space_id_63817551 ON public.cookbook_shoppinglist USING btree (space_id);


--
-- Name: cookbook_shoppinglist_supermarket_id_b32e2f55; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglist_supermarket_id_b32e2f55 ON public.cookbook_shoppinglist USING btree (supermarket_id);


--
-- Name: cookbook_shoppinglistentry_created_by_id_6703f4a5; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistentry_created_by_id_6703f4a5 ON public.cookbook_shoppinglistentry USING btree (created_by_id);


--
-- Name: cookbook_shoppinglistentry_food_id_ea0df05b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistentry_food_id_ea0df05b ON public.cookbook_shoppinglistentry USING btree (food_id);


--
-- Name: cookbook_shoppinglistentry_ingredient_id_9e69abb6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistentry_ingredient_id_9e69abb6 ON public.cookbook_shoppinglistentry USING btree (ingredient_id);


--
-- Name: cookbook_shoppinglistentry_list_recipe_id_88aff588; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistentry_list_recipe_id_88aff588 ON public.cookbook_shoppinglistentry USING btree (list_recipe_id);


--
-- Name: cookbook_shoppinglistentry_space_id_e5f4be53; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistentry_space_id_e5f4be53 ON public.cookbook_shoppinglistentry USING btree (space_id);


--
-- Name: cookbook_shoppinglistentry_unit_id_fb7bc5f0; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistentry_unit_id_fb7bc5f0 ON public.cookbook_shoppinglistentry USING btree (unit_id);


--
-- Name: cookbook_shoppinglistrecipe_mealplan_id_4c4a3a29; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistrecipe_mealplan_id_4c4a3a29 ON public.cookbook_shoppinglistrecipe USING btree (mealplan_id);


--
-- Name: cookbook_shoppinglistrecipe_recipe_id_6baab510; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_shoppinglistrecipe_recipe_id_6baab510 ON public.cookbook_shoppinglistrecipe USING btree (recipe_id);


--
-- Name: cookbook_space_created_by_id_7499949f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_space_created_by_id_7499949f ON public.cookbook_space USING btree (created_by_id);


--
-- Name: cookbook_space_food_inherit_foodinheritfield_id_e873012b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_space_food_inherit_foodinheritfield_id_e873012b ON public.cookbook_space_food_inherit USING btree (foodinheritfield_id);


--
-- Name: cookbook_space_food_inherit_space_id_eca83965; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_space_food_inherit_space_id_eca83965 ON public.cookbook_space_food_inherit USING btree (space_id);


--
-- Name: cookbook_space_image_id_85b74808; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_space_image_id_85b74808 ON public.cookbook_space USING btree (image_id);


--
-- Name: cookbook_st_search__2ef7fa_gin; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_st_search__2ef7fa_gin ON public.cookbook_step USING gin (search_vector);


--
-- Name: cookbook_step_file_id_b511ff2c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_step_file_id_b511ff2c ON public.cookbook_step USING btree (file_id);


--
-- Name: cookbook_step_ingredients_ingredient_id_d6431b70; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_step_ingredients_ingredient_id_d6431b70 ON public.cookbook_step_ingredients USING btree (ingredient_id);


--
-- Name: cookbook_step_ingredients_step_id_dfac35a5; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_step_ingredients_step_id_dfac35a5 ON public.cookbook_step_ingredients USING btree (step_id);


--
-- Name: cookbook_step_space_id_fe3f078f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_step_space_id_fe3f078f ON public.cookbook_step USING btree (space_id);


--
-- Name: cookbook_step_step_recipe_id_3a856493; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_step_step_recipe_id_3a856493 ON public.cookbook_step USING btree (step_recipe_id);


--
-- Name: cookbook_storage_created_by_id_a9fdcb08; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_storage_created_by_id_a9fdcb08 ON public.cookbook_storage USING btree (created_by_id);


--
-- Name: cookbook_storage_space_id_1f875e70; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_storage_space_id_1f875e70 ON public.cookbook_storage USING btree (space_id);


--
-- Name: cookbook_supermarket_space_id_d45d0500; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_supermarket_space_id_d45d0500 ON public.cookbook_supermarket USING btree (space_id);


--
-- Name: cookbook_supermarketcategory_space_id_bde9c2c1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_supermarketcategory_space_id_bde9c2c1 ON public.cookbook_supermarketcategory USING btree (space_id);


--
-- Name: cookbook_supermarketcategoryrelation_category_id_479ed1e6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_supermarketcategoryrelation_category_id_479ed1e6 ON public.cookbook_supermarketcategoryrelation USING btree (category_id);


--
-- Name: cookbook_supermarketcategoryrelation_supermarket_id_9c010bab; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_supermarketcategoryrelation_supermarket_id_9c010bab ON public.cookbook_supermarketcategoryrelation USING btree (supermarket_id);


--
-- Name: cookbook_sync_space_id_28a032b1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_sync_space_id_28a032b1 ON public.cookbook_sync USING btree (space_id);


--
-- Name: cookbook_sync_storage_id_53b98652; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_sync_storage_id_53b98652 ON public.cookbook_sync USING btree (storage_id);


--
-- Name: cookbook_synclog_sync_id_4bfcba4a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_synclog_sync_id_4bfcba4a ON public.cookbook_synclog USING btree (sync_id);


--
-- Name: cookbook_telegrambot_created_by_id_44e39215; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_telegrambot_created_by_id_44e39215 ON public.cookbook_telegrambot USING btree (created_by_id);


--
-- Name: cookbook_telegrambot_space_id_ba1c2347; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_telegrambot_space_id_ba1c2347 ON public.cookbook_telegrambot USING btree (space_id);


--
-- Name: cookbook_unit_space_id_7bca8466; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_unit_space_id_7bca8466 ON public.cookbook_unit USING btree (space_id);


--
-- Name: cookbook_unitconversion_base_unit_id_9985ec49; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_unitconversion_base_unit_id_9985ec49 ON public.cookbook_unitconversion USING btree (base_unit_id);


--
-- Name: cookbook_unitconversion_converted_unit_id_5b8aa5a3; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_unitconversion_converted_unit_id_5b8aa5a3 ON public.cookbook_unitconversion USING btree (converted_unit_id);


--
-- Name: cookbook_unitconversion_created_by_id_dcdba77b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_unitconversion_created_by_id_dcdba77b ON public.cookbook_unitconversion USING btree (created_by_id);


--
-- Name: cookbook_unitconversion_food_id_4f9c4eb0; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_unitconversion_food_id_4f9c4eb0 ON public.cookbook_unitconversion USING btree (food_id);


--
-- Name: cookbook_unitconversion_space_id_221cd4a8; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_unitconversion_space_id_221cd4a8 ON public.cookbook_unitconversion USING btree (space_id);


--
-- Name: cookbook_userfile_created_by_id_a6850ccf; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userfile_created_by_id_a6850ccf ON public.cookbook_userfile USING btree (created_by_id);


--
-- Name: cookbook_userfile_space_id_954be4eb; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userfile_space_id_954be4eb ON public.cookbook_userfile USING btree (space_id);


--
-- Name: cookbook_userpreference_image_id_01bfc1c1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userpreference_image_id_01bfc1c1 ON public.cookbook_userpreference USING btree (image_id);


--
-- Name: cookbook_userpreference_plan_share_user_id_c755ee99; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userpreference_plan_share_user_id_c755ee99 ON public.cookbook_userpreference_plan_share USING btree (user_id);


--
-- Name: cookbook_userpreference_plan_share_userpreference_id_87373d85; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userpreference_plan_share_userpreference_id_87373d85 ON public.cookbook_userpreference_plan_share USING btree (userpreference_id);


--
-- Name: cookbook_userpreference_sh_userpreference_id_fdbb11a9; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userpreference_sh_userpreference_id_fdbb11a9 ON public.cookbook_userpreference_shopping_share USING btree (userpreference_id);


--
-- Name: cookbook_userpreference_shopping_share_user_id_3a04ee80; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userpreference_shopping_share_user_id_3a04ee80 ON public.cookbook_userpreference_shopping_share USING btree (user_id);


--
-- Name: cookbook_userspace_groups_group_id_b6bf66da; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userspace_groups_group_id_b6bf66da ON public.cookbook_userspace_groups USING btree (group_id);


--
-- Name: cookbook_userspace_groups_userspace_id_cf39ce1b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userspace_groups_userspace_id_cf39ce1b ON public.cookbook_userspace_groups USING btree (userspace_id);


--
-- Name: cookbook_userspace_invite_link_id_627899a5; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userspace_invite_link_id_627899a5 ON public.cookbook_userspace USING btree (invite_link_id);


--
-- Name: cookbook_userspace_space_id_2d833713; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userspace_space_id_2d833713 ON public.cookbook_userspace USING btree (space_id);


--
-- Name: cookbook_userspace_user_id_3e254f5c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_userspace_user_id_3e254f5c ON public.cookbook_userspace USING btree (user_id);


--
-- Name: cookbook_vi_created_bd2b5f_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_vi_created_bd2b5f_idx ON public.cookbook_viewlog USING btree (created_at DESC);


--
-- Name: cookbook_vi_created_f9385c_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_vi_created_f9385c_idx ON public.cookbook_viewlog USING btree (created_by_id);


--
-- Name: cookbook_vi_recipe__1b051f_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_vi_recipe__1b051f_idx ON public.cookbook_viewlog USING btree (recipe_id, created_at DESC, created_by_id);


--
-- Name: cookbook_vi_recipe__ce995d_idx; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_vi_recipe__ce995d_idx ON public.cookbook_viewlog USING btree (recipe_id);


--
-- Name: cookbook_viewlog_created_by_id_f0294e75; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_viewlog_created_by_id_f0294e75 ON public.cookbook_viewlog USING btree (created_by_id);


--
-- Name: cookbook_viewlog_recipe_id_a4c7d71a; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_viewlog_recipe_id_a4c7d71a ON public.cookbook_viewlog USING btree (recipe_id);


--
-- Name: cookbook_viewlog_space_id_0ce48f5b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX cookbook_viewlog_space_id_0ce48f5b ON public.cookbook_viewlog USING btree (space_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_idtoken_application_id_08c5ff4f; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_idtoken_application_id_08c5ff4f ON public.oauth2_provider_idtoken USING btree (application_id);


--
-- Name: oauth2_provider_idtoken_user_id_dd512b59; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_idtoken_user_id_dd512b59 ON public.oauth2_provider_idtoken USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: djangouser
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_automation cookbook_automation_created_by_id_751d239f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_automation
    ADD CONSTRAINT cookbook_automation_created_by_id_751d239f_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_automation cookbook_automation_space_id_8b5f56ea_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_automation
    ADD CONSTRAINT cookbook_automation_space_id_8b5f56ea_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_bookmarkletimport cookbook_bookmarklet_created_by_id_bc6f07c3_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_bookmarkletimport
    ADD CONSTRAINT cookbook_bookmarklet_created_by_id_bc6f07c3_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_bookmarkletimport cookbook_bookmarklet_space_id_66ae4586_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_bookmarkletimport
    ADD CONSTRAINT cookbook_bookmarklet_space_id_66ae4586_fk_cookbook_ FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_comment cookbook_comment_created_by_id_e88e3920_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_comment
    ADD CONSTRAINT cookbook_comment_created_by_id_e88e3920_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_comment cookbook_comment_recipe_id_89daaae3_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_comment
    ADD CONSTRAINT cookbook_comment_recipe_id_89daaae3_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_cooklog cookbook_cooklog_created_by_id_e442291b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_cooklog
    ADD CONSTRAINT cookbook_cooklog_created_by_id_e442291b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_cooklog cookbook_cooklog_recipe_id_a8259608_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_cooklog
    ADD CONSTRAINT cookbook_cooklog_recipe_id_a8259608_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_cooklog cookbook_cooklog_space_id_7d005ce1_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_cooklog
    ADD CONSTRAINT cookbook_cooklog_space_id_7d005ce1_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_customfilter_shared cookbook_customfilte_customfilter_id_95b15fc2_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter_shared
    ADD CONSTRAINT cookbook_customfilte_customfilter_id_95b15fc2_fk_cookbook_ FOREIGN KEY (customfilter_id) REFERENCES public.cookbook_customfilter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_customfilter cookbook_customfilter_created_by_id_83409b14_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter
    ADD CONSTRAINT cookbook_customfilter_created_by_id_83409b14_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_customfilter_shared cookbook_customfilter_shared_user_id_9473d70e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter_shared
    ADD CONSTRAINT cookbook_customfilter_shared_user_id_9473d70e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_customfilter cookbook_customfilter_space_id_ab8c10e8_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_customfilter
    ADD CONSTRAINT cookbook_customfilter_space_id_ab8c10e8_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_exportlog cookbook_exportlog_created_by_id_0bbeae7a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_exportlog
    ADD CONSTRAINT cookbook_exportlog_created_by_id_0bbeae7a_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_exportlog cookbook_exportlog_space_id_eaf55b2b_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_exportlog
    ADD CONSTRAINT cookbook_exportlog_space_id_eaf55b2b_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_child_inherit_fields cookbook_food_child__food_id_867e4ef9_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_child_inherit_fields
    ADD CONSTRAINT cookbook_food_child__food_id_867e4ef9_fk_cookbook_ FOREIGN KEY (food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_child_inherit_fields cookbook_food_child__foodinheritfield_id_46ced68c_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_child_inherit_fields
    ADD CONSTRAINT cookbook_food_child__foodinheritfield_id_46ced68c_fk_cookbook_ FOREIGN KEY (foodinheritfield_id) REFERENCES public.cookbook_foodinheritfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_inherit_fields cookbook_food_inheri_food_id_c401a750_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_inherit_fields
    ADD CONSTRAINT cookbook_food_inheri_food_id_c401a750_fk_cookbook_ FOREIGN KEY (food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_inherit_fields cookbook_food_inheri_foodinheritfield_id_4897e0ea_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_inherit_fields
    ADD CONSTRAINT cookbook_food_inheri_foodinheritfield_id_4897e0ea_fk_cookbook_ FOREIGN KEY (foodinheritfield_id) REFERENCES public.cookbook_foodinheritfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_onhand_users cookbook_food_onhand_users_food_id_307e2861_fk_cookbook_food_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_onhand_users
    ADD CONSTRAINT cookbook_food_onhand_users_food_id_307e2861_fk_cookbook_food_id FOREIGN KEY (food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_onhand_users cookbook_food_onhand_users_user_id_7cd9fdd1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_onhand_users
    ADD CONSTRAINT cookbook_food_onhand_users_user_id_7cd9fdd1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food cookbook_food_preferred_shopping_u_26e5c310_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_food_preferred_shopping_u_26e5c310_fk_cookbook_ FOREIGN KEY (preferred_shopping_unit_id) REFERENCES public.cookbook_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food cookbook_food_preferred_unit_id_2f418c4b_fk_cookbook_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_food_preferred_unit_id_2f418c4b_fk_cookbook_unit_id FOREIGN KEY (preferred_unit_id) REFERENCES public.cookbook_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_foodproperty cookbook_food_proper_property_id_d079e963_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodproperty
    ADD CONSTRAINT cookbook_food_proper_property_id_d079e963_fk_cookbook_ FOREIGN KEY (property_id) REFERENCES public.cookbook_property(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_foodproperty cookbook_food_properties_food_id_4c533fef_fk_cookbook_food_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_foodproperty
    ADD CONSTRAINT cookbook_food_properties_food_id_4c533fef_fk_cookbook_food_id FOREIGN KEY (food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food cookbook_food_properties_food_unit_d7b17c55_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_food_properties_food_unit_d7b17c55_fk_cookbook_ FOREIGN KEY (properties_food_unit_id) REFERENCES public.cookbook_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food cookbook_food_space_id_7506856c_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_food_space_id_7506856c_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_substitute cookbook_food_substi_from_food_id_4ef3bd19_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_substitute
    ADD CONSTRAINT cookbook_food_substi_from_food_id_4ef3bd19_fk_cookbook_ FOREIGN KEY (from_food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food_substitute cookbook_food_substi_to_food_id_a780feca_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food_substitute
    ADD CONSTRAINT cookbook_food_substi_to_food_id_a780feca_fk_cookbook_ FOREIGN KEY (to_food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food cookbook_food_supermarket_category_1eb69e11_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_food_supermarket_category_1eb69e11_fk_cookbook_ FOREIGN KEY (supermarket_category_id) REFERENCES public.cookbook_supermarketcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_importlog cookbook_importlog_created_by_id_7317acea_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_importlog
    ADD CONSTRAINT cookbook_importlog_created_by_id_7317acea_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_importlog cookbook_importlog_keyword_id_5d78d756_fk_cookbook_keyword_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_importlog
    ADD CONSTRAINT cookbook_importlog_keyword_id_5d78d756_fk_cookbook_keyword_id FOREIGN KEY (keyword_id) REFERENCES public.cookbook_keyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_importlog cookbook_importlog_space_id_237e01cd_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_importlog
    ADD CONSTRAINT cookbook_importlog_space_id_237e01cd_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_ingredient cookbook_ingredient_food_id_b0a88cbe_fk_cookbook_food_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_ingredient
    ADD CONSTRAINT cookbook_ingredient_food_id_b0a88cbe_fk_cookbook_food_id FOREIGN KEY (food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_food cookbook_ingredient_recipe_id_8a38f9bf_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_food
    ADD CONSTRAINT cookbook_ingredient_recipe_id_8a38f9bf_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_ingredient cookbook_ingredient_space_id_8af9a53c_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_ingredient
    ADD CONSTRAINT cookbook_ingredient_space_id_8af9a53c_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_ingredient cookbook_ingredient_unit_id_e51939b3_fk_cookbook_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_ingredient
    ADD CONSTRAINT cookbook_ingredient_unit_id_e51939b3_fk_cookbook_unit_id FOREIGN KEY (unit_id) REFERENCES public.cookbook_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_invitelink cookbook_invitelink_created_by_id_95f9aed6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_invitelink
    ADD CONSTRAINT cookbook_invitelink_created_by_id_95f9aed6_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_invitelink cookbook_invitelink_group_id_b93a5dc8_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_invitelink
    ADD CONSTRAINT cookbook_invitelink_group_id_b93a5dc8_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_invitelink cookbook_invitelink_space_id_70340e84_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_invitelink
    ADD CONSTRAINT cookbook_invitelink_space_id_70340e84_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_invitelink cookbook_invitelink_used_by_id_8a3cdc6d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_invitelink
    ADD CONSTRAINT cookbook_invitelink_used_by_id_8a3cdc6d_fk_auth_user_id FOREIGN KEY (used_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_keyword cookbook_keyword_space_id_7b44ffc9_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_keyword
    ADD CONSTRAINT cookbook_keyword_space_id_7b44ffc9_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealplan cookbook_mealplan_created_by_id_b42c8e90_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan
    ADD CONSTRAINT cookbook_mealplan_created_by_id_b42c8e90_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealplan cookbook_mealplan_meal_type_id_34ede76c_fk_cookbook_mealtype_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan
    ADD CONSTRAINT cookbook_mealplan_meal_type_id_34ede76c_fk_cookbook_mealtype_id FOREIGN KEY (meal_type_id) REFERENCES public.cookbook_mealtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealplan cookbook_mealplan_recipe_id_6cefb069_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan
    ADD CONSTRAINT cookbook_mealplan_recipe_id_6cefb069_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealplan_shared cookbook_mealplan_sh_mealplan_id_45732190_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan_shared
    ADD CONSTRAINT cookbook_mealplan_sh_mealplan_id_45732190_fk_cookbook_ FOREIGN KEY (mealplan_id) REFERENCES public.cookbook_mealplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealplan_shared cookbook_mealplan_shared_user_id_8715cd4d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan_shared
    ADD CONSTRAINT cookbook_mealplan_shared_user_id_8715cd4d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealplan cookbook_mealplan_space_id_83d1a9a7_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealplan
    ADD CONSTRAINT cookbook_mealplan_space_id_83d1a9a7_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealtype cookbook_mealtype_created_by_id_bd5877ee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealtype
    ADD CONSTRAINT cookbook_mealtype_created_by_id_bd5877ee_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_mealtype cookbook_mealtype_space_id_edaaeb6c_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_mealtype
    ADD CONSTRAINT cookbook_mealtype_space_id_edaaeb6c_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_nutritioninformation cookbook_nutritionin_space_id_942c878e_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_nutritioninformation
    ADD CONSTRAINT cookbook_nutritionin_space_id_942c878e_fk_cookbook_ FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_property cookbook_property_property_type_id_4184de5b_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_property
    ADD CONSTRAINT cookbook_property_property_type_id_4184de5b_fk_cookbook_ FOREIGN KEY (property_type_id) REFERENCES public.cookbook_propertytype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_property cookbook_property_space_id_9845a1fd_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_property
    ADD CONSTRAINT cookbook_property_space_id_9845a1fd_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_propertytype cookbook_propertytype_space_id_c7f65948_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_propertytype
    ADD CONSTRAINT cookbook_propertytype_space_id_c7f65948_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe cookbook_recipe_created_by_id_9deb3c0c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe
    ADD CONSTRAINT cookbook_recipe_created_by_id_9deb3c0c_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_keywords cookbook_recipe_keyw_keyword_id_94a6e96a_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_keywords
    ADD CONSTRAINT cookbook_recipe_keyw_keyword_id_94a6e96a_fk_cookbook_ FOREIGN KEY (keyword_id) REFERENCES public.cookbook_keyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_keywords cookbook_recipe_keyw_recipe_id_87bc53ad_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_keywords
    ADD CONSTRAINT cookbook_recipe_keyw_recipe_id_87bc53ad_fk_cookbook_ FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe cookbook_recipe_nutrition_id_54975a42_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe
    ADD CONSTRAINT cookbook_recipe_nutrition_id_54975a42_fk_cookbook_ FOREIGN KEY (nutrition_id) REFERENCES public.cookbook_nutritioninformation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_properties cookbook_recipe_prop_property_id_2302b4a9_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_properties
    ADD CONSTRAINT cookbook_recipe_prop_property_id_2302b4a9_fk_cookbook_ FOREIGN KEY (property_id) REFERENCES public.cookbook_property(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_properties cookbook_recipe_prop_recipe_id_e148c678_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_properties
    ADD CONSTRAINT cookbook_recipe_prop_recipe_id_e148c678_fk_cookbook_ FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_shared cookbook_recipe_shared_recipe_id_00bf8a92_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_shared
    ADD CONSTRAINT cookbook_recipe_shared_recipe_id_00bf8a92_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_shared cookbook_recipe_shared_user_id_167b85d2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_shared
    ADD CONSTRAINT cookbook_recipe_shared_user_id_167b85d2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe cookbook_recipe_space_id_26762ca7_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe
    ADD CONSTRAINT cookbook_recipe_space_id_26762ca7_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_steps cookbook_recipe_steps_recipe_id_cb98d48a_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_steps
    ADD CONSTRAINT cookbook_recipe_steps_recipe_id_cb98d48a_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe_steps cookbook_recipe_steps_step_id_5565a252_fk_cookbook_step_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe_steps
    ADD CONSTRAINT cookbook_recipe_steps_step_id_5565a252_fk_cookbook_step_id FOREIGN KEY (step_id) REFERENCES public.cookbook_step(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipe cookbook_recipe_storage_id_38e8031f_fk_cookbook_storage_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipe
    ADD CONSTRAINT cookbook_recipe_storage_id_38e8031f_fk_cookbook_storage_id FOREIGN KEY (storage_id) REFERENCES public.cookbook_storage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipebook_shared cookbook_recipebook__recipebook_id_4b306f2e_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook_shared
    ADD CONSTRAINT cookbook_recipebook__recipebook_id_4b306f2e_fk_cookbook_ FOREIGN KEY (recipebook_id) REFERENCES public.cookbook_recipebook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipebook cookbook_recipebook_created_by_id_cb096d2e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook
    ADD CONSTRAINT cookbook_recipebook_created_by_id_cb096d2e_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipebook cookbook_recipebook_filter_id_b6f8cab0_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook
    ADD CONSTRAINT cookbook_recipebook_filter_id_b6f8cab0_fk_cookbook_ FOREIGN KEY (filter_id) REFERENCES public.cookbook_customfilter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipebook_shared cookbook_recipebook_shared_user_id_43985dd2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook_shared
    ADD CONSTRAINT cookbook_recipebook_shared_user_id_43985dd2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipebook cookbook_recipebook_space_id_bccb4e49_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebook
    ADD CONSTRAINT cookbook_recipebook_space_id_bccb4e49_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipebookentry cookbook_recipebooke_book_id_748059dd_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebookentry
    ADD CONSTRAINT cookbook_recipebooke_book_id_748059dd_fk_cookbook_ FOREIGN KEY (book_id) REFERENCES public.cookbook_recipebook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipebookentry cookbook_recipebooke_recipe_id_c5a18fb2_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipebookentry
    ADD CONSTRAINT cookbook_recipebooke_recipe_id_c5a18fb2_fk_cookbook_ FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipeimport cookbook_recipeimpor_storage_id_82a4d44b_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipeimport
    ADD CONSTRAINT cookbook_recipeimpor_storage_id_82a4d44b_fk_cookbook_ FOREIGN KEY (storage_id) REFERENCES public.cookbook_storage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_recipeimport cookbook_recipeimport_space_id_ce243a93_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_recipeimport
    ADD CONSTRAINT cookbook_recipeimport_space_id_ce243a93_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_icontains cookbook_searchprefe_searchfields_id_472706b6_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_icontains
    ADD CONSTRAINT cookbook_searchprefe_searchfields_id_472706b6_fk_cookbook_ FOREIGN KEY (searchfields_id) REFERENCES public.cookbook_searchfields(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_unaccent cookbook_searchprefe_searchfields_id_51b33696_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_unaccent
    ADD CONSTRAINT cookbook_searchprefe_searchfields_id_51b33696_fk_cookbook_ FOREIGN KEY (searchfields_id) REFERENCES public.cookbook_searchfields(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_istartswith cookbook_searchprefe_searchfields_id_591bfddd_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_istartswith
    ADD CONSTRAINT cookbook_searchprefe_searchfields_id_591bfddd_fk_cookbook_ FOREIGN KEY (searchfields_id) REFERENCES public.cookbook_searchfields(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_fulltext cookbook_searchprefe_searchfields_id_aa8cc3ab_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_fulltext
    ADD CONSTRAINT cookbook_searchprefe_searchfields_id_aa8cc3ab_fk_cookbook_ FOREIGN KEY (searchfields_id) REFERENCES public.cookbook_searchfields(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_trigram cookbook_searchprefe_searchfields_id_b9288b9d_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_trigram
    ADD CONSTRAINT cookbook_searchprefe_searchfields_id_b9288b9d_fk_cookbook_ FOREIGN KEY (searchfields_id) REFERENCES public.cookbook_searchfields(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_icontains cookbook_searchprefe_searchpreference_id_0306cc90_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_icontains
    ADD CONSTRAINT cookbook_searchprefe_searchpreference_id_0306cc90_fk_cookbook_ FOREIGN KEY (searchpreference_id) REFERENCES public.cookbook_searchpreference(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_istartswith cookbook_searchprefe_searchpreference_id_15af2dd9_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_istartswith
    ADD CONSTRAINT cookbook_searchprefe_searchpreference_id_15af2dd9_fk_cookbook_ FOREIGN KEY (searchpreference_id) REFERENCES public.cookbook_searchpreference(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_trigram cookbook_searchprefe_searchpreference_id_7884147e_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_trigram
    ADD CONSTRAINT cookbook_searchprefe_searchpreference_id_7884147e_fk_cookbook_ FOREIGN KEY (searchpreference_id) REFERENCES public.cookbook_searchpreference(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_fulltext cookbook_searchprefe_searchpreference_id_9a3d14f4_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_fulltext
    ADD CONSTRAINT cookbook_searchprefe_searchpreference_id_9a3d14f4_fk_cookbook_ FOREIGN KEY (searchpreference_id) REFERENCES public.cookbook_searchpreference(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference_unaccent cookbook_searchprefe_searchpreference_id_c2c5cb8c_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference_unaccent
    ADD CONSTRAINT cookbook_searchprefe_searchpreference_id_c2c5cb8c_fk_cookbook_ FOREIGN KEY (searchpreference_id) REFERENCES public.cookbook_searchpreference(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_searchpreference cookbook_searchpreference_user_id_238a47eb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_searchpreference
    ADD CONSTRAINT cookbook_searchpreference_user_id_238a47eb_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_sharelink cookbook_sharelink_created_by_id_727060e1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sharelink
    ADD CONSTRAINT cookbook_sharelink_created_by_id_727060e1_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_sharelink cookbook_sharelink_recipe_id_4745561e_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sharelink
    ADD CONSTRAINT cookbook_sharelink_recipe_id_4745561e_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_sharelink cookbook_sharelink_space_id_057148be_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sharelink
    ADD CONSTRAINT cookbook_sharelink_space_id_057148be_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistentry cookbook_shoppinglis_created_by_id_6703f4a5_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry
    ADD CONSTRAINT cookbook_shoppinglis_created_by_id_6703f4a5_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistentry cookbook_shoppinglis_ingredient_id_9e69abb6_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry
    ADD CONSTRAINT cookbook_shoppinglis_ingredient_id_9e69abb6_fk_cookbook_ FOREIGN KEY (ingredient_id) REFERENCES public.cookbook_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistentry cookbook_shoppinglis_list_recipe_id_88aff588_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry
    ADD CONSTRAINT cookbook_shoppinglis_list_recipe_id_88aff588_fk_cookbook_ FOREIGN KEY (list_recipe_id) REFERENCES public.cookbook_shoppinglistrecipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistrecipe cookbook_shoppinglis_mealplan_id_4c4a3a29_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistrecipe
    ADD CONSTRAINT cookbook_shoppinglis_mealplan_id_4c4a3a29_fk_cookbook_ FOREIGN KEY (mealplan_id) REFERENCES public.cookbook_mealplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistrecipe cookbook_shoppinglis_recipe_id_6baab510_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistrecipe
    ADD CONSTRAINT cookbook_shoppinglis_recipe_id_6baab510_fk_cookbook_ FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist_shared cookbook_shoppinglis_shoppinglist_id_7c59c8fb_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_shared
    ADD CONSTRAINT cookbook_shoppinglis_shoppinglist_id_7c59c8fb_fk_cookbook_ FOREIGN KEY (shoppinglist_id) REFERENCES public.cookbook_shoppinglist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist_recipes cookbook_shoppinglis_shoppinglist_id_96036b98_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_recipes
    ADD CONSTRAINT cookbook_shoppinglis_shoppinglist_id_96036b98_fk_cookbook_ FOREIGN KEY (shoppinglist_id) REFERENCES public.cookbook_shoppinglist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist_entries cookbook_shoppinglis_shoppinglist_id_fe682466_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_entries
    ADD CONSTRAINT cookbook_shoppinglis_shoppinglist_id_fe682466_fk_cookbook_ FOREIGN KEY (shoppinglist_id) REFERENCES public.cookbook_shoppinglist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist_entries cookbook_shoppinglis_shoppinglistentry_id_17d2a305_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_entries
    ADD CONSTRAINT cookbook_shoppinglis_shoppinglistentry_id_17d2a305_fk_cookbook_ FOREIGN KEY (shoppinglistentry_id) REFERENCES public.cookbook_shoppinglistentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist_recipes cookbook_shoppinglis_shoppinglistrecipe_i_20d550a1_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_recipes
    ADD CONSTRAINT cookbook_shoppinglis_shoppinglistrecipe_i_20d550a1_fk_cookbook_ FOREIGN KEY (shoppinglistrecipe_id) REFERENCES public.cookbook_shoppinglistrecipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistentry cookbook_shoppinglis_space_id_e5f4be53_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry
    ADD CONSTRAINT cookbook_shoppinglis_space_id_e5f4be53_fk_cookbook_ FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist cookbook_shoppinglis_supermarket_id_b32e2f55_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist
    ADD CONSTRAINT cookbook_shoppinglis_supermarket_id_b32e2f55_fk_cookbook_ FOREIGN KEY (supermarket_id) REFERENCES public.cookbook_supermarket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist cookbook_shoppinglist_created_by_id_8deb115f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist
    ADD CONSTRAINT cookbook_shoppinglist_created_by_id_8deb115f_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist_shared cookbook_shoppinglist_shared_user_id_ddb3de18_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist_shared
    ADD CONSTRAINT cookbook_shoppinglist_shared_user_id_ddb3de18_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglist cookbook_shoppinglist_space_id_63817551_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglist
    ADD CONSTRAINT cookbook_shoppinglist_space_id_63817551_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistentry cookbook_shoppinglistentry_food_id_ea0df05b_fk_cookbook_food_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry
    ADD CONSTRAINT cookbook_shoppinglistentry_food_id_ea0df05b_fk_cookbook_food_id FOREIGN KEY (food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_shoppinglistentry cookbook_shoppinglistentry_unit_id_fb7bc5f0_fk_cookbook_unit_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_shoppinglistentry
    ADD CONSTRAINT cookbook_shoppinglistentry_unit_id_fb7bc5f0_fk_cookbook_unit_id FOREIGN KEY (unit_id) REFERENCES public.cookbook_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_space cookbook_space_created_by_id_7499949f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space
    ADD CONSTRAINT cookbook_space_created_by_id_7499949f_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_space_food_inherit cookbook_space_food__foodinheritfield_id_e873012b_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space_food_inherit
    ADD CONSTRAINT cookbook_space_food__foodinheritfield_id_e873012b_fk_cookbook_ FOREIGN KEY (foodinheritfield_id) REFERENCES public.cookbook_foodinheritfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_space_food_inherit cookbook_space_food__space_id_eca83965_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space_food_inherit
    ADD CONSTRAINT cookbook_space_food__space_id_eca83965_fk_cookbook_ FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_space cookbook_space_image_id_85b74808_fk_cookbook_userfile_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_space
    ADD CONSTRAINT cookbook_space_image_id_85b74808_fk_cookbook_userfile_id FOREIGN KEY (image_id) REFERENCES public.cookbook_userfile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_step cookbook_step_file_id_b511ff2c_fk_cookbook_userfile_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step
    ADD CONSTRAINT cookbook_step_file_id_b511ff2c_fk_cookbook_userfile_id FOREIGN KEY (file_id) REFERENCES public.cookbook_userfile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_step_ingredients cookbook_step_ingred_ingredient_id_d6431b70_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step_ingredients
    ADD CONSTRAINT cookbook_step_ingred_ingredient_id_d6431b70_fk_cookbook_ FOREIGN KEY (ingredient_id) REFERENCES public.cookbook_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_step_ingredients cookbook_step_ingredients_step_id_dfac35a5_fk_cookbook_step_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step_ingredients
    ADD CONSTRAINT cookbook_step_ingredients_step_id_dfac35a5_fk_cookbook_step_id FOREIGN KEY (step_id) REFERENCES public.cookbook_step(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_step cookbook_step_space_id_fe3f078f_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step
    ADD CONSTRAINT cookbook_step_space_id_fe3f078f_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_step cookbook_step_step_recipe_id_3a856493_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_step
    ADD CONSTRAINT cookbook_step_step_recipe_id_3a856493_fk_cookbook_recipe_id FOREIGN KEY (step_recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_storage cookbook_storage_created_by_id_a9fdcb08_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_storage
    ADD CONSTRAINT cookbook_storage_created_by_id_a9fdcb08_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_storage cookbook_storage_space_id_1f875e70_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_storage
    ADD CONSTRAINT cookbook_storage_space_id_1f875e70_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_supermarketcategoryrelation cookbook_supermarket_category_id_479ed1e6_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategoryrelation
    ADD CONSTRAINT cookbook_supermarket_category_id_479ed1e6_fk_cookbook_ FOREIGN KEY (category_id) REFERENCES public.cookbook_supermarketcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_supermarketcategory cookbook_supermarket_space_id_bde9c2c1_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategory
    ADD CONSTRAINT cookbook_supermarket_space_id_bde9c2c1_fk_cookbook_ FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_supermarket cookbook_supermarket_space_id_d45d0500_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarket
    ADD CONSTRAINT cookbook_supermarket_space_id_d45d0500_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_supermarketcategoryrelation cookbook_supermarket_supermarket_id_9c010bab_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_supermarketcategoryrelation
    ADD CONSTRAINT cookbook_supermarket_supermarket_id_9c010bab_fk_cookbook_ FOREIGN KEY (supermarket_id) REFERENCES public.cookbook_supermarket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_sync cookbook_sync_space_id_28a032b1_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sync
    ADD CONSTRAINT cookbook_sync_space_id_28a032b1_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_sync cookbook_sync_storage_id_53b98652_fk_cookbook_storage_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_sync
    ADD CONSTRAINT cookbook_sync_storage_id_53b98652_fk_cookbook_storage_id FOREIGN KEY (storage_id) REFERENCES public.cookbook_storage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_synclog cookbook_synclog_sync_id_4bfcba4a_fk_cookbook_sync_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_synclog
    ADD CONSTRAINT cookbook_synclog_sync_id_4bfcba4a_fk_cookbook_sync_id FOREIGN KEY (sync_id) REFERENCES public.cookbook_sync(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_telegrambot cookbook_telegrambot_created_by_id_44e39215_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_telegrambot
    ADD CONSTRAINT cookbook_telegrambot_created_by_id_44e39215_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_telegrambot cookbook_telegrambot_space_id_ba1c2347_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_telegrambot
    ADD CONSTRAINT cookbook_telegrambot_space_id_ba1c2347_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_unit cookbook_unit_space_id_7bca8466_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unit
    ADD CONSTRAINT cookbook_unit_space_id_7bca8466_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_unitconversion cookbook_unitconvers_base_unit_id_9985ec49_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT cookbook_unitconvers_base_unit_id_9985ec49_fk_cookbook_ FOREIGN KEY (base_unit_id) REFERENCES public.cookbook_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_unitconversion cookbook_unitconvers_converted_unit_id_5b8aa5a3_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT cookbook_unitconvers_converted_unit_id_5b8aa5a3_fk_cookbook_ FOREIGN KEY (converted_unit_id) REFERENCES public.cookbook_unit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_unitconversion cookbook_unitconversion_created_by_id_dcdba77b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT cookbook_unitconversion_created_by_id_dcdba77b_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_unitconversion cookbook_unitconversion_food_id_4f9c4eb0_fk_cookbook_food_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT cookbook_unitconversion_food_id_4f9c4eb0_fk_cookbook_food_id FOREIGN KEY (food_id) REFERENCES public.cookbook_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_unitconversion cookbook_unitconversion_space_id_221cd4a8_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_unitconversion
    ADD CONSTRAINT cookbook_unitconversion_space_id_221cd4a8_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userfile cookbook_userfile_created_by_id_a6850ccf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userfile
    ADD CONSTRAINT cookbook_userfile_created_by_id_a6850ccf_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userfile cookbook_userfile_space_id_954be4eb_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userfile
    ADD CONSTRAINT cookbook_userfile_space_id_954be4eb_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userpreference cookbook_userprefere_image_id_01bfc1c1_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference
    ADD CONSTRAINT cookbook_userprefere_image_id_01bfc1c1_fk_cookbook_ FOREIGN KEY (image_id) REFERENCES public.cookbook_userfile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userpreference_shopping_share cookbook_userprefere_user_id_3a04ee80_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_shopping_share
    ADD CONSTRAINT cookbook_userprefere_user_id_3a04ee80_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userpreference_plan_share cookbook_userprefere_user_id_c755ee99_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_plan_share
    ADD CONSTRAINT cookbook_userprefere_user_id_c755ee99_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userpreference_plan_share cookbook_userprefere_userpreference_id_87373d85_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_plan_share
    ADD CONSTRAINT cookbook_userprefere_userpreference_id_87373d85_fk_cookbook_ FOREIGN KEY (userpreference_id) REFERENCES public.cookbook_userpreference(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userpreference_shopping_share cookbook_userprefere_userpreference_id_fdbb11a9_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference_shopping_share
    ADD CONSTRAINT cookbook_userprefere_userpreference_id_fdbb11a9_fk_cookbook_ FOREIGN KEY (userpreference_id) REFERENCES public.cookbook_userpreference(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userpreference cookbook_userpreference_user_id_6f5d0c9f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userpreference
    ADD CONSTRAINT cookbook_userpreference_user_id_6f5d0c9f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userspace_groups cookbook_userspace_g_userspace_id_cf39ce1b_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace_groups
    ADD CONSTRAINT cookbook_userspace_g_userspace_id_cf39ce1b_fk_cookbook_ FOREIGN KEY (userspace_id) REFERENCES public.cookbook_userspace(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userspace_groups cookbook_userspace_groups_group_id_b6bf66da_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace_groups
    ADD CONSTRAINT cookbook_userspace_groups_group_id_b6bf66da_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userspace cookbook_userspace_invite_link_id_627899a5_fk_cookbook_; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace
    ADD CONSTRAINT cookbook_userspace_invite_link_id_627899a5_fk_cookbook_ FOREIGN KEY (invite_link_id) REFERENCES public.cookbook_invitelink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userspace cookbook_userspace_space_id_2d833713_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace
    ADD CONSTRAINT cookbook_userspace_space_id_2d833713_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_userspace cookbook_userspace_user_id_3e254f5c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_userspace
    ADD CONSTRAINT cookbook_userspace_user_id_3e254f5c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_viewlog cookbook_viewlog_created_by_id_f0294e75_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_viewlog
    ADD CONSTRAINT cookbook_viewlog_created_by_id_f0294e75_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_viewlog cookbook_viewlog_recipe_id_a4c7d71a_fk_cookbook_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_viewlog
    ADD CONSTRAINT cookbook_viewlog_recipe_id_a4c7d71a_fk_cookbook_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.cookbook_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cookbook_viewlog cookbook_viewlog_space_id_0ce48f5b_fk_cookbook_space_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.cookbook_viewlog
    ADD CONSTRAINT cookbook_viewlog_space_id_0ce48f5b_fk_cookbook_space_id FOREIGN KEY (space_id) REFERENCES public.cookbook_space(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr FOREIGN KEY (id_token_id) REFERENCES public.oauth2_provider_idtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_idtoken oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_idtoken oauth2_provider_idtoken_user_id_dd512b59_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_idtoken
    ADD CONSTRAINT oauth2_provider_idtoken_user_id_dd512b59_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: djangouser
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.22
-- Dumped by pg_dump version 11.22

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

