CREATE TABLE public.t2
(
	c1 INTEGER NOT NULL,
	c2 INTEGER
);


GRANT SELECT ON public.t2 TO dummy_ro;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.t2 TO dummy_rw;
GRANT ALL ON public.t2 TO dummy_adm;
