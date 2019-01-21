---
title: Designing Data Intensive Applications
tags: complete
layout: post
date: 2018-04-28 17:10:00
---

Most applications built from general purpose data stores, essentially end up building APIs that behave like bespoke data stores on top of them (cache, message queue, etc)

> service’s interface or application programming interface (API) usually hides those implementation details from clients. Now you have essentially created a new, special-purpose data system from smaller, general-purpose components. Your composite data system may provide certain guarantees: e.g.,

> Reliability The system should continue to work correctly

> (performing the correct function at the desired level of performance) even in the face of adversity (hardware or software faults, and even human error). See “Reliability”. Scalability As the system grows (in data volume, traffic volume, or complexity), there should be reasonable ways of dealing with that growth. See “Scalability”. Maintainability Over time, many different people will work on the system (engineering and operations, both maintaining current behavior and adapting the system to new use cases), and they should all be able to work on it productively. See “Maintainability”.

> It is impossible to reduce the probability of a fault to zero; therefore it is usually best to design fault-tolerance mechanisms that prevent faults from causing failures.

> killing individual processes without warning. Many critical bugs are actually due to poor error handling [3]; by deliberately inducing faults, you ensure that the fault-tolerance machinery is continually exercised and tested, which can increase your confidence that faults will be handled correctly when they occur naturally.

> begun using larger numbers of machines, which proportionally increases the rate of hardware faults. Moreover,

> those circumstances, it is revealed that the software is making some kind of assumption about its environment — and while that assumption is usually true, it eventually stops being true for some reason

> provide fully featured non-production sandbox

> quick and easy recovery from human errors, to minimize the impact in the case of a failure.

> telemetry. (Once a rocket has left the ground, telemetry

> Scalability is the term we use to describe a system’s ability to cope with increased load. Note,

> not a one-dimensional label that we can attach to a system: it is meaningless to say “X is scalable” or “Y doesn’t scale.” Rather,

> keep the system resources (CPU, memory, network bandwidth, etc.) unchanged, how

> increase the resources if you want to keep performance unchanged?

> processing system such as Hadoop, we usually care about throughput

> online systems, what’s usually more important is the service’s response time

> for internal services in terms of the 99.9th percentile, even though it only affects 1 in 1,000 requests. This is because the customers with the slowest requests are often those who have the most data on their accounts because they have made many purchases — that is, they’re the most valuable customers

> slow requests to hold up the processing of subsequent requests — an effect sometimes known as head-of-line blocking.

> An architecture that scales well for a particular application is built around assumptions of which operations will be common and which will be rare — the load parameters. If those assumptions turn out to be wrong, the engineering effort for scaling is at best wasted, and at worst counterproductive.

> majority of the cost of software is not in its initial development, but in its ongoing maintenance —

> Operability Make it easy for operations teams to keep the system running smoothly. Simplicity Make it easy for new engineers to understand the system, by removing as much complexity as possible from the system. (Note this is not the same as simplicity of the user interface.) Evolvability Make it easy for engineers to make changes to the system in the future, adapting it for unanticipated use cases as requirements change. Also known as extensibility, modifiability, or plasticity.

> There are various possible symptoms of complexity: explosion of the state space, tight coupling of modules, tangled dependencies, inconsistent naming and terminology, hacks aimed at solving performance problems, special-casing to work around issues elsewhere,

> define complexity as accidental if it is not inherent in the problem that the software solves (as seen by the users) but arises only from the implementation.

> organizational processes, Agile working patterns provide a framework for adapting to change.

> application). In this book, we search for ways of increasing agility on the level of a larger data system, perhaps consisting of several different applications or services with different characteristics.

> APIs, but the basic idea is still the same: each layer hides the complexity of the layers below it by providing a clean data model. These abstractions allow different groups of people — for example, the engineers at the database vendor and the application developers using their database — to work together effectively.

> data model has such a profound effect on what the software above it can and can’t do, it’s important to choose one that is appropriate to the application.

> remarkably, relational databases turned out to generalize very well, beyond their original scope of business data processing, to a broad variety of use cases.

> disconnect between the models is sometimes called an impedance mismatch.i

> JSON representation has better locality than the multi-table schema

> store an ID or a text string is a question of duplication.

> Removing such duplication is the key idea behind normalization in databases.ii

> IMS used a fairly simple data model called the hierarchical model, which has some remarkable similarities to the JSON model used by document databases

> network model, a record could have multiple parents.

> difficult to make changes to an application’s data model.

> relational model thus made it much easier to add new features to applications.

