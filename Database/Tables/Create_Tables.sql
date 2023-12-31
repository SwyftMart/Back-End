USE Ecommerce
GO

--############# USERS ############
CREATE TABLE Users
(
    userId VARCHAR(100) PRIMARY KEY,
    -- GENERATED BY THE SERVER
    email VARCHAR(100) UNIQUE NOT NULL,
    -- ENSURES THAT ALL VALUES IN A COLUMN ARE DIFFERENT
    -- Both the UNIQUE and PRIMARY KEY constraints provide a 
    -- guarantee for uniqueness for a column or set of columns
    userPassword VARCHAR(255),
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    streetAddress VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100),
    phone VARCHAR(100),
    -- WILL BE CONVERTED TO STRING
    isDeleted INT DEFAULT 0,
	isAdmin INT DEFAULT 0,
    emailsReceived INT DEFAULT 0
)

DROP TABLE Users

--##################################
--####### VIEW Users CONTENTS ######
--##################################
SELECT *
FROM Users

/*************** END ***************/

--########## PRODUCTS #############
USE Ecommerce
GO

CREATE TABLE Products
(
    productId VARCHAR(255) PRIMARY KEY,
    -- GENERATED BY THE SERVER
    productName VARCHAR(255),
    productImage VARCHAR(max),
    productDescription VARCHAR(max),
	category VARCHAR(255),
    price INT,
    isDeleted INT DEFAULT 0
)
 
DROP TABLE Products

--######################################
--####### VIEW Products CONTENTS ######
--#####################################
SELECT *
FROM Products

/*************** END ***************/

--######## ORDERS #########
CREATE TABLE Orders(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	orderDate VARCHAR(255), --TIME STAMP
	userId VARCHAR(255),
	totalAmount INT
)

/*************** END ***************/

--####### ORDER ITEM ########
CREATE TABLE orderItem(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	orderId INT,
	productId VARCHAR(255),
	quantity INT
)

--##########################
--CREATE TABLE FOR CartItem
--##########################
CREATE TABLE CartItem(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	productId VARCHAR(100),
	quantity INT
)

--######################
--CREATE TABLE FOR Cart
--######################
CREATE TABLE cart (
  id VARCHAR(100) PRIMARY KEY,
  userid VARCHAR(100),
  productid VARCHAR(100),
  quantity VARCHAR(100),
  price VARCHAR(100),
  FOREIGN KEY (userid) REFERENCES Users(UserId),
  FOREIGN KEY (productid) REFERENCES products(id),
   isDeleted INT DEFAULT 0
);


/*************** END ***************/


--####################################
--############# TESTS #############
USE Ecommerce
GO

SELECT * FROM Users
SELECT * FROM Products
SELECT * FROM orderItem
SELECT * FROM Orders