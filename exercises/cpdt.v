(* http://adam.chlipala.net/cpdt/ex/exercises.pdf *)

Require Import List.

Set Implicit Arguments.
Set Asymmetric Patterns.

(* Problem 1 *)
Section inductivetypes.
    Inductive truth: Set :=
        | Yes
        | No
        | Maybe.

    Print truth_ind.

    Definition not (t: truth): truth :=
        match t with
        | Yes => No
        | No => Yes
        | Maybe => Maybe 
        end.
    
    Definition and (t1 t2: truth): truth :=
        match t1, t2 with
        | Yes, Yes => Yes
        | Yes, Maybe => Maybe
        | No, _ => No
        | _, No => No
        | Maybe, _ => Maybe
        end.

    Theorem and_commut: 
        forall t1 t2: truth, and t1 t2 = and t2 t1.
        induction t1; induction t2; reflexivity.
    Qed.
    
    Definition or (t1 t2: truth): truth :=
        match t1, t2 with
        | Yes, _ => Yes
        | _, Yes => Yes
        | Maybe, _ => Maybe
        | _, Maybe => Maybe
        | No, No => No
        end.

    Theorem and_distributes_over_or:
        forall t1 t2 t3: truth, 
            and t1 (or t2 t3) = or (and t1 t2) (and t1 t3). 
        induction t1; induction t2; induction t3; reflexivity.
    Qed.
End inductivetypes.

(* Problem 2 *)
Section slist.
    Variable T: Set.

    (* Supports constant time concatenation by having tail first. *)
    Inductive slist (T: Set): Set :=
    | Nil: slist T
    | Singleton: T -> slist T
    | Cons: slist T -> slist T -> slist T.

    Print list.

    Fixpoint flatten (sl: slist T) : list T :=
        match sl with
        | Nil => nil
        | Singleton h => cons h nil
        | Cons l1 l2 => (flatten l1) ++ (flatten l2)
        end.

    Theorem flatten_distributes_over_concat: 
        forall sl1 sl2 : slist T, 
            flatten (Cons sl1 sl2) = flatten sl1 ++ flatten sl2.
        simpl. reflexivity.
    Qed.

End slist.

(* Problem 5 *)
Section mutually_inductive.
    Inductive even_nat :=
    | Zero
    | EvenN: odd_nat -> even_nat
    with odd_nat := 
    | OddN: even_nat -> odd_nat.

    Print even_nat_ind.

    Fixpoint sum_even (e1 e2 : even_nat) : even_nat :=
        match e1, e2 with
        | Zero, _ => e2
        | _, Zero => e1
        | EvenN o1, EvenN o2 => sum_odd o1 o2
        end
    (* The sum of 2 odd numbers is also even. *)
    with sum_odd (o1 o2 : odd_nat) : even_nat :=
        match o1, o2 with
        | OddN e1, OddN e2 => sum_even e1 e2
        end.

    Check even_nat_ind.

    Theorem comm_add: forall e1 e2 : even_nat, 
        sum_even e1 e2 = sum_even e2 e1.
        induction e1.


End mutually_inductive.