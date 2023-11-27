# About
The Envoy Proxy is an open source, high-performance, small-footprint edge and service proxy. It works similarly to software load balancers like NGINX and HAProxy. It was originally created by Lyft, and is now a large open source project with an active base of contributors. The project has been adopted by the Cloud Native Computing Foundation (CNCF) and is now at Graduated project maturity.

As a data plane, Envoy can serve multiple important functions:
- Proxy for Istio Service Mesh (see also [Istio](istio.md))
- Kubernetes Ingress
- API-GW
- Integrate with WebAssembly
- Integrate with GraphQL


# Architecture
Envoy creates a transparent network that helps troubleshoot and handle cloud-native applications. It’s an independent executable that runs with a real-world application, is easily deployable, and supports any programming language.

Envoy has a multi-threaded architecture and uses a single process within it. The primary thread controls different coordination operations, and worker threads handle the processing, filtering, and forwarding. Once a listener accepts some incoming connection, a worker thread gets allocated to it till the end of the process.

Hence, Envoy is usually single-threaded and has some complex code that handles coordination between the different worker threads. It is advisable to configure the number of worker threads equal to the number of hardware threads on the system.

# Use Cases
## Sidecar
Envoy can serve as an L3 or L4 application or sidecar proxy in a service mesh that enables communication between services. The Envoy instance has the same lifecycle as the proxy’s parent application, allowing the extension of applications across multiple technology stacks—this includes legacy apps that don’t offer extensibility.

All application requests to traverse Envoy through the following listeners:
- **Ingress listeners**—take requests from other services in a service mesh and forward them to the local application related to the Envoy sidecar instance.
- **Egress listeners**—take requests from the local application related to the Envoy sidecar instance and forwards them to other services in the network.
![Alt text](service-mesh-tools-img\ingress-egress-traffic-image.jpg)

## Envoy as API Gateway
Envoy proxy can serve as an API gateway and ‘front proxy’ that sits between the application and the client request. Envoy accepts inbound traffic, collates the information in each request, and directs it to its destination within the service mesh. The image below demonstrates the use of Envoy as a ‘front proxy’ or ‘edge proxy,’ which will get requests from other networks. As an API gateway, the Envoy proxy is responsible for functionality such as traffic routing, load balancing, authentication, and monitoring at the edge.
![Alt text](service-mesh-tools-img\edge-traffic-image.jpg)

# Source
1. [Solo.io: Envoy Proxy](https://www.solo.io/topics/envoy-proxy/) [eng]