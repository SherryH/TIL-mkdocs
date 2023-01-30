## Single Small Mini Goal
- create a simple Todo with this [tweet](https://twitter.com/DavidKPiano/status/1604870393084665856/photo/1) example and this [blog](https://www.builder.io/blog/use-reducer)
- 
## Code
- [here](https://codesandbox.io/s/winter-cookies-jhcmqe?file=/src/Counter3-1.js)
## What surprised me
- I am unfamiliar with uncontrolled component!!! `<input onChange={} />` can be handled with controlled component. When I wanna get input value only when on buttonClick , then we can get the input value via `ref` using uncontrolled component pattern
- Create a simple todo component does not take that long!
- The reducer `(state, action) => newState` can be treated as `(preState, newPartialState)=> newState` Instead of using `switch(action.type)` in the reducer, we can actually pass in the updated form value like `{title:""}` as partialData in the 2nd param!
- If we wanna access the preState in the dispatcher, `typeof action === "function"? action(preState): action`