> arguments in favor of the document data model are schema flexibility, better performance due to locality, and that for some applications it is closer to the data structures used by the application. The relational model counters by providing better support for joins, and many-to-one and many-to-many relationships.

> highly interconnected data, the document model is awkward, the relational model is acceptable, and graph models (see “Graph-Like Data Models”) are the most natural.

> A more accurate term is schema-on-read (the structure of the data is implicit, and only interpreted when the data is read), in contrast with schema-on-write (the traditional approach of relational databases, where the schema is explicit and the database ensures all written data conforms to it) [21].

> grouping related data together for locality is not limited to the document model. For example, Google’s Spanner database offers the same locality properties in a relational data model, by allowing the schema to declare that a table’s rows should be interleaved (nested) within a parent table

> Imperative code is very hard to parallelize across multiple cores and multiple machines, because it specifies instructions that must be performed in a particular order. Declarative languages have a better chance of getting faster in parallel execution because they specify only the pattern of the results, not the algorithm that is used to determine the results. The

> property graph model (implemented by Neo4j, Titan, and InfiniteGraph) and the triple-store model (implemented by Datomic, AllegroGraph, and others).

> same query can be written in 4 lines in one query language but requires 29 lines in another, that just shows that different data models are designed to satisfy different use cases. It’s important to pick a data model that is suitable for your application.

> Appending and segment merging are sequential write operations, which are generally much faster than random writes, especially on magnetic spinning-disk hard drives.

> Instead of overwriting pages and maintaining a WAL for crash recovery, some databases (like LMDB) use a copy-on-write scheme

> multi-dimensional indexes are not just for geographic locations. For example, on an ecommerce website you could use a three-dimensional index on the dimensions (red, green, blue) to search for products in a certain range

> 2D index could narrow down by timestamp and temperature simultaneously. This technique is used by HyperDex

> Even a disk-based storage engine may never need to read from disk if you have enough memory, because the operating system caches recently used disk blocks in memory anyway. Rather, they can be faster because they can avoid the overheads of encoding in-memory data structures in a form that can be written to disk

> Further changes to storage engine design will probably be needed if non-volatile memory (NVM) technologies become more widely adopted [46]. At present, this is a new area of research, but it is worth keeping an eye on in the future.

> Extract–Transform–Load (ETL)

> Besides reducing the volume of data that needs to be loaded from disk, column-oriented storage layouts are also good for making efficient use of CPU cycles.

> Another advantage of sorted order is that it can help with compression of columns.

> change to an application’s features also requires a change to data that it stores:

> schema-on-read (“schemaless”) databases don’t enforce a schema, so the database can contain a mixture of older and newer data formats written at different times

> means that old and new versions of the code, and old and new data formats, may potentially all coexist in the system at the same time.

> Programs usually work with data in (at least) two different representations:

> memory, data is kept in objects, structs, lists,

