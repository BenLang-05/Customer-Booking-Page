CREATE TABLE company (
companyID VARCHAR2 (15) NOT NULL,
companyName VARCHAR2 (50) NOT NULL, PRIMARY KEY (companyID))
/

CREATE TABLE branch (
branchID VARCHAR2 (15) NOT NULL,
branchName VARCHAR2 (50) NOT NULL,
branchPhoneNumber number NOT NULL,
street VARCHAR2 (20) NOT NULL,
city VARCHAR2 (20) NOT NULL,
postcode VARCHAR2 (8) NOT NULL,
numberOfRooms number NOT NULL CHECK (numberOfRooms BETWEEN 5 AND 30),
numberOfEmployees number NOT NULL,
companyID VARCHAR2 (15) NOT NULL, PRIMARY KEY (branchID),
FOREIGN KEY (companyID) REFERENCES company (companyID))
/

CREATE TABLE employee (
employeeID VARCHAR2 (15) NOT NULL,
forename VARCHAR2 (20) NOT NULL,
surname VARCHAR2 (20) NOT NULL,
employeeType VARCHAR2 (30) NOT NULL,
branchID VARCHAR2 (15) NOT NULL, PRIMARY KEY (employeeID),
FOREIGN KEY (branchID) REFERENCES branch (branchID))
/

CREATE TABLE supplier (
supplierID VARCHAR2 (15) NOT NULL,
supplierType VARCHAR2 (30) NOT NULL,
supplierPhoneNumber number NOT NULL,
street VARCHAR2 (20) NOT NULL,
city VARCHAR2 (20) NOT NULL,
postcode VARCHAR2 (8) NOT NULL, PRIMARY KEY (supplierID))
/

CREATE TABLE product_order (
orderID number NOT NULL,
productID VARCHAR2 (15) NOT NULL,
orderDate date NOT NULL,
productName VARCHAR2 (30) NOT NULL,
productPrice number(4,2) NOT NULL, 
productQuantity number NOT NULL, 
supplierID VARCHAR2 (15) NOT NULL, 
branchID VARCHAR2 (15) NOT NULL, PRIMARY KEY (orderID, productID),
FOREIGN KEY (supplierID) REFERENCES supplier (supplierID),
FOREIGN KEY (branchID) REFERENCES branch (branchID))
/

CREATE TABLE room (
roomID VARCHAR2 (10) NOT NULL, 
roomNumber number NOT NULL, 
roomType VARCHAR2 (15) NOT NULL CHECK (roomType IN ('standard', 'executive')),
capacity number NOT NULL,
branchID VARCHAR2 (15) NOT NULL, PRIMARY KEY (roomID),
FOREIGN KEY (branchID) REFERENCES branch (branchID))
/

CREATE TABLE standard (
standardID VARCHAR2 (15) NOT NULL,
roomID VARCHAR2 (15) NOT NULL, 
party CHAR(1) CHECK (party IN ('Y', 'N')), PRIMARY KEY (standardID),
FOREIGN KEY (roomID) REFERENCES room (roomID))
/

CREATE TABLE partyRoom (
partyRoomID VARCHAR2 (15) NOT NULL,
numberOfDecor number NOT NULL,
numberOfGuests number NOT NULL,
standardID VARCHAR2 (15) NOT NULL, PRIMARY KEY (partyRoomID),
FOREIGN KEY (standardID) REFERENCES standard (standardID))
/

CREATE TABLE executive (
executiveID VARCHAR2 (15) NOT NULL,
televisionNumber number NOT NULL,
internetAPNumber number NOT NULL,
buffet CHAR(1) CHECK (buffet IN ('Y', 'N')),
roomID VARCHAR2 (15) NOT NULL, PRIMARY KEY (executiveID),
FOREIGN KEY (roomID) REFERENCES room (roomID))
/

CREATE TABLE buffet (
orderNumber number NOT NULL, PRIMARY KEY (orderNumber),
executiveID VARCHAR2 (15) NOT NULL,
FOREIGN KEY (executiveID) REFERENCES executive (executiveID))
/

