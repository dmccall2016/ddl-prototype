\connect dummy


CREATE TABLE public.t3(
    c1    int4    NOT NULL,
    CONSTRAINT t3_pk PRIMARY KEY (c1)
)
;
GRANT SELECT ON public.t3 TO dummy_ro;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.t3 TO dummy_rw;
GRANT ALL ON public.t3 TO dummy_adm;