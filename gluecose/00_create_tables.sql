CREATE TABLE IF NOT EXISTS readings(
    gluecose integer,
   	b_weight real,
	reading_date text,
    time_stamp text default (datetime('now','localtime'))
) ;
