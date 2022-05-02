CREATE DATABASE countries_CP
	ON
		(
			NAME = countries, --Should have the same name of the databse to copy
			FILENAME = 'D:\countries_CP.ss'
		)
	AS SNAPSHOT OF countries;