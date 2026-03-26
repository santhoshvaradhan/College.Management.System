1.Master Table : 

A master table is a core database table that stores essential, authoritative information about a main business entity (such as Users, Students, Products, or Departments) and is referenced by many other tables. 
It exists to avoid data duplication, maintain consistency, and act as a single source of truth. 
A master table is used when the data represents long‑lived, reusable entities that change infrequently but are required across multiple transactions or modules of the system.

Example : Users, Student, Products, Departments, etc. are examples of master tables.

2.Lookup Table :

A lookup table stores a small, predefined set of valid values that are used to restrict and standardize column values in other tables. 
It exists to ensure data consistency and integrity by allowing only approved values through foreign key relationships. 
It is used when a column should accept only fixed, limited options.

Example : A lookup table for "Status" might include values like "Active," "Inactive," and "Pending."

3.Configuration Table:

A configuration table stores application or system settings that control how the application behaves without changing code. 
It exists to provide flexibility, central management, and environment-specific control. It is used when behavior or limits must be changeable at runtime.

Example : A configuration table might include settings like "MaxLoginAttempts" or "SessionTimeoutMinutes."

4.Transaction Table:

A transaction table records dynamic, time‑based business events or activities. 
It exists to capture operational data and history. It is used when data is frequently inserted and represents actions rather than entities.

Example : An "Attendance" table that records each time a student attends a class, with columns for StudentID, ClassID, and Timestamp.

5.Junction Table = X_ref Table

An X_ref (cross‑reference) table is a junction table used to link two master/reference tables in a many‑to‑many relationship.

Example : "Users" table that records or some user may possible to many Roles "Role" Table


Table			TypeStoresUsed			 When

Lookup          Fixed valid values      Restrict column options
Configuration	App behavior settings	Avoid code changes
Reference		Shared business data	Reuse across modules
Master			Core parent entities	Multiple dependents
Transaction		Business events			Operational history
Junction		Relationships			Many‑to‑many
Audit/Log		Action history			Tracking & compliance
Staging			Temporary data			Imports & processing