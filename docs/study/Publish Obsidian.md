- Use static site generator: [mkdocs](https://github.com/jobindjohn/obsidian-publish-mkdocs) and eleventy


### What am I thinking?
- I might change publishing platforms later. e.g. mkdocs to eleventy to nextjs etc. With 1 vault, how shall I manage the different publishing platforms?
	- [Github monorepo](https://www.starfallprojects.co.uk/blog/create-multiple-websites-from-one-obsidian-vault/#step-one-set-up-your-obsidian-vault-and-git-repo)? => in each of the vault/subfolder, we can publish using different static site generators
- I need to move all the images into a subfolder...
	- Looks like, I can safely move notes to a subfolder and all the wikilinks still work!


### What are the easiest way?
- Just use the [mkdocs](https://github.com/jobindjohn/obsidian-publish-mkdocs) with Material. Clone the template and it seems to work!
	- This [Gitlab guide](https://about.gitlab.com/blog/2022/03/15/publishing-obsidian-notes-with-gitlab-pages/) explains the ci in detail
- Use the [eleventy-garden](https://github.com/binyamin/eleventy-garden)
	- Figure out how to show a list of all notes in the note index file
	- I guess the[ learn eleventy from scratch](https://learneleventyfromscratch.com/lesson/11.html) course shows how
	- But I need to configure so many things, understand the plugin system..
- Or maybe use [Quartz](https://brandonkboswell.com/blog/Publishing-your-Obsidian-Vault-Online-with-Quartz/)? 
	- Looks like some configuration is still needed
- OK, there is a reason why Jekyll is so popular... The templates are ready made!
	- I like this design better
	- Follow this [video](https://www.youtube.com/watch?v=kg-9n_A4Tf0) and publish the notes in 15min

#### Jekyll wins!
- To build on top of it!
- Next can be to add a [searchbox](https://pulsarea.com/articles/add-searchbar-to-jekyll)

### NextJS Digital Garden
- There is a [working example](https://github.com/canburaks/digital-garden-react-nextjs) with NextJS!
#### How to avoid clutter of build files in vault?
- Copy the files from vault into a separate Github repo for build
- As part of the build command, copy the files over from Vault lol
- Shell script will do


### Other Note:
- To make a static site generator for showing the Markdown, I will need to make a Markdown Compiler first!?
- [Beezwax](https://blog.beezwax.net/writing-a-markdown-compiler/), [Sarv's notes](https://sarvasvkulpati.com/blog/markdown-parser) on making Markdown Parser - super valuable, [this post](https://prettydiff.com/2/guide/unrelated_parser.xhtml#enjoyment)
- Goal 1: make a shitty version of the Markdown on repl that transforms only heading!