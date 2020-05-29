<!--
```agda
{-# OPTIONS --safe --cubical #-}
```
-->

Strictly associative and unital inverses are defined in

```agda
import Groups.Function.Inverse
```

Then we define the Symmetric group.

```agda
import Groups.Symmetric
```

We define an inclusion from a group to its symmetric group as in Cayley's Theorem.

```agda
import Groups.Symmetric.Inclusion
```

and we define the representable portion of the Symmetric group and show it is isomorphic and hence equal to the original group.

```agda
import Groups.Symmetric.Representable
```

and lastly the use of this is demonstrated.

```agda
import Groups.Properties.Test
```
