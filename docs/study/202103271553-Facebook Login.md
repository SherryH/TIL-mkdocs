---
alias: Facebook Login
---
tags: 
links: 


## Facebook Login

[Video](https://www.youtube.com/watch?v=gXux8b3wcYw)

### Create a new App 
- This new App is the `client` that will talk to FB using products such as `Facebook Login`
- Follow the Quick Start instruction

#### My Steps
- Install Vite, follow the steps on docs
- on localhost:3000, check login status. 
- 🐛  vite:import-analysis failed because I tried changing extension from `.jsx` to `.js` [this config](https://indepth.dev/posts/1318/a-note-on-vite-a-very-fast-dev-build-tool) can potentially solve the issue, but no need to go down the rabbit hole
- Change the file extension back... restart server
- the fbLoginStatus is unknown... why?
- Change the script order so that the FB SDK order is before the React `main.jsx` => still no auth login request and fbLoginStatus is unknown
- read on html script loading and proper way of loading react scripts

##### Use Promise to ensure the script execution order!
- Still nothing happened... the loginStatus is still unconnected!?
##### Add the UI button separately!
- Read further down the [documentation](https://developers.facebook.com/docs/facebook-login/web#logindialog) to see how to implement a button
- Logged in! Connected!!

#### Bugs
1. FB login UI never appeared after pasting the FB Login code snippet
- Possibily because FB code was executed after App.jsx loaded
- fbAsyncInit is an asynchonous function, we want to [wait for it to complete](https://github.com/cornflourblue/react-facebook-login-example/blob/4f8a9880b9c73ef1224f45ecce9ee51cf14e6c6b/src/index.js) before starting up App.jsx
- => according to my console logs, putting all script in the <head/> naively, only loads the script first but the `fbAsyncInit()` is run after App.jsx. 

#### Insights
- [[202103281627 🔖  Script Async Await]]]
- the FB script was loaded before React `main.jsx` was loaded. However, FB script was `executed` after React loaded while we want `fbAsyncInit` to executes before React loads to have the webapp FB login modal to show up on page mount.
- We need to use a Promise to wrape around the `fbAsyncInit` to make sure it is executed before React main.jsx loads!
	