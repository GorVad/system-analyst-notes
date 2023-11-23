# About
Keycloak is an Open Source Identity and Access Management solution for modern Applications and Services.

# Keycloak Features
1. **Multiple Protocols Support**  
As for now Keycloak supports three different protocols, namely - OpenID Connect, OAuth 2.0 and SAML 2.0.
2. **SSO**  
Keycloak has full support for Single Sign-On and Single Sign-Out.
3. **Admin Console**  
Keycloak offers web-based GUI where you can “click out” all configurations required by your instance to work as you desire.
4. **User Identity and Accesses**  
Keycloak can be used as a standalone user identity and access manager by allowing us to create users database with custom roles and groups. 
5. **External Identity Source Sync**  
In case when your client currently has some type of user database, Keycloak allows us to synchronize with such database. By default, it supports LDAP and Active Directory but you can create custom extensions for any user database using Keycloak User storage API.
6. **Identity Brokering**  
Keycloak can also work as a proxy between your users and some external identity provider or providers.
7. **Social Identity Providers**  
Additionally, Keycloak allows us to use Social Identity Providers. 
8. **Pages Customization**  
Keycloak lets you customize all pages displayed by it to your users.

# Keycloak Disctibution
## Server
Standalone application is downloadable from Keycloak page in form of a tar or zip archive with all scripts, docs, and assets needed to work normally. As for now, there are two main versions of this distribution: one is powered by WildFly server while the other is powered by Quarkus. It is now in preview stage so some unexpected error may occur.
## Docker Image
Distribution appropriate for Docker, Podman, Kubernetes, and OpenShift. There are two official docker images for Keycloak: one is held in Quay Container Registry - quay.io/keycloak/keycloak, the second one is held in Docker Hub - jboss/keycloak. You can download both of them with a simple docker pull command.
## Operator
Distribution for Kubernetes and OpenShift based on Operator SDK.

# Source
1. [GitHub: Keycloak](https://github.com/keycloak/keycloak) [eng]
2. [DZone: Keycloak](https://dzone.com/articles/what-is-keycloak-and-when-it-may-help-you)
