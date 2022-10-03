##### ComponentDidMount in hooks
``` js
useEffect(()=>{
  fetchRandomData().then((userInfo)=>{
    setUSerInfo(userInfo)
  })
}, [])
```
Eslint would give a warning - because fetchRandomData may change
To Solve it => `useRef`! Value in `useRef` doesn't change 
```
const fetchNextUser = useRef(()=>{})

fetchNextUser.current = () => {
  fetchRandomData().then((userInfo)=>{
    setUSerInfo(userInfo)
  })
}

useEffect(()=>{
  fetchNextUser.current()
},[])

```

OR

1. Define the local function `fetchNextUser` inside `useEffect`

##### Get previous state or updated state
- latestRef: [React Docs](https://reactjs.org/docs/hooks-faq.html#why-am-i-seeing-stale-props-or-state-inside-my-function), [Dan's blog](https://overreacted.io/how-are-function-components-different-from-classes/)
- previousValue: [React Docs](https://reactjs.org/docs/hooks-faq.html#how-to-get-the-previous-props-or-state)
``` js
import {useEffect, useRef} from 'react'

export default function useRefValue(value){
  const ref = useRef()
  useEffect(()=>{
    ref.current = value
  })
  return {
    latestRef: ref,
	previousValue: ref.current
  }
}
```

##### Clean Pattern for setState after getting async response
- see the React-coding-solutions [spootify example](https://github.com/alexgurr/react-coding-solutions/blob/master/spootify/src/routes/Discover/components/Discover.js)
- synchronously setting a key value pair in the state
- `this.setState({ \[key\]: await fetchFunction() }, resolve);`
- 2nd arg, `resolve` callback is executed after state is set
- return the promise after state is set
``` js
  getData = (key, fetchFunction) => {
    return new Promise(async resolve => {
      this.setState({ [key]: await fetchFunction() }, resolve);
    })
  };
```