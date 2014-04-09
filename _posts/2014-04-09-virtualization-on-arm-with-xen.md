---
layout: post
title: "Virtualization on ARM with Xen"
description: ""
category: 
tags: []
---
{% include JB/setup %}



With ARM entering the server space, a key technology in play in this segment is Virtualization. Virtualization is not a tool solely for servers and the data center, it is also used in the embedded space in segments like automotive and it is also starting to be used in mobile.

This is not a new technology, IBM pioneered it in the 1960s, and there are many different hypervisors implementing different methods of virtualization. In the Open Source realm there are two major hypervisors: KVM and Xen. Both are interact directly with the Linux kernel, however KVM is solely in the Linux domain whereas Xen works with Linux, *BSD and other UNIX variants.

In the past it was generally accepted that there are two types of hypervisor, Type1 (also known as bare metal or native) where the hypervisor runs directly on the host server and controls all aspects of the hardware and manages the guest operating systems, and Type2 (also known as hosted) where the hypervisor runs within a normal operating system; under this classification Xen falls into the Type1 camp and KVM fell into the Type2 camp. However the modern implementations of the hypervisors has now blurred the lines of distinction.

This time round I’ll be taking a look at the Xen Hypervisor, which is now one of the Linux Foundation’s collaborative projects. Here is a brief overview of some of Xen’s features:

Small footprint. Based on a microkernel design, it has a limited interface to the guest virtual machine and takes up around 1MB of memory.
Operating system agnostic. Xen works well with BSD variants and other UNIX systems, although most deployments use Linux.
Driver Isolation. This allows the main device drivers of a system to run inside the VM, which enables the VM containing drivers to be rebooted in the event of a crash or compromise without affecting the host or other guests. In the Xen model the majority of the device drivers run in virtual machines rather than in the hypervisor, as well as allowing reusing of existing OS driver stacks this allows the VM containing the driver to be rebooted without affecting the host of other guests. Individual drivers can even be run in separate VMs in order to improve isolation and fault tolerance or just to take advantage of differing OS functionality.
Paravirtualization (PV). This style of port enables Xen to run on hardware that doesn’t have virtualization extensions, such as Cortex-A5/A8/A9 in ARM’s case.  There can also be some performance gains for some PV guests, but this requires the guests to be modified and prevents “out of the box” implementations of operating systems.
No emulation, no QEMU. Emulated interfaces are slow and insecure. By using hardware virtualization extensions and IO paravirtualization, Xen removes any need for emulation. As a result you have a smaller code base and better performances