# Dual-Mode or Hybrid IT



It’s no doubt that changes in the ifrastructure and -in general- in the IT won’t be made overnight. Most of my clients ask me to drive a long-term change strategy. Dual-Mode IT, hybrid-cloud or even multi-cloud are the different "facets" in which IT is evolving, but the key mesasge is that is important to run both traditional and new “cloudish” IT in the initial phase of the adoption.

Typically what I do with my team is to start changing the test and development infrastructure, because it’s non-critical and helps bringing more confidence while adopting new and agile technologies.

How the two worlds can interact really depends from customer to customer.
The usual two ways is either run "parallel worlds" by using an external Cloud Management Portal (or CMP) or by using OpenStack itself as an orchestrator.

## Cloud management portal as orchestrator

**TBD**

## OpenStack as orchestrator

**TBD**

Notes: two regions scenario

## A real-life example

Let me give you a more complicated example of a client of mine in the oil&gas industry. To get things a little more complcated, Microsoft given the option to use Azure services as part of their global agreement and therefore was key to be integrated.

![](images/hybrid_dualmode_it.jpg)

We introduced a cloud management portal and automation tools to orchestrate an internal production area on VMWare where the traditional workloads sit (typically Oracle and SAP ), an internal OpenStack area with development &testing and limited internal web applications, and an Azure area with public sites in need of bandwidth.

With these kind of scenarios, the use of internal or external doesn’t change the way IT operates. Moreover, if planned on the proper way a multi-datacenter OpenStack can allow the customer to have an automated disaster recovery system, if not even active-active business continuity with very low costs.

It’s no doubt that service providers and outsourcers were the first who understood that the adoption of open standards and agile "DevOps" methodologies bring many benefits, but also enterprises from small to large will be able to benefit as well.
