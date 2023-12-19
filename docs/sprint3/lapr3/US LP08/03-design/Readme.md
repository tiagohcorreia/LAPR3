# US 002 - To publish an announcement

## 3. Design - User Story Realization 

### 3.1. Rationale

**SSD - Alternative 1 is adopted.**

| Interaction ID | Question: Which class is responsible for...                       | Answer                       | Justification (with patterns)                                |
|:---------------|:------------------------------------------------------------------|:-----------------------------|:-------------------------------------------------------------|
| Step 1  		     | 	...interacting with the actor?                                   | CreateAnnouncementUI         | Pure Fabrication                                             |
| Step 2         | ...managing the system resources and delegating taks              | CreateAnnouncementController | Controller                                                   |
| Step 3         | ...temporarly saving the inputted data                            | CreateAnnouncementUI         | Pure Fabrication                                             |
|        | ...getting the states list                                        | StatesRepository             | Information Expert                                           |
|                | ...sorting the states list by ascending alphabetical order        | StatesRepository             | Information Expert                                           |
| Step 5         | ...getting the list of the districts inside of the selected state | DistrictsCollection          | Information Expert                                           |
|                | ...sorting the districts list by ascending alphabetical order     | DistrictsCollection          | Information Expert                                           |
| Step 7         | ...getting the list of cities inside of the district selected     | CitiesCollection             | Information Expert                                           |
|                | ...sorting the cities list by ascending alphabetical order        | CitiesCollection             | Information Expert                                           |
| Step 11        | ...validating the ACs for inputted data                           | CreateAnnoucementUI          | Pure Fabrication                                             |
| Step 23        | ...creating the lease advertisement                               | LeasesRepository             | Creator (rule 1: contains/aggregates instances of the class) |
|                | ...creating the sale advertisement                                | SalesRepository              | Creator (rule 1: contains/aggregates instances of the class) |
|                | ...creating the property                                          | Sale/Lease                   | Creator (rule 1: contains/aggregates instances of the class)                                                         |
|                | ...creating the adress                                            | Property                     | Creator (rule 1: contains/aggregates instances of the class)                                                             |

### Systematization ##

According to the taken rationale, the conceptual classes promoted to software classes are: 

* Sale
* Lease
* Property

Other software classes (i.e. Pure Fabrication) identified: 

 * CreateAnnouncementUI  
 * CreateAnnouncementController
 * StatesRepository
 * DistrictsCollection
 * CitiesCollection
 * SalesRepository
 * LeasesRepository

## 3.2. Sequence Diagram (SD)

### Split Diagram

![US02 - Sequence Diagram Split](svg/1.2.us02-sequence-diagram-split.svg)

### Get States List

![US02 - Sequence Diagram Partial - Get States List](../../../utils/svg/1.3.us02-sequence-diagram-get-states-list.svg)

### Get Districts Within State

![US02 - Sequence Diagram Partial - Get Districts List](../../../utils/svg/1.4.us02-sequence-diagram-get-districts-list.svg)

### Get Cities Within District

![US02 - Sequence Diagram Partial - Get Cities List](../../../utils/svg/1.5.us02-sequence-diagram-get-cities-list.svg)

### Create Sale

![US02 - Sequence Diagram Partial - Create Sale](svg/1.6.us02-sd-partial-create-sale.svg)

### Create Lease

![US02 - Sequence Diagram Partial - Create Lease](svg/1.7.us02-sd-partial-create-lease.svg)

### Validate Advertisement

![US02 - Sequence Diagram Partial - Validate Advertisement](svg/1.8.us02-sd-partial-validate-advertisement.svg)

## 3.3. Class Diagram (CD)

![Class Diagram](svg/2.us02-class-diagram.svg)