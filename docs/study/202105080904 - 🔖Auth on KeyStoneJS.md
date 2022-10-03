# Authentication
User Sign In
# Authorisation
Permission and Access Control
https://sherryh.hashnode.dev/wesbos-advanced-react-roles-permissions-27-apr



# How CORS affects Auth
- It is important to use custom Domain. So browsers don't block requests when they are under different domains
- When server and client are on different domains  
- on Server: We can set CORS `Access-Control-Allow-Origin` , to white list certain client domains, and tells browser to let the response pass back to the client
- HOWEVER, if it is a ==authenticated request==, e.g. the user is authenticated, and the request contains a ==sign-in cookie==. 
- Cookie needs to have a separate property ==SameSite== set that allows or disallows cross-origin cookies from being saved in the browser. => actually, maybe it works for Firefly since ==sameSite== can be set to `false` in the previous Keystone. => YAY! Stable version wins!!!!
- KeystoneJS NEXT does not allow setting sameSite cookie to false, so browser does not save the sign-in cookies (different origin), so user will never be authenticated!!