CREATE TABLE buffet_order (
itemName VARCHAR2 (30) NOT NULL,
itemQuantity number NOT NULL,
orderNumber number NOT NULL,
FOREIGN KEY (orderNumber) REFERENCES buffet (orderNumber))
/

CREATE TABLE customer (
customerID VARCHAR2 (15) NOT NULL,
customerForename VARCHAR2 (20) NOT NULL,
customerSurname VARCHAR2 (20) NOT NULL,
dateOfBirth date NOT NULL,
customerPhoneNumber number NOT NULL,
customerEmail VARCHAR2 (30) NOT NULL,
customerType VARCHAR2 (25) NOT NULL CHECK (customerType IN ('standard', 'business')), PRIMARY KEY (customerID))
/

CREATE TABLE booking (
bookingID VARCHAR2 (20) NOT NULL,
bookingDate date NOT NULL,
checkInDate date NOT NULL,
duration number NOT NULL,
customerID VARCHAR2 (15) NOT NULL,
roomID VARCHAR2 (15) NOT NULL, PRIMARY KEY (bookingID),
FOREIGN KEY (roomID) REFERENCES room (roomID),
FOREIGN KEY (customerID) REFERENCES customer (customerID))
/

CREATE TABLE business_customer (
businessCustomerID VARCHAR2 (15) NOT NULL,
customerCompanyName VARCHAR2 (30) NOT NULL,
companyPhoneNumber number NOT NULL,
roomType VARCHAR2 (15) NOT NULL,
payByInvoice CHAR(1) CHECK (payByInvoice IN ('Y', 'N')),
customerID VARCHAR2 (15) NOT NULL, PRIMARY KEY (businessCustomerID),
FOREIGN KEY (customerID) REFERENCES customer (customerID))
/

CREATE TABLE standard_customer (
standardCustomerID VARCHAR2 (15) NOT NULL,
standardID VARCHAR2 (15) NOT NULL,
customerID VARCHAR2 (15) NOT NULL, PRIMARY KEY (standardCustomerID),
FOREIGN KEY (standardID) REFERENCES standard (standardID),
FOREIGN KEY (customerID) REFERENCES customer (customerID))
/



INSERT INTO company VALUES
('easeLtd001','Ease Ltd');



INSERT INTO branch VALUES
('keele001','Ease Ltd - Keele branch', 38176691107,'Keele Road','Stoke-on-Trent','ST5 5BG',15,38,'easeLtd001');

INSERT INTO branch VALUES
('preston001','Ease Ltd - Preston branch', 34576691107,'Preston Road','Preston','PR5 4NZ',5,23,'easeLtd001');

INSERT INTO branch VALUES
('london001','Ease Ltd - London branch', 39076691107,'London Road','London','SW7 5BD',30,73,'easeLtd001');



INSERT INTO employee VALUES
('k014','User','One','Receptionist','keele001');

INSERT INTO employee VALUES
('k003','User','Two','Cleaner','keele001');

INSERT INTO employee VALUES
('k020','User','Three','Chef','keele001');

INSERT INTO employee VALUES
('p007','User','Four','Receptionist','preston001');

INSERT INTO employee VALUES
('p022','User','Five','Chef','preston001');

INSERT INTO employee VALUES
('p012','User','Six','Cleaner','preston001');

INSERT INTO employee VALUES
('l064','User','Seven','Chef','london001');

INSERT INTO employee VALUES
('l031','User','Eight','Receptionist','london001');

INSERT INTO employee VALUES
('l009','User','Nine','Cleaner','london001');



INSERT INTO supplier VALUES
('supply001','Food',74184338917,'Supply Avenue','Manchester','M11 3FF');

INSERT INTO supplier VALUES
('supply002','Toiletries',82927568109,'Supply Street','Bristol','BS3 2EJ');

INSERT INTO supplier VALUES
('supply003','Water',67829746517,'Supply Road','Leeds','LS11 0ES');



INSERT INTO product_order VALUES
(1,'meat012','26-APR-2025','Chicken Nuggets',5.49,100,'supply001','keele001');

INSERT INTO product_order VALUES
(2,'meat012','26-APR-2025','Chicken Nuggets',5.49,40,'supply001','preston001');

