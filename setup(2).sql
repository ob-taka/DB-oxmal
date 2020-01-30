/* 	MokeTravels Database*/
/* setup.sql */

/*** Delete database if it exists ***/
USE master
IF EXISTS(select *
from sys.databases
where name='MokeTravels')
DROP DATABASE MokeTravels
GO

Create Database MokeTravels
GO

use MokeTravels
GO

/*** Delete tables (if they exist) before creating ***/

/* Table: dbo.Trip */
if exists (select *
from sysobjects
where id = object_id('dbo.Trip') and sysstat & 0xf = 3)
  drop table dbo.Trip
GO

/* Table: dbo.Booking */
if exists (select *
from sysobjects
where id = object_id('dbo.Booking') and sysstat & 0xf = 3)
  drop table dbo.Booking
GO

/* Table: dbo.TravelAdvisor */
if exists (select *
from sysobjects
where id = object_id('dbo.TravelAdvisor') and sysstat & 0xf = 3)
  drop table dbo.TravelAdvisor
GO

/* Table: dbo.TourLeader  */
if exists (select *
from sysobjects
where id = object_id('dbo.TourLeader') and sysstat & 0xf = 3)
  drop table dbo.TourLeader 
GO

/* Table: dbo.Country */
if exists (select *
from sysobjects
where id = object_id('dbo.Country') and sysstat & 0xf = 3)
  drop table dbo.Country
GO

/* Table: dbo.City*/
if exists (select *
from sysobjects
where id = object_id('dbo.City') and sysstat & 0xf = 3)
  drop table dbo.City
GO

/* Table: dbo.Site */
if exists (select *
from sysobjects
where id = object_id('dbo.Site') and sysstat & 0xf = 3)
  drop table dbo.Site
GO

/* Table: dbo.Itinerary */
if exists (select *
from sysobjects
where id = object_id('dbo.Itinerary') and sysstat & 0xf = 3)
  drop table dbo.Itinerary
GO

/* Table: dbo.Payment */
if exists (select *
from sysobjects
where id = object_id('dbo.Payment') and sysstat & 0xf = 3)
  drop table dbo.Payment 
GO

/* Table: dbo.CheckIn */
if exists (select *
from sysobjects
where id = object_id('dbo.CheckIn') and sysstat & 0xf = 3)
  drop table dbo.CheckIn
GO

/* Table: dbo.DepartDate */
if exists (select *
from sysobjects
where id = object_id('dbo.DepartDate') and sysstat & 0xf = 3)
  drop table dbo.DepartDate
GO

/* Table: dbo.RoomType */
if exists (select *
from sysobjects
where id = object_id('dbo.RoomType') and sysstat & 0xf = 3)
  drop table dbo.RoomType
GO

/* Table: dbo.Promotion */
if exists (select *
from sysobjects
where id = object_id('dbo.Promotion') and sysstat & 0xf = 3)
  drop table dbo.Promotion
GO

/* Table: dbo.StaffContactInfo*/
if exists (select *
from sysobjects
where id = object_id('dbo.StaffContactInfo') and sysstat & 0xf = 3)
  drop table dbo.StaffContactInfo
GO

/* Table: dbo.BookedRooms */
if exists (select *
from sysobjects
where id = object_id('dbo.BookedRooms') and sysstat & 0xf = 3)
  drop table dbo.BookedRooms
GO

/* Table: dbo.ValidPromo */
if exists (select *
from sysobjects
where id = object_id('dbo.ValidPromo') and sysstat & 0xf = 3)
  drop table dbo.ValidPromo
GO

/* Table: dbo.Offer*/
if exists (select *
from sysobjects
where id = object_id('dbo.Offer') and sysstat & 0xf = 3)
  drop table dbo.Offer
GO

/* Table: dbo.Hotel */
if exists (select *
from sysobjects
where id = object_id('dbo.Hotel') and sysstat & 0xf = 3)
  drop table dbo.Hotel
GO

/* Table: dbo.Flight */
if exists (select *
from sysobjects
where id = object_id('dbo.Flight') and sysstat & 0xf = 3)
  drop table dbo.Flight
GO

/* Table: dbo.Organiser  */
if exists (select *
from sysobjects
where id = object_id('dbo.Organiser') and sysstat & 0xf = 3)
  drop table dbo.Organiser 
GO

/* Table: dbo.Passenger */
if exists (select *
from sysobjects
where id = object_id('dbo.Passenger') and sysstat & 0xf = 3)
  drop table dbo.Passenger
GO

/* Table: dbo.Customer */
if exists (select *
from sysobjects
where id = object_id('dbo.Customer') and sysstat & 0xf = 3)
  drop table dbo.Customer
GO

/* Table: dbo.Staff */
if exists (select *
from sysobjects
where id = object_id('dbo.Staff') and sysstat & 0xf = 3)
  drop table dbo.Staff
