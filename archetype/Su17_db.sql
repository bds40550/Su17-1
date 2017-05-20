drop database if exists Su17; 
create database Su17; 
use Su17; 
 
create table ProductionRun ( 
  product Product not null,
  quantity int unsigned not null,
  targetStartDate DATE,
  targetCompleteDate DATE,
  RunStatus ENUM('planned', 'in process', 'cancelled', 'complete')
  status RunStatus,
  primary key (product),
  );
  
create table Product (
  productDesignation VARCHAR(40) not null,
  productName VARCHAR(40) not null,
  assembly Assembly,
  standardSalesPrice double (18,2),
  primary key (productName)
  );
  
create table Assembly (
  name varchar(40) not null,
  bom BillOfMaterials,
  quantityOnHand int not null,
  primary key (name),
  );
  
create table BillOfMaterials(
  version int,
  items LineItem,
  primary key (version),
  );
  
create table LineItem(
  assembly Assembly,
  part Part,
  quantity int,
  primary key (assembly, part),
  );
  
create table Part (
  description char(200),
  value double (18,2),
  units varchar (40),
  mfrPartNumber varchar (40),
  manufacturer Manufacturer,
  standardCost double (18, 2),
  standardLeadTime int,
  quantityOnHand int,
  primary key (mfrPartNumber),
  );
  
create table Manufacturer(
  name char(40),
  primary key (name),
  );
  

  

  

  
