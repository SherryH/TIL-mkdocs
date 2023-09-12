## Motivation
- For Design System Migration, one of the harder part is to migrate the custom components and repos that still use an older version of SUI. Now We are on SUI5.x but For repos that are still on SUI 3.x and 4.x, it poses a risk to the DS migration
- We need to understand how many repos still depend on the old SUI and the obstacles that prevented the teams to update to the latest SUI

## Methods
- Following the pnpm-lock file in Frontend repo to track for the packages 
// Jemi's example
Example of dependency tracking
1. Text search `@smartly/tokens/3` finds the installation. Copy version.  
2. text search for `'@smartly/tokens': 3.113.1_5gmf44wh7eu5myllprwccqvqie` finds dependents. Pick one as an example: `@smartly/button/3.113.1_w2bf6tsmpojz6yvlz3yaqqr2a4`  
3. Follow the dependency chain with a couple more searches: `@smartly/button': 3.113.1_w2bf6tsmpojz6yvlz3yaqqr2a4`, `@smartly/query-builder': 3.113.1_w2bf6tsmpojz6yvlz3yaqqr2a4`.This gives us the following graph`@smartly/pinterest-campaign-wizard/14.0.1`  
 => `@smartly/query-builder/3.113.1` => `@smartly/button/3.113.1` => `@smartly/tokens/3.113.1`I happen to know `@smartly/pinterest-campaign-wizard` is in the [pinterest-campaign-management](https://github.com/smartlyio/pinterest-campaign-management) repository. If I didn't I'd have to search our GitHub for a repository. In the [package.json](https://github.com/smartlyio/pinterest-campaign-management/blob/master/packages/pinterest-campaign-wizard/package.json#L84) of `pinterest-campaign-wizard` we see the dependency definition that needs to change.

## Initial Approach
```
> in pnpm-lock file, search for 

'@smartly/tokens': ~3  
'@smartly/tokens': ^3

'@smartly/tokens': ~4

'@smartly/tokens': ^4  
=> no results
```
- Search for `'@smartly/tokens': 3`
- => 15 results for the package
- => Tracing the results up the recursively yield a few different repos that still use version 3 of the tokens

## Script for exhaustive search
- It is tiring the prone to negligence from manual search
- I want to write a script to do that
- I want an easy way to debug and see the errors as I write the script

#### 1. Write a Node script that reads pnpm-lock file


# Key Learnings
## Understand the context of the data
- Always, always take the time to understand the data and the context 
- and simply the data input to the very essential
- => this would save heaps of time down the road
## Recursion is only 1 direction!
### and Traversing the object up & down is 2 directions
### and Continuously searching for parent, ancestors is another recursion/ loop
### and going through all occurrences is another loop!
- I have a rough idea that recursion is the key. The insights into these inner workings became apparent after I started working and debugging through the problem.
#### How can I notice these sooner and earlier?
- More detailed pseudocode with exact input and output. 
- Also write code at the same time to support it
