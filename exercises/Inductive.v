Require Import List.

Require Import Cpdt.CpdtTactics.

Set Implicit Arguments.
Set Asymmetric Patterns.


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

    
End inductivetypes.


Section slist.
    Variable T: Set.

    Inductive slist: Set :=
    | Nil
    | Cons 