GO


/* Table: dbo.Visit*/
if exists (select *
from sysobjects
where id = object_id('dbo.Visit') and sysstat & 0xf = 3)
  drop table dbo.Visit
GO

/* Table: dbo.Customer    */
CREATE TABLE Customer
(
  CustID char(9) NOT NULL,
  CustName varchar (50) NOT NULL,
  Gender char (1) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Customer PRIMARY KEY NONCLUSTERED (CustID),
)

/* Table: dbo.Organiser    */
CREATE TABLE Organiser
(
  CustID char(9) NOT NULL,
  CustContact char(10) NOT NULL,
  CustEmail varchar(50) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Organiser PRIMARY KEY NONCLUSTERED (CustID),
  --ForignKey
  CONSTRAINT FK_Customer_CustID FOREIGN KEY (CustID) REFERENCES
  dbo.Customer(CustID)
)

/* Table: dbo.Itinerary    */
CREATE TABLE Itinerary
(
  ItineraryNo char(5) NOT NULL,
  Duration tinyint NOT NULL,
  ItineraryDesc varchar(100) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Itinerary PRIMARY KEY NONCLUSTERED (ItineraryNo),
  --Check constraints
  CONSTRAINT CK_ItineraryNo CHECK(ItineraryNo NOT LIKE 'I[^0-9]%'),
  CONSTRAINT CK_Upper_ItineraryNo CHECK(Upper(ItineraryNo) = ItineraryNo collate Latin1_General_BIN2)
)

/* Table: dbo.Country    */
CREATE TABLE Country
(
  CountryCode char(4) NOT NULL,
  CountryDesc varchar(100) NOT Null,
  --PrimaryKey
  CONSTRAINT PK_Country PRIMARY KEY NONCLUSTERED (CountryCode)
)

/* Table: dbo.City    */
CREATE TABLE City
(
  CityCode char(4) ,
  CityDesc varchar(100) Null,
  CountryCode char(4) NOT Null ,
  --PrimaryKey
  CONSTRAINT PK_City PRIMARY KEY  NONCLUSTERED (CityCode),
  --Check constraints
  CONSTRAINT FK_City_CountryCode FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode),
  CONSTRAINT CK_CityCode CHECK(CityCode NOT LIKE '%[^0-9]%')
)



/* Table: dbo.Site     */
CREATE TABLE Site
(
  SiteID char(5),
  SiteDesc varchar(100) NOT NULL,
  CityCode char(4) NOT NULL ,
  --PrimaryKey
  CONSTRAINT PK_Site PRIMARY KEY NONCLUSTERED (SiteID),
  --ForeignKey
  CONSTRAINT FK_Site_CityCode FOREIGN KEY (CityCode) REFERENCES City(CityCode),
  --Check constraints
  CONSTRAINT CK_SiteID CHECK(SiteID  NOT LIKE 'SI[^0-9]%'),
  CONSTRAINT CK_Upper_SiteID CHECK(Upper(SiteID) = SiteID collate Latin1_General_BIN2)
)

/* Table: dbo.Visit    */
CREATE TABLE Visit
(
  ItineraryNo char(5) not null FOREIGN KEY REFERENCES Itinerary(ItineraryNo),
  SiteID char (5) not null FOREIGN KEY REFERENCES Site(SiteID),
  --PrimaryKey
  CONSTRAINT PK_Visit PRIMARY KEY NONCLUSTERED (ItineraryNo, SiteID),
  --ForeignKey
  CONSTRAINT FK_Visit_ItineraryNo  FOREIGN KEY (ItineraryNo) REFERENCES Itinerary(ItineraryNo),
  CONSTRAINT FK_Visit_SiteID FOREIGN KEY (SiteID) REFERENCES Site(SiteID)
)

/* Table: dbo.Staff    */
CREATE TABLE Staff
(
  StaffID char(4) NOT NULL,
  StaffName varchar (50) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Staff PRIMARY KEY NONCLUSTERED (StaffID),
  --Check contraints
  CONSTRAINT CK_StaffID CHECK(StaffID NOT LIKE 'S[^0-9]%'),
  CONSTRAINT CK_Upper_StaffID CHECK(Upper(StaffID) = StaffID collate Latin1_General_BIN2)
)

/* Table: dbo.StaffContactInfo     */
CREATE TABLE StaffContactInfo
(
  StaffID char(4) NOT NULL,
  StaffContact char(10) NOT NULL ,
  --PrimaryKey
  CONSTRAINT PK_StaffContactInfo PRIMARY KEY NONCLUSTERED (StaffID,StaffContact),
  --ForeignKey
  CONSTRAINT FK_StaffContactInfo_StaffID FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
)

