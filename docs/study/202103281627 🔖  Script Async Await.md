
tags: #🔖  #🌱️ 
links: [[202103271553-Facebook Login]]
reference: [The Complete Guide to Async and Defer](https://javascript.plainenglish.io/async-and-defer-the-complete-guide-to-loading-javascript-properly-ce6edce1e6b5)


### What is the order in which script, <script async/> <script defer /> is loaded?


#### Script
- the script loads synchronously. Blocking the DOM while script loads. 
- makes page loads slow as HTML loads from top to bottom
- So usually puts JS script at bottom of body so it does not block loading of css

#### Script async
- enables the script to load while the DOM parses. Load in Parallel!
- as soon as the script finishes loading it ==BLOCKS DOM== and executes. (JS single thread maybe)
- as soon JS script finishes executing, DOM continues to parse

#### Script defer
- script loads while HTML parsing. Does not block browser (same as async)
- executes after DOM finishes loading! ()
- Ideal for: 
	- scripts have to have DOM access
	- scripts that access each other. They will def by executed in the order

### What is the correct way to load script in React?
[Load 3rd libraries Dynamically](https://betterprogramming.pub/loading-third-party-scripts-dynamically-in-reactjs-458c41a7013d)
[4 way to add external libraries](https://betterprogramming.pub/4-ways-of-adding-external-js-files-in-reactjs-823f85de3668)
[Declaratively load JS cache](https://www.newline.co/fullstack-react/articles/Declaratively_loading_JS_libraries/)

### What happens if we try loading script by adding <script/> in index.html?
- Without `async`, the script will be loaded in sequence in the HTML. 
- In [[202103271553-Facebook Login]], the FB script was loaded before React `main.jsx` was loaded. However, FB script was `executed` after React loaded while we want `fbAsyncInit` to executes before React loads to have the webapp FB login modal to show up on page mount.
- We need to use a promise to wrap around the `fbAsyncInit` to make sure it is executed before React!