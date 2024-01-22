# Bayesian Statistics
## In this file, all of the Bayesian Statistics R work I did in my graduate study is included.

There are total 6 homework and 1 final project. 

About the 6 homework, most of it is for solving complicated math problems.

About the final project, I would like to introduce it more detailed.
### Description of the final project(This is a teamwork, so I'm going to make my own section the key part of the description) 
#### Research Background
In the Bayesian domain, Markov chain Monte Carlo (MCMC) methods are used in probability space to estimate the posterior distribution of the parameter of interest by random sampling. Markov chain sampling is used to obtain the set of samples we need, which in turn is used for Monte Carlo simulation (approximate numerical computation by random sampling from a probabilistic model). This method is widely used for learning and inference of probabilistic models in statistical learning. But this method is not always feasible.
When the model is more complex, solving the problem with this method has low accuracy and high time cost. So a new method ---- Integrated Nested Laplace Approximation is introduced.
#### Introduction to LGM(*)
Before learning INLA, we need to know latent Gaussian model(LGM) first. It is a new kind of hierarchical model. Knowing LGM is the foundation of learning INLA. Why? In the real world, most data set can be fitted as a LGM. And INLA is the most efficient way ton solve such models. 
#### Use Markov chain Monte Carlo approaches to approximate posterior distributions(*)
I chose one simple dataset to do this work.
#### Introduction to INLA
#### Use INLA to deal with the same dataset
#### Choose a more complicated dataset to do the INLA
