\connect dummy

CREATE TABLE public.t1
(
	c1 INTEGER NOT NULL,
	c2 INTEGER,
	CONSTRAINT t1_pk PRIMARY KEY (c1)
);


GRANT SELECT ON public.t1 TO dummy_ro;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.t1 TO dummy_rw;
GRANT ALL ON public.t1 TO dummy_adm;

