## Why do we create Compound Cards?
- For Onboarding Toolkit, we have[ `use-case-cards`](https://www.figma.com/file/6rzxf0OQLeEHinSiXGPZi8/Feature-onboarding-toolkit?node-id=545%3A190113&t=yTdp131owfFuqy3V-0) and the current Card component does not enable us to make `use-case-cards` easily.
- We create this new Compound Cards to enable creating the `use-case-cards`

## How to quickly understand the thoughts behind the design and creation of the Compound Cards?
- There are 2 PRs.
- Read the comments in the closed PR. See the Problems Jemi spotted
- Pull the new Compound Cards PR in Code and check
### What were the problems Jemi spotted?
#### Context Declaration
- We usually initialise the context to `null` and pass in the first state later. 
- ❌
```
const CompoundCardContext = createContext<CompoundCardContextType>(
{} as CompoundCardContextType) 
```
- ✅ 
```
const CompoundCardContext = createContext<CompoundCardContextType | null>({})
```

### Compound Card Code Reading Guiding Qs
#### What are the states?
- Internal (controlled by component): expanded/closed
- External (supplied by applications): num of children

#### Component API Heuristics
##### Controlled (by product applications) vs Uncontrolled (set internally in component)
- The Compound Card has an internal state: `expanded` and we provide flexibility for users to control the state by themselves as well as the ease of use that we can manage it by ourselves
- prop: `expanded` -> if this prop is supplied, then controlled, else we use our internal state
##### Productify the common design patterns 
- In area (Header) where there is a commonly used: we enable users to insert the text as props  
- And to preserve flexibility for customisation
##### Define the Compound component building blocks
- Header, Action, Content, Row etc. Provide the layout block with preset CSS for ease of use and standardization of styles. 



## Mood
### Procrastination, Feels Hard
- After I noticed that I wanted to procrastinate cos reading the code line by line feels hard work and I may still get lost easily
- Then I remembered to come up with some guiding Qs to make it easier and fun!
