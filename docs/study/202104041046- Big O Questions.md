references: [[202103310924-#🔖 Big O]]

## How do we use Big O to describe the complexity of the algorithm?
Big O describes the rate of growth change of the maximum bound for an algorithm with increasing number of inputs.
i.e. the running time grows at most at this rate, but it could grow more slowly.

Big O of O(1) suggests that the rate of growth in complexity. ie, the time taken does not increase with the increasing input size.
O(n) suggests complexity increases in a linear fasion with the increasing input size. e.g. when the algorithm has 1 for loop.
O(n<sup>2</sup>) suggests the complexity increases in a Polynomial manner. e.g. nested for loop

## Why is the worst case running time for Binary Search Θ(log<sub>2</sub>n)?
Binary Search is useful for finding an item from a sorted array.
For binary search, we divide the input by half, check if the item is in one half and procede to the next if not. 

`n` is continuously divided by 2 until item is found. if `n` is 300, it will take no more than 9 rounds to find the item because `2^9=512` greater than 300!

As `n` increases, the increase in complexity grows more slowly. `9 <= log2(512)`
-> `rounds = log(n)` The Binary Search complexity is `Θ(log(n))`

![[Pasted image 20210404122228.png]]
![[Pasted image 20210406091048.png]]