## Selection Sort 
==Selection== - With an open hand of cards, 2 Selections with 2 LOOPS!


### Pseudocode
A simple sorting algorithm. Not very performant.

For `array` with length `n`
1. get `array[0]`, loop through `array`, find the `min` from `array[1]` to `array[n-1]`
2. swap
3. move to `array[1]`, loop through the `array`, find `min` from `array[2]` to `array[n-1]`
4. swap
5. Repeat the above proces until finishing the whole `array`

### Helper Methods
- `swap(array, firtIndex, secondIndex)` - mutates the existing array
- `getMinIndex(array, startIndex)`

### Big O (Asymptotic running time analysis)
There are 2 loops. 1 Outer loop going from `0 ~ n-1` for each item.

There is another inner loop that runs from `i ~ n-1` doing comparison inside `getMinIndex()`.
For inner loop, if `array.length = 8`, it will run through in total `8+7+6+5+4+3+2+1` times. This is an arithmatic series! `8+1` =`2+7` =`3+6`... 
There are `n` items and there will be `n/2` pairs.
The sum of the arithmatic series will be `(n+1)*(n/2)` -> `O(n2)`

If we analyse the running time of the 3 parts of the algorithm:
1. Outer loop
2. Swap
3. Inner loop (getMinIndex)

For array of size `n`:
1. Outer loop runs  through the array, performing the same computations like `swap`, `getMinIndex`. -> O(n) linear. The running time increases linearly with the inceasing `n`.
2. Swap: The swap function performs  the same step for swapping items when iterating through `n`. The function itself is O(1) as swapping only involves 3 steps. As `n` increases, the number of times swapping will be called increases too. So overall running time increases linearly O(n).
3. Inner loop (getMinIndex): This is like a nested loop. Although the number of items looping through the inner loop decreases, the sum of the total number of computations is still O(n2) as arithmatic series sum is `(n+1)*(n/2)`

![[Pasted image 20210411163427.png]]
O(n2) from getMinIndex trumps everything else, so the Big O is `O(n2)`