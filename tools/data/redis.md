# About
Redis (for REmote DIctionary Server) (link resides outside IBM) is an open source, in-memory, NoSQL key/value store that is used primarily as an application cache or quick-response database. Because it stores data in memory, rather than on a disk or solid-state drive (SSD), Redis delivers unparalleled speed, reliability, and performance.

# Capabilities
## Cache sessions
Unlike NoSQL databases such as MongoDB and PostreSQL, Redis stores data in the server's main memory rather than on hard disks and solid-state drives. This leads to significantly faster response times when performing read and write operations. It also helps ensure high availability (together with Redis Sentinel—see below) and scalability of services and application workloads.

## Queues
Redis can queue tasks that may take web clients longer to process than usual. Multiprocess task queuing is commonplace in many of today's web-based applications, and Redis makes it easy to implement automated Python-written processes that run in the background of request/response cycles.

# Use cases
## Real-time analytics
Because Redis can process data with sub-millisecond latency, it is ideal for real-time analytics, online advertising campaigns, and AI-driven machine learning processes.

## Location-based applications
Redis simplifies the development of location-based applications and services by providing geospatial indexing, sets, and operations. Using sorted sets, Redis is able to offload time-consuming searching and sorting of location data while also using an intelligent geo-hashing implementation.

## Caching for databases
Redis is able to handle large amounts of real-time data, making use of its in-memory data storage capabilities to help support highly responsive database constructs. Caching with Redis allows for fewer database accesses, which helps to reduce the amount of traffic and instances required. By using Redis for caching, development teams can dramatically improve their application throughputs by achieving sub-millisecond latency. And since Redis’ caching layer can scale quickly and economically, organizations are able to develop these highly responsive applications while reducing their overall expenditures.


# Source
[IBM: What is Redis?](https://www.ibm.com/topics/redis)