> write data to a file or send it over the network, you have to encode it as some kind of self-contained sequence of bytes (for example,

> restore data in the same object types, the decoding process needs to be able to instantiate arbitrary classes. This is frequently a source of security problems [5]: if an attacker can get your application to decode an arbitrary

> JSON returned by Twitter’s API includes tweet IDs twice, once as a JSON number and once as a decimal string, to work around the fact that the numbers are not correctly parsed by JavaScript applications

> Consequently, Avro doesn’t have optional and required markers in the same way as Protocol Buffers and Thrift do (it has union types and default values instead).

> ASN.1, a schema definition language that was first standardized in 1984 [27]. It was used to define various network protocols, and its binary encoding (DER) is still used to encode SSL certificates (X.509), for example [28]. ASN.1 supports schema evolution using tag numbers, similar to Protocol Buffers and Thrift

> in that case you can think of storing something in the database as sending a message to your future self.

> The same is not true of database contents: the five-year-old data will still be there, in the original encoding, unless you have explicitly rewritten it since then. This observation is sometimes summed up as data outlives code.

> key design goal of a service-oriented/microservices architecture is to make the application easier to change and maintain by making services independently deployable and evolvable.

> factors mean that there’s no point trying to make a remote service look too much like a local object in your programming language,

> REST seems to be the predominant style for public APIs. The main focus of RPC frameworks is on requests between services owned by the same organization, typically within the same datacenter.

> we will briefly look at asynchronous message-passing systems, which are somewhere between RPC and databases.

> difference compared to RPC is that message-passing communication is usually one-way: a sender normally doesn’t expect to receive a reply to its messages.

> Location transparency works better in the actor model than in RPC, because the actor model already assumes that messages may be lost, even within a single process. Although latency over the network is likely higher than within the same process, there is less of a fundamental mismatch between local and remote communication when using the actor model.

> While a distributed shared-nothing architecture has many advantages, it usually also incurs additional complexity for applications and sometimes limits the expressiveness of the data models you can use.

> We will discuss three popular algorithms for replicating changes between nodes: single-leader, multi-leader, and leaderless replication.

> important detail of a replicated system is whether the replication happens synchronously or asynchronously.

> possible to work around those issues — for example, the leader can replace any nondeterministic function calls with a fixed return value when the statement is logged so that the followers all get the same value.

> log is an append-only sequence of bytes containing all writes to the database. We can use the exact same log to build a replica on another node: besides

> implement read-after-write consistency in a system with leader-based replication? There are various possible techniques. To mention a few:

> profile, not by anybody else. Thus, a simple rule is: always read the user’s own profile from the leader, and any other users’ profiles from a follower.

> you could track the time of the last update and, for one minute after the last update, make all reads from the leader.

> anomaly that can occur when reading from asynchronous followers is that it’s possible for a user to see things moving backward in time.

> anomaly requires another type of guarantee: consistent prefix reads [23]. This guarantee says that if a sequence of writes happens in a certain order, then anyone reading those writes will see them appear in the same order.

> claiming that transactions are too expensive in terms of performance and availability, and asserting that eventual consistency is inevitable in a scalable system. There is some truth in that statement, but it is overly simplistic, and we will develop a more nuanced view over the course of the rest of this book.

> For example, autoincrementing keys, triggers, and integrity constraints can be problematic. For this reason, multi-leader replication is often considered dangerous territory that should be avoided if possible

> We don’t usually think of collaborative editing as a database replication problem, but it has a lot in common with the previously mentioned offline editing use case.

> simplest strategy for dealing with conflicts is to avoid them: if the application can ensure that all writes for a particular record go through the same leader, then conflicts cannot occur.

> every replication scheme must ensure that the data is eventually the same in all replicas. Thus, the database must resolve the conflict in a convergent way, which means that all replicas must arrive at the same final value when all changes have been replicated.

> similar to the one we saw in “Consistent Prefix Reads”: the update depends on the prior insert,

> Dynamo-style databases are generally optimized for use cases that can tolerate eventual consistency. The parameters w and r allow you to adjust the probability of stale values being read, but it’s wise to not take them as absolute guarantees.

> For defining concurrency, exact time doesn’t matter: we simply call two operations concurrent if they are both unaware of each other, regardless of the physical time at which they occurred.

> appropriate version number to indicate that the item has been removed when merging siblings. Such a deletion marker is known as a tombstone. (We previously saw tombstones in the context of log compaction in “Hash Indexes”.)

> collection of version numbers from all the replicas is called a version vector [56]. A few variants of this idea are in use, but the most interesting is probably the dotted version vector [57], which is used in Riak 2.0

> brief, when comparing the state of replicas, version vectors are the right data structure to use.

> Despite being a simple goal — keeping a copy of the same data on several machines — replication turns out to be a remarkably tricky problem. It requires carefully thinking about concurrency and about all the things that can go wrong, and dealing with the consequences of those faults. At a minimum, we need to deal with unavailable nodes and network interruptions (and that’s not even considering the more insidious kinds of fault, such as silent data corruption due to software bugs).

> Perhaps in the future, data systems will be able to automatically detect and compensate for skewed workloads; but for now, you need to think through the trade-offs for your own application.

> document-partitioned index is also known as a local index (as opposed to a global index, described in the next section).

> sometimes known as scatter/gather, and it can make read queries on secondary indexes quite expensive. Even if you query the partitions in parallel, scatter/gather is prone to tail latency amplification (see “Percentiles in Practice”). Nevertheless,

> world, the index would always be up to date, and every document written to the database would immediately be reflected in the index. However, in a term-partitioned index, that would require a distributed transaction across all partitions affected by a write, which is not supported in all databases

> wondered why we don’t just use mod (the % operator in many programming languages). For example, hash(key) mod 10 would return a number between 0 and 9 (if we write the hash as a decimal number, the hash mod 10 would be the last digit).

> fairly simple solution: create many more partitions than there are nodes, and assign several partitions to each node.

> Dynamic partitioning is not only suitable for key range–partitioned data, but can equally well be used with hash-partitioned data.

> But there remains an open question: when a client wants to make a request, how does it know which node to connect to?

> This is an instance of a more general problem called service discovery, which isn’t limited to just databases. Any piece of software that is accessible over a network has this problem, especially if it is aiming for high availability (running in a redundant configuration on multiple machines).

> goal of partitioning is to spread the data and query load evenly across multiple machines, avoiding hot spots (nodes with disproportionately high load). This requires choosing a partitioning scheme that is appropriate to your data, and rebalancing the partitions when nodes are added to or removed from the cluster.

> Hybrid approaches are also possible, for example with a compound key: using one part of the key to identify the partition and another part for the sort order.

> operations that need to write to several partitions can be difficult to reason about: for example, what happens if the write to one partition succeeds, but another fails? We will address that question in the following chapters.

> Transactions are not a law of nature; they were created with a purpose, namely to simplify the programming model for applications accessing a database.

> (we call these safety guarantees).

> truth is not that simple: like every other technical design choice, transactions have advantages and limitations. In order to understand those trade-offs, let’s go into the details of the guarantees that transactions can provide — both in normal operation and in various extreme (but realistic) circumstances.

> this idea of consistency depends on the application’s notion of invariants, and it’s the application’s responsibility to define its transactions correctly so that they preserve consistency.

> classic database textbooks formalize isolation as serializability, which means that each transaction can pretend that it is the only transaction running on the entire database. The database ensures that when the transactions have committed, the result is the same as if they had run serially (one after another), even though in reality they may have run concurrently

> Durability is the promise that once a transaction has committed successfully, any data it has written will not be forgotten, even if there is a hardware fault or the database crashes.

> do we need multi-object transactions at all? Would it be possible to implement any application with only a key-value data model and single-object operations?

> multi-object transactions are needed when updating a single document.

> Transactions are very useful in this situation to prevent denormalized data from going out of sync.

> key feature of a transaction is that it can be aborted and safely retried if an error occurred.

> datastores with leaderless replication (see “Leaderless Replication”) work much more on a “best effort” basis, which could be summarized as “the database will do as much as it can, and if it runs into an error, it won’t undo something it has already done” — so it’s the application’s responsibility to recover from errors.

> Errors will inevitably happen, but many software developers prefer to think only about the happy path rather than the intricacies of error handling.

> Although retrying an aborted transaction is a simple and effective error handling mechanism, it isn’t perfect:

> databases have long tried to hide concurrency issues from application developers by providing transaction isolation. In theory, isolation should make your life easier by letting you pretend that no concurrency is happening: serializable isolation means that the database guarantees that transactions have the same effect as if they ran serially (i.e., one at a time, without any concurrency).

> Transactions running at the read committed isolation level must prevent dirty writes, usually by delaying the second write until the first write’s transaction has committed or aborted.

> value ($600) than she saw in her previous query. Read skew is considered acceptable under read committed isolation: the account balances that Alice saw were indeed committed at the time when she read them.

> From a performance point of view, a key principle of snapshot isolation is readers never block writers, and writers never block readers.

> several versions of an object side by side, this technique is known as multi-version concurrency control (MVCC).

> CouchDB, Datomic, and LMDB. Although they also use B-trees (see “B-Trees”), they use an append-only/copy-on-write variant that does not overwrite pages of the tree when they are updated, but instead creates a new copy of each modified page.

> The lost update problem can occur if an application reads some value from the database, modifies it, and writes back the modified value (a read-modify-write cycle). If two transactions do this concurrently, one of the modifications can be lost, because the second write does not include the first modification.

> Atomic operations can work well in a replicated context, especially if they are commutative (i.e., you can apply them in a different order on different replicas, and still get the same result). For example, incrementing a counter or adding an element to a set are commutative operations.

> This anomaly is called write skew [28]. It is neither a dirty write nor a lost update, because the two transactions are updating two different objects (Alice’s and Bob’s on-call records, respectively). It is less obvious that a conflict occurred here, but it’s definitely a race condition: if the two transactions had run one after another, the second doctor would have been prevented from going off call.

> think of write skew as a generalization of the lost update problem. Write skew can occur if two transactions read the same objects, and then update some of those objects (different transactions may update different objects). In the special case where different transactions update the same object, you get a dirty write or lost update anomaly (depending on the timing).

> chapter has painted a bleak picture of concurrency control in databases. On the one hand, we have implementations of serializability that don’t perform well (two-phase locking) or don’t scale well (serial execution). On the other hand, we have weak isolation levels that have good performance, but are prone to various race conditions (lost updates, write skew, phantoms, etc.). Are serializable isolation and good performance fundamentally at odds with each other?

> Transactions are an abstraction layer that allows an application to pretend that certain concurrency problems and certain kinds of hardware and software faults don’t exist. A large class of errors is reduced down to a simple transaction abort, and the application just needs to try again.

> In distributed systems, suspicion, pessimism, and paranoia pay off.

> Although the system can be more reliable than its underlying parts, there is always a limit to how much more reliable it can be.

> For failure detection, it’s not sufficient for the system to be fast most of the time: if your timeout is low, it only takes a transient spike in round-trip times to throw the system off-balance.

> When you make a call over the telephone network, it establishes a circuit: a fixed, guaranteed amount of bandwidth is allocated for the call, along the entire route between the two callers.

> datacenter networks and the internet were circuit-switched networks, it would be possible to establish a guaranteed maximum round-trip time when a circuit was set up. However, they are not: Ethernet and IP are packet-switched protocols, which suffer from queueing and thus unbounded delays in the network. These protocols do not have the concept of a circuit.

> More generally, you can think of variable delays as a consequence of dynamic resource partitioning.

> Consequently, there’s no “correct” value for timeouts — they need to be determined experimentally.

> distributed system, time is a tricky business, because communication is not instantaneous: it takes time for a message to travel across the network from one machine to another.

> Thus, it doesn’t make sense to think of a clock reading as a point in time — it is more like a range of times, within a confidence interval: for example, a system may be 95% confident that the time now is between 10.3 and 10.5 seconds past the minute, but it doesn’t know any more precisely than that [58]. If we only know the time +/– 100 ms, the microsecond digits in the timestamp are essentially meaningless.

> hasn’t been declared dead by the others), and that it may safely accept writes? One option is for the leader to obtain a lease from the other nodes, which is similar to a lock with a timeout [63].

