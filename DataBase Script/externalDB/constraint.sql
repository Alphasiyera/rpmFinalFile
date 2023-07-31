
ALTER TABLE public.external_system
    ADD CONSTRAINT external_system_pkey PRIMARY KEY (external_system_id);

ALTER TABLE public.external_system_param
    ADD CONSTRAINT external_system_param_pkey PRIMARY KEY (external_system_param_id);

ALTER TABLE public.external_patient_map
    ADD CONSTRAINT external_patient_map_pkey PRIMARY KEY (external_patient_map_id);

ALTER TABLE public.external_obsterm_map
    ADD CONSTRAINT external_obsterm_map_pkey PRIMARY KEY (external_obsterm_map_id);

ALTER TABLE public.external_system_param
    ADD CONSTRAINT external_system_id FOREIGN KEY (external_system_id) REFERENCES public.external_system(external_system_id);

ALTER TABLE public.external_patient_map
    ADD CONSTRAINT external_system_id FOREIGN KEY (external_system_id) REFERENCES public.external_system(external_system_id);

ALTER TABLE public.external_obsterm_map
    ADD CONSTRAINT external_system_id FOREIGN KEY (external_system_id) REFERENCES public.external_system(external_system_id);

