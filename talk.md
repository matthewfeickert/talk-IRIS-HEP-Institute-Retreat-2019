class: middle, center, title-slide
count: false

# pyhf Roadmap:
# 2019 into 2020

(for the dev team)<br>
Matthew Feickert<br>
[matthew.feickert@cern.ch](mailto:matthew.feickert@cern.ch)

[2019 IRIS-HEP Institute Retreat](https://indico.cern.ch/event/XXXXX/contributions/YYYYYY/)

September 12th, 2019

---
# Collaborators

<br><br>

.grid[
.kol-1-3.center[
.circle.width-80[![Lukas](figures/collaborators/heinrich.jpg)]

[Lukas Heinrich](https://github.com/lukasheinrich)

CERN
]
.kol-1-3.center[
.circle.width-80[![Giordon](figures/collaborators/stark.jpg)]

[Giordon Stark](https://github.com/kratsg)

UCSC SCIPP
]
.kol-1-3.center[
.circle.width-70[![Kyle](figures/collaborators/cranmer.png)]

[Kyle Cranmer](http://theoryandpractice.org/)

NYU
]
]

---
# HistFactory

<br>

- A flexible p.d.f. template to build statistical models from binned distributions and data
<!-- - Developed by Cranmer, et al. [1] -->
- Developed by Cranmer, Lewis, Moneta, Shibata, and Verkerke [1]
- Widely used by the HEP community for standard model measurements and BSM searches
   <!-- - Show public summary plots and link to references that use HistFactory (multi b-jets for example) -->

.kol-1-1.center[
.width-100[![HistFactory_uses](figures/HistFactory_result_examples.png)]
]

---
# HistFactory Template

<br>

$$\begin{aligned}
&\mathcal{P}\left(n\_{c}, x\_{e}, a\_{p} \middle|\phi\_{p}, \alpha\_{p}, \gamma\_{b} \right) = \\\\
&{\color{blue}{\prod\_{c \\,\in\\, \textrm{channels}} \left[\textrm{Pois}\left(n\_{c} \middle| \nu\_{c}\right) \prod\_{e=1}^{n\_{c}} f\_{c}\left(x\_{e} \middle| \vec{\alpha}\right)\right]}} {\color{red}{G\left(L\_{0} \middle| \lambda, \Delta\_{L}\right) \prod\_{p\\, \in\\, \mathbb{S}+\Gamma} f\_{p}\left(a\_{p} \middle| \alpha\_{p}\right)}}
\end{aligned}$$

.bold[Use:] Multiple disjoint _channels_ (or regions) of binned distributions with multiple _samples_ contributing to each with additional (possibly shared) systematics between sample estimates

.bold[Main pieces:]

- .blue[Poisson p.d.f. for bins observed in all channels]
- .red[Constraint p.d.f. (+ data) for "auxiliary measurements"]
   - encoding systematic uncertainties (normalization, shape, etc)

---
# HistFactory Template

$$\begin{aligned}
&\mathcal{P}\left(n\_{c}, x\_{e}, a\_{p} \middle|\phi\_{p}, \alpha\_{p}, \gamma\_{b} \right) = \\\\
&\prod\_{c \\,\in\\, \textrm{channels}} \left[\textrm{Pois}\left(n\_{c} \middle| \nu\_{c}\right) \prod\_{e=1}^{n\_{c}} f\_{c}\left(x\_{e} \middle| \vec{\alpha}\right)\right] G\left(L\_{0} \middle| \lambda, \Delta\_{L}\right) \prod\_{p\\, \in\\, \mathbb{S}+\Gamma} f\_{p}\left(a\_{p} \middle| \alpha\_{p}\right)
\end{aligned}$$

.bold[This is a _mathematical_ representation!] Nowhere is any software spec defined

Until now, the only implementation of HistFactory has been in RooStats+RooFit

- To start using HistFactory p.d.f.s first have to learn ROOT, RooFit, RooStats
   - Problem for our theory colleagues (generally don't want to)
- Possible issues with scaling I/O and memory for large models
   - Not multithreaded
- Difficult to interface with modern tools for minimization and computation of the p.d.f.
- Likelihood stored in the binary ROOT format
   - Challenge for long-term preservation (i.e. HEPData)
   - Why is a histogram needed for an array of numbers?

---
# `pyhf`: HistFactory in pure Python

- First non-ROOT implementation of the HistFactory p.d.f. template
   - [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1169739.svg)](https://doi.org/10.5281/zenodo.1169739)
   - pure-Python library
      - [`pip install pyhf`](https://diana-hep.org/pyhf/installation.html#install-from-pypi)
   - machine learning frameworks as computational backends
      - [`pip install pyhf[tensorflow]`](https://diana-hep.org/pyhf/installation.html#with-tensorflow-backend)
- Alternative choice to ROOT-based HistFactory to use in the analysis pipeline of HistFitter + HistFactory + RooStats
   - Project scope: HistFactory
   - Not a replacement for HistFitter or RooStats
- Open source tool for all of HEP
   - Originated from a [DIANA/HEP](https://diana-hep.org/) project fellowship
      - Special thanks to [Gilles Louppe](https://glouppe.github.io/), [Vince Croft](https://www.nikhef.nl/~vcroft/), and [Kyle Cranmer](http://theoryandpractice.org/)
   - Not experiment specific (though designed by ATLAS physicists)
   - Have contributions from [CMS members](https://github.com/diana-hep/pyhf/commit/4159c2dbc9ed7a9b3866e9b127d885d696314754) and [strong interest by theorists](https://indico.cern.ch/event/689514/contributions/2961925/)
   - Used for reinterpretation in phenomenology paper [2]

---
# Roadmap

Loosely follow [Seibert’s Heirarchy of Needs](https://twitter.com/FRoscheck/status/1159158552298229763)

.center.width-80[![Seibert Heirarchy of Needs SciPy 2019](https://pbs.twimg.com/media/EBYojw8XUAERJhZ?format=png)]
.center[Stan Seibert (Anaconda) at SciPy 2019]

---
# Roadmap

.center.width-105[![pyhf docs gantt](figures/pyhf_docs_gantt.svg)]

---
# Roadmap

.center.width-105[![pyhf maintenance gantt](figures/pyhf_maintenance_gantt.svg)]

---
# Roadmap

.center.width-105[![pyhf dev gantt](figures/pyhf_dev_gantt.svg)]

---
# Roadmap

.center.width-105[![pyhf research gantt](figures/pyhf_research_gantt.svg)]

---
# Roadmap

.center.width-90[![Roadmap](figures/pyhf_AS_gantt.svg)]

---
# Analysis Systems Milestones

.center.width-105[![AS Milestones](figures/AS_gantt.svg)]

- Initial roadmap for ecosystem coherency (2019-Q4 -> 2020-Q3)
- Initial roadmap for high-level cyberinfrastructure (2019-Q4 -> 2020-Q3)
- Benchmarking and assessment of existing AS (2020-Q1 -> 2020-Q3)
- Accelerator implementations of statistical components  (2020-Q1 -> 2020-Q3)

---
# Upcoming Release v0.1.3

## Toy Sampling

.kol-1-2.center.width-95[
[![lukas_tweet](figures/lukas_tweet.png)](https://twitter.com/lukasheinrich_/status/1171075909102833665)
]
.kol-1-2.width-100[
.center[![comparison GIF](figures/comparison_tweet.gif)]

In just a few lines of code are able to reproduce Figure 5b of [arXiv:1007.1727](https://inspirehep.net/record/860907)! 👍
]

---
# ...in just a few lines

.center.width-90[
[![lukas_tweet](https://pbs.twimg.com/media/EEB_VjrWsAAE6IJ?format=png)](https://twitter.com/lukasheinrich_/status/1171075918556782592?s=20)
]

---
# Summary

- Summary of talk

---
class: end-slide, center

Backup

---
# Backup Slide

<br>

- Backup content
- more of it

---
# References

1. L. Heinrich, .italic[[Continuous Analysis in ATLAS: Running User-Defined Container Images on the Grid](https://indico.cern.ch/event/708041/contributions/3276174/)], ACAT 2019, March 12, 2019
2. L. Heinrich, .italic[[Docker On the Grid](https://indico.cern.ch/event/791372/contributions/3286861/)], ATLAS Machine Learning Forum, January 23, 2019
3. A. C. Forti, L. Heinrich, M. Guth, .italic[[Hardware Accelerated ATLAS Workloads on the WLCG](https://cds.cern.ch/record/2665661?ln=en)], ACAT 2019, March 11, 2019
4. M. Feickert, .italic[[Base Images for Machine Learning](https://indico.cern.ch/event/791372/contributions/3286864/)], ATLAS Machine Learning Forum, January 23, 2019

---

class: end-slide, center
count: false

The end.
