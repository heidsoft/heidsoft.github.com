---
layout: post
title: "C++ 函数"
description: ""
category: 
tags: [构造函数,成员函数]
---
{% include JB/setup %}

#变量初始化规则

##内置类型

	#include <iostream>

	using namespace std;


	std::string global_str;
	int global_int;

	int main(int argc, char const *argv[])
	{
		int i ; //named, uninitialized ,int var

		int *pi = new int; // pi 指针 动态分配

		cout<< "i="<< i << endl;

		cout<<"*pi=" << *pi << endl;

		cout<<"*pi2=" << pi << endl;

		cout<<"*global_str=" << global_str << endl;
		cout<<"*global_str.size=" << global_str.size() << endl;

		cout<<"*global_int=" << global_int << endl;

		return 0;
	}

##类类型

#类定义

    class Demo{
		public:
			Demo():age(20),name("jake")
		private:

			int age;
			string name;
    };

#构造函数

    构造函数的初始化列表由成员名和带括号的值组成

#成员函数