/* Table: dbo.TourLeader     */
CREATE TABLE TourLeader
(
  StaffID char(4) NOT NULL,
  LicenceExpiry smalldatetime NOT NULL,
  LicenceNo char(10) NOT NULL,
  CONSTRAINT PK_TourLeader PRIMARY KEY NONCLUSTERED (StaffID),
  CONSTRAINT FK_TourLeader_StaffID FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
)

/* Table: dbo.TravelAdvisor     */
CREATE TABLE TravelAdvisor
(
  StaffID char(4) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_TravelAdvisor PRIMARY KEY NONCLUSTERED (StaffID),
  --ForeignKey
  CONSTRAINT FK_TravelAdvisor FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
)


/* Table: dbo.Hotel    */
CREATE TABLE Hotel
(
  HotelID char(6) NOT NULL,
  HotelName varchar (30) NOT NULL,
  HotelCategory varchar(6) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Hotel PRIMARY KEY NONCLUSTERED (HotelID),
  --Check constraints
  CONSTRAINT CK_HotelID CHECK(HotelID NOT LIKE 'H[^0-9]%'),
  CONSTRAINT CK_Upper_HotelID CHECK(Upper(HotelID) = HotelID collate Latin1_General_BIN2),
  CONSTRAINT CK_HotelCategory CHECK(HotelCategory LIKE '[1-7]-star')

)

/* Table: dbo.Flight */
CREATE TABLE Flight
(
  FlightNo char(6) NOT NULL,
  Airline varchar(30) NOT NULL,
  Origin varchar(30) NOT NULL,
  Destination varchar(30) NOT NULL,
  FlightTime TINYINT NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Flight PRIMARY KEY NONCLUSTERED (FlightNo),
  --Check constraint
  CONSTRAINT CK_FlightNo CHECK(FlightNo NOT LIKE '[A-Z][A-Z][^0-9]%'),
  CONSTRAINT CK_Upper_FlightNo CHECK(Upper(FlightNo) = FlightNo collate Latin1_General_BIN2)
)


/* Table: dbo.Trip */
CREATE TABLE Trip
(
  ItineraryNo char(5) NOT NULL,
  DepartureDate smalldatetime NOT NULL,
  DepartureTime char(4) NOT NULL Check(DepartureTime Between '0000' and '2359'),
  AdultPrice smallmoney NOT NULL,
  ChildPrice smallmoney NOT NULL,
  Status varchar(30) NULL,
  MaxNoOfParticipants tinyint NOT NULL,
  StaffID char(4) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Trip PRIMARY KEY NONCLUSTERED (DepartureDate,ItineraryNo),
  --ForignKey
  CONSTRAINT FK_Trip_ItineraryNo FOREIGN KEY (ItineraryNo) REFERENCES
  Itinerary(ItineraryNo),
  CONSTRAINT FK_Trip_StaffID FOREIGN KEY (StaffID) REFERENCES
  TourLeader(StaffID)
)

/* Table: dbo.Booking */
CREATE TABLE Booking
(
  BookingNo char(10) NOT NULL,
  BookingDate datetime NOT NULL,
  StaffID char(4) NOT NULL,
  CustID char(9) NOT NULL,
  ItineraryNo char(5) NOT NULL,
  DepartureDate smalldatetime NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Booking_BookingNo PRIMARY KEY NONCLUSTERED (BookingNo),
  --ForeignKey
  CONSTRAINT FK_Booking_StaffID FOREIGN KEY (StaffID) REFERENCES TravelAdvisor(StaffID) ,
  CONSTRAINT FK_Booking_CustID FOREIGN KEY (CustID) REFERENCES Organiser(CustID) ,
  CONSTRAINT FK_Booking_Trip FOREIGN KEY (DepartureDate,ItineraryNo) REFERENCES Trip(DepartureDate,ItineraryNo),
  --Check constraints
  CONSTRAINT CK_BookingNo CHECK(BookingNo NOT LIKE 'B[^0-9]%'),
  CONSTRAINT CK_Upper_BookingNo CHECK(Upper(BookingNo) = BookingNo collate Latin1_General_BIN2)

)

/* Table: dbo.Passenger     */
CREATE TABLE Passenger
(
  CustID char(9) NOT NULL,
  BookingNo char(10) NOT NULL,
  Age tinyint NOT NULL,
  Nationality varchar(20) NOT NULL,
  PassportNo varchar(20) NOT NULL,
  PassportExpiry smalldatetime NOT NULL,
  PricePaid smallmoney NULL,
  --PrimaryKey
  CONSTRAINT PK_Passenger PRIMARY KEY NONCLUSTERED (CustID, BookingNo),
  --ForeignKey
  CONSTRAINT FK_Passenger_CustID FOREIGN KEY (CustID) REFERENCES Customer(CustID) ,
  CONSTRAINT FK_Passenger_BookingNo FOREIGN KEY (BookingNo) REFERENCES Booking(BookingNo)
)

