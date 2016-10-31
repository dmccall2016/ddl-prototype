\connect dummy

DROP TABLE public.t1;


CREATE TABLE public.t1
(
	c1 INTEGER NOT NULL,
	c2 INTEGER
);


GRANT SELECT ON public.t1 TO dummy_ro;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.t1 TO dummy_rw;
GRANT ALL ON public.t1 TO dummy_adm;


INSERT INTO t1
(
	c1,
	c2
)
SELECT
	c1,
	c2
FROM keep.t1;


