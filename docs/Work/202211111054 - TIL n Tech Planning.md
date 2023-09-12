### Tech Planning
- Impact vs Effort
- Usage 
- Technical facing vs product facing
- Minna's awesome [documentation](https://docs.google.com/document/d/1sAZ3xtj1osxkWiKbmWRNMoHy8bV9bX77uWPSe3JEOGk/edit#heading=h.fprizwxbhah2)
- My steps: 
	- Read the Goals and Scope
	- Write notes and Qs as I think....
	- To implement, what do I need to know?
	- What are the entities / states of interest? (Users/Permissions, Features, Platforms, EntryPoint Links, FeatureGates)
	- What are the pages include:
		- Angular pages? React pages?
		- Page, Modal? Popover? Drawer?

### Bug Investigation
- This error `setFocus` is not a function.... in `List`.
- Looked into the code, it should not happen as we always pass it in internally. Unless they use the ListStateful where they pass in the props, inc `setFocus` themselves
#### Always Check they are using the latest version of Smartly-UI
- `package.json` uses `^x.xx.x` , the actual version used may be upgraded. To check the actual dependency version used, check lock file.
#### Always try reproducing the bug in Storybook
#### Write a test to prevent the same bug from appearing

### Jest Debugging
#### Error 
When trying to run `pnpm jest ...spec.tsx`
```
 ERR_PNPM_RECURSIVE_EXEC_FIRST_FAIL  Command failed with ENOENT: jest packages/frontend/components/Onboarding/ChannelConnection/FinalizeLink.test.tsx
spawn jest ENOENT
```
When trying to run the jest extension on VSCode, I got 
```
Error: Cannot find module '/Users/sherryhsu/Smartly/frontend4/node_modules/.bin/jest'
    at Module._resolveFilename (node:internal/modules/cjs/loader:995:15)
    at Module._load (node:internal/modules/cjs/loader:841:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:23:47 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}
```
- Somehow all of a sudden the jest library cannot be found inside the node_modules
- I have already cleaned node_modules and `pnpm i` many times
- Dont know why - WORKAROUND: install jest globally
##### Change VSCode workspace directory to inside 