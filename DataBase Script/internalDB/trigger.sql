CREATE FUNCTION public.fn_updatedtsz_bu()
RETURNS TRIGGER
 LANGUAGE plpgsql
 VOLATILE
AS
$$
BEGIN
   NEW.updated_ts := current_timestamp;
   RETURN NEW;
END
$$
;

COMMENT ON FUNCTION public.fn_updatedtsz_bu() IS 'Changes value of updatedtsz field to current_timesatmp in a table'
;


CREATE TRIGGER trg_person_bu
  BEFORE UPDATE
  ON public.person FOR EACH ROW
 EXECUTE PROCEDURE public.fn_updatedtsz_bu()
;
CREATE TRIGGER trg_enterprise_bu
  BEFORE UPDATE
  ON public.enterprise FOR EACH ROW
 EXECUTE PROCEDURE public.fn_updatedtsz_bu()
;
CREATE TRIGGER trg_practice_bu
  BEFORE UPDATE
  ON public.practice FOR EACH ROW
 EXECUTE PROCEDURE public.fn_updatedtsz_bu()
;
CREATE TRIGGER trg_patient_bu
  BEFORE UPDATE
  ON public.patient FOR EACH ROW
 EXECUTE PROCEDURE public.fn_updatedtsz_bu()
;
CREATE TRIGGER trg_patient_obs_bu
  BEFORE UPDATE
  ON public.patient_obs FOR EACH ROW
 EXECUTE PROCEDURE public.fn_updatedtsz_bu()
;
CREATE TRIGGER trg_patient_obs_detail_bu
  BEFORE UPDATE
  ON public.patient_obs_detail FOR EACH ROW
 EXECUTE PROCEDURE public.fn_updatedtsz_bu()
;