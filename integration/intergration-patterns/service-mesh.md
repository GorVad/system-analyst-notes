# About
A service mesh controls the delivery of service requests in an application. Common features provided by a service mesh include service discovery, load balancing, encryption and failure recovery. High availability is also common through the use of software controlled by APIs rather than through hardware. Service meshes can make service-to-service communication fast, reliable and secure.

# How it works
A service mesh architecture uses a proxy instance called a sidecar in whichever development paradigm is in use, typically containers and/or microservices. In a microservice application, a sidecar attaches to each service. In a container, the sidecar attaches to each application container, VM or container orchestration unit, such as a Kubernetes pod.

Sidecars can handle tasks abstracted from the service itself, such as monitoring and security.

Service instances, sidecars and their interactions make up what is called the data plane in a service mesh. A different layer called the control plane manages tasks such as creating instances, monitoring and implementing policies for network management and security. Control planes can connect to a CLI or a GUI interface for application management.
![Alt text](integration-patterns-img\servicemesh-how-it-works-image.png)

# Key Feaures
## Reliability
Managing communications through sidecar proxies and the control plane improves efficiency and reliability of service requests, policies and configurations. Specific capabilities include load balancing and fault injection.

## Observability
Service mesh frameworks can provide insights into the behavior and health of services. The control plane can collect and aggregate telemetry data from component interactions to determine service health, such as traffic and latency, distributed tracing and access logs. Third-party integration with tools, such as Prometheus, Elasticsearch and Grafana, enables further monitoring and visualization.

## Security
Service mesh can automatically encrypt communications and distribute security policies, including authentication and authorization, from the network to the application and individual microservices. Centrally managing security policies through the control plane and sidecar proxies helps keep up with increasingly complex connections within and between distributed applications.

# Advantages and Disadvantages
**Advantages**:  
- Simplifies communication between services in both microservices and containers.
- Easier to diagnose communication errors, because they would occur on their own infrastructure layer.
- Supports security features such as encryption, authentication and authorization.
- Allows for faster development, testing and deployment of an application.
- Sidecars placed next to a container cluster is effective in managing network services.

**Disadvantages**:
- Runtime instances increase through use of a service mesh.
- Each service call must first run through the sidecar proxy, which adds a step.
- Service meshes do not address integration with other services or systems, and routing type or transformation mapping.
- Network management complexity is abstracted and centralized, but not eliminated -- someone must integrate service mesh into workflows and manage its configuration.

# Source
1. [EPAM: Service Mesh для микросервисов на примере Istio](https://www.youtube.com/watch?v=-n-Nkd8Y3-k) [ru]
2. [TechTarget: ServiceMesh](https://www.techtarget.com/searchitoperations/definition/service-mesh) [eng]