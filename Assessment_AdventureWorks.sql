-- DROP SCHEMA SalesLT;

CREATE SCHEMA SalesLT;
-- AdventureWorks.SalesLT.Address definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.Address;


/*
 *
 Tabela de Endereço  
 * 
 */
CREATE TABLE AdventureWorks.SalesLT.Address (
	AddressID int IDENTITY(1,1) NOT NULL,
	AddressLine1 nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	AddressLine2 nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	City nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	StateProvince 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CountryRegion 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PostalCode nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_Address_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_Address_AddressID PRIMARY KEY (AddressID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_Address_rowguid ON AdventureWorks.SalesLT.Address (rowguid);
 CREATE NONCLUSTERED INDEX IX_Address_AddressLine1_AddressLine2_City_StateProvince_PostalCode_CountryRegion ON SalesLT.Address (  AddressLine1 ASC  , AddressLine2 ASC  , City ASC  , StateProvince ASC  , PostalCode ASC  , CountryRegion ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
 CREATE NONCLUSTERED INDEX IX_Address_StateProvince ON SalesLT.Address (  StateProvince ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- AdventureWorks.SalesLT.Customer definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.Customer;

/*
 *
 Tabela de Clientes
 * 
 */	
	
CREATE TABLE AdventureWorks.SalesLT.Customer (
	CustomerID int IDENTITY(1,1) NOT NULL,
	NameStyle 260 NOT NULL,
	Title nvarchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FirstName 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	MiddleName 259 COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	LastName 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Suffix nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CompanyName nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SalesPerson nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	EmailAddress nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Phone 262 COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PasswordHash varchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PasswordSalt varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_Customer_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_Customer_CustomerID PRIMARY KEY (CustomerID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_Customer_rowguid ON AdventureWorks.SalesLT.Customer (rowguid);
 CREATE NONCLUSTERED INDEX IX_Customer_EmailAddress ON SalesLT.Customer (  EmailAddress ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;


-- AdventureWorks.SalesLT.Logger definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.Logger;

	
/*
 *
 Tabela de Mensagens de Log  
 * 
 */	
CREATE TABLE AdventureWorks.SalesLT.Logger (
	LogDate datetime NULL,
	LogMessage varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UserName varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


-- AdventureWorks.SalesLT.ProductDescription definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.ProductDescription;
/*
 *
 Tabela de Descrição de Produtos 
 * 
 */

CREATE TABLE AdventureWorks.SalesLT.ProductDescription (
	ProductDescriptionID int IDENTITY(1,1) NOT NULL,
	Description nvarchar(400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_ProductDescription_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_ProductDescription_ProductDescriptionID PRIMARY KEY (ProductDescriptionID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_ProductDescription_rowguid ON AdventureWorks.SalesLT.ProductDescription (rowguid);


-- AdventureWorks.SalesLT.ProductModel definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.ProductModel;

/*
 *
 Tabela de Modelo de Produtos  
 * 
 */
CREATE TABLE AdventureWorks.SalesLT.ProductModel (
	ProductModelID int IDENTITY(1,1) NOT NULL,
	Name 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CatalogDescription xml NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_ProductModel_Name UNIQUE (Name),
	CONSTRAINT AK_ProductModel_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_ProductModel_ProductModelID PRIMARY KEY (ProductModelID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_ProductModel_Name ON AdventureWorks.SalesLT.ProductModel (Name);
CREATE UNIQUE NONCLUSTERED INDEX AK_ProductModel_rowguid ON AdventureWorks.SalesLT.ProductModel (rowguid);


-- AdventureWorks.SalesLT.CustomerAddress definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.CustomerAddress;


/*
 *
 Tabela de relacionamento Endereço x Clientes 
 * 
 */

CREATE TABLE AdventureWorks.SalesLT.CustomerAddress (
	CustomerID int NOT NULL,
	AddressID int NOT NULL,
	AddressType 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_CustomerAddress_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_CustomerAddress_CustomerID_AddressID PRIMARY KEY (CustomerID,AddressID),
	CONSTRAINT FK_CustomerAddress_Address_AddressID FOREIGN KEY (AddressID) REFERENCES AdventureWorks.SalesLT.Address(AddressID),
	CONSTRAINT FK_CustomerAddress_Customer_CustomerID FOREIGN KEY (CustomerID) REFERENCES AdventureWorks.SalesLT.Customer(CustomerID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_CustomerAddress_rowguid ON AdventureWorks.SalesLT.CustomerAddress (rowguid);


-- AdventureWorks.SalesLT.ProductCategory definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.ProductCategory;

/*
 *
 Tabela de Categoria de Produto 
 * 
 */

CREATE TABLE AdventureWorks.SalesLT.ProductCategory (
	ProductCategoryID int IDENTITY(1,1) NOT NULL,
	ParentProductCategoryID int NULL,
	Name 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_ProductCategory_Name UNIQUE (Name),
	CONSTRAINT AK_ProductCategory_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_ProductCategory_ProductCategoryID PRIMARY KEY (ProductCategoryID),
	CONSTRAINT FK_ProductCategory_ProductCategory_ParentProductCategoryID_ProductCategoryID FOREIGN KEY (ParentProductCategoryID) REFERENCES AdventureWorks.SalesLT.ProductCategory(ProductCategoryID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_ProductCategory_Name ON AdventureWorks.SalesLT.ProductCategory (Name);
CREATE UNIQUE NONCLUSTERED INDEX AK_ProductCategory_rowguid ON AdventureWorks.SalesLT.ProductCategory (rowguid);


-- AdventureWorks.SalesLT.ProductModelProductDescription definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.ProductModelProductDescription;

/*
 *
 Tabela de relacionamento Modelo Produto x Descricao Produto 
 * 
 */

CREATE TABLE AdventureWorks.SalesLT.ProductModelProductDescription (
	ProductModelID int NOT NULL,
	ProductDescriptionID int NOT NULL,
	Culture nchar(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_ProductModelProductDescription_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_ProductModelProductDescription_ProductModelID_ProductDescriptionID_Culture PRIMARY KEY (ProductModelID,ProductDescriptionID,Culture),
	CONSTRAINT FK_ProductModelProductDescription_ProductDescription_ProductDescriptionID FOREIGN KEY (ProductDescriptionID) REFERENCES AdventureWorks.SalesLT.ProductDescription(ProductDescriptionID),
	CONSTRAINT FK_ProductModelProductDescription_ProductModel_ProductModelID FOREIGN KEY (ProductModelID) REFERENCES AdventureWorks.SalesLT.ProductModel(ProductModelID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_ProductModelProductDescription_rowguid ON AdventureWorks.SalesLT.ProductModelProductDescription (rowguid);


-- AdventureWorks.SalesLT.SalesOrderHeader definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.SalesOrderHeader;

/*
 *
 Tabela de Cabeçalho de Notas
 * 
 */

CREATE TABLE AdventureWorks.SalesLT.SalesOrderHeader (
	SalesOrderID int NOT NULL,
	RevisionNumber tinyint NOT NULL,
	OrderDate datetime NOT NULL,
	DueDate datetime NOT NULL,
	ShipDate datetime NULL,
	Status tinyint NOT NULL,
	OnlineOrderFlag 258 NOT NULL,
	SalesOrderNumber nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	PurchaseOrderNumber 261 COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	AccountNumber 257 COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CustomerID int NOT NULL,
	ShipToAddressID int NULL,
	BillToAddressID int NULL,
	ShipMethod nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CreditCardApprovalCode varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SubTotal money NOT NULL,
	TaxAmt money NOT NULL,
	Freight money NOT NULL,
	TotalDue money NOT NULL,
	Comment nvarchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_SalesOrderHeader_SalesOrderNumber UNIQUE (SalesOrderNumber),
	CONSTRAINT AK_SalesOrderHeader_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_SalesOrderHeader_SalesOrderID PRIMARY KEY (SalesOrderID),
	CONSTRAINT FK_SalesOrderHeader_Address_BillTo_AddressID FOREIGN KEY (BillToAddressID) REFERENCES AdventureWorks.SalesLT.Address(AddressID),
	CONSTRAINT FK_SalesOrderHeader_Address_ShipTo_AddressID FOREIGN KEY (ShipToAddressID) REFERENCES AdventureWorks.SalesLT.Address(AddressID),
	CONSTRAINT FK_SalesOrderHeader_Customer_CustomerID FOREIGN KEY (CustomerID) REFERENCES AdventureWorks.SalesLT.Customer(CustomerID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_SalesOrderHeader_SalesOrderNumber ON AdventureWorks.SalesLT.SalesOrderHeader (SalesOrderNumber);
CREATE UNIQUE NONCLUSTERED INDEX AK_SalesOrderHeader_rowguid ON AdventureWorks.SalesLT.SalesOrderHeader (rowguid);
 CREATE NONCLUSTERED INDEX IX_SalesOrderHeader_CustomerID ON SalesLT.SalesOrderHeader (  CustomerID ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderHeader WITH NOCHECK ADD CONSTRAINT CK_SalesOrderHeader_DueDate CHECK null;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderHeader WITH NOCHECK ADD CONSTRAINT CK_SalesOrderHeader_Freight CHECK null;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderHeader WITH NOCHECK ADD CONSTRAINT CK_SalesOrderHeader_ShipDate CHECK null;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderHeader WITH NOCHECK ADD CONSTRAINT CK_SalesOrderHeader_Status CHECK null;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderHeader WITH NOCHECK ADD CONSTRAINT CK_SalesOrderHeader_SubTotal CHECK null;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderHeader WITH NOCHECK ADD CONSTRAINT CK_SalesOrderHeader_TaxAmt CHECK null;


-- AdventureWorks.SalesLT.Product definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.Product;

/*
 *
 Tabela de Produto
 * 
 */

CREATE TABLE AdventureWorks.SalesLT.Product (
	ProductID int IDENTITY(1,1) NOT NULL,
	Name 259 COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ProductNumber nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	Color nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StandardCost money NOT NULL,
	ListPrice money NOT NULL,
	[Size] nvarchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Weight decimal(8,2) NULL,
	ProductCategoryID int NULL,
	ProductModelID int NULL,
	SellStartDate datetime NOT NULL,
	SellEndDate datetime NULL,
	DiscontinuedDate datetime NULL,
	ThumbNailPhoto varbinary(MAX) NULL,
	ThumbnailPhotoFileName nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_Product_Name UNIQUE (Name),
	CONSTRAINT AK_Product_ProductNumber UNIQUE (ProductNumber),
	CONSTRAINT AK_Product_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_Product_ProductID PRIMARY KEY (ProductID),
	CONSTRAINT FK_Product_ProductCategory_ProductCategoryID FOREIGN KEY (ProductCategoryID) REFERENCES AdventureWorks.SalesLT.ProductCategory(ProductCategoryID),
	CONSTRAINT FK_Product_ProductModel_ProductModelID FOREIGN KEY (ProductModelID) REFERENCES AdventureWorks.SalesLT.ProductModel(ProductModelID)
);
CREATE UNIQUE NONCLUSTERED INDEX AK_Product_Name ON AdventureWorks.SalesLT.Product (Name);
CREATE UNIQUE NONCLUSTERED INDEX AK_Product_ProductNumber ON AdventureWorks.SalesLT.Product (ProductNumber);
CREATE UNIQUE NONCLUSTERED INDEX AK_Product_rowguid ON AdventureWorks.SalesLT.Product (rowguid);
ALTER TABLE AdventureWorks.SalesLT.Product WITH NOCHECK ADD CONSTRAINT CK_Product_ListPrice CHECK null;
ALTER TABLE AdventureWorks.SalesLT.Product WITH NOCHECK ADD CONSTRAINT CK_Product_SellEndDate CHECK null;
ALTER TABLE AdventureWorks.SalesLT.Product WITH NOCHECK ADD CONSTRAINT CK_Product_StandardCost CHECK null;
ALTER TABLE AdventureWorks.SalesLT.Product WITH NOCHECK ADD CONSTRAINT CK_Product_Weight CHECK null;


-- AdventureWorks.SalesLT.SalesOrderDetail definition

-- Drop table

-- DROP TABLE AdventureWorks.SalesLT.SalesOrderDetail;

/*
 *
 Tabela de detalhes da nota fiscal
 * 
 */

CREATE TABLE AdventureWorks.SalesLT.SalesOrderDetail (
	SalesOrderID int NOT NULL,
	SalesOrderDetailID int IDENTITY(1,1) NOT NULL,
	OrderQty smallint NOT NULL,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL,
	UnitPriceDiscount money NOT NULL,
	LineTotal numeric(38,6) NOT NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	CONSTRAINT AK_SalesOrderDetail_rowguid UNIQUE (rowguid),
	CONSTRAINT PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID PRIMARY KEY (SalesOrderID,SalesOrderDetailID),
	CONSTRAINT FK_SalesOrderDetail_Product_ProductID FOREIGN KEY (ProductID) REFERENCES AdventureWorks.SalesLT.Product(ProductID),
	CONSTRAINT FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID FOREIGN KEY (SalesOrderID) REFERENCES AdventureWorks.SalesLT.SalesOrderHeader(SalesOrderID) ON DELETE CASCADE
);
CREATE UNIQUE NONCLUSTERED INDEX AK_SalesOrderDetail_rowguid ON AdventureWorks.SalesLT.SalesOrderDetail (rowguid);
 CREATE NONCLUSTERED INDEX IX_SalesOrderDetail_ProductID ON SalesLT.SalesOrderDetail (  ProductID ASC  )  
	 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
	 ON [PRIMARY ] ;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderDetail WITH NOCHECK ADD CONSTRAINT CK_SalesOrderDetail_OrderQty CHECK null;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderDetail WITH NOCHECK ADD CONSTRAINT CK_SalesOrderDetail_UnitPrice CHECK null;
ALTER TABLE AdventureWorks.SalesLT.SalesOrderDetail WITH NOCHECK ADD CONSTRAINT CK_SalesOrderDetail_UnitPriceDiscount CHECK null;

