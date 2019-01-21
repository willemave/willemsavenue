---
title: The Book of Why
tags: complete self
layout: post
date: 2018-06-2 17:10:00
---

No mathematical equations for Cause and Effect. Statistics pushed this aside, correlation is not causation. Path Analysis starts to help here. So does Casual Diagrams.

Data is dumb. Doesn't tell us why. Causal modes can help machines tell us what they are doing and why.

Query, data, assumptions = inherence engine. 

Counterfactual are key to why. Data can not show cause and effect unless done by controller experiments.

## Ladder of causation
Things we can imagine are the bedrock of causation (from Sapiens). Modularity, swapping variables and recalculating outcomes. Observe => doing => imagining. Last step is creating theories on cause / effect of tools for example.

The ladder: 
Association. "What if I see", regressions.
Intervention. "Changing what is". A/B testing is one way. 
Counterfactual. 

Causal models are much more resilient then probability distributions. Cause happens when intervention or imagination happen.

La-QAplases theorem, central limit theory, sum of random decisions will end up to a normal distribution. Price is Right balls.



Regression to mean is not a causal relationship. Ie sophomore slump. 

Correlation coefficient detrrmines how two variables interact and of they revert to a mean, can plot these and look at slope.

## causal inference

Khaneman: success = talent + luck. More success is a but more talent and lots of luck.

Correlation killed causation.

Causation is not to prove X means Y, or to define X by studying Y.

Statistics is methods of reduction of data.


Bayesian thinking started to incorporate causal thinking. Prior Belief + New Evidence = Revised Belief

## Bayesian from evidence to cause

Bayesian networks are from cause to effect, or induction from evidence to hypothesis (and then cause).

Belief network propagation is implementation of baysian network.

Core idea is how much evidence do you need to go from probable to improbable, ie "dead people stay dead".

Bayes rule helps the scientific method in organic outcomes. Inverse probabilities are crazy, re mammograms and the psychological harm they can cause. Bayes is subjective, or if you have history of cancer percentage goes up.

## Bayes networks 1
Child to parent is updating with likelyhood ration. Parent to childen update with conditional probabilities.

Inverse probabilities are the simplest Bayesian networks. Two boxes one connection.

Conditional independence. explain away syndrome.

Chains, forks and Colliders. Explain away and collider bias.

Sparse networks are necessary as baysian calculation grows at 2^n

Bayesian networks are just probability tables. 

Arrows in causal diagrams are outcomes of hypotheticals, if you can modify something and another changes then there is an arrow. 

Bayesian networks allow you to test relations based on correlations in data,A-B, A-C, can test of any cortisone between A and C.

## confounding variables
What should you control for? Mixing variables.

Statistics has trouble with interventions or intention to do something, however this is key to causal relationships.

Randomization solves for confounding variables. Confounding variables are discrepancies between p(X|Y) and p(X do Y).

Back door principle - removing any causal lines that affect X. Sometimes controlling for a variable a can make it a confounder.


QAMoney and capatilism can super charge confounders

## Paradoxes
When causal expectations s collide with probabilistic outcomes.

The rules of the game, or how we gain information is just as important as the days itself, re the Monty Hall problem.

Causeless correlation is hard to imagine, Bayesian conditioning. 

Any hypothesis that survives a threat is more like, greater the threat, more likely it is.

It's hard to visualize Colliders, non intuitive. If you flip a coin 100 times, and only record when a coin is heads, you will have 75 rows, if you look at those rows, the other will almost always be tails - heads is the collider. Collider structures, the at we observe data. All good looking people are assholes, you've controlled on looks.


## intervention
If you want to influence use the backdoor formula -- Anki

Front door formula, allows you to control for confounders the same way as RCT - Anki

List out 3 rules. Great verifier but not solver.

Path deletion

Instrumental variables, alternative to front door formula. Must be independent from confounders. Path from Z to Y, and strong association between Z and X.  Should be randomized like genes.

## counterfactuals

We can see what could happen, all animals can see what is.

Counterfactuals give us language to break correlation. Rooster and sunrise, if no rooster, not no sunrise. or B would not have occurred if not for A. Most similar worlds, ie if you take aspirin headache goes away, except for other worlds where you bumped your head, but bumping my head is not similar.

Structured causal models. 

Logic void of representation is metaphysics.


Daniel Kahneman found that people are more likely to undo a rare event than a common one, ie blaming a train that a train left on schedule versus leaving early. Also are more likely to undo events they caused.


## Mediation
Total vs direct vs indirect effects (which are counterfactuals)

Direct can be affected by confounders, indirect a mediator, weighed by unit relation. 

Linear modeling can not spot mediations in day.

The data may be intense, but the questions are simple.

Data morning can help identify the questions we need to ask, then need a casual model. 

Data interpretation requires hypothesis.

Transportability between different studies allows us to not look at differences in relations as a threat but as a way to grow the study. Do calculus allows this.

## AI

Rule based > Bayesian > deep learning, CNNs.

CNNs are empirical, opaque system.

Transparency and causal reasoning is necessary for clear communication, needs to understand counterfactuals.

Should machines have the illusion of free will? Rationalization may be a post-hoc system.

From HN:

Not the same kind of experiment. An experiment in the scientific sense tweaks the process that generates the data, not the interpretation of the data. There is an inspiration / hypothesis creation step between old data and new experiment.
Main differences: A hypothesis is sorta kinda like your model's coefficients, but more generally applicable. And you have no feedback loop between model coefficients and input data.
So yeah, you are doing very sophisticated curve fitting. It is useful alright, it's just not very much like science.


What Chomsky is saying is that the control variables don't exist until you create them because the most telling things don't happen until you have a specific hypothesis and make them happen to test the hypothesis.