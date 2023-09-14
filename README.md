# Data Warehousing Project

This project focuses on transforming an OLTP (Online Transaction Processing) style database into an OLAP (Online Analytical Processing) style using PostgreSQL and SQL. The main objective is to optimize the database structure to facilitate data analysis and reporting.

## Table of Contents

- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Transformations Made](#transformations-made)
- [Usage](#usage)
- [Getting Started](#getting-started)
- [Contributions](#contributions)
- [License](#license)

## Overview

In this project, the conversion of an OLTP database, designed for operational transactions, to an OLAP model geared towards analysis and reporting has been carried out. This involves restructuring the data and creating data schemas that are better suited for analytical queries.

## Technologies Used

- PostgreSQL
- SQL

## Project Structure

- `/sql`: Contains SQL scripts used to transform the database.
- `/data`: May contain sample data or backup files.
- `/docs`: Additional documentation, if necessary.

## Transformations Made

- **Normalization and Denormalization**: Existing tables have been normalized to eliminate redundancies and improve storage efficiency. Simultaneously, some tables have been denormalized to simplify analytical queries.

- **Index Creation**: Appropriate indexes have been created to accelerate analytical queries and enhance overall performance.

- **Data Aggregation**: Tables and views have been added to summarize data, making analysis and reporting easier.

## Usage

Describe how to use and query the transformed database in the project. Provide examples of typical SQL queries for analysis and reporting.

## Getting Started

1. Clone this repository:

   ```bash
   git clone https://JavierFernandez2002/OLTP-to-OLAP.git

  Before going forward with this , you need to have:
    .A PostgreSQL database server installed on your system. 
    .A PostgreSQL sample database called dvdrental.

## Load the sample database using psql tool
  ```
>psql
  ```
Second, enter the account’s information to log in to the PostgreSQL database server. You can use the default value provided by psql by pressing the Enter keyboard. However, for the password, you need to enter the one that you provided during PostgreSQL installation.
  ```
Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
  ```
Third, enter the following CREATE DATABASE statement to create a new dvdrental database.
```
postgres=# CREATE DATABASE dvdrental;
CREATE DATABASE
```
PostgreSQL will create a new database named dvdrental.

Finally, enter the exit command to quit psql:
```
postgres=# exit
```
Then, navigate the bin folder of the PostgreSQL installation folder:
```
postgres=# exit
```
After that, use the pg_restore tool to load data into the dvdrental database:
```
pg_restore -U postgres -d dvdrental C:\sampledb\dvdrental.tar
```
Finally, enter the password for the postgres user and press enter
```
Password:
```
## Execute the next SQL Scripts in order to transform your database.