/* Table: dbo.RoomType     */
CREATE TABLE RoomType
(
  RmTypeID char(4) NOT NULL,
  RmDesc VARCHAR(100) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_RoomType PRIMARY KEY NONCLUSTERED (RmTypeID),
  --Check Constraints
  CONSTRAINT CK_RmTypeID CHECK(RmTypeID NOT LIKE 'RM[^0-9]%'),
  CONSTRAINT CK_Upper_RmTypeID CHECK(Upper(RmTypeID) = RmTypeID collate Latin1_General_BIN2)
)

/* Table: dbo.Promotion     */
CREATE TABLE Promotion
(
  PromoCode char(10) NOT NULL,
  PromoDesc VARCHAR(100) NOT NULL,
  Discount SMALLMONEY NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Promotion PRIMARY KEY NONCLUSTERED (PromoCode),
  --Check constraints
  CONSTRAINT CK_PromoCode CHECK(PromoCode NOT LIKE 'Moke[^0-9]%'),
  CONSTRAINT CK_Upper_PromoCode CHECK(Upper(PromoCode) = PromoCode collate Latin1_General_BIN2)

)

/* Table: dbo.Payment     */
CREATE TABLE Payment
(
  PmtNo char(25) NOT NULL,
  PmtDate smalldatetime NOT NULL,
  PmtType varchar(10) NOT NULL,
  PmtAmt SMALLMONEY NOT NULL,
  PmtMethod varchar(10) NOT NULL,
  CreditCardNo char(20) NULL,
  ChequeNo varchar(30) NULL,
  BookingNo char(10) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Payment PRIMARY KEY NONCLUSTERED (PmtNo),
  --ForeignKey
  CONSTRAINT PK_Payment_BookingNo FOREIGN KEY (BookingNo) REFERENCES Booking(BookingNo),
  --Check constraints
  CONSTRAINT CK_PmtNo CHECK(PmtNo NOT LIKE 'P[^0-9]%'),
  CONSTRAINT CK_Upper_PmtNo CHECK(Upper(PmtNo) = PmtNo collate Latin1_General_BIN2)
)

/* Table: dbo.CheckIn     */
CREATE TABLE CheckIn
(
  ItineraryNo char(5) NOT NULL,
  DepartureDate smalldatetime NOT NULL,
  HotelID char(6) NOT NULL,
  CheckInDate smalldatetime NOT NULL,
  CheckOutDate smalldatetime NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_CheckIn PRIMARY KEY NONCLUSTERED (ItineraryNo,DepartureDate,HotelID),
  --ForeignKey
  CONSTRAINT FK_CheckIn_Trip FOREIGN KEY (DepartureDate,ItineraryNo) REFERENCES Trip(DepartureDate,ItineraryNo),
  CONSTRAINT FK_CheckIn_HotelID FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
)

/* Table: dbo.DepartDate    */
CREATE TABLE DepartDate
(
  ItineraryNo char(5) NOT NULL,
  DepartureDate smalldatetime NOT NULL,
  FlightNo char(6) NOT NULL,
  FlightDate smalldatetime NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_DepartDate PRIMARY KEY NONCLUSTERED (ItineraryNo,DepartureDate,FlightNo),
  --ForeignKey
  CONSTRAINT FK_DepartDate_Trip FOREIGN KEY (DepartureDate,ItineraryNo) REFERENCES Trip(DepartureDate,ItineraryNo),
  CONSTRAINT FK_DepartDate_Flight FOREIGN KEY (FlightNo) REFERENCES Flight(FlightNo)
)

/* Table: dbo.BookedRooms    */
CREATE TABLE BookedRooms
(
  RmTypeID char(4) NOT NULL,
  BookingNo char(10) NOT NULL,
  NoOfExtraBeds TINYINT NULL,
  NoOfRooms TINYINT NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_BookedRooms PRIMARY KEY NONCLUSTERED (RmTypeID,BookingNo),
  --ForeignKey
  CONSTRAINT FK_BookedRooms_Booking FOREIGN KEY (BookingNo) REFERENCES Booking(BookingNo),
  CONSTRAINT FK_BookedRooms_RoomType FOREIGN KEY (RmTypeID) REFERENCES RoomType(RmTypeID)
)

/* Table: dbo.ValidPromo    */
CREATE TABLE ValidPromo
(
  CustID char(9) NOT NULL,
  BookingNo char(10) NOT NULL,
  PromoCode char(10) NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_ValidPromo PRIMARY KEY NONCLUSTERED (CustID,BookingNo,PromoCode),
  --ForeignKey
  CONSTRAINT FK_ValidPromo_Passenger  FOREIGN KEY (CustID,BookingNo) REFERENCES Passenger(CustID,BookingNo),
  CONSTRAINT FK_ValidPromo_Promotion  FOREIGN KEY (PromoCode) REFERENCES Promotion(PromoCode)
)