> node in a distributed system must assume that its execution can be paused for a significant length of time at any point, even in the middle of a function.

> An emerging idea is to treat GC pauses like brief planned outages of a node, and to let other nodes handle requests from clients

> node in the network cannot know anything for sure — it can only make guesses based on the messages it receives (or doesn’t receive) via the network.

> Distributed systems problems become much harder if there is a risk that nodes may “lie” (send arbitrary faulty or corrupted responses) — for example, if a node may claim to have received a particular message when in fact it didn’t. Such behavior is known as a Byzantine fault, and the problem of reaching consensus in this untrusting environment is known as the Byzantine Generals Problem

> defining a system model, which is an abstraction that describes what things an algorithm may assume.

> define what it means for an algorithm to be correct, we can describe its properties.

> Safety is often informally defined as nothing bad happens, and liveness as something good eventually happens.

> Is it better to be alive and wrong or right and dead?

> We will now continue along the same lines, and seek abstractions that can allow an application to ignore some of the problems with distributed systems. For example, one of the most important abstractions for distributed systems is consensus: that is, getting all of the nodes to agree on something.

> transaction isolation is primarily about avoiding race conditions due to concurrently executing transactions, whereas distributed consistency is mostly about coordinating the state of replicas in the face of delays and faults.

> replica. In other words, linearizability is a recency guarantee.

