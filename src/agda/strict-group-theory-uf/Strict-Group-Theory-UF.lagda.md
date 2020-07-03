{---
title = "Strictly Associative Group Theory using Univalence";
---}

<!--
```agda
{-# OPTIONS --safe --cubical #-}
```
-->

This post is a follow up to my previous post on this topic found [here](../strict-group-theory.html). The idea of this post was to introduce an environment where we could prove equalities about groups without having to manually move around brackets. In other words, the associators `assoc : (a · b) · c ≡ a · (b · c)` and unitors `a · ₁ ≡ ₁ · a ≡ a` are given by reflexivity. The underlying idea was to use Cayley's Theorem, that says that any Group embeds into it's symmetric group. As the symmetric group is based on functions and their compositions, these structures are automatically strictly associative and unital by the nature of how function composition reduces in a Agda.

Unfortunately this system introduced another problem. To take advantage of these strict features, we constantly need to transport equalities along this embedding, which is possible, though is not much easier than the original problem we were trying to solve. In the original post, we add in reflection helpers that automatically apply all the homomorphism rules. While this works, it seems quite messy and has problems such as not being able to infer the types of metavariables.

This sort of problem is one of things that univalence can make very easy. Instead of having to worry about how to move these equalities along an embedding, we can instead obtain an equality and transport the whole result we were instending to prove. To achieve this we need to obtain an equivalence between our original group and a group with strict associativity and unitality. Therefore, instead of considering the symmetric group and associated embedding, we instead consider the "representable" subgroup, the subgroup of the symmetric group lying in the image of the embedding. The embedding then induces an isomorphism between the original group and the represetable symmetric group. Using the structure identity principle, this isomorphism is sufficient to obtain the needed equivalence.

There are some technicalities that we need to consider. Firstly, in the original presentation, we considered a custom setoid equality between invertible functions which only checked whether the forward direction functions were equal. We then used a trick to maintain the strict associativity of the underlying function composition. This was done effectively by not requiring that invertibility data matched up. With this univalent approach, this is no longer sufficient. We need a type of permutations for which the regular equality is strictily associative and unitial. This is done in the following file, which contains and explaination on how these are constructed.

```agda
import Groups.Function.Inverse
```

These inverses are then used to define the symmetric group.

```agda
import Groups.Symmetric
```

We define an inclusion from a group to its symmetric group as in Cayley's Theorem. We further show that this is a homomorphism and is injective.

```agda
import Groups.Symmetric.Inclusion
```

Next we need to define the representable subgroup of the symmetric group. Here we run into a similar problem as we did for inverses in that the obvious definition of an element being representable if there is an element of the original group that maps to it will not compose in a strictly associative and unital way (in fact it effectively composes in the same way as the original group). To get round this, we define a different charactarisation of representability. The details of this are in the following file.

```agda
import Groups.Symmetric.Representable
```

In this file we also define the induced isomophism between a group and its representable symmetric group. Further we apply the structure identity principle in this file.

The next file defines a reasoning module for working with this new machinery. Similarly to the previous system, once everything is strictly associative and unital, it becomes easy to define syntax that allows us to also get rid of the `cong` operation. The main part of this module is the `strictify` function. This function takes a property of groups, and gives a proof of this property for a group `𝓖` from a proof of the property on the representable symmetric group on `𝓖`.

```agda
import Groups.Reasoning
```

and lastly the use of this is demonstrated.

```agda
import Groups.Properties.Test
```
