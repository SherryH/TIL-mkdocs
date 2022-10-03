link: https://www.youtube.com/watch?v=Af4M8GMoxi4


### Partial Mocks
- Some dependencies real, some fake => no good

### Mocking 3rd Party dependencies
- Hard to mock code = hard to use code
- Wrap the 3rd party dependecy in a module => 1 place rule all usages across tests

#### If no dependencies
- test logic rules

#### If mock dependencies
- test contracts and relationships
- the test needs to change

##### If test both Logic and Relationships 
=> functions should do or delegate, never both
=> code smell

##### If mocked layer: external / direction => GOOD! 

Test=> refactor safety => look from a distance

If isoltaed unit tests wont inform you about your design, don't bother with them

Generalze concerns common across features

##### Asserts steer designs

Watch out when tools make you think less (meaningfully) 
=> Be aware of snapshot test
=> verifying calls, maybe people will not write pure functions
=> only verify calls to outside worlds

Neglecting tests design feedback
=> root cause is not test, it is design
=> hard to test code = hard to use code


How searls programs