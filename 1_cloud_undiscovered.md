# Cloud: the undiscovered country

I’ve been sitting in front of many European IT Managers and CTOs and when they want to hear from me about OpenStack or Cloud, most of the times they mean something different: customers want a VMware replacement for virtualization. The most audacious ones are willing to have a nice web interface to access their virtual machines and that’s it.

Cloud sounds like yet another marketing buzzword, it can mean just about anything or nothing at all. We are not discussing here what is the reason of walking away from VMWare, but the idea of the equation “Cloud=Virtualization” is pretty spread across all the customers. This is actually what some vendors tried to let you think of cloud.

While Cloud implies a virtualized environment, virtualization is not a cloud. Let me define Cloud using the NIST definition: _"Cloud computing is a model for enabling ubiquitous, convenient, on-demand network access to a shared pool of configurable computing resources (ex: networks, servers, storage, applications and services) that can be rapidly provisioned and released with minimal management effort"_.

The NIST definition goes on to define the essential characteristics of clouds (i.e., on-demand, network access, multitenancy, elasticity, and metering). It continues by defining three service models: **software as a service** (SaaS), **platform as a service **(PaaS), and **infrastructure as a service** (IaaS). It also identifies four main deployment models: private cloud, public cloud, hybrid cloud, and community cloud.

**SaaS** refers to online application hosting: users will access the application interface over the Internet,  all the work that happens in the background to make the application available and scalable is hidden from the end user. Gmail (and most Google services, including Calendar and Docs), SalesForce and SecurePass are typical SaaS examples. 

**PaaS** represents what we used to call middleware, and makes the link between the end-user application and the underlying infrastructure that it is running on. A PaaS solution is aimed at developers who do not want to worry about the infrastructure. PaaS is still a growing area and interesting players such as Openshift, CloudFoundry (and derivatives) and Cloudify.

**IaaS** is the infrastructure layer that orchestrates the work typically done by system administrators to host the applications, including server provisioning, network management, and storage allocation.

There are several open source solutions which can be used to build our own IaaS Cloud.
The three major projects in my personal order of importance are: **OpenStack**, **CloudStack** and **OpenNebula**. Successful private and public clouds are currently operational all over the world using these solutions.

**Cloud is a huge shift in your organization and will change forever your way of working in the IT projects, improving your IT dramatically and cutting down costs.** If you follow me, I will reveal to you the “secret ingredient” of a successful cloud project and you will be able to achieve incredible results.

If you feel you’re not ready for it or if all you want is to find an alternative virtualization solution, I can give you some names such as RedHat oVirt, Citrix XenServer or Google’s Ganeti.

But if you are willing to embrace the change, understand what actually are the impacts of OpenStack in your organization or just curious about what OpenStack is, read on. We will go into details of OpenStack, the most successful Open Source project after Linux itself, we will understand the strength and how it accomplished on-demand network access, multitenancy, elasticity, and metering.
