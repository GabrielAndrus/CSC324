Question 1:

a) Call-by-value:

(\x -> \y -> xy) ((\z -> z) y) =b>
(\x -> \y -> xy) y =a>
(\x -> \b -> xb) y =b>
\b -> yb -- finished!



b) Call-by-name:

(\x -> \y -> xy) ((\z -> z) y) =b>
\y -> ((\z->z)y)y =a>
\b -> ((\z ->z)y)b -- finished, since call-by-name doesn't evaluate under lambdas.


c) Normal order:

(\x -> \y -> xy) ((\z -> z) y) =b>
\y -> ((\z -> z)y)y =a>
\b -> ((\z -> z)y)b =b>
\b -> yb -- finished!


Question 2:

a) 

1. \b1 b2 -> b1 (b2 FALSE TRUE) b2


2. XOR b b =*> FALSE

if b = TRUE:
XOR TRUE TRUE =d>
(\b1 b2 -> b1 (b2 FALSE TRUE) b2) TRUE TRUE =b>
(\b2 -> TRUE (b2 FALSE TRUE) b2) TRUE =b>
TRUE (TRUE FALSE TRUE) TRUE =d> -- did more than one definition-swap here, but should be clear to follow
(\x y -> x) ((\x y -> x) FALSE TRUE) TRUE =b>
(\x y -> x) FALSE TRUE =b> FALSE

if b = FALSE:
XOR FALSE FALSE =d>
(\b1 b2 -> b1 (b2 FALSE TRUE) b2) FALSE FALSE =b>
(\b2 -> FALSE (b2 FALSE TRUE) b2) FALSE =b>
FALSE (FALSE FALSE TRUE) FALSE =*>
FALSE TRUE FALSE =*> FALSE -- also didn't do a definition-swap for every term, but it should be clear to follow (using =*> to avoid writing all the tedious and redundant steps)


b) 

1. Let SHIFT = \p -> PAIR (SND p) (INC (SND p))

2. Let PRED = \n -> FST (n SHIFT (PAIR ZERO ZERO)) 

3. PRED TWO =d>
(\n -> FST(n SHIFT (PAIR ZERO ZERO))) TWO =b>
FST(TWO SHIFT (PAIR ZERO ZERO)) =d>
FST((\fx -> f(fx)) SHIFT (PAIR ZERO ZERO)) =*>
FST(SHIFT(SHIFT (PAIR ZERO ZERO)) =*>
FST(SHIFT(PAIR ZERO ONE)) =*>
FST(PAIR ONE TWO) =*> ONE -- not writing all the steps for space/ease, but the derivation is clear.
