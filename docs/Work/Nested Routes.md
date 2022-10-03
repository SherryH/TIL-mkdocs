Link: [codesandbox](https://codesandbox.io/s/nestedroutes-95h2fv?file=/src/App.js)


### Nested Routes
- In the PR, when creating `renderWithRouter` test utils, there was an issue with navigation that it does not support navigation, I had to wrap it with a base Route `renderWithRouterAndBaseRoute` for testing navigation
- Looking at Hannu's [PR](https://github.com/smartlyio/frontend/pull/15911/files), it was because in the Onboarding nested route implementation, we didn't use <Outlet/> and instead we used `<Route path="*" />` to capture all routes. 

### How does Nested Route work?
- Only got the nested routes woking in the `WithOutlet.js` example
- In App.js, we enable replacing root route with `/withOutlet`
- WithOutlet has a nested route. It contains `<Routes><Route path="/innerOutlet/*" >` That Route will retain the WithOutlet rendered html and place the children elements inside the Outlet area. The Route path specifies the next path to the children element, the * is important as it will allow the next grandchildren path to be captured. To navigate and show the children, the  Link ==to== path needs to contain the whole url destination path, not just the nested relative path
- We can have multiple levels of the nested Routes. 
- In InnerOutlet, we can further define nested routes and have the children elements shown where Outlet is placed.  