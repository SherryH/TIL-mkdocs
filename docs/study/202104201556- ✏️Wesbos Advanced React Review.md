## Q: What's the main architecture? 
KeystoneJS as the CMS + Server which generates default APIs to query the DB.
KeystoneJS talks to 1. FE, 2. Admin UI, 3. DB and manages Server Cache and session information.
![[Pasted image 20210420160215.png]]

## What are the Gotchas in deploying KeystoneJS (5) to Heroku Free Dyno?
Lots!! Although they are not in Wes's courses yet, here is what I stumbled on when working on Firefly using similar structure in Keystone 5.

##### MonoRepo git subtree: 
If using the Mono Repo structure i.e. DB and FE in the same repo, then we can't link Heroku deploy with Github as Heoku expects BE code inside `/backend` to be at the root. In this case, we need to use `git subtree push --prefix backend heroku main` from the root folder to push only the BE code from `/backend` to Heroku

##### Mongo Atlas enable access
- Enable Access 0000 /0 access everywhere. If still issue, manually enable local ip adress first to get it working asap!

##### Secure Cookies - set FALSE on Heroku FREE Dyno!
[[202104201616- 🔖SSL HTTPS]]
According to [Keystone production list](https://www.keystonejs.com/guides/production#secure-cookies), we need to make sure the `cookie.secure` is set to `true` when https is enabled. 

Although Heroku gives us `https` on free Dyno using *.herokuapp.com* certificate, it does not satisfy the criteria of a secure SSL. (unsure why, could investigate further). 

So, we must set `cookie.secure` to `false` when using FREE Dyno on Heroku.

We can either upgrade to a paid plan to make it work or using [Cloudfare to set SSL](https://stackoverflow.com/questions/52185560/heroku-set-ssl-certificates-on-free-plan). 

##### CookieSecret - generate a secure one!
See [Keystone production list](https://www.keystonejs.com/guides/production#secure-cookies)

##### Session Store - create one too!
Create a SessionStore using [MongoStore](https://stackoverflow.com/questions/58796880/deployed-to-heroku-admin-ui-login-suddenly-stops-working). May need to [downgrade the version](https://forum.freecodecamp.org/t/advanced-node-and-express-error/450979). 

##### Get the initial user credential 1st time deploy from Application Log!
Super important! This credential  just appears once and expects you to update the password using the default password. Remember to grab it otherwise you can't log in to the Admin UI and will need to delete the APP and redeploy!



## Q: What's the DB Design?
Using draw.io
![[Pasted image 20210420172134.png]]

#### Cart
A Shopping Cart is made up of multiple Cart Items belong to the User. CartItem is the smallest structure that we use as DB schema!

## Q: What is the default Apollo Cache?
``` js
new ApolloClient({cache: new InMemoryCache().restore(initialState || {})})
```
-   if we view the pageSource, we can see that the json data of apolloState is saved in the `<script/>`
-   ![[Pasted image 20210420173156.png]]

## Q: When does it make sense to configure own cache? example?
e.g. Pagination.
Usually, Apollo uses the query as the key 
```
{ allProducts: [{product1}, {product2},{product3}...] }
```

However, in pagination, the query key is different for each page 
![[Pasted image 20210420175827.png]]
Problem: When the product is used in another component. e.g. Footer, Apollo would not know that it is present already (keys don't match!) and will fetch from network again.
To make it faster, we can ==Configure Key to be Generic Query Key== ,`allProducts` again!

See [Hashnode notes](https://sherryh.hashnode.dev/wesbos-advanced-react-module-6-26-feb) for more detail.

## Q: After deleting data, e.g. a product, how do we update the view?
There are 2 ways to update the view after a Mutation.
1. refetchQuery: Call the Query to get the updated items from network
2. Optimistic Update / update(). Note: These 2 are not equal for Apollo. 

At the time of writing, there seems to be an issue with Optimistic Update so Wes uses `useMutation({update()})` the `update()` function inside useMutation to update the cache directly.
``` js
update(cache, {data}) {}

cache.evict()
cache.modify()
cache.identify()
```

See Hashnode [note1](https://sherryh.hashnode.dev/wesbos-advanced-react-m9-cartitem-16-mar) and [2](https://sherryh.hashnode.dev/wesbos-advanced-react-module-5-23-feb) for more details.

## Q: When does it make sense to configure the custom mutation? example?
By default, Keystone supports CRUD mutation/ query that add items into DB
e.g. `[{cart1}, {cart2}, {cart3}...]`
If we want to update the data with incremental count instead,  `[{cart, count: 3}]`, we need to customise the resolver to update the DB by incrementing count instead of pushing 1 more item into the array.

When creating a new custom mutation, we use `graphQLSchemaExtension`  or `extendGraphQLSchema` (depending Keystone5 or 6) to define the new Mutation `type` and `resolver`. 

Inside the `resolver(root, {variable}, ksContxt)`, we can use the ksContxt to 
- check the session and see if user is logged in
- query the current user data 
- increment count or create a new one accordingly
- Keystone provides Lists API with methods like `context.lists.CartItems.findMany` that we can leverage! These are not Mongoose methods!

See [Hashnode Note](https://sherryh.hashnode.dev/wesbos-advanced-react-m9-cartitem-16-mar) and [Wesbos stepped solution](https://github.com/wesbos/Advanced-React/blob/master/stepped-solutions/47/mutations/addToCart.ts)

## Q: What are the steps for creating pagination? Draw components and diagrams
There are 2 types of pagination: 
- cursor based pagination. What FB graph API uses
- offset based pagination

For Offset based pagination, we need 
1. page number (we can get from URL)
2. items per page (offset)

Then we can deduce the `total pages` by `total items / offset + 1`
graphQL query ` allProducts($first, $skip)` where first is offset and skip is the page number - 1.
## Q: How to configure cache for pagination?
See above. Use Apollo `read` and `merge` functions so that the generic query keys are still used in the cache. That way data requested inside <Pagination/> or other components like <Footer/> can be fetched in the same query.

## Q: What are the steps for creating Search? using DownShift 
Downshift: 
- use the prop getters like `getComboProps()` for setting attributes and methods to make the autocomplete working!
- `highlightedIndex` is to be set for applying the highlighted styling
- To query for specific products, we can use graphql queries with `where` KeystoneJS generated filters `name_contains_i` like:

``` js
query SEARCH\_PRODUCTS\_QUERY($searchTerm: String!) {
  foundProducts: allProducts(
    where: {
      OR: [
        { name_contains_i: $searchTerm }
        { description_contains_i: $searchTerm }
      ]
    }
  ){
   id
   name
 } 
```

- we want to fire the query onClick, not when the page loads `useLazyQuery`!
- fetchPolicy: `no-cache` we don't want to query this search result!

For more detailed info, [see the slides](https://docs.google.com/presentation/d/1XjUeiVj0j7W_yqRHOrJKR1ffg0MKjV79e_YFsgTvViI/edit#slide=id.gca623cb703_0_0).

## Q: What are the 2 ways of using Stripe? What are the differences?
Stripe Checkout and Stripe Element.
Stripe Checkout: a prebuilt form
Stripe Element: let us customise the look and feel.