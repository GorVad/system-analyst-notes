# Active Directory
Active Directory (AD) is a directory service that runs on Microsoft Windows Server. The main function of Active Directory is to enable administrators to manage permissions and control access to network resources. In Active Directory, data is stored as objects, which include users, groups, applications, and devices, and these objects are categorized according to their name and attributes. 

# Active Directory Domain Service
Active Directory Domain Services (AD DS) are a core component of Active Directory and provide the primary mechanism for authenticating users and determining which network resources they can access. AD DS also provides additional features such as Single Sign-On (SSO), security certificates, LDAP, and access rights management. 

## Structure
AD DS organizes data in a hierarchical structure consisting of domains, trees, and forests, as detailed below.

### Domains
A domain represents a group of objects such as users, groups, and devices, which share the same AD database. You can think of a domain as a branch in a tree. A domain has the same structure as standard domains and sub-domains, e.g. yourdomain.com and sales.yourdomain.com.

### Trees
A tree is one or more domains grouped together in a logical hierarchy. Since domains in a tree are related, they are said to “trust” each other.

### Forest
A forest is the highest level of organization within AD and contains a group of trees. The trees in a forest can also trust each other, and will also share directory schemas, catalogs, application information, and domain configurations.

### Organizational Units
An OU is used to organize users, groups, computers, and other organizational units.

### Containers
A container is similar to an OU, however, unlike an OU, it is not possible to link a Group Policy Object (GPO) to a generic Active Directory container. 

# Other Active Directory Services
Besides Active Directory Domain Services, there are a handful of other critical services that AD provides. Some of those services have been listed below:

## Lightweight Directory Services
AD LDS is a Lightweight Directory Access Protocol (LDAP) directory service. It provides only a subset of the AD DS features, which makes it more versatile in terms of where it can be run. For example, it can be run as a stand-alone directory service without needing to be integrated with a full implementation of Active Directory.

## Certificate Services
You can create, manage and share encryption certificates, which allow users to exchange information securely over the internet.

## Active Directory Federation Services
ADFS is a Single Sign-On (SSO) solution for AD which allows employees to access multiple applications with a single set of credentials, thus simplifying the user experience.

## Rights Management Services
AD RMS is a set of tools that assists with the management of security technologies that will help organizations keep their data secure. Such technologies include encryption, certificates, and authentication, and cover a range of applications and content types, such as emails and Word documents.

# Source
1. [Lepide: What Is Active Directory and How Does It Work?](https://www.lepide.com/blog/what-is-active-directory-and-how-does-it-work/) [en]
2. [Microsoft: Active Directory Domain Services Overview](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview) [en]