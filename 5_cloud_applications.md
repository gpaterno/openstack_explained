# Applications in the cloud 

So you have read about OpenStack and you are really eager to implement it. But let us step back and understand why you are willing to embrace the cloud. You might think of several reasons, but -- judging by my experience -- everything comes down to two root causes:

* You are looking to take advantage of the fast provisioning of the infrastructure, either for savings, speed, or both
* Your applications may have varying demand patterns, resulting in the need of increased computing power during some periods. You may want to take advantage of the scaling capabilities of Cloud to fire up new instances of key modules at peak periods, shutting them down when not needed, freeing up infrastructure resources for other tasks and reducing the TCO


Most of the customers just want a fast provisioning mechanism of the infrastructure. Do not get me wrong, this is perfectly fine and OpenStack gets the job done.

But you will get the full benefit of the cloud when you’ll have an application that might be in need of resources on-demand. Think about a sports news portal when the World Cup is on, the invoicing and billing at the end of the month or a surge in the need to process a data from devices.

Wouldn’t it not be nice, given the detected increasing loads, to have the **application scale automatically to cope with the requests**? Believe it or not, it is not magic and it is totally feasible. Netflix did it and I can name a lot of other SaaS systems that are doing it. There is only one constraint: you have to be in control of the source code of your applications. If you bought your application “as is”, contact your vendor, but there are yet few chances that you can follow this pattern.

Being cloud aware for an application also means that it need to be implemented with self resiliency in mind.
In case you have the source code, you can adapt your application to take full advantage of your new environment. In this scenario, you will have to intervene more into your code as you will need to ensure that **the application can take full advantage of the environment**, reconfiguring load balancers, dynamically allocating resources and etc. There are some “tricks” that an application has to adopt to be “cloudish”, but is outside of the scope of this publication.

It’s quite common that a customer might decide to have a phased approach to the cloud, starting to take advantage of the fast provisioning and then transforming the application to adapt it to the cloud. The cloud is a long journey and it can be successful, are you ready for it?