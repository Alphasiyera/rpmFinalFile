create table public.person (
    person_id Bigint DEFAULT nextval('seq_person_id') NOT NULL,
    first_name Character varying(100),
    middle_name Character varying(50),
    last_name Character varying(50),
    preferred_name Character varying(50),
    birth_date Integer,
    gender Character varying(15),
    birth_sex Character varying(15),
    marital_status Character varying(20),
    photo_url Character varying(255),
    email_id Character varying(255),
    phone_no Integer,
    expired Boolean,
    expired_date Integer,
    active Boolean DEFAULT TRUE NOT NULL,
    created_by Integer default(1) not null,
    created_ts Timestamp with time zone DEFAULT now() NOT NULL,
    updated_by Integer,
    updated_ts Timestamp with time zone
);

CREATE TABLE public.enterprise (
    enterprise_id Bigint DEFAULT nextval('seq_enterprise_id') NOT NULL,
    name character varying(100),
    active Boolean DEFAULT TRUE NOT NULL,
    created_by Integer default(1) not null,
    created_ts Timestamp with time zone DEFAULT now() NOT NULL,
    updated_by Integer,
    updated_ts Timestamp with time zone
);

CREATE TABLE public.practice (
    practice_id Bigint DEFAULT nextval('seq_practice_id') NOT NULL,
    name Character varying(100),
    enterprise_id Bigint NOT NULL,
    active Boolean DEFAULT TRUE NOT NULL,
    created_by Integer default(1) not null,
    created_ts Timestamp with time zone DEFAULT now() NOT NULL,
    updated_by Integer,
    updated_ts Timestamp with time zone
);

CREATE TABLE public.patient (
    patient_id Bigint DEFAULT nextval('seq_patient_id') NOT NULL,
    practice_id Bigint NOT NULL,
    person_id Bigint NOT NULL,
    deleted Boolean DEFAULT false NOT NULL,
    deleted_ts Timestamp with time zone,
    created_by Integer default(1) not null,
    created_ts Timestamp with time zone DEFAULT now() NOT NULL,
    updated_by Integer,
    updated_ts Timestamp with time zone
);

CREATE TABLE public.config_group (
    config_group_id bigint NOT NULL,
    name character varying(50)
);

CREATE TABLE public.config (
    config_id bigint NOT NULL,
    config_key character varying(50),
    config_value character varying(255),
    group_id bigint
);

CREATE TABLE public.codesystem (
    code character varying(10),
    display_name character varying(100),
    system character varying(100)
);

CREATE TABLE public.uom (
    code character varying(30),
    display_name character varying(100),
    ucmcd character varying(30)
);

CREATE TABLE public.obscategory ( 
    obscategory_id integer NOT NULL,
    display_name character varying(255),
    code character varying(25)
);

CREATE TABLE public.obstype ( 
    obstype_id integer NOT NULL,
    display_name character varying(25)
);

CREATE TABLE public.obsterm (
    obsterm_id integer DEFAULT nextval('public.seq_obsterm_id') NOT NULL,
    name character varying(255),
    code character varying(10),
    obstype_id integer,
    obscategory_id integer
);

CREATE TABLE public.obsterm_codesystem (
    obsterm_codesystem_id integer DEFAULT nextval('public.seq_obsterm_codesystem_id') NOT NULL,
    code character varying(10),
    obsterm_id integer,
    codesystem_code character varying(10)
);

CREATE TABLE public.patient_obs (
    patient_obs_id bigint DEFAULT nextval('public.seq_patient_obs_id') NOT NULL,
    patient_id bigint,
    obsterm_id integer,
    value numeric,
    uom_code character varying(30),
    effective_datetime timestamp,
    created_by Integer default(1) not null,
    created_ts Timestamp with time zone DEFAULT now() NOT NULL,
    updated_by Integer,
    updated_ts Timestamp with time zone  
);

CREATE TABLE public.patient_obs_detail (
    patient_obs_detail_id bigint DEFAULT nextval('public.seq_patient_obs_detail_id') NOT NULL,
    patient_obs_id bigint,
    obsterm_id integer,
    obstype_id integer,
    created_by Integer default(1) not null,
    created_ts Timestamp with time zone DEFAULT now() NOT NULL,
    updated_by Integer,
    updated_ts Timestamp with time zone
);

CREATE TABLE public.obsterm_range (
    obsterm_range_id integer,
    obsterm_id integer,
    uom_code character varying(30),
    low numeric,
    high numeric
);