/* Table: dbo.Offer   */
CREATE TABLE Offer
(
  PromoCode char(10) NOT NULL,
  ItineraryNo char(5) NOT NULL,
  DepartureDate smalldatetime NOT NULL,
  --PrimaryKey
  CONSTRAINT PK_Offer PRIMARY KEY NONCLUSTERED (PromoCode,ItineraryNo,DepartureDate),
  --ForeignKey
  CONSTRAINT FK_Offer_Promotion FOREIGN KEY (PromoCode) REFERENCES Promotion(PromoCode),
  CONSTRAINT FK_Offer_Trip FOREIGN KEY (DepartureDate,ItineraryNo) REFERENCES Trip(DepartureDate,ItineraryNo),
)



insert into Customer
values
  ('M0000001C', 'Cloe Eastwood', 'F'),
  ('M0000002C', 'Jaxx Henderson', 'M'),
  ('M0000003C', 'Anabelle Robin', 'F'),
  ('M0000004C', 'Ralphy Hayes', 'M'),
  ('M0000005C', 'Dannielle Mckenzie', 'M'),
  ('M0000006C', 'Lana Draper', 'F'),
  ('M0000007C', 'Dexter Mackay', 'M'),
  ('M0000008C', 'Patrick Star', 'M'),
  ('M0000009C', 'Naomi Arnold', 'F'),
  ('M0000010C', 'Byron Hussain', 'M'),
  ('M0000011C', 'Karin Hassan', 'F'),
  ('M0000012C', 'Lilith Aziz', 'F'),
  ('M0000013C', 'Nadia Amin', 'F'),
  ('M0000014C', 'Sara Bates', 'F'),
  ('M0000015C', 'Karen Karim', 'F');


insert into Organiser
values
  ('M0000001C', '66660000', 'Cloe.Eastwood@hotmail.com'),
  ('M0000002C', '99990000', 'Jaxx.Henderson@hotmail.com'),
  ('M0000003C', '11110000', 'Anabelle.Robin@hotmail.com'),
  ('M0000004C', '22220000', 'Ralphy.Hayes@hotmail.com'),
  ('M0000005C', '33330000', 'Dannielle.Mckenzie@hotmail.com'),
  ('M0000011C', '44440000', 'Karin.Hassan@hotmail.com'),
  ('M0000012C', '55550000', 'Lilith.Aziz@hotmail.com'),
  ('M0000013C', '62353535', 'pizzahutdelivery@hotmail.com'),
  ('M0000014C', '67773777', 'macdonalds@hotmail.com'),
  ('M0000015C', '98769876', 'karenkarim@hotmail.com');


INSERT INTO Itinerary
VALUES
  ('I0001', 9, 'Explore Wuhan Yellow Crane Tower'),
  ('I0002', 12, 'Go Malaysia Legoland'),
  ('I0003', 11, 'Explore Burj Khalifa in Dubai'),
  ('I0004', 10, 'Visit Statue of Liberty in New York'),
  ('I0005', 13, 'Explore Tokyo DisneyLand'),
  ('I0006', 10, 'Explor Bangkok'),
  ('I0007', 10, 'Visit the leaning tower of Pissa'),
  ('I0008', 10, 'A trip to Louvre'),
  ('I0009', 10, 'Day tour at the Pyrmaid'),
  ('I0010', 10, 'Vist the Big Ben');

INSERT INTO Country
VALUES
  ('0001', 'America'),
  ('0086', 'China'),
  ('0091', 'India'),
  ('0081', 'Japan'),
  ('0060', 'Malaysia'),
  ('0020', 'Egypt'),
  ('0033', 'France'),
  ('0044', 'UK'),
  ('0084', 'Vietnam'),
  ('0066', 'Thailand');

INSERT INTO City
VALUES
  ('0971', 'Mumbai', '0091'),
  ('0212', 'New York', '0001'),
  ('0027', 'Wuhan', '0086'),
  ('0813', 'Tokyo', '0081'),
  ('0236', 'Cairo', '0020'),
  ('0003', 'Kuala lumpur','0060'),
  ('0001', 'Paris', '0033'),
  ('0020', 'London', '0044'),
  ('0028', 'Ho Chi Minh', '0084'),
  ('0002', 'Bangkok', '0066');


INSERT INTO Site
VALUES
  ('SI001', 'Dubai Burj Khalifa', '0971'),
  ('SI002', 'New York Statue Of Liberty', '0212'),
  ('SI003', 'Wuhan Yellow Crane Tower', '0027'),
  ('SI004', 'Tokyo Disneyland', '0813'),
  ('SI005', 'Great Wall of China', '0007'),
  ('SI006', 'Leaning Tower of Pisa', '0007'),
  ('SI007', 'Louvre', '0007'),
  ('SI008', 'Pyrmaid', '0007'),
  ('SI009', 'The Big Ben', '0007'),
  ('SI010', 'Ayutthaya Temples', '0007');


