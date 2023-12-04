# About
It is an open-source telemetry agent specifically designed to efficiently handle the challenges of collecting and processing telemetry data across a wide range of environments, from constrained systems to complex cloud infrastructures. Managing telemetry data from various sources and formats can be a constant challenge, particularly when performance is a critical factor.

# Features
- High Performance at low CPU and Memory footprint
- Data Parsing
    - Convert your unstructured messages using parsers: JSON, Regex, LTSV and Logfmt
- Reliability and Data Integrity
    - Backpressure Handling
    - Data Buffering in memory and file system
- Networking
    - Security: built-in TLS/SSL support
    - Asynchronous I/O
- Pluggable Architecture and Extensibility: Inputs, Filters and Outputs
    - More than 70 built-in plugins available
    - Extensibility
        - Write any input, filter or output plugin in C language
        - Write Filters in Lua or Output plugins in Golang
- Monitoring: expose internal metrics over HTTP in JSON and Prometheus format
- Stream Processing: Perform data selection and transformation using simple SQL queries
    - Create new streams of data using query results
    - Aggregation Windows
    - Data analysis and prediction: Timeseries forecasting
- Portable: runs on Linux, MacOS, Windows and BSD systems

# Key concepts
## Event or Record
Every incoming piece of data that belongs to a log or a metric that is retrieved by Fluent Bit is considered an Event or a Record.
It contains four lines and all of them represents four independent Events.
Internally an Event is comprised of:
- timestamp
- key/value metadata
- payload

### Event format
The Fluent Bit wire protocol represents an Event as a 2-element array with a nested array as the first element:
```[[TIMESTAMP, METADATA], MESSAGE]```

where
- **TIMESTAMP** is a timestamp in seconds as an integer or floating point value (not a string);
- **METADATA** is a possibly-empty object containing event metadata; 
- **MESSAGE** is an object containing the event body.

## Filtering
In some cases it is required to perform modifications on the Events content, the process to alter, enrich or drop Events is called Filtering.  
There are many use cases when Filtering is required like:
- Append specific information to the Event like an IP address or metadata.
- Select a specific piece of the Event content.
- Drop Events that matches certain pattern.

## Tag
Every Event that gets into Fluent Bit gets assigned a Tag. This tag is an internal string that is used in a later stage by the Router to decide which Filter or Output phase it must go through.

## Timestamp
The Timestamp represents the time when an Event was created. Every Event contains a Timestamp associated.

## Match
Fluent Bit allows to deliver your collected and processed Events to one or multiple destinations, this is done through a routing phase. A Match represent a simple rule to select Events where it Tags matches a defined rule.

## Structured Messages
Source events can have or not have a structure. A structure defines a set of keys and values inside the Event message.  
At a low level both are just an array of bytes, but the Structured message defines keys and values, having a structure helps to implement faster operations on data modifications.

# Source
1. [FluentBit Manual](https://docs.fluentbit.io/manual/about/what-is-fluent-bit) [eng]
2. [FluentBit GitHub](https://github.com/fluent/fluent-bit) [eng]
