# The choice in OpenStack

Earlier in this publication I mentioned that the promise of OpenStack is the interoperability among different components from different vendors or open source projects. As a matter of fact, **each of the components** described in the previous page **can be easily replaced** with projects or products from each vendor.

At the time of writing, the only project that has no valuable alternative among vendors is Keystone. Keystone acts as a service registry and user repository, therefore plays an important role in OpenStack. While it was conceived to have internal users like Amazon does, the development is shifting towards an HTTP interface to existing identity systems, such as LDAP or SAML.

Also Horizon, the web dashboard, has few chances to be replaced, as its colors and logos can easily be customized to be adapted for everyone. Some other dashboards exist for OpenStack, but usually the company who needs a different web interface goes for a customized development on top of the OpenStack APIs.

Projects in which it makes sense to adopt **a plugin approach** are **Nova, Neutron, Swift and Cinder**. Let us review in a table what are the most relevant open source and proprietary technology for each component (please keep in mind that this list can vary).

## Nova

Open Source | Proprietary
--- | ---
KVM | VMWare ESX/ESXi
XenServer | Microsoft Hyper-V
LXC	| 
Docker	|



 

## Cinder

Open Source	| Proprietary
--- | ---
LVM	| NetApp
Ceph | IBM (Storwize family/SVC, XIV)
Gluster | Nexenta
NFS (any compatible) | SolidFire
 | HP LeftHand/3PAR/MSA
 | Dell EqualLogic/Storage Center
 | EMC VNX/XtremIO


## Neutron 

Open Source| Proprietary
Linux Bridge | VMWare NSX
Open vSwitch | Brocade
Midonet | Big Switch
OpenContrail (Juniper OpenSource) | Alcatel Nuage
 | Cisco Nexus


## Swift 

Open Source	| Proprietary
Swift project | EMC Isilon OneFS
Ceph | NetApp E-Series
Gluster | Nexenta
Hadoop with SwiftFS/Sahara	| 
