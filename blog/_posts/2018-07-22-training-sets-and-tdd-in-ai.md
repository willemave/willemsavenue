---
layout: post
title:  "Training Sets are TDD in the world of AI"
date:   2018-08-05 17:10:00
---

In the imperative and functional programming patterns of today, TDD can be thought of as stating the requirements for your interface, object, etc. There are programming practices such as red/green/refactor coding, where you write a failing test first then implement the code to make it pass.

Andrej Karpathy wrote a fantastic article about what he calls the [Software 2.0 stack](https://medium.com/@karpathy/software-2-0-a64152b37c35). While there are lots of hurdles to overcome, the viability of his future cannot be ignored. 

This got me thinking. In Software 2.0, isn't selecting your training set similar to TDD? It seems like it's inherently tested based on known inputs. Identifying the right training set is like defining the known space of requirements for your product. Algorithm selection, tweaking variables and hyper parameters has  similarities to defining your domain objects or APIs. This has a strange resemblance to red/green coding. One of the interesting points here is that generating the models (neural networks, etc.) happens when you "run the test". This really highlights the importance for traceability and debug-ability within our tools. While it was relatively simple to put a breakpoint in Software 1.0, this is simply not possible with Software 2.0.

Interestingly, since we rarely have 100% test coverage for functionality in Software 1.0, similar analogs can be drawn to Software 2.0. This is where biases and other training set issues start to arise. 






