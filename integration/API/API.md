# What is an API?  
An API is a set of programming code that enables data transmission between one software product and another. It also contains the terms of this data exchange.   

Application programming interfaces consist of two components:
- Technical specification describing the data exchange options between solutions with the specification done in the form of a request for processing and data delivery protocols
- Software interface written to the specification that represents it

# Types of APIs
## Private APIs
These application software interfaces are designed for improving solutions and services within an organization. In-house developers or contractors may use these APIs to integrate a company’s IT systems or applications, build new systems or customer-facing apps leveraging existing systems. Even if apps are publicly available, the interface itself remains available only for those working directly with the API publisher. The private strategy allows a company to fully control the API usage.
## Partner APIs
Partner APIs are openly promoted but shared with business partners who have signed an agreement with the publisher. The common use case for partner APIs is software integration between two parties. A company that grants partners with access to data or capability benefits from extra revenue streams. At the same time, it can monitor how the exposed digital assets are used, ensure whether third-party solutions using their APIs provide decent user experience, and maintain corporate identity in their apps.
## Public APIs
Also known as developer-facing or external, these APIs are available for any third-party developers. A public API program allows for increasing brand awareness and receiving an additional source of income when properly executed.

# API architecture styles
## Remote Procedure Call (RPC)
Web APIs may adhere to resource exchange principles based on a Remote Procedure Call. This protocol specifies the interaction between client-server based applications. One program (client) requests data or functionality from another program (server), located in another computer on a network, and the server sends the required response.
## Service Object Access Protocol (SOAP)
SOAP is a lightweight protocol for exchanging structured information in a decentralized, distributed environment, according to the definition by Microsoft that developed it. Generally speaking, this specification contains the syntax rules for request and response messages sent by web applications. APIs that comply with the principles of SOAP enable XML messaging between systems through HTTP or Simple Mail Transfer Protocol (SMTP) for transferring mail.  
[Read more about SOAP](https://github.com/GorVad/system-data-analyst-notes/blob/main/integration/API/SOAP.md)
## Representational State Transfer (REST)
The term REST was introduced by computer scientist Roy Fielding in a dissertation in 2000. Unlike SOAP, which is a protocol, REST is a software architectural style with six constraints for building applications that work over HTTP, often web services. The World Wide Web is the most common realization and application of this architecture style.
[Read more about REST]()
## gRPC
gRPC is an open-source universal API framework that is also classified under RPC. Unlike SOAP, gRPC is much newer and was released publicly in 2015 by Google. With gRPC, the client application can directly call methods from a server application located on a different computer as if it was a local object. This makes it easier to create distributed services and applications.
## GraphQL
The need for faster feature development, more efficient data loading due to increased mobile adoption, and a multitude of clients, made the developers look for other approaches to software architecture. GraphQL, initially created by Facebook in 2012 for internal use, is the new REST with organizations like Shopify, Yelp, GitHub, Coursera, and The New York Times using it to build APIs.

# Sources
## Webinar
1. [APIs for Beginners - How to use an API (Full Course / Tutorial)](https://www.youtube.com/watch?v=GZvSYJDk-us) [eng]
## Articles
1. [What is API: Definition, Types, Specifications, Documentation](https://www.altexsoft.com/blog/engineering/what-is-api-definition-types-specifications-documentation/) [eng]
2. [Что такое API?/ What is API?](https://aws.amazon.com/ru/what-is/api/) [eng/ru]
3. [Сравнение архитектурных стилей API: SOAP vs REST vs GraphQL vs RPC](https://medium.com/nuances-of-programming/сравнение-архитектурных-стилей-api-soap-vs-rest-vs-graphql-vs-rpc-68855deb3f4)