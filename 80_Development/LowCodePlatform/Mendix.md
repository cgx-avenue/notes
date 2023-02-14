#lowcode #mendix #siemens
2023年2月1日

# 背景
Mendix号称低代码平台的佼佼者，那正好试着玩一玩。mendix可以用西门子员工登录，登陆之后跟着Academy搞了一个礼拜左右，试了一些基本功能。

# 初学之后的心得
1. Mendix主要开发Web app，但这个app，其实指的就是网站开发


# 官网自学历程和笔记
主要就是跟着Academy
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

![](imgs/2023-02-14-15-44-14.png)

### Application lifecycle management

The Mendix platform provides a development life cycle that is familiar to people who are used to agile software development. What are the differences?

1.  The result is the model, which is interpreted by the runtime in the cloud.
2.  In the team, the business analyst and the developer work together on the app. This helps create a common understanding of the application.

![](imgs/2023-02-14-15-44-26.png)

### Integration with Existing CI/CD Pipeline

![](imgs/2023-02-14-15-44-36.png)

### Capabilities of Mendix

![](imgs/2023-02-14-15-44-46.png)

![](imgs/2023-02-14-15-44-54.png)

### Mendix Architecture

![](imgs/2023-02-14-15-45-02.png)

### Database

HSQL, that comes with the Mendix Runtime

The domain model supports several databases. You can choose the internal database, which is fine for small apps, or one of the enterprise databases supported by Mendix. These include:

-   IBM DB2.

-   Microsoft SQL Server.

-   MySQL/MariaDB.

-   Oracle Database.

-   PostgreSQL.

### Entities and Attributes