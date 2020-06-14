--1
CREATE FUNCTION
fib_seq_gen (@n INT)
RETURNS
@fibonacci TABLE (Ci¹g_Fibonacciego INT)
BEGIN
	DECLARE @res INT = 0;
	DECLARE @n1 INT = 0;
	DECLARE @n2 INT = 1;

	IF @n = 2
		BEGIN
			SET @res = 1;
			INSERT INTO @fibonacci SELECT @res;
			SET @n = @n - 1;
		END;
	IF @n = 1
		BEGIN
			SET @res = 1;
			INSERT INTO @fibonacci SELECT @res;
		END;
	ELSE
		WHILE @n >= 1
			BEGIN
				SET @res = @n1 + @n2;
				SET @n1 = @n2;
				SET @n2 = @res;
				SET @n = @n-1;
				INSERT INTO @fibonacci SELECT @res;
			END;
		RETURN;
END;

CREATE PROCEDURE
fib_seq @n INT
AS
SELECT * FROM fib_seq_gen(@n);

--przyk³ady
EXEC fib_seq @n=8;
EXEC fib_seq @n=1;

--2
CREATE TRIGGER
LN_UPP ON AdventureWorks2017.Person.Person
FOR UPDATE AS
UPDATE AdventureWorks2017.Person.Person SET LastName = UPPER(LastName)

--przyk³ad
UPDATE AdventureWorks2017.Person.Person
SET FirstName='Michael' WHERE BusinessEntityID = 10;
SELECT * FROM AdventureWorks2017.Person.Person WHERE BusinessEntityID = 10;

--3
CREATE TRIGGER
taxRateMonitoring ON AdventureWorks2017.Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
	DECLARE @old_tax FLOAT = (SELECT TaxRate FROM deleted);
	DECLARE @new_tax FLOAT = (SELECT TaxRate FROM inserted);
	DECLARE @per_tax FLOAT = @old_tax * 0.3;
	IF (@new_tax > (@old_tax + @per_tax)) OR (@new_tax < (@per_tax))
		BEGIN
		PRINT 'B³¹d - zmieniono wartoœæ w polu TaxRate o wiêcej ni¿ 30%'
		ROLLBACK;
	END;
END;

--przyk³ad
SELECT * FROM AdventureWorks2017.Sales.SalesTaxRate WHERE SalesTaxRateID = 10;
UPDATE AdventureWorks2017.Sales.SalesTaxRate SET TaxRate = '10' WHERE SalesTaxRateID = 10;