INSERT INTO Visit
VALUES
  ('I0001', 'SI003'),
  ('I0002', 'SI005'),
  ('I0003', 'SI001'),
  ('I0004', 'SI002'),
  ('I0005', 'SI004'),
  ('I0006', 'SI010'),
  ('I0007', 'SI006'),
  ('I0008', 'SI007'),
  ('I0009', 'SI008'),
  ('I00010', 'SI009');

INSERT INTO Staff
VALUES
  ('S118', 'Delbert Yap Qian Yi'),
  ('S289', 'Kim Jong-Un'),
  ('S409', 'Frederick Tan Lin Qi'),
  ('S242', 'Seok Hong Lim'),
  ('S999', 'The Devil'),
  ('S369', 'Xi Jinping'),
  ('S456', 'Yap Zhao Yi'),
  ('S732', 'Lim Yong Kai'),
  ('S076', 'Wong Zhi Da');

INSERT INTO StaffContactInfo
VALUES
  ('S118', '98765432'),
  ('S289', '91234567'),
  ('S409', '96781234'),
  ('S242', '93456789'),
  ('S999', '96666666'),
  ('S369', '98989898'),
  ('S456', '91212121'),
  ('S732', '98760987'),
  ('S076', '92353535');

INSERT INTO TourLeader
VALUES
  ('S369', '2023-JAN-31 00:00:00', 'T000000001'),
  ('S456', '2020-Feb-29 00:00:00', 'T000000002');

INSERT INTO TravelAdvisor
VALUES
  ('S732'),
  ('S076');


INSERT INTO Hotel
VALUES
  ('H12345', 'Great Wastern', '4-star'),
  ('H23456', 'Ahlibaba', '3-star'),
  ('H34567', 'Shangri-la', '2-star'),
  ('H45678', 'Jeya', '1-star'),
  ('H56789', 'zac inn', '4-star');


INSERT INTO Flight
VALUES
  ('AB1235', 'Qatar Airways', 'Singapore', 'Wuhan', 4),
  ('KB7637', 'United Airlines', 'Singapore', 'Tokyo', 6),
  ('JB5634', 'JetBlue', 'Singapore', 'New York', 18),
  ('LG8900', 'Emirates', 'Singapore', 'Dubai', 10),
  ('ST1569', 'Singapore Airlines', 'Singapore', 'Kuala Lumpur', 1);


INSERT INTO Trip
VALUES
  ('I0001', '2020-Feb-01 09:00:00', '0900', 1000, 500, 'Confirmed', 1 , 'S369'),
  ('I0002', '2020-Feb-02 14:00:00', '1400', 1000, 500, 'Confirmed', 1 , 'S456'),
  ('I0003', '2020-Feb-03 22:00:00', '2200', 1000, 500, 'Confirmed', 1 , 'S456'),
  ('I0004', '2020-Feb-04 16:30:00', '1630', 1000, 500, 'Confirmed', 1 , 'S456'),
  ('I0005', '2020-Feb-05 01:00:00', '0100', 1000, 500, 'Confirmed', 1 , 'S369');


INSERT INTO Booking
VALUES
  ('B000000001', '2020-01-10', 'S732', 'M0000001C', 'I0001', '2020-Feb-01 09:00:00'),
  ('B000000002', '2020-01-11', 'S732', 'M0000002C', 'I0002', '2020-Feb-02 14:00:00'),
  ('B000000003', '2020-01-12', 'S076', 'M0000003C', 'I0003', '2020-Feb-03 22:00:00'),
  ('B000000004', '2020-01-13', 'S076', 'M0000004C', 'I0004', '2020-Feb-04 16:30:00'),
  ('B000000005', '2020-01-14', 'S732', 'M0000005C', 'I0005', '2020-Feb-05 01:00:00'),
  ('B000000006', '2020-01-15', 'S732', 'M0000011C', 'I0001', '2020-Feb-01 09:00:00'),
  ('B000000007', '2020-01-07', 'S076', 'M0000012C', 'I0001', '2020-Feb-01 09:00:00'),
  ('B000000008', '2019-12-25', 'S732', 'M0000013C', 'I0001', '2020-Feb-01 09:00:00'),
  ('B000000009', '2020-01-23', 'S732', 'M0000014C', 'I0001', '2020-Feb-01 09:00:00'),
  ('B000000010', '2020-01-09', 'S076', 'M0000015C', 'I0001', '2020-Feb-01 09:00:00');


