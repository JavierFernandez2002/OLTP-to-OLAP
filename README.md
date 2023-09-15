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

## 1.Initial Database
to charge the dvd rental you need to follow the next tutorial
[https://www.postgresqltutorial.com/postgresql-getting-started/load-postgresql-sample-database/](https://www.postgresqltutorial.com/postgresql-getting-started/load-postgresql-sample-database/)
## 2.Create Star Schema
copy the StarSchem.sql file in the querie tool and the OLAP Schema will be created
