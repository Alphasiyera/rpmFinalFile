CREATE TABLE public.external_system (
    external_system_id bigint DEFAULT nextval('seq_external_system_id') NOT NULL,
    name character varying(100),
    created_by Integer default(1) not null,
    created_ts Timestamp with time zone DEFAULT now() NOT NULL,
    updated_by Integer,
    updated_ts Timestamp with time zone
);

CREATE TABLE public.external_system_param (
    external_system_param_id bigint DEFAULT nextval('seq_external_system_param_id') NOT NULL,
    key character varying(100) ,
    value character varying(100) ,
    external_system_id bigint NOT NULL
);

CREATE TABLE public.external_patient_map (
    external_patient_map_id bigint DEFAULT nextval('seq_external_patient_map_id') NOT NULL,
    external_system_id bigint NOT NULL,
    patient_id character varying(100) ,
    external_patient_id character varying(100) 
);

CREATE TABLE public.external_obsterm_map (
    external_obsterm_map_id bigint DEFAULT nextval('seq_external_obsterm_map_id') NOT NULL,
    external_system_id bigint NOT NULL,
    obsterm character varying(100) ,
    external_obsterm_id character varying(100) 
);
