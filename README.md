Shifting elasmobranch community assemblage at Cocos Island—an isolated marine protected area
=====

This repository contains R scripts for analyses described in [White et al (2015)](http://onlinelibrary.wiley.com/doi/10.1111/cobi.12478/abstract). The data are not available online as they are owned by the Undersea Hunter Dive Company. Please contact Easton White (eawhite@ucdavis.edu) for more information. 

The R scripts were used to assess trends in abundance of twelve different elasmobranch (shark and ray) species at Cocos Island, Costa Rica. The scripts use the glmmadmb package to assess trends using a generalized mixed modeling framework. Each species required a tailored modeling approach to account for the type of data collected (count versus presence-absence data) and the distributions of count data. GLMMs with a negative binomial error distribution were used for species where count data was recorded (hammerheads, whitetips, eagle rays, marble rays, mobula rays, and manta rays). We also accounting for zero-inflated count data when dealing with eagle, mobula, and manta rays. For the six remaining species only presence or absence was noted. A GLMM with a binomial error was used to model these species. Model selection was conducted comparing models by AIC through the mumin package. All models were run on Westgrid computing services.