INSERT INTO product_order VALUES
(3,'meat012','26-APR-2025','Chicken Nuggets',5.49,150,'supply001','london001');

INSERT INTO product_order VALUES
(4,'bread003','19-APR-2025','Baguette',2.39,70,'supply001','keele001');

INSERT INTO product_order VALUES
(5,'bread003','19-APR-2025','Baguette',2.39,30,'supply001','preston001');

INSERT INTO product_order VALUES
(6,'bread003','19-APR-2025','Baguette',2.39,35,'supply001','london001');

INSERT INTO product_order VALUES
(7,'bathroom007','23-APR-2025','Soap',2.09,20,'supply002','keele001');

INSERT INTO product_order VALUES
(8,'bathroom007','24-APR-2025','Soap',2.09,15,'supply002','preston001');

INSERT INTO product_order VALUES
(9,'bathroom007','23-APR-2025','Soap',2.09,35,'supply002','london001');

INSERT INTO product_order VALUES
(10,'bathroom002','24-MAR-2025','Towel',8.79,15,'supply002','keele001');

INSERT INTO product_order VALUES
(11,'bathroom002','19-MAR-2025','Towel',8.79,20,'supply002','preston001');

INSERT INTO product_order VALUES
(12,'bathroom002','30-MAR-2025','Towel',8.79,5,'supply002','london001');

INSERT INTO product_order VALUES
(13,'bathroom002','07-APR-2025','Water',1.29,150,'supply003','keele001');

INSERT INTO product_order VALUES
(14,'bathroom002','02-APR-2025','Water',1.29,300,'supply003','london001');

INSERT INTO product_order VALUES
(15,'bathroom002','13-APR-2025','Water',1.29,100,'supply003','preston001');



INSERT INTO room VALUES
('pre002',2,'standard',3,'preston001');

INSERT INTO room VALUES
('pre005',5,'executive',6,'preston001');

INSERT INTO room VALUES
('pre004',4,'executive',5,'preston001');

INSERT INTO room VALUES
('pre001',1,'standard',2,'preston001');

INSERT INTO room VALUES
('kee013',13,'standard',2,'keele001');

INSERT INTO room VALUES
('kee003',3,'standard',5,'keele001');

INSERT INTO room VALUES
('kee001',1,'executive',8,'keele001');

INSERT INTO room VALUES
('kee009',9,'executive',4,'keele001');

INSERT INTO room VALUES
('lon027',27,'executive',5,'london001');

INSERT INTO room VALUES
('lon012',12,'executive',10,'london001');

INSERT INTO room VALUES
('lon008',8,'standard',6,'london001');

INSERT INTO room VALUES
('lon020',20,'standard',2,'london001');



INSERT INTO standard VALUES
('preS01','pre002','Y');

INSERT INTO standard VALUES
('preS02','pre001','N');

INSERT INTO standard VALUES
('keeS01','kee013','N');

INSERT INTO standard VALUES
('keeS02','kee003','Y');

INSERT INTO standard VALUES
('lonS01','lon008','Y');

INSERT INTO standard VALUES
('lonS02','lon020','N');



INSERT INTO partyRoom VALUES
('prePR01',5,8,'preS01');

INSERT INTO partyRoom VALUES
('keePR01',8,10,'keeS02');

INSERT INTO partyRoom VALUES
('lonPR01',14,8,'lonS01');



INSERT INTO executive VALUES
('preE01',3928,31,'Y','pre005');

INSERT INTO executive VALUES
('preE02',2901,31,'N','pre004');

INSERT INTO executive VALUES
('keeE01',2988,87,'Y','kee001'); 

INSERT INTO executive VALUES
('keeE02',1983,87,'N','kee009');

INSERT INTO executive VALUES
('lonE01',4092,103,'N','lon027');

INSERT INTO executive VALUES
('lonE02',3919,103,'Y','lon012');



INSERT INTO buffet VALUES
(1,'preE01');

INSERT INTO buffet VALUES
(2,'keeE01'); 

INSERT INTO buffet VALUES
(3,'lonE01');



