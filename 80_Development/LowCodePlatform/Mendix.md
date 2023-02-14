#lowcode #mendix #siemens
2023年2月1日


## Academy

### Mendix Development Process

Agile + DevOps

### Creating Pages

Atlas UI

### Domain Model

The domain model is an abstracted relational database based upon standard UML notation and object-oriented principles. In other words, this is a visual representation of the data that your application consists of.

This visual approach to application development allows you to build apps with Agility. Mendix gives you the ability to quickly build and grow your application over time.

The domain model consists of three main elements:

-   Entities which represents objects.
-   Attributes which assigns properties and values to entities.
-   Associations which allow entities to communicate with one another.

To store data in Mendix, you’ll need to use the Domain Model, an Object Relational Mapping (or ORM) included in Mendix. You can compare it to Hibernate, Entity Framework, or Django. Let’s get familiar with the Mendix way of structuring data!

### Team Server

The Team Server is the Mendix host environment that hosts all your applications. It also facilitates [versioning of apps](https://www.mendix.com/evaluation-guide/app-lifecycle/version-control), allowing for team members to sync updated projects.

### Microflows

Microflows model custom logic instead of custom code. This makes understanding the underlying structure of an application much easier, even years after it was created, no matter who is looking at it. This also allows for non-technical business interests and customers to easily understand how the application works.

### Data Validation and Consistency

Validation rules in Mendix are conditions that need to be met before objects can be stored in the database.

Domain model validations are added directly to the attributes of entities. This can control if data entered is unique or matches a specific datatype.

Validations can also be added to microflows and can be used to generate custom error messages for actions and inputs of the end user.

[Data consistency](https://www.mendix.com/evaluation-guide/app-lifecycle/model-consistency) is controlled by the relation of association between two objects. This controls what data can be deleted from each object.

### Application Security

At the project level, you can set who has access to the application and what they have access to, by setting user and module roles.

At the administrator level, you can preview the app, toggling each user role to view how they would experience the application, ensuring desired configuration.

### Microflows

表单条件判断等特定逻辑。

一个start event，一个或多个end event，其中包含activities和decisions。

### Widgets & Building blocks

Widgets are single elements that can be configured and used in your pages.

Building blocks are pre-configured sets of widgets.

### User Roles

User roles are not developer roles!

User roles are security measures, control access to pages and microflows.

Developer roles are used to manage access for app developers.

App -> Settings -> Roles & Permissions

## Crash Course

Mendix runtime, Mendix client, Mendix model

![](https://mail.qq.com/cgi-bin/viewfile?f=D7E8C1A1AFAFB85D873A0FAA2D3F44718D391E7C36E67C5C85A39488F01F61FAD0DF5C9997DA9DFCE680390786A1A4A3C1DECDB24A42613A9B9AC27E72B6D0E83978033FB249B6728F2E287D94B04E4D088BE6FBE997B618F7979FB9D47F3183&mailid=ZL0014_OObNmraMnsUue2MApd0utd2&sid=sG4-ga2X3YZtaHAT&net=1787637278)

### Application lifecycle management

The Mendix platform provides a development life cycle that is familiar to people who are used to agile software development. What are the differences?

1.  The result is the model, which is interpreted by the runtime in the cloud.
2.  In the team, the business analyst and the developer work together on the app. This helps create a common understanding of the application.

![](https://mail.qq.com/cgi-bin/viewfile?f=D7E8C1A1AFAFB85D873A0FAA2D3F44718D391E7C36E67C5C85A39488F01F61FAD0DF5C9997DA9DFCE680390786A1A4A3C1DECDB24A42613A62981539EBAF449C8CA326C5E82665672F831019C31C0DE445BF0D71DDC11877556B18EDC9AFD38E&mailid=ZL0014_OObNmraMnsUue2MApd0utd2&sid=sG4-ga2X3YZtaHAT&net=1787637278)

### Integration with Existing CI/CD Pipeline

![](https://mail.qq.com/cgi-bin/viewfile?f=D7E8C1A1AFAFB85D873A0FAA2D3F44718D391E7C36E67C5C85A39488F01F61FAD0DF5C9997DA9DFCE680390786A1A4A3C1DECDB24A42613A295734940BD891D9F29ABFA21BC2D3E32207F1E77DD72AA339F9AB5B924217167D6B62A497787935&mailid=ZL0014_OObNmraMnsUue2MApd0utd2&sid=sG4-ga2X3YZtaHAT&net=1787637278)

### Capabilities of Mendix

![](https://mail.qq.com/cgi-bin/viewfile?f=D7E8C1A1AFAFB85D873A0FAA2D3F44718D391E7C36E67C5C85A39488F01F61FAD0DF5C9997DA9DFCE680390786A1A4A3C1DECDB24A42613ADF2DCD3DDF24CA16C4269FE89F4DE1B7B2537EAB038F6B48886812054256D6381A6A78CA0569234D&mailid=ZL0014_OObNmraMnsUue2MApd0utd2&sid=sG4-ga2X3YZtaHAT&net=1787637278)

![](https://mail.qq.com/cgi-bin/viewfile?f=D7E8C1A1AFAFB85D873A0FAA2D3F44718D391E7C36E67C5C85A39488F01F61FAD0DF5C9997DA9DFCE680390786A1A4A3C1DECDB24A42613A41F4678E1D85CCAA33C29A4195790C9A309D5039C8DE8276ABF17275DCDD0CDC56863CC9C1D0168A&mailid=ZL0014_OObNmraMnsUue2MApd0utd2&sid=sG4-ga2X3YZtaHAT&net=1787637278)

### Mendix Architecture

![](https://mail.qq.com/cgi-bin/viewfile?f=D7E8C1A1AFAFB85D873A0FAA2D3F44718D391E7C36E67C5C85A39488F01F61FAD0DF5C9997DA9DFCE680390786A1A4A3C1DECDB24A42613AB255238A89D6046E84692543D2C2ABC588E049B78E275971EDF7B3512D43D5668C02C0D2590F9050&mailid=ZL0014_OObNmraMnsUue2MApd0utd2&sid=sG4-ga2X3YZtaHAT&net=1787637278)

### Database

HSQL, that comes with the Mendix Runtime

The domain model supports several databases. You can choose the internal database, which is fine for small apps, or one of the enterprise databases supported by Mendix. These include:

-   IBM DB2.

-   Microsoft SQL Server.

-   MySQL/MariaDB.

-   Oracle Database.

-   PostgreSQL.

### Entities and Attributes