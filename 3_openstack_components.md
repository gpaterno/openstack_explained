# OpenStack components

OpenStack is a collection of open source technologies delivering a massively scalable cloud operating system.

OpenStack cloud operating system controls large pools of compute, storage and networking resources throughout a datacenter, all managed through a dashboard that gives administrators control while empowering their users to provision resources through a web interface.

We can think of it as software to power our own Infrastructure as a Service (IaaS) offering, like the one behind Amazon Web Services.

OpenStack is an umbrella project that can be divided into many sub-components:


Project                    	Code Name
Dashboard	Horizon
Compute	Nova
Identity	Keystone
Network	Neutron
Image Service	Glance
Block Storage	Cinder
Object Storage	Swift
Telemetry	Ceilometer
Orchestration	Heat
Database	Trove
DNS service	Designate
Bare Metal	Ironic
Queue Service	Zaqar
 


## OpenStack logical architecture
There are currently seven core components of OpenStack, how they conceptually interact with each other is shown below:

[[images/openstack_logical_architecture1.jpg]]

All these components and how they relate each other are shown in the simplest way in the below OpenStack logical architecture : 

[[images/openstack_logical_architecture2.jpg]]


## Horizon – Dashboard

Horizon provides a modular web-based user interface for all the OpenStack services. With this web GUI, you can perform most operations on your cloud like launching an instance, assigning IP addresses and setting access controls.

 

## Keystone – Identity

Keystone is a framework for authentication and authorization for all the OpenStack services. Keystone handles API requests and provides configurable catalog, policy, token and identity services.

Keystone also implements the ability to add users to groups (also known as tenants or projects) and to manage permissions between users and groups. Permissions include the ability to launch and terminate instances.

Keystone can be integrated with LDAP and other external authentication providers.
 


## Nova – Compute

Probably the most known among the projects, it provides virtual servers upon demand. Nova is the most complicated and distributed component of OpenStack. A large number of processes cooperate to turn end user API requests into running virtual machines.

These are the Nova components and their functions:

* nova-api : a RESTful API web service which accepts incoming commands to interact with the OpenStack cloud
* nova-compute: a worker daemon which creates and terminates virtual machine instances via Hypervisor’s APIs
* nova-scheduler: takes a request from the queue and determines which compute server host it should run on
* nova-conductor: provides services for nova-compute, such as completing database updates and handling long-running tasks
* nova database: stores most of the build-times and run-time states for a cloud infrastructure
* The queue provides a central hub for passing messages between daemons. This is usually implemented with RabbitMQ
* Nova also provides console services to allow end users to access their virtual instances console through a proxy. This involves several daemons (nova-console, nova-novncproxy and nova-consoleauth)
* nova-network (now Neutron): a worker daemon very similar to nova-compute. It accepts networking tasks from the queue and then performs tasks to manipulate the network (such as setting up bridging interfaces or changing iptables rules). This functionality is being migrated to Neutron, a separate OpenStack service
* nova-volume (now Cinder): Manages creation, attaching and detaching of persistent volumes to compute instances. This functionality is being migrated to Cinder, a separate OpenStack service.
  

Nova also interacts with many other OpenStack services: Keystone for authentication, Glance for images and Horizon for the web interface. The Glance interactions are central to OpenStack. The API process can upload and query Glance while nova-compute will download images for launching images.

Historically, most OpenStack development is done with the most community supported KVM: this allows you to refer to Internet forums to find help on your issues. All the features that are currently supported in KVM are also supported in QEMU.

Microsoft Hyper-V and VMware ESXi too are gaining much support, with Hyper-V now being available with a free license. ESXi can also be used with a free license however API support is limited to READ ONLY without vCenter or an Enterprise license.

Nova has support for XenServer and XCP through the XenAPI virt layer. Note that this does not imply support for other Xen-based platforms such as those shipped with RHEL 6 or SUSE, which is provided via the libvirt layer (i.e. Xen via libvirt).

Nova also supports bare metal provisioning through the Ironic project, that means it is possible to deploy to hardware in the same way the end user deploys virtual machines. By default, it will use PXE and IPMI in concert to provision and turn on/off machines, but Ironic also supports vendor-specific plugins which may implement additional functionality. Some vendors, most notably HP Helion, use Ironic to deploy OpenStack itself.

