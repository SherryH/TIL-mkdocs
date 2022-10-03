## Insertion Sort 
==Insertion== - With a closed hand of cards, flip and Insert an open card into the appropriate position in the sorted subarray each time

### Helper Method 
1. Write Paseudocode
2. Build the helper methods from pseudocode!!
#### Insert()
``` js
insert(array, rightIndex, value)
```
- an array that is sorted from [0]~[rightIndex]
- `insert()` starts from the `rightIndex` and compare `value` with each element in the sorted subarray
- insert the value when `value < array[currentIndex]`
- Do ==Comparison inside FOR loop==! 👏 No IF ELSE!
- 2 Comparisons inside FOR loop!!!👏  so i don't go to -ve
- Use `rightIndex` to mark the subArray! Don't need to use slice to create extra variables or subarrays
- Mutate the array is OK!!
``` js
function insert(array, rightIndex, value){
    // j = currentIndex
	for(var j = rightIndex; array[j] > value && j>=0 ; j -- ) {
	  array[j+1] = array[j]
	}
	array[j+1] = value
}
```

### Pseudocode
1. Create a sorted subarray, from the left most index `0`
2. From index = `i=1` to `n-1` for `n` elemenets
3. compare `array[i]` to sorted array to the left ==INSERT==
4. insert `array[i]` to the position where `array[i] < array[j]`

### Big O
As `n` increases, Insertion Sort time complexity is `O(n2)`

==Best Case==: The `value` only needs to be compared once to the neighbor to insert. The array is already sorted. `O(n)`
==Worst Case==: The `value` needs to be compared to every element in the subarray. i.e. The array is inversely sorted. `O(n2)`
==Average Case for an random array:==