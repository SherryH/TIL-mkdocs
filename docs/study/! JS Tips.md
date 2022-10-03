### Async fetch in parallel
- need 2 `Promise.all` because `res.json()` also returns a Promise
``` js
    Promise.all([newReleasePromise, featuredPlayList])
      .then((resArray) => {
        return Promise.all(resArray.map((res) => res.json()));
      })
      .then(([newReleases, playlists]) => {
        this.setState({
          newReleases: newReleases?.albums?.items,
          playlists: playlists?.playlists?.items,
        });
      });
```
