[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/adolfont/ke_system)

# KE System

My initial goal here is to provide an implementation of a tool for teaching the KE System for classical propositional logic.

The student can build its own proofs and verify if they are correct.

The student can choose a problem (a sequent) and try to solve it.

The student can create its own problem. 

If you want to know more about the KE System, which is a kind of tableau system created by Marco Mondadori, read [
The Taming of the Cut. Classical Refutations with Analytic Cut](https://www.researchgate.net/profile/Marcello_DAgostino/publication/31089377_The_Taming_of_the_Cut_Classical_Refutations_with_Analytic_Cut/links/004635276879db86c1000000/The-Taming-of-the-Cut-Classical-Refutations-with-Analytic-Cut.pdf) by  MARCELLO D' AGOSTINO and MARCO MONDADORI.

My Phd. Dissertation https://teses.usp.br/teses/disponiveis/45/45134/tde-04052007-175943/en.php (see page 63 for an example)

KE System rules https://youtu.be/VtGCNsSRblg


## Representation of formulas

A formula is represented as follows:

- Atomic formulas: :p, :q, :r
- Unary formulas: {:not, :p}, {:not, {:not, :q}}
- Binary formulas: {:p, :and, :q}, {:p, :or, :q}, {:p, :implies, :q}, {:p, :implies, {:not , :q}}, {{:p, :and, :r}, :or, :q}




