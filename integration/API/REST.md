# What is REST
A REST API is an API that conforms to the design principles of the REST, or representational state transfer architectural style. For this reason, REST APIs are sometimes referred to RESTful APIs.

# REST design principles 
REST APIs can be developed using virtually any programming language and support a variety of data formats. The only requirement is that they align to the following six REST design principles - also known as architectural constraints:

## Uniform interface
All API requests for the same resource should look the same, no matter where the request comes from. The REST API should ensure that the same piece of data, such as the name or email address of a user, belongs to only one uniform resource identifier (URI). Resources shouldn’t be too large but should contain every piece of information that the client might need.

## Client-server decoupling
In REST API design, client and server applications must be completely independent of each other. The only information the client application should know is the URI of the requested resource; it can't interact with the server application in any other ways. Similarly, a server application shouldn't modify the client application other than passing it to the requested data via HTTP.

## Statelessness
REST APIs are stateless, meaning that each request needs to include all the information necessary for processing it. In other words, REST APIs do not require any server-side sessions. Server applications aren’t allowed to store any data related to a client request.

## Cacheability
When possible, resources should be cacheable on the client or server side. Server responses also need to contain information about whether caching is allowed for the delivered resource. The goal is to improve performance on the client side, while increasing scalability on the server side.

## Layered system architecture
In REST APIs, the calls and responses go through different layers. As a rule of thumb, don’t assume that the client and server applications connect directly to each other. There may be a number of different intermediaries in the communication loop. REST APIs need to be designed so that neither the client nor the server can tell whether it communicates with the end application or an intermediary.

## Code on demand (optional)
REST APIs usually send static resources, but in certain cases, responses can also contain executable code (such as Java applets). In these cases, the code should only run on-demand.

# How it works?
REST APIs communicate via [HTTP](https://github.com/GorVad/system-data-analyst-notes/blob/main/integration/protocols/HTTP.md) requests to perform standard database functions like creating, reading, updating, and deleting records (also known as CRUD) within a resource.
This information can be delivered to a client in virtually any format including [JSON](https://github.com/GorVad/system-data-analyst-notes/blob/main/markup/JSON/JSON.md), HTML, [XML](https://github.com/GorVad/system-data-analyst-notes/blob/main/markup/XML/XML.md), Python, PHP, or plain text. JSON is popular because it’s readable by both humans and machines—and it is programming language-agnostic.

Request headers and parameters are also important in REST API calls because they include important identifier information such as metadata, authorizations, uniform resource identifiers (URIs), caching, cookies and more. Request headers and response headers, along with conventional HTTP status codes, are used within well-designed REST APIs.

# Anti-patterns
## Use singular and plural forms in one API
```
GET /places       |   GET /places
GET /place/{id}   |   GET /places/{id}
```
## Use trivial actions in URI
```
POST /create-booking   
PUT /update-booking/{id}
```
POST already means creating an object

# Working with collections
## Use pages
```
GET /places?limit=20&offset=0
```

## Use filters
```
GET /places?location=MO&type=italian
GET /tables?fields=place,size,date
```

## Use sort
```
GET /places?orderby=name,desc
```

# Sources
1. [OpenAPI Specification](https://spec.openapis.org/oas/v3.1.0)
2. [IBM: What is a REST API?](https://www.ibm.com/topics/rest-apis#:~:text=the%20next%20step-,What%20is%20a%20REST%20API%3F,representational%20state%20transfer%20architectural%20style.) 