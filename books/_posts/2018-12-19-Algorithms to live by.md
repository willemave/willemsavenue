---
title: "Algorithms to live by"
tags: in_progress
layout: post
date: 2019-01-15 17:10:00
---

Optimal stopping problem. Aka the secretary problem. 
Time to a search if unbounded. If number of candidates is fixed. If no incomplete information, observation only, then 37% is optimal. If full information, score and only that score matters. Never hire unless it's the best you've seen so far, 58%.

Selling a house, know objective dollar value, and rough range. Not single best, most money, waiting has a cost. Set one going in, take first option to exceed it. 

Explore vs Exploit.
Always exploring can be frustrating. Multi-armed bandit problem and casino's.  Time is the key value, exploring goes down over time, exploit goes up. Need to discount payoffs based on time. You care more about the meal tonight than the one a month from now, geometrically discounting. Giddens Index. If you don't have time, think about regret. Total amount of regret will always increase, minimize regret. Regret Minimization Algorithms. Upper Confidence Bound. Choose the one with the highest confidence bound, it's always greater than the expected value. Optimism fights against regret. High value of the 0/0 (try/win) option. Win-stay, loose-shift explores too much.

Sorting.
Sometimes sorting isn't worth the time, only if your searching. Fault tolerant sorting, were comparisons have error bars, you want more comparisons like bubble or counting sort. In animal pecking order, sorting helps against larger amounts of antagonizing. Cardinal ordering like races allow for O(n) to sort.