INSERT INTO Passenger
VALUES
  ('M0000001C', 'B000000001', 20, 'Singaporean', 'E0000001P', '2021-Jan-03 00:00:00', 1550.00),
  ('M0000002C', 'B000000002', 22, 'Singaporean', 'E0000002P', '2020-Mar-15 00:00:00', 1650.00),
  ('M0000003C', 'B000000003', 24, 'Singaporean', 'E0000003P', '2020-Jul-20 00:00:00', 1650.00),
  ('M0000004C', 'B000000004', 26, 'Singaporean', 'E0000004P', '2021-Jan-02 00:00:00', 850.00),
  ('M0000005C', 'B000000005', 28, 'Malaysian', 'A00001111', '2020-Oct-20 00:00:00', 850.00),
  ('M0000006C', 'B000000001', 30, 'Singaporean', 'E0000005P', '2020-Oct-21 00:00:00', null),
  ('M0000007C', 'B000000002', 32, 'Singaporean', 'E0000006P', '2020-Oct-22 00:00:00', null),
  ('M0000008C', 'B000000003', 34, 'Singaporean', 'E0000007P', '2020-Oct-23 00:00:00', null),
  ('M0000009C', 'B000000004', 36, 'Singaporean', 'E0000008P', '2020-Oct-24 00:00:00', null),
  ('M0000010C', 'B000000005', 38, 'Malaysian', 'A00002222', '2020-Oct-25 00:00:00', null),
  ('M0000011C', 'B000000006', 27, 'Singaporean', 'E0000009P', '2020-Dec-29 00:00:00', null),
  ('M0000012C', 'B000000007', 40, 'Malaysian', 'E0000010P', '2021-Apr-03 00:00:00', null),
  ('M0000013C', 'B000000008', 25, 'Malaysian', 'E0000011P', '2020-Nov-20 00:00:00', null),
  ('M0000014C', 'B000000009', 33, 'Singaporean', 'E0000012P', '2021-Mar-15 00:00:00', null),
  ('M0000015C', 'B000000010', 29, 'Singaporean', 'E0000013P', '2021-May-02 00:00:00', null);

INSERT INTO RoomType
VALUES
  ('RM01', 'Single: Room for at most 1 person'),
  ('RM02', 'Double: Room for at most 2 people'),
  ('RM03', 'Triple: Room for at most 3 people'),
  ('RM04', 'Quad: Room for at most 4 people'),
  ('RM05', 'Queen: Room with 1 queen-sized bed'),
  ('RM06', 'King: Room with 1 king-sized bed'),
  ('RM07', 'Double: Room that contains 2 regular/queen beds'),
  ('RM08', 'Studio: Room with 1 regular bed and one convertable couch bed'),
  ('RM09', 'Master Suite: Parlour/Living room that connects to one or more bedrooms'),
  ('RM10', 'Mini Suite: Smaller version of master suite');


INSERT INTO Promotion
VALUES
  ('MOKE000001', '100 dollar off on the month of February for all the trips to China', 100.00),
  ('MOKE000002', '150 dollar off for First time booking', 150.00),
  ('MOKE000003', '200 dollar off with a minimum spend of 2000 dollar', 200.00),
  ('MOKE000004', '50 dollar off for senior citizen (65 years old and above)', 20.00),
  ('MOKE000005', '50 dollar off on the month of February for all the trips to Japan', 50.00);




INSERT INTO Payment
VALUES
  ('P000000000000000000000001', '2019-09-28 12:39:10', 'CreditCard', 1550.00, 'Visa', '26535480536862466708', NULL , 'B000000001'),
  ('P000000000000000000000002', '2019-01-08 14:46:05', 'CreditCard', 1650.00, 'Amex', '4754658964368325888', NULL , 'B000000002'),
  ('P000000000000000000000003', '2019-06-20 11:23:09', 'Cheque', 1650.00, 'Cheque', NULL , '1000000001', 'B000000003'),
  ('P000000000000000000000004', '2019-05-06 09:05:30', 'Cheque', 850.00, 'Cheque', NULL , '1000000002', 'B000000004'),
  ('P000000000000000000000005', '2019-04-18 18:26:41', 'CreditCard', 850.00, 'MasterCard', '6354692872803399938', NULL , 'B000000005');


INSERT INTO CheckIn
VALUES
  ('I0001', '01-Feb-2020 09:00:00', 'H34567', '2020-Feb-01', '2020-Feb-10'),
  ('I0002', '2020-Feb-02 14:00:00', 'H56789', '2020-Feb-02', '2020-Feb-09'),
  ('I0003', '2020-Feb-03 22:00:00', 'H45678', '2020-Feb-04', '2020-Feb-12'),
  ('I0004', '2020-Feb-04 16:30:00', 'H23456', '2020-Feb-05', '2020-Feb-09'),
  ('I0005', '2020-Feb-05 01:00:00', 'H12345', '2020-Feb-05', '2020-Feb-12');


