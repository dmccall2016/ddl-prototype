\connect dummy

CREATE TABLE keep.t1 AS
	SELECT *
	FROM public.t1;



ALTER TABLE public.t1
ADD COLUMN t3 INTEGER;


