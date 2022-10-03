Debug With 學長

### Issue: 
The uploaded mp3 file / text files only have 9kb. They are actually all undefined

### How found?
- 學長嘗試upload different file types, 
- cat the downloaded file
- debug the _uploadByes()_ function and see the source code on the Chrome debug console
- According to the [doc](https://firebase.google.com/docs/storage/web/upload-files) , need to read the mp3 into a Blob or a File API
- Copy 學長的link from FB

### Debug Tips
- Where the line where the error happened?
- What does the web console log say?
- What does the server log say?


### The way
- After converting the text into speech, upload to Cloud Storage straightaway when it is already a File!



