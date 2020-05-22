---
title: "Design"
menu: 
    main:
        weight: 3
        parent: "Construction"
---

<p></p>

# Database (Deliverable 7)

The TLC system featured the use of two databases, the system’s own database and the Clara database. The system database was responsible for tracking all the moving parts of the system while the purpose of Clara was for retrieving student, teacher and course information such as their names. 

# The Physical Data Model

A physical data model represents the physical SQL tables which store the data. They are represented in the picture below. 

![Physical Data Model](/images/physical.jpg)  

# Database Analysis

The concept of referential integrity is the idea that for each reference pointing towards a record, a row for that record is guaranteed to exist. This is accomplished through a number of techniques in regards to how the database copes with the removal of a referenced row.

Integrity between the system database and the Clara database is not enforced, as they are completely separate systems where Clara only exposes a set of views which cannot have foreign keys applied to them. This could be problematic in situations such as courses being used by the application disappearing from Clara. Cases like these would need to be dealt with in application code, as we don’t have the means to do it purely in the data layer.

Entity Framework offers 3 approaches to working with databases: code-first, database-first and model-first. The code-first strategy is the approach where all the models are written as C# classes, are used to generate SQL which creates the database entities. Database-first is the reverse, where an existing database is used to generate C# classes. Model-first is the approach where visual studio enables interactive modeling of the entities to then generate both the database and the C# classes. We used code-first for the entirety of the application, while modifying the migration code to allow it to work with Clara views instead of physical tables. The main advantage of this approach is the convenience of tracking changes to our model in a single place, instead of requiring changes in both the models and the physical database entities. Model first wouldn’t work as .NET Core doesn’t support it.

## Database Access Paths

The most important tables used by the syste mare the Group and Schedule are the most important, as they hold data for the schedule and the queue information. Group has groupdId and schedule has scheduleId. Group will have all of the sessions therefore we needed a groupId for each, and for scheduleId it is there because schedule will hold every slot that had been added in the schedule. Then there is DepartmentOpenness which has departmentOpennessId. These tables reference Clara views, which cannot be under foreign keys.

## The Design Models for the System

Our model design has been layered with a database layer (SQL Server), database access layer (Entity Framework), login layer and user interface layer. Layering the model design in such a manner made it possible to theoretically swap out any of the layers with ease.

# The Data Security Plan

My [security plan](/files/vknyazev_securityplan.docx) outlines the design decisions and testing performed to ensure the security of the project, where the main concern has been authorization issues.
