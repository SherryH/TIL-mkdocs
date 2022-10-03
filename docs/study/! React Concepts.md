##### Controlled Input vs Uncontrolled Input
- A Controlled input is an input that gets its value from a single source of truth. e.g. state
- An Uncontrolled input let the browser handles user update. Component is clueless of the updates

##### One way data flow
- e.g. A Switcher on/off state, can be updated by 1. user 2. API.
- The store that contains the state should receive data change instruction from 1 way! 
- Instead of letting User and API change the store state directly, we can have the store ==subscribe== to  the change.

``` js
// this store has getter, setter routines for 
// state variables 
var Store = { 
  _handlers: [], 
  _flag: '', 
  subscribe: function(handler) { this._handlers.push(handler); }, 
  set: function(value) { this._flag = value; this._handlers.forEach(handler => handler(value)) }, 
  get: function() { return this._flag; 
  } 
 };
```

### React.memo
- is pureComponent. Does not re-render when the states/ props are updated with the same values
- shallow comparison of props
- if props are nested props objects => pass a second equality check function!

### useCallback useMemo
- use in large data

### ErrorBoundary
- catches errors in the children
- do not catch error for SSR, async calls, event handlers
- `getDerivedStateFromError` - render the fallback UI
- `componentDidCatch` - log error info
- https://reactjs.org/docs/error-boundaries.html#introducing-error-boundaries

### Lazy Loading
#### Component based code splitting
- React Lazy + Suspense
- Fetch the resouce when you need it e.g. onButtonClick, scrolldown
- Auth! -- Lazy Load the App after user logs in
``` js
// before
import Scene from './Scene'

// lazy
const Scene = React.lazy(()=> import('./Scene'))
```
Suspense provides a fallback view while the Component is ==loading==
``` js
import {Suspense} from 'react'

<Suspense fallback=''>
  <Scene />
</Suspense>
```
- Note, `Scene` has to be default export. No Named Export supported
- Workaround
``` js
// AwesomeA.js 
export { AwesomeA as default } from './MyAwesomeComponents'

// SomeWhereElse.js 
const AwesomeA = React.lazy(() => import('AwesomeA'))
```

#### Route based code splitting
- Client side routing: The JS of the whole App is loaded at the same time, even though user only sees the `<Home>` page, not the `<About>` page
- Lazy load only the component page the user is on!
``` js
// Lazy load the route components 
const Home = React.lazy(() => import('./Home')) 
const About = React.lazy(() => import('./About')) 
// Provide a fallback with Suspense 
const App = () => (
  <Router>
    <Suspense fallback={<div>loading...</div>}>
	  <Route exact path="/" component={Home} />
	  <Route  path="/about" component={About} />
	</Suspense>
  </Router>
)


```

### Context

```javascript
import React, { createContext, useContext } from 'react';
const ThemeContext = createContext('green');
const App = () => {
  return (
    <ThemeContext.Provider value={'green'}>
	  <Content/>
	</ThemeContext.Provider>
  )
}

Const Content = () =>{
  const theme = useContext(ThemeContext)
  return <Button theme={theme} />
}

```

### useReducer
- shape of state object is complex
- access prev state value to update next state
- apply special logic