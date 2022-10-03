- Follow along https://www.youtube.com/watch?v=SYnu6CLKD70

#### Q1: He added so many keys. in current doc, only 1 json file is needed... maybe i will just used this one json file and see
=> So, follow this most updated video tutorial to setup firebase https://www.youtube.com/watch?v=rQvOAnNvcNQ 
=> in this 1 month old official Firebase tutorial, we still need to get this huge Firebase config object and enter the keys etc.
#### Q: Where do I get these keys!? I only see a Firebase json key...!?
- OK, use the auth service as an example: https://firebase.google.com/docs/auth/web/start
- "Connect your app to Firebase SDK" https://firebase.google.com/docs/web/setup
- OK. Now I set up the Firebase project. still can't see the config object in the Firebase Console.
- Go to Settings. Notice there is no Firebase ==app== under my ==dialogue-app== project
- Create a new app 
- And the Firebase Config object shows up!! ![[Pasted image 20211002213219.png]]

#### How to configure Firestore?
- Firestore is a NOSQL for storing JSON.
- https://firebase.google.com/docs/firestore/quickstart?authuser=0#web-version-9
- Before following the [youtube](https://www.youtube.com/watch?v=SYnu6CLKD70), try copy paste some code from the Docs and see if that works.
- Then tidy code up by following youtube 

#### Security Issues with including these keys on Client side?
- It is safe!
- It tells Firebase SDK (library) how to talk to Firebase project on the client side
- Firebase Security Rules and App Check come to help!

#### Keep getting exception when playing audio from Google Storage - CORS Issue
```
DOMException: Failed to load because no supported source was found.
```
- able to play the mp3 if from localhost
- the Google Storage url is correct
- could be a CORS issue? => YES, network tab shows CORS error
- => set `audio.setAttribute('crossorigin, anonymous')` see https://pretagteam.com/question/cant-load-audio-domexception-failed-to-load-because-no-supported-source-was-found
- => [set CORS on Google Storage](https://cloud.google.com/storage/docs/configuring-cors#storage_cors_configuration-nodejs) 
- => set the Bucket using gsutil => my Python installation seems to have issues 
- => set Bucket using [JSON API](https://cloud.google.com/storage/docs/configuring-cors#rest-apis)
- Configure CORS
```
curl --request PATCH \
 'https://storage.googleapis.com/storage/v1/b/dialogue-app-324908.appspot.com?fields=cors' \
 --header 'Authorization: Bearer "ya29.a0ARrdaM-MyyKS2_-bkiecKWxnJnAOm0gt4nYT4WKu-Bhzz-nQKNg9vM7HxglGHR-ZbqvlpsQ6un9bgVEQsOyVHEpD_7V01QsS22QQ-krN4AD79wtm3SPNRPQbCBXMRo5F2tEg3-7TO5nywJSYx38sOZj2iPJT"' \
 --header 'Content-Type: application/json' \
 --data-binary @storage-cors.json
```

- View Bucket CORS Config
```
curl -X GET \
    -H 'Authorization: Bearer "ya29.a0ARrdaM-MyyKS2_-bkiecKWxnJnAOm0gt4nYT4WKu-Bhzz-nQKNg9vM7HxglGHR-ZbqvlpsQ6un9bgVEQsOyVHEpD_7V01QsS22QQ-krN4AD79wtm3SPNRPQbCBXMRo5F2tEg3-7TO5nywJSYx38sOZj2iPJT"' \
    "https://storage.googleapis.com/storage/v1/b/dialogue-app-324908.appspot.com?fields=cors"
```

=> Using other API like `https://s3-us-west-2.amazonaws.com/s.cdpn.io/123941/Yodel_Sound_Effect.mp3` works, so my use of Web Audio API is correct.
=> The existing mp3 file in the bucket seems corrupt. Only 9B. Upload another one manually to try out
=> Try downloading the new mp3 file, still cors issue. See the new uploaded file type is 
=> The uncorrupted mp3 has `content-type = audio/mpeg` . Adding this to the CORS rule json file => still CORS error

TODO:
=> Try checking the response header using a line like (Configure CORS on Google Cloud Storage) `
curl -H "Origin: https://example.com" -I https://mybucket.storage.googleapis.com/myfile.pdf
`

#### Observations
- Firebase Projects and Google Cloud Projects are separate. Google TTS API is under Cloud Projects and the Firestore DB, Storage are under Firebase Projects.
- We can add Firebase Projects to the existing Google Cloud Project
- Billing is combined.
- Google Cloud Project uses the json file as API key


#### Firestore Docs
- [Get Started Guide](https://firebase.google.com/docs/firestore/quickstart#web-version-9)
- [Firestore Reference ](https://firebase.google.com/docs/reference/js/firestore_.md?authuser=0#@firebase/firestore)
- Overly complicated [sample code](https://github.com/firebase/quickstart-js/blob/master/firestore/scripts/FriendlyEats.js)


#### Storage Permission Config
- Set up [Public Access](https://firebase.google.com/docs/storage/security/rules-conditions#public)

```
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if request.auth == null;
    }
  }
```



#### My Apps
- [Firestore DB console](https://console.firebase.google.com/project/dialogue-app-324908/firestore/data/~2F) (inside Firebase apps overview)