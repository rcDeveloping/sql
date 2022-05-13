--Insert a word 'Server' and a space at the starting position 5 without deleting any character
SELECT STUFF('SQL Demo', 5, 0, 'Server ');

--Insert a word 'Demo' at the starting position 5 delete 6 characters
SELECT STUFF('SQL Server', 5, 6, 'Demo');