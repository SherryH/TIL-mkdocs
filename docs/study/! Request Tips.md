### POST body query param
- When querying for Auth token, OAuth 2.0 spec
- body param can be encoded using [`URLSearchParam`](https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams)
- headers content-type also needs to be set to[ `'application/x-www-form-urlencoded'`](https://github.com/github/fetch/issues/635)
- `Authorization Basic` in headers needs to be Base64 encoded - can use [`btoa`](https://stackoverflow.com/questions/246801/how-can-you-encode-a-string-to-base64-in-javascript)
- 