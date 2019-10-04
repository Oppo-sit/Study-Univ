create TABLE indextblindexTBL(first_name varchar(14), last_name varchar(16), hire_data date); 

CREATE INDEX idx_indexTBL_firstname
	ON indexTBL(first_name);

SELECT * FROM indextbl;
SELECT * FROM indextbl WHERE first_name = 'mary';

