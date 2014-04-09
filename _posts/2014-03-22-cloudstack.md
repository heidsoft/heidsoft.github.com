---
layout: post
title: "CloudStack"
description: ""
category: 
tags: []
---
{% include JB/setup %}


	Operation and maintenance problems
	
	1、在cloudstack中如何手动设置虚拟机的IP，而不用系统路由分配.
	How to manually set the virtual machine's IP in cloudstack , not by Vrouter
	[PB] Using UI, cannot set IP address in cloudstack. 
	        IP address can be set using API, deployVirtualMachine with “ipaddress” parameter.
	Status: Pending verification        
	Action Item: SJCloud has to test and verify this functionality.	
	
	
	2、在cloudstack 中如何实现对虚拟机的克隆？
	How to clone a virtual machine in the cloudstack?
	[PB] There is no direct way of cloning available in cloudstack. Users have to take a snapshot of VM and take template out of that snapshot and create a VM from that template.
	Status: Closed
	
	3、如在cloudstack 中实现第三方硬件设备的集成，比如负载均衡或交换机等
	How to integrate the third-party hardware devices in cloudstack, such as load balancing or switches.
	[PB]      Add external device
		Create Network service offering
		Create a network and deploy VMs using this network
	¬¬¬¬¬- 
	Status: Closed
	
	4.cloudstack对制作模板时，windows PV操作系统的模板无法识别为何种版本的操作系统类型，如：windows 2003等
	In cloudstack, making a template for windows PV operating system cannot be identified as to what version of the operating system types, such as: windows 2003.etc.
	[PB] “Windows PV” OS type is just to indicate the VM is of type PV as hypervisor treats same with all PV enabled VMs. 
	          SJCloud raised a concern on how to identify OS of all windows PV VMs. This can addressed by referring to template names which contain OS information in them.
	Status: Closed 
	
	5.cloudstack 如果要实现虚拟机的hostname，支持中文命名，大概方式是？
	Cloudstack, how to have hostname of the virtual machine to support the Chinese name?
	[PB] cloud-stack doesn’t support this. Raise a feature request to community.
	         SJcloud will log a feature request.
	Status: Closed
	
	6.cloudstack 4.2  在使用kvm做hpervisor时，对虚拟机快照功能不支持，那么cloudstack 后续版本会支持？
	cloudstack 4.2, when using kvm do hypervisor, virtual machine snapshot feature is not supported, does cloudstack subsequent versions will support?
	 
	Status: pending verification.
	Action Item: SJcloud to upgrade cloudstack to latest version and verify snapshot feature.
	
	7.cloudstack对虚拟机名字修改不支持，目前仅支持初次安装虚拟机更改hostname.
	cloudstack does not support the modification for the virtual machine, but only to change the hostname after the initial installation of the virtual machine 
	[PB] Hostname is allowed to set only one time through cloudstack at the time of VM deployment. Suggested a workaround to stop the VM, change name field of VM from backend database, vm_instance table and start VM to reflect the change hostname. Tested and verified this change.
	Status: Closed 
	
	8.cloudstack+kvm的高可用，开源版无法支持,如果要自己实现，大概思路是？能解释下cloudstack 实现高可用的原理？
	For cloudstack + kvm highly available, open source version (4.2.0) failed. But CloudPlatform successed.
	[PB] Suggested SJCLoud to try the feature test on latest apache cloudstack.
	Status: pending verification.
	Action Item: SJcloud to upgrade cloudstack to latest version and try HA of VMs feature.
	
	9.Cloudstack的高级网络中虚拟路由器如何在生产环境大流量中使用.
	Cloudstack, how to use advance network mode in a production environment with a large network traffic environment?
	[PB] In advanced network, router VM will become the default gateway for all guest VMs and all the external traffic has to be routed through routed VM. Network traffic is totally isolated as every account and every guest network has a router VM. Offerings for router VMs can also be increased. Option is also available to add external firewall device juniper SRX and also integrated with SDN. 
	Status: Closed
	
	10.Cloudstack stored using
	   clvm方案在较大的磁盘卷（20-50G）中，会造成磁盘堵塞，从而触发clvm集群重启物理机，造成物理主机无法处于正常工作状态。
	clvm in the larger disk volume (20-50G), the disk will cause congestion, thereby triggering a cluster restart clvm physical machine, causing physical machine be in abnormal working situation.
	[PB] cloudstack will fence off and restart host if primary storage is not accessible to the host. Hence, always ensure high uptime of storage connectivity.
	Issue may not be related to cloudstack. 
	*The use of CLVM in KVM is not officially supported in cloudstack. Hence, recommended to use iSCSI as shared mount point primary storage.
	Status: Waiting for confirmation form SJCloud
	
	   Ceph在cloudstack的使用中是否稳定可行，具体配置该如何做？.
	What about Ceph working with Cloudstack? Is it stable?
	[PB] Ceph support is introduced in KVM and open source version of xen recently. I could say still it is at experimental stage when stability is considered. We do not have any information of production customer using it. But, without knowledge of Citrix, some customers may still use and run a stable cloudstack.
	Status: Closed
	
	11.Cloudstack管理端的高可用使用经验，官方提供的mysql主从方案是否靠谱?
	Is CloudStack management DB mysql HA from reliable?
	[PB] Its pretty much reliable. Cloudstack will use native active-active replication provided by mysql.
	Status: Closed
	
	二、Development issues
	1、cloudstack mvn 在使用第三方包时，应该如何配置，比如vmware
	In cloudstack mvn when using a third-party package, how to configure such as vmware
	[PB] This is development related question. Please provide me complete details of your question. I may need to consult with our engineering team.
	Status: Open 
	Action Item: SJCloud to provide complete details so Citrix consultant can check with development engineer on this query
	
	2、cloudstack 中，如果要自己实现相关命令，需要做哪些配置动作，需要继承哪些类，实现哪些接口呢？
	In cloudstack, if you want to issue commands yourself, what needs to be done to configure, which classes need to inherit, which interfaces to achieve it?
	[PB] resolved. SJ knows solution to this already.
	Status: Closed.
	
	3、cloudstack 中，如果要自己生成系统虚拟机文件，应该如何配置？
	In cloudstack, if you want to create a virtual machine file system yourself, how to configure?
	[PB] Not advised to create system VMs on own. SSVM and CPVMs will be created automatically depending on load.
	Status: Closed
	
	5、cloudstack 中，域一般怎么使用，只是用于多用户？
	In cloudstack in general how to use the domain for multi-tenancy?
	[PB] resolved and explained. Need to further Verify it.
	Status: Closed
	
	6、cloudstack 中，目前监控功能的集成好实现？比如像OpenStack 中就集成Niagos
	cloudstack, is there any monitoring service could be integrated to CloudStack? For example, OpenStack integrate Niagos
	[PB] Zenoss monitoring tool is integrated with cloudstack
	Status: Closed
	
	7、cloudstack 中，高级网络和基础网络的区别在哪里？高级网络的拓扑架构是怎样的。
	In cloudstack, what is the main differences between the advanced network and basic networks mode? 
	[PB]  
	Status: Closed
	
	
	8、cloudstack 中，生产网络虚拟机的流量如何控制？
	In cloudstack, how to control the network traffic of the production network virtual machine?
	[PB] using firewall rules, egress rules in advanced networks
	        Using security groups in basic and shared networks 
	Status: Closed
	
	9、cloudstack 中的多租户是如何做到的呢？
	In cloudstack how to do implement the multi-tenancy?
	[PB] Each account VMs are isolated through VLANs in advanced networking zone.
	Status: Closed
	
	10、cloudstack 中，模板架构有什么讲究？比如数据库操作目前采用DButils,为什么不用Hibernate呢？
	In cloudstack, what about the template architecture? For example, DB operations use DButils, why not Hibernate it?
	[PB] Suggested SJCloud to post this query  to apache clodustack developer forum
	Status: Closed
	11、cloudstack 4.3 大概什么时候发布？未来cloudstack 的发展方向如何？
	when is cloudstack 4.3 going to release? What is future direction of cloudstack/cloudplatform?
	[PB] Not in Citrix control.. its community driven.
	        You can always check the update of 4.3 release here https://cwiki.apache.org/confluence/display/CLOUDSTACK/Cloudstack+4.3+Release. 
	Status: Closed
	
	12、cloudstack 目前生态圈发展的如何？有哪些可集成的产品？
	How is cloudstack ecosystem? Which can be integrated product?
	[PB] Several integrations are happening with cloudstack. Suggested SJCLoud to follow cloudstack community for these details.
	Status: Closed
	
	13、OpenStack 和 CloudStack 两大平台，你觉得将来谁将更胜一筹？
	How do you evaluate OpenStack and CloudStack
	[PB] Provided a link that explains basic differences between openstack and clodustack http://www.getfilecloud.com/blog/category/iaas/ .
	Status: closed
	
	日常操作：
	1.在CS平台的实例中，要查找一台虚机，非常不方便。
	一般用户只会提供一个IP地址，现在无法通过IP地址过滤来找这台虚机，只能一个一个的点开查看,而且虚机的命名也不规范,已分好的虚机无法再更改名称
	we have to specify IP to find out a virtual machine, and the virtual machine naming rule is not regulate, do you have better solution?
	[PB] Not available in cs. Can list VMs by networkID using listVirtualMachines API
	Status: Closed
	
	2.cs中无法针对两个volume整体做模板，是否有其他方式可以实现。
	cloudstack can't make template based on 2 volumes, any other way to do it?
	[PB] Template will be made form only one volume. Can you provide me the use case to create a template from two volumes in detail?
	Status: Closed
	
	3.cloudstack vm日志记录不好追踪
	vm被无故或者异常关闭后，日志中只有vm启动信息，没有异常信息，debug有困难
	It is not easy to debug in cloudstack log. For example, when VM is shutdown abnormally, the log only have VM startinging info.
	[PB] An async job is submitted whenever user initiates any action in cloudstack and job should log its status even if it fails to execute. It must log exception/timeout entries in the log file.
	Status: Closed
	4.cloudstack某台vm中选择查看卷-添加卷时，无法自动关联当前主机，目前还得手动选择附加的vm
	Added volume configuration in CS
	[PB] This is a manual operation
	Status: Closed
	
	网络方面：
	1.CS高级网络中虚拟路由器如何在生产环境大流量中使用
	It was asked.
	[PB] explained
	Status: Closed
	
	2.iptables做安全策略，怎么避免性能问题?
	If we enable any security policy in IPtables, will it generate any performance issue?
	[PB] IPtables is a general linux feature and so cloudstack should not add any additional latency.
	Status: Closed
	
	存储方面：
	1.对于不同的hypervisor类型，cs支持的存储类型不同，但iscsi，FC SAN，nfs，这些通用协议支持不全。因为什么考虑？
	Cloudstack doesn't support all storage protocal like iscsi, FC SAN, NFS for all type of HyperVisor, what is the reason?
	[PB] Before cloudstack supporting any storage protocol, hypervisor must first support it. Also, it depends how hypervisor has handled respective storage protocols.
	 
	(*The use of CLVM in KVM is not officially supported in cloudstack)
	Status: Closed
	
	2.目前CS部署，性能最好及支持性最好的存储方案是什么？
	What is the best storage solution in term of performance for CloudStack + KVM?
	[PB] iSCSI for shared storage(Though NFS is highly competitive). 
	     FC SAN storage for local storage.
	Status: Pending verification     
	Action Item: Consultant to find our recommended storage for KVM in CCP deployments.
	
	3.clvm方案在较大的磁盘卷（20-50G）中，会造成磁盘堵塞，从而触发clvm集群重启物理机，造成物理主机无法处于正常工作状态。
	It was asked.
	Status: Closed
	
	4.Ceph在cloudstack的使用中是否稳定可行
	Is Ceph stable as cloudstack first storage?
	[PB] Ceph support is introduced in KVM and open source version of KVM. I could say still it is at experimental stage when stability is considered. We do not have any information of production customer using it. But, without knowledge of Citrix, some customers may still use and run a stable cloudstack.
	However, for cloudstack to work properly, the underlying storage should be stable and should never undergo disconnected or be unavailable.  
	
	Status: Closed
	
	
	5.Ceph在cloudstack作为一级存储，性能上跟本地硬盘、共享san存储有没比较数据 ？ ceph在延时性、随机读写并发上有什么优化办法？ 几个节点、几个副本数比较合理？
	When we use Ceph as the first storage of CloudStack, the performance is far behind local drive or SAN. 
	Is there any way to improve the random I/O, time delay? how many copy is reasonable?
	[PB]Can you confirm if you used RBD storage for Ceph? Also, it depends the way you implemented ceph. Suggested SJCloud to check with ceph storage team for performance tuning of ceph storage.
	Status: Closed
	
	性能方面：
	1.CS针对kvm虚拟机最佳性能实践不是最好，默认windows虚拟机配置文件为ide，而非virtio，怎么修改？
	Is there any way to improve KVM performance?
	[PB] Where you getting performance hits? Cloudstack performance depends on storage, network, hypervisor and  its agent performance. Let us review and analyze case by case how to overcome these performance hits. 
	The default Windows VM config file is IDE, not VirtIO, how to change it? 
	Status: Open
	Action Item: SJCloud to reproduce performance hitting scenarios. Consultant to work of issues related to cloudstack if any. 
	
	高可用性方面：
	1.CS management 高可用和负载均衡，怎么实现？
	Is there a HA solution for CS Management server and load balance?
	[PB] Having multiple management servers will provide HA to CS management server. Load balancer is out of scope of cloudstack. But, you can have two load balancers with a floating IP referred by all CS users which redirects to one of cloudstack management server.
	 
	Status: Closed
	
	2.CS Agent  高可用和负载均衡是否成熟？
	what about HA for CS Agent?
	[PB] Agent runs on every KVM node and so cannot have nay HA for it as it is not predictable to find if any issue lies with agent problem. However, you can use external tools for monitoring the agent services and then restart in-case of any service problem. 
	Status: Closed
	
	大规模部署经验：
	1.CS大规模部署经验（IDC级别），如何实现，如果解决网络，存储，负载均衡高可用问题？
	If deploy CS in large scale DC, any experience on networking, storage, load balance configuration？ 
	[PB] Again, it depends on use cases how big the deployment is. Because, you may need to increase the system offerings to increase processing capacity of system VMs.
	Status: Closed
	
	发展前景：
	1.你认为的CS发展前景和下一步会实现的功能
	What is the new functions of CloudStack next version and what is its development direction?
	[PB] Its all community driven. Here are list of new features coming in 4.3 https://issues.apache.org/jira/browse/CLOUDSTACK-999?filter=12325248. 
	       Get entire information related to cloudstack 4.3 release here https://cwiki.apache.org/confluence/display/CLOUDSTACK/Cloudstack+4.3+Release. 
	Status: Closed