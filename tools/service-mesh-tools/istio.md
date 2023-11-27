# About
Istio is a service mesh—a modernized service networking layer that provides a transparent and language-independent way to flexibly and easily automate application network functions. It is a popular solution for managing the different microservices that make up a cloud-native application. Istio service mesh also supports how those microservices communicate and share data with one another. (see also [Service Mesh](..\\integration\intergration-patterns\service-mesh.md)).  
Istio sidecar uses Envoy(see also [Envoy](\envoy.md)).

# Benefits
## Achieve consistent service networking
Your networking operators can consistently manage networking for all of their services without adding developer overhead.

## Secure your services
Your security operators can easily implement service-to-service security including authentication, authorization, and encryption.

## Improve your application performance
Implement best practices, like canary rollouts, and get deep visibility into your applications to identify where to focus your efforts to improve performance.

# How do Istio, Envoy, and Kubernetes work together?
The key to understanding Istio and the Istio architecture is to know about both Envoy and Kubernetes. It’s not a question of Istio versus Envoy or Istio versus Kubernetes—they often work together to make a microservices-based containerized environment operate smoothly. 

For example, service meshes like Istio are made up of both a control plane and a data plane. Istio uses an extended version of Envoy as its data plane. Envoy then manages all inbound and outbound traffic in the Istio service mesh. 

Kubernetes, on the other hand, is an open source platform that gets rid of many of the manual processes involved in deploying and scaling containerized applications by automating and orchestrating them. And, although Istio is platform independent, using Istio and Kubernetes together is popular among developers.

# Purpose of using Istio
## Secure cloud-native apps
Focus on security at the application level with strong identity-based authentication, authorization, and encryption.

## Manage traffic effectively
Fine-grained control of traffic behavior with rich routing rules, retries, failovers, and fault injection. 

## Monitor service mesh
Gain deep understanding of how service performance impacts matters upstream with the robust tracing, monitoring, and logging features of Istio.

## Easily deploy with Kubernetes and virtual machines
Istio provides visibility and network controls for both traditional and modern workloads including containers and virtual machines.

## Simplify load balancing with advanced features
Automated load balancing for all of your traffic, along with advanced features like client-based routing and canary rollouts.

## Enforce policies
Policies with a pluggable policy layer and configuration API that supports access controls, rate limits, and quotas.

# Source
1. [Флант: Что ждать от внедрения Istio? (Андрей Половов, Флант, Kuber Conf 2021)](https://www.youtube.com/watch?v=9CUfaeT3T-A) [ru]
2. [Флант: Istio в разрезе: что умеет и не умеет самый популярный Service Mesh (А. Половов, DevOpsConf 2023)](https://www.youtube.com/watch?v=S-WxeCDDels) [ru]
3. [IBM: Istio](https://www.youtube.com/watch?v=6zDrLvpfCK4) [eng]
4. [Google: What is Istio](https://cloud.google.com/learn/what-is-istio) [eng]