INSERT INTO buffet_order VALUES
('Fish and chips',2,1);

INSERT INTO buffet_order VALUES
('Soup',3,1);

INSERT INTO buffet_order VALUES
('Pizza',1,1);

INSERT INTO buffet_order VALUES
('Pizza',7,2); 

INSERT INTO buffet_order VALUES
('Sausage and mash',1,2);

INSERT INTO buffet_order VALUES
('Sausage and mash',5,3);

INSERT INTO buffet_order VALUES
('Fish and chips',3,3);

INSERT INTO buffet_order VALUES
('Salad',2,3);



INSERT INTO customer VALUES
('cust0182','User','Ten','15-MAR-2005',38173638577,'Ten@gmail.com','standard');

INSERT INTO customer VALUES
('cust0472','User','Eleven','10-AUG-2005',38183638577,'Eleven@gmail.com','business');

INSERT INTO customer VALUES
('cust0071','User','Twelve','26-MAY-2002',38193638577,'Twelve@gmail.com','business');

INSERT INTO customer VALUES
('cust1039','User','Thirteen','27-APR-2004',38273638577,'Thirteen@gmail.com','business');

INSERT INTO customer VALUES
('cust0821','User','Fourteen','06-AUG-2007',38373638577,'Fourteen@gmail.com','standard');

INSERT INTO customer VALUES
('cust0561','User','Fifteen','07-SEP-2006',38473638577,'Fifteen@gmail.com','standard');

INSERT INTO customer VALUES
('cust0001','User','Sixteen','10-Aug-2010',38573638577,'Sixteen@gmail.com','business');

INSERT INTO customer VALUES
('cust1390','User','Seventeen','03-JUN-2005',38673638577,'Seventeen@gmail.com','business');

INSERT INTO customer VALUES
('cust0162','User','Eighteen','06-JUN-2005',38773638577,'Eighteen@gmail.com','business');



INSERT INTO booking VALUES
('preBook0139','20-APR-2025','29-APR-2025',7,'cust0472','pre004');

INSERT INTO booking VALUES
('preBook0019','05-JUN-2024','01-SEP-2024',14,'cust0071','pre005');

INSERT INTO booking VALUES
('preBook0108','26-DEC-2024','28-JAN-2025',3,'cust0821','pre001');

INSERT INTO booking VALUES
('keeBook0072','20-FEB-2024','26-FEB-2024',1,'cust0182','kee013');

INSERT INTO booking VALUES
('keeBook0201','13-AUG-2024','21-SEP-2024',5,'cust1390','kee001');

INSERT INTO booking VALUES
('keeBook0378','03-JAN-2025','07-MAR-2025',7,'cust0162','kee009');

INSERT INTO booking VALUES
('lonBook0145','31-JAN-2025','28-MAR-2025',2,'cust0001','lon027');

INSERT INTO booking VALUES
('lonBook0074','25-OCT-2024','01-NOV-2024',2,'cust1039','lon012');

INSERT INTO booking VALUES
('lonBook0405','27-APR-2025','06-MAY-2025',10,'cust0561','lon008');



INSERT INTO business_customer VALUES
('bus0583','Algorithm Alchemists',29185648172,'executive','Y','cust0001');

INSERT INTO business_customer VALUES
('bus0201','Neural Network Nexus',29285648172,'executive','N','cust1039');

INSERT INTO business_customer VALUES
('bus0091','Algorithm Alchemists',29185648172,'executive','N','cust1390');

INSERT INTO business_customer VALUES
('bus0308','CodeCraft Dynamics',29385648172,'executive','Y','cust0162');

INSERT INTO business_customer VALUES
('bus1029','CodeCraft Dynamics',29385648172,'executive','N','cust0472');

INSERT INTO business_customer VALUES
('bus0891','Neural Network Nexus',29285648172,'executive','Y','cust0071');



INSERT INTO standard_customer VALUES
('sta0828','preS02','cust0821');

INSERT INTO standard_customer VALUES
('sta0164','keeS01','cust0182');

INSERT INTO standard_customer VALUES
('sta0762','lonS01','cust0561');