INSERT INTO DepartDate
VALUES
  ('I0001', '01-Feb-2020 09:00:00', 'AB1235', '01-Feb-2020 09:00:00'),
  ('I0002', '02-Feb-2020 14:00:00', 'KB7637', '02-Feb-2020 14:00:00'),
  ('I0003', '03-Feb-2020 22:00:00', 'JB5634', '03-Feb-2020 22:00:00'),
  ('I0004', '04-Feb-2020 16:30:00', 'LG8900', '04-Feb-2020 16:30:00'),
  ('I0005', '05-Feb-2020 01:00:00', 'ST1569', '05-Feb-2020 01:00:00');



INSERT INTO BookedRooms
VALUES
  ('RM01', 'B000000001', NULL, 2),
  ('RM02', 'B000000002', NULL, 3),
  ('RM03', 'B000000003', NULL, 1),
  ('RM04', 'B000000004', NULL, 2),
  ('RM05', 'B000000005', NULL, 2),
  ('RM03', 'B000000006', NULL, 1),
  ('RM02', 'B000000007', NULL, 3),
  ('RM03', 'B000000008', NULL, 1),
  ('RM05', 'B000000009', NULL, 2),
  ('RM01', 'B000000010', NULL, 3),


INSERT INTO ValidPromo
VALUES
  ('M0000001C', 'B000000001', 'Moke000001'),
  ('M0000001C', 'B000000001', 'Moke000002'),
  ('M0000001C', 'B000000001', 'Moke000003'),
  ('M0000002C', 'B000000002', 'Moke000002'),
  ('M0000002C', 'B000000002', 'Moke000003'),
  ('M0000003C', 'B000000003', 'Moke000002'),
  ('M0000003C', 'B000000003', 'Moke000003'),
  ('M0000004C', 'B000000004', 'Moke000002'),
  ('M0000005C', 'B000000005', 'Moke000002');


INSERT INTO Offer
VALUES
  ('Moke000001', 'I0001', '2020-Feb-01 09:00:00'),
  ('Moke000002', 'I0001', '2020-Feb-01 09:00:00'),
  ('Moke000003', 'I0001', '2020-Feb-01 09:00:00'),
  ('Moke000002', 'I0002', '2020-Feb-02 14:00:00'),
  ('Moke000003', 'I0002', '2020-Feb-02 14:00:00'),
  ('Moke000002', 'I0003', '2020-Feb-03 22:00:00'),
  ('Moke000003', 'I0003', '2020-Feb-03 22:00:00'),
  ('Moke000002', 'I0004', '2020-Feb-04 16:30:00'),
  ('Moke000002', 'I0005', '2020-Feb-05 01:00:00');



SELECT *
FROM Customer
SELECT *
FROM Organiser
SELECT *
FROM Itinerary
SELECT *
FROM Country
SELECT *
FROM City
SELECT *
FROM Site
SELECT *
FROM Visit
SELECT *
FROM Staff
SELECT *
FROM StaffContactInfo
SELECT *
FROM TourLeader
SELECT *
FROM TravelAdvisor
SELECT *
FROM Hotel
SELECT *
FROM Flight
SELECT *
FROM Trip
SELECT *
FROM Booking
SELECT *
FROM Passenger
SELECT *
FROM RoomType
SELECT *
FROM Promotion
SELECT *
FROM Payment
SELECT *
FROM CheckIn
SELECT *
FROM DepartDate
SELECT *
FROM ValidPromo
SELECT *
FROM Offer

-- list the name and ID of the customer that have booked a tour for china who has yet to depart
SELECT c.CustID as 'Customer ID', c.CustName as 'Customer Name' from Customer c 
INNER JOIN Booking b on b.CustID  = c.CustID 
inner join Trip t on t.ItineraryNo = b.ItineraryNo
inner join Visit v on v.ItineraryNo = t.ItineraryNo
inner join Site s on s.SiteID = v.SiteID
inner join City ct on ct.CityCode = s.CityCode
inner join Country coun on coun.CountryCode = ct.CountryCode
where coun.CountryDesc = 'China' and  b.DepartureDate > GETDATE()


select s.StaffID, s.StaffName, sc.StaffContact, tl.LicenceNo as 'Tour leader' from Staff s 
inner join StaffContactInfo sc on sc.StaffID = s.StaffID
inner join TourLeader tl on tl.StaffID = sc.StaffID
where not exists(select * from TourLeader where TourLeader.StaffID = s.StaffID)

select s.StaffID as 'Staff ID', s.StaffName as 'Staff Name'
from Staff s
where not exists (select * from TourLeader where TourLeader.StaffID = s.StaffID)


select * from Customer c
inner join Booking b on b.CustID = c.CustID
inner join Trip t on t.ItineraryNo = b.ItineraryNo
inner join CheckIn ci on ci.ItineraryNo = t.ItineraryNo
inner join BookedRooms br on br.BookingNo = b.BookingNo
inner join RoomType rt on rt.RmTypeID = br.RmTypeID
where ci.CheckInDate < '2020-2-3' and rt.RmDesc like 'Single%'



