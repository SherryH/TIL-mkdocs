## Goal
Generate a website from FB content

## Required Steps
### Query User
1. [[202103271553-Facebook Login|Facebook Login]]
2. Make [Facebook graph API](https://developers.facebook.com/docs/graph-api/using-graph-api/) calls
	- To My personal pofile to get posts and images 
	- To Szu's FB Page 
3. After setting the login permission scope to include `user_photos`, the graph API returns photos in the call!
4. Pass in the [fields into API calls](https://developers.facebook.com/docs/javascript/reference/FB.api/) to get specific data from the photos

### Tricky Parts
Cool. So far things work as expected!
Issues with extracting user data are that, 
1. The Access Token expires after 1 hour or so as seen from the status object from FB.login. We will need to detect when it is going to expire and [continuously renew the token](https://github.com/cornflourblue/react-facebook-login-example/blob/4f8a9880b9/src/_services/account.service.js) by [getting the FB url](https://github.com/cornflourblue/react-facebook-login-example/blob/4f8a9880b9/src/_helpers/fake-backend.js) again. OR, just use a [long-lived access token](https://developers.facebook.com/docs/pages/access-tokens) and periodically renew it with scheduled crown jobs. See [Refresh access token](https://developers.facebook.com/docs/facebook-login/access-tokens/refreshing/) and [long lived access token](https://developers.facebook.com/docs/facebook-login/access-tokens/refreshing/#long-via-code) ^560bca
2. Facebook would ask us to pass an APP Review if our app asks for permission to access user posts and photos.. 
3. Page API says I need permissions like `pages_read_engagement` My App does not have those permissions available in the facebook Graph Tool... Because the [App Type](https://developers.facebook.com/docs/development/create-an-app/app-dashboard/app-types) matters!!!

#### Test App
- After creating an App on FB, we can create a test app as well. Setting permissions on the test app does not need to go through the App Review Process.
- 
#### Production App
- Setting the permissions require going through the App Review Process


### Query Fan Page
Now, we need if Facebook Page has less strict control over permissions.
Now I created a Facebook page for testing, but it does not have a specific login credential. It looks like as long as I log in as myself, I will have access to the edit controls.
1. Create a Fan Page url and log in details (/)
2. See if I can query Page info without access token: [no](https://developers.facebook.com/docs/pages/overview). We need access token from the User who has access to the Fan Page. All Fan Page permissions require App Review as well.
3. [Long Lived Page Access Token](https://developers.facebook.com/docs/pages/access-tokens) have no expiry date
4. To query the [Page Photos](https://developers.facebook.com/docs/graph-api/reference/page/photos/) and [Feed](https://developers.facebook.com/docs/graph-api/reference/v10.0/page/feed):
	1. The App Type matters. When creating the FB APP client, choose the App Type that enable page permission options
	2. Enable the page permissions like `pages_read_engagement`, `pages_read_user_content`
	3. The Page also needs to be `published` too
	4. To get Tags, use `{fields: message_tags}` in the Page Feeds API!

5. Webhook for realtime updates or push notification => possibly webhook + serverless functions scheduling
6. [Features](https://developers.facebook.com/docs/apps/features-reference#page-public-content-access). Features are similar to Permission. Also require App Review

#### Query Page Info
- In the development mode, we seem to need to always authorize the app via the Graph API Explorer tool to update the permissions (e.g.  pages_show_list, page_token) so those data get returned.
1. [Get Page Token ](https://developers.facebook.com/docs/pages/overview#app-review)
2. Query Page Info


## Draft Notes
- Use Vite, quickly set up a server and React
- Instead of adding React Router, simply use a state to control the log in/ log out view => doesn't work. after you login, you still need to redirect url to another view.

## Learnings
### When following the API doc, doesn't seem to work....
- e.g. the login panel not showing up or showing connected 
- 1. Read further down the docs! 2. Watch relevant youtube 
- e.g. limage urls not returned, only ids are returned when requesting for specific photo
- 1. find example code snippets. e.g. on the live ==Graph API Explorer==
- 2. Use ==Graph API Explorer== to try out different fields and test API using the Test Apps!


### Don't call functions after setting states
- No calling of functions after `useState` is called! the set functions from `useState` are asynchonous and they are batched together before firing off.
- The callbacks / functions after set functions are never called.
- The React team wants us to use[ `useEffect`](https://www.robinwieruch.de/react-usestate-callback) to run the functions on state change.

### ESlint is a must!
- save so much time from debugging into the most obvious import mistakes..
- just run 1 line with npx to set up a basic linking config 
- life will be different!
- Note: can add global variabled into .eslintrc to remove the error noise

## Other Ideas
- FB token expires. user gets logged out. We want to get notified when the state changes. => subscribe to the state change => observable pattern! =>RxJS!

## Other Functionalities To Look Into
- [Push Notifications](https://www.youtube.com/watch?v=0K7AjHrK4TA)
- [Webhook]()
- Creating a website theme: [styled-system](https://medium.com/styled-components/build-better-component-libraries-with-styled-system-4951653d54ee), [css variable design system](https://www.infoq.com/news/2020/06/css-variables-design-systems/)
	
	
	## Next Up
	- Now, I can query the FB infos like feeds, photo, tags in the feeds
	- Next, check if we can get the urls embeded in the post. e.g. video urls (after text removed it is still there!)
	- Pagination, constraint the number to 3 or 4, see how the cursor pagination works
	- Figure out how to do long access token. (video!) 