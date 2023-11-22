# About

OAuth 2.0 is the industry-standard protocol for authorization. OAuth 2.0 focuses on client developer simplicity while providing specific authorization flows for web applications, desktop applications, mobile phones, and living room devices.

# How it works?
![Alt text](ouath2-img\oauth2-arch-image.png)

## Participants
1. Resource Owner - User who interacts with web application
2. Client Application - Front-end code with which user interacts via browser etc.  
_Note: Don't confuse with User Agent. User Agent is the resource (browser, mobile app etc.) via which User interacts with Client Application_
3. Resource Server - Back-end application
4. Authorization Server - Server that grant access to user to interact with web application

## Interaction 
1. When Resource Owner trying to interact with Client Application for the first time, Client Application redirect him to Authorization Server  to Grant Access (authorize)
2. If Resource Owner authorized successfully, Authorization Server generater access token, which Resource Owner will use to interact with Client Application
3. When Resource Owner request data via Client Application, Client Application Access data with access token provided from Resource Server
4. Resource server Delegate cheking provided access token to Authorization Server 
5. Authorization Server cheks provided access token and if it exist in its DB, Resource Served send requested data to Client Application to show it to Resource Owner

## What is Access Token
An OAuth Access Token is a string that the OAuth client uses to make requests to the resource server.  
Access tokens do not have to be in any particular format, and in practice, various OAuth servers have chosen many different formats for their access tokens.  
Access tokens may be either "bearer tokens" or "sender-constrained" tokens. Sender-constrained tokens require the OAuth client to prove possession of a private key in some way in order to use the access token, such that the access token by itself would not be usable.
There are a number of properties of access tokens that are fundamental to the security model of OAuth:
- Access tokens must not be read or interpreted by the OAuth client. The OAuth client is not the intended audience of the token.
- Access tokens do not convey user identity or any other information about the user to the OAuth client.
- Access tokens should only be used to make requests to the resource server. Additionally, ID tokens must not be used to make requests to the resource server.

# Grant Type (flow)
This is the method of receiving Access Token. It depends on the Web Application type (see also [Web App Types](web-app-types.md))

## Main types
### Authorization Code Grant
The Authorization Code grant type is used by confidential and public clients to exchange an authorization code for an access token.  
After the user returns to the client via the redirect URL, the application will get the authorization code from the URL and use it to request an access token.
![Alt text](ouath2-img\sd-auth-code-grant-image.png)

### Proof Key for Code Exchange (PKCE)
Is an extension to the Authorization Code flow to prevent CSRF and authorization code injection attacks.  
PKCE is not a form of client authentication, and PKCE is not a replacement for a client secret or other client authentication. PKCE is recommended even if a client is using a client secret or other form of client authentication like private_key_jwt.  
__Note__: Because PKCE is not a replacement for client authentication, it does not allow treating a public client as a confidential client.

### Client Credentials Grant
The Client Credentials grant type is used by clients to obtain an access token outside of the context of a user.  This is typically used by clients to access resources about themselves rather than to access a user's resources.

### Device Authorization Grant
The Device Code grant type is used by browserless or input-constrained devices in the device flow to exchange a previously obtained device code for an access token.


# Sources
1. [OAuth 2.0](https://oauth.net/2/) [eng]
2. [Youtube: OAuth2 и KeyCloak](https://www.youtube.com/playlist?list=PL8X2nqRlWfaZbGSfSCnNyQ7g5VW3irLjX) [ru]