> linearizable system we imagine that there must be some point in time (between the start and end of the write operation) at which the value of x atomically flips from 0 to 1. Thus, if one client’s read returns the new value 1, all subsequent reads must also return the new value, even if the write operation has not yet completed.

> However, a hard uniqueness constraint, such as the one you typically find in relational databases, requires linearizability. Other kinds of constraints, such as foreign key or attribute constraints, can be implemented without requiring linearizability

> not meet CAP’s idiosyncratic definition of availability. All in all, there is a lot of misunderstanding and confusion around CAP, and it does not help us understand systems better, so CAP is best avoided.

> Attiya and Welch [47] prove that if you want linearizability, the response time of read and write requests is at least proportional to the uncertainty of delays in the network. In a network with highly variable delays,

> mathematical sets are not totally ordered: is {a, b} greater than {b, c}? Well, you can’t really compare them, because neither is a subset of the other. We say they are incomparable, and therefore mathematical sets are partially ordered: in some cases one set is greater than another (if one set contains all the elements of another), but in other cases they are incomparable.

> Lamport timestamps is illustrated in Figure 9-8. Each node has a unique identifier, and each node keeps a counter of the number of operations it has processed. The Lamport timestamp is then simply a pair of (counter, node ID).

> Total order broadcast is exactly what you need for database replication: if every message represents a write to the database, and every replica processes the same writes in the same order, then the replicas will remain consistent with each other (aside from any temporary replication lag). This principle is known as state machine replication

> In general, if you think hard enough about linearizable sequence number generators, you inevitably end up with a consensus algorithm.

> This is no coincidence: it can be proved that a linearizable compare-and-set (or increment-and-get) register and total order broadcast are both equivalent to consensus [28, 67]. That is, if you can solve one of these problems, you can transform it into a solution for the others. This is quite a profound and surprising insight!