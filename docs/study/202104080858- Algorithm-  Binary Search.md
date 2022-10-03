## Binary Search Pseudocode

^92fea9

Works on a sorted array

`n` is number of inputs - `array.length`
`min` - 0 index
`max` - `array.length - 1`
`target` - target value

```
while (max >= min)
  for each iteration
  guess = (max + min)/2 // guess in middle, Math.floor() to round down
  compare guess === target ?
  if yes
    return the guess index!
  else if (guess > target)
    max = guess - 1
  if (guess < target)
    min = guess + 1

end while
  return -1  // nothing is found after max/min overlap and searched whole array
```

![[Pasted image 20210404122228.png]]

Note: `max >= min` condition, `equal` is needed as it is possible that there is one last item remaining, and in the last iteration `max == min` to set that number.

## Worst Case, Average Case
### Worst Case: 
For a given `n`, we need at most `m + 1` case to find the target. `m=log(n)` so O(logN)

```
n = 15
2^4 > 15

2^m > n

iteration = m + 1

We need at most 4+1 iterations to get the number
Need to +1 in case there is one last item remaining which we still need to run through the iteration

```

### Average Case: 
![[Pasted image 20210408104821.png]]
See Decision Tree diagram and the proof: https://www.cs.wcupa.edu/rkline/ds/analysis.html#binsearch-ave