## How Found
onClick `Play MP3` to play the speech from Google Cloud, CORS error appeared in the console

## What makes you think it should work?
- the mp3 is saved in Google Cloud Storage.
- the access rules have been defined as allow all 

```
rules_version = '2';
service firebase.storage {
  // match /public/{mp3Name} {
  //   allow read, write: if mp3Name.matches(".*\\.mp3");
  // }
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if request.auth == null;
    }
  }
}

```
- I set the CORS configuration on the bucket with this [instruction](https://cloud.google.com/storage/docs/configuring-cors#rest-apis_1) 
	- 1. No need to input anything in `scope` inside the OAuth Playground
	- 2. ![[Pasted image 20220206125851.png]]
	- 2.  The folowing error suggests the bucket name is wrong. The bucket name is actually `dialogue-app-324908.appspot.com` . found by creating multiple buckets and examine the names
	- To successfully set CORS using the access token from the OAuth Playground. Sample code copied from [here](https://cloud.google.com/storage/docs/configuring-cors)

```
curl --request PATCH \
 'https://storage.googleapis.com/storage/v1/b/dialogue-app-324908.appspot.com?fields=cors' \
 --header 'Authorization: Bearer ya29.A0ARrdaM8FrtDDOrd_14bQYDFzGezkWuM35KPcGs1bqpmFfSuFT-rmiy5sBs8AL019pwgP__5vTvnCjfBgs0e3O_fWoz5AdLJan5mwtv818vdaL6U3-sJpQMElND_yEcIGqo3nDEzZFO0B1ZJP6zfzoObhw0TY' \
 --header 'Content-Type: application/json' \
 --data-binary @storage-cors.json
```

- The new error complains about 403, no permission. Set the permission as follows using [Stackoverflow solution](https://stackoverflow.com/questions/38671444/user-does-not-have-permission-to-access-this-object-firebase-storage-android?fbclid=IwAR1sdO3tvDh8O4iEl2IfSXjcUb1-rc1Uja8X82mPuGlshpW1EB5LexZcNoY)
```
service firebase.storage {
  match /b/{bucket}/o {
  // https://firebase.google.com/docs/rules/basics?authuser=0
    // Allow public read access, but only content owners can write
    match /{allPaths=**} {
      allow read, write;
    }
  }
}
```