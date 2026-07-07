--create database

--this script creates database stg_brightlearn_store and database dwh_brightlearn_store after checking if it already exists.


If db_id ('stg_brightlearn_store') is not null
drop database stg_brightlearn_store;


create database stg_brightlearn_store;

go


If db_id ('dwh_brightlearn_store') is not null
drop database dwh_brightlearn_store;

create database dwh_brightlearn_store;

go