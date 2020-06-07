--1
BEGIN
DECLARE @srednia_placa FLOAT;
SET @srednia_placa = (SELECT AVG(EPH.Rate * EPH.PayFrequency) FROM AdventureWorks2017.HumanResources.EmployeePayHistory EPH);
SELECT @srednia_placa AS srednia_placa;
SELECT E.*, EPH.Rate, EPH.PayFrequency FROM AdventureWorks2017.HumanResources.Employee E, AdventureWorks2017.HumanResources.EmployeePayHistory EPH
WHERE EPH.BusinessEntityID = E.BusinessEntityID AND (EPH.Rate * EPH.PayFrequency) < @srednia_placa
END;

--2
CREATE FUNCTION
data_wysylki (@id INT)
RETURNS TABLE AS
RETURN SELECT SOH.ShipDate AS data_wysylki FROM AdventureWorks2017.Sales.SalesOrderHeader SOH
WHERE SOH.SalesOrderID = @id;

--SELECT * FROM data_wysylki(43947)

--3
CREATE PROCEDURE
produkt_info (@nazwa_produktu nvarchar(50))
AS
SELECT P.ProductID, P.ProductNumber, P.SellEndDate FROM AdventureWorks2017.Production.Product P
WHERE P.Name = @nazwa_produktu;

--EXEC produkt_info @nazwa_produktu='Mountain End Caps'

--4
CREATE FUNCTION
numer_karty (@id  INT)
RETURNS TABLE AS
RETURN (SELECT SOH.*, CC.CardNumber FROM AdventureWorks2017.Sales.CreditCard CC, AdventureWorks2017.Sales.SalesOrderHeader SOH
WHERE CC.CreditCardID = SOH.CreditCardID AND SOH.SalesOrderID = @id);

--SELECT * FROM numer_karty(43947)

--5
CREATE PROCEDURE
dzielenie (@num1 FLOAT , @num2 FLOAT)
AS
BEGIN
IF @num1 < @num2
	PRINT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
ELSE
	SELECT @num1/@num2 AS Wynik_dzielenia
END;

--EXEC dzielenie @num1=10,@num2=2
--EXEC dzielenie @num1=2,@num2=10