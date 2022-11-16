# HTTP
## What is HTTP?
Hypertext Transfer Protocol (HTTP) is an application-layer protocol for transmitting hypermedia documents, such as HTML. It was designed for communication between web browsers and web servers, but it can also be used for other purposes. HTTP follows a classical client-server model, with a client opening a connection to make a request, then waiting until it receives a response. HTTP is a stateless protocol, meaning that the server does not keep any data (state) between two requests.

## HTTP Messages
HTTP messages are how data is exchanged between a server and a client. There are two types of messages: requests sent by the client to trigger an action on the server, and responses, the answer from the server.

HTTP requests, and responses, share similar structure and are composed of:

A start-line describing the requests to be implemented, or its status of whether successful or a failure. This start-line is always a single line.
An optional set of HTTP headers specifying the request, or describing the body included in the message.
A blank line indicating all meta-information for the request has been sent.
An optional body containing data associated with the request (like content of an HTML form), or the document associated with a response. The presence of the body and its size is specified by the start-line and HTTP headers.
The start-line and HTTP headers of the HTTP message are collectively known as the head of the requests, whereas its payload is known as the body.

![img.png](https://github.com/GorVad/system-data-analyst-notes/blob/main/integration/protocols/prorocols%20img/img.png)

## HTTP request methods
### GET
The GET method requests a representation of the specified resource. Requests using GET should only retrieve data.

### HEAD
The HEAD method asks for a response identical to a GET request, but without the response body.

### POST
The POST method submits an entity to the specified resource, often causing a change in state or side effects on the server.

### PUT
The PUT method replaces all current representations of the target resource with the request payload.

### DELETE
The DELETE method deletes the specified resource.

### CONNECT
The CONNECT method establishes a tunnel to the server identified by the target resource.

### OPTIONS
The OPTIONS method describes the communication options for the target resource.

### TRACE
The TRACE method performs a message loop-back test along the path to the target resource.

### PATCH
The PATCH method applies partial modifications to a resource.

## HTTP response status codes
1. Informational responses (100 – 199)
2. Successful responses (200 – 299)
3. Redirection messages (300 – 399)
4. Client error responses (400 – 499)
5. Server error responses (500 – 599)

## HTTP vs HTTPS
HTTPS is HTTP with encryption and verification. The only difference between the two protocols is that HTTPS uses TLS (SSL) to encrypt normal HTTP requests and responses, and to digitally sign those requests and responses. As a result, HTTPS is far more secure than HTTP. A website that uses HTTP has http:// in its URL, while a website that uses HTTPS has https://.

## Sources
### Web
1. [Mozilla: HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) [en/ru]
2. [W3S: HTTP](https://www.w3schools.com/whatis/whatis_http.asp) [en]

### Article 
1. [HTTP vs HTTPS](https://www.cloudflare.com/learning/ssl/why-is-http-not-secure/#:~:text=HTTPS%20is%20HTTP%20with%20encryption,far%20more%20secure%20than%20HTTP.) [en]