## Glance – Image Store

It provides discovery, registration and delivery services for disk and server images.
List of components and their functions:

* glance-api: accepts Image API calls for image discovery, image retrieval and image storage
* glance-registry: stores, processes and retrieves metadata about images (size, type, etc.)
* glance database: a database to store the image metadata
* A storage repository for the actual image files. Glance supports normal filesystems, Ceph block devices, Amazon S3, HTTP and Swift.

Glance accepts API requests for images (or image metadata) from end users or Nova components,  and can store its disk files in the object storage service, Swift or other storage repository.


## Neutron – Network

Neutron provides “network connectivity as a service” between interface devices (e.g., vNICs) managed by other OpenStack services (e.g., Nova). The service works by allowing users to create their own networks and then attach interfaces to them. Neutron has a pluggable architecture to support many popular networking vendors and technologies.

* neutron-server accept API requests and routes them to the correct neutron plugin
* plugins and agents perform actual actions, like plug/unplug ports, creating networks, subnets and IP addressing
* it also has a message queue to route info between neutron-server and various agents
* it has a neutron database to store networking state for particular plugins

 

Neutron will interact mainly with Nova, where it will provide networks and connectivity for its instances.


 


## Cinder – Block Storage

Cinder allows block devices to be exposed and connected to compute instances for expanded storage & better performance.

* cinder-api accepts requests and routes them to cinder-volumes for action
* cinder-volume reports reading or writing to the cinder database to maintain state, interacts with other processes (like cinder-scheduler, see below) through a message queue and directly on block storage providing hardware or software
* cinder-scheduler picks the optimal block storage node to create the volume on
* the messages queue routes information between Cinder processes
* a cinder database stores volumes state

 

Like Neutron, Cinder will mainly interact with Nova, providing volumes for its instances.


 


## Swift – Object Storage

Object store allows you to store or retrieve files. It provides a fully distributed, API-accessible storage platform that can be directly integrated into applications or used for backup, archiving and data retention.

Note: Object Storage is not a traditional file system, but rather a distributed storage system for static data such as virtual machine images, or photos, e-mails, backups and archives.

●	Proxy server (swift-proxy-server) accepts incoming requests, like files to upload, modifications to metadata or container creation; it also serves files and provides container listing
●	Accounts server manage accounts defined within the object storage service.
●	Container servers manage mapping of containers, folders, within the object store service.
●	Object servers manage actual objects, files, on the storage nodes.

 

Also replication services run to provide consistency and availability across the cluster, audit and update.


Ceilometer  - Telemetry
The required steps to bill for usage in a cloud environment are metering, rating and billing. Because the provider's requirements may be far too specific for a shared solution, rating and billing solutions cannot be designed as a common module that satisfies all possible scenarios. Providing users with measurements on cloud services is required to meet the "measured service" definition of cloud computing.

The Telemetry module was originally designed to support billing systems for OpenStack cloud resources. This project only covers the metering portion of the required processing for billing. The module collects information about the system and stores it in the form of samples in order to provide data about anything that can be billed.

 


The list of metrics is continuously growing, which makes it possible to use the data collected by Telemetry for many more purposes other than billing. For example Heat can autoscale resources when Ceilometers triggers an alarm, for example adding more front-end web servers when CPU utilization is more than 70% for 5 minutes.





 

## Other projects

Although the former ones are the most relevant, there are three other projects worth mentioning:

●	Trove is a database-as-a-service provisioning relational and non-relational database engines. It allows an agnostic access to databases, currently supports MySQL and PostgreSQL, but vendors like Oracle and Microsoft might provide a Trove plugin for their databases in future.
●	Ironic (Bare Metal Provisioning), is an incubated OpenStack project that aims to provision bare metal machines instead of virtual machines. Ironic is currently in use by HP Helion.
●	Zaqar (Multiple Tenant Cloud Messaging), is a multi-tenant cloud messaging service for Web developers. Zaqar was formerly known as Marconi.
●	Designate provides a DNS as a Service for OpenStack.
