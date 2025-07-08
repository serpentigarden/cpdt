(* https://www.labri.fr/perso/casteran/CoqArt/contents.html *)

(* Propositions and Proofs *)
Lemma id_P : P -> P.

Lemma id_PP : (P->P)->(P->P).

Lemma imp_trans : (P->Q)->(Q->R)->P->R.

Lemma imp_perm : (P->Q->R)->(Q->P->R).

Lemma ignore_Q : (P->R)->P->Q->R.

Lemma delta_imp  : (P->P->Q)->P->Q.

Lemma delta_impR : (P->Q)->(P->P->Q).

Lemma diamond : (P->Q)->(P->R)->(Q->R->S)->P->S.

Lemma weak_peirce : ((((P->Q)->P)->P)->Q)->Q.


(* Dependent Products *)
(* Everyday logic *)
(* Inductive Data Structures *)
(* Tactics and automation *)
(* Inductive Predicates *)
(* Functions and their specification *)
(* Extraction and imperative programming *)
(* A Case Study : binary search trees *)
(* The Module System *)
(* Infinite Objects and Proofs *)
(* Foundations of Inductive Types *)
(* General Recursion *)
(* Proof by reflection *)