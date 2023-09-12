## Goal
- Update the Global Nav bar with a New Design as part of the work of DS revamp

## My Idea
### Take a Button
- Move it from SUI to a package inside monorepo (/packages/sui-button)
- Replace the inner HTML with Radix Button
- Style with Tailwind, using the default tokens

### Step by Step
#### 11 Sept
- Talked to Hannu:
	- We want to place packages on the root level. `packages/ui-v2/button`
	- There should be no `package.json` in `ui-v2` level to avoid complexity
	- We also don't want to depend on relative linting config. In case, people change the linting config outside and invalidate the linting inside the packages.
	- Have separate tasks for: 
		- Removing the package.json from the `ui-v2` level
		- Updating the linting configs (more strict), and make the ts-config package isolated 
		- Create visual-regression tests for the packages
		- 
- Todo:
	- Move `ui-v2` under `packages/` again and make sure `pnpm i` `pnpm build` runs
	- Change the tsconfig back to the original one, to make the linting rule pass and pnpm build pass
##### Notes
- mv ui-v2 back to under `packages/`
- Remove the `dist`, `node_modules` inside `packages/ui-v2/button`
- run `pnpm i`
- => missing peer dependencies issues for `button` dependencies like `inline-spinner`, `tokens`. These peer dependencies were not installed here. 
- Idea of peer dependencies: Plugins (SmartlyUI) and Host package (frontend) may depend on the same libraries (react, styled-components). 
- So, in `ui-v2`, we are using the package.json with peerDependencies from Example_Package. So it looks good. In `packages/ui-v2/button`  , **peerDependencies** are also declared so it looks good. The complaints are about the button's dependencies: icons, tokens etc.
	- This issue was not there when the path directory is `ui-v2/button`. 
	- Maybe need to add some configuration like npm `workspaces` 
	- What is workspace? => The packages inside will get symlinked to the node_modules of the current working dir
	- In pnpm, a [workspace](https://pnpm.io/workspaces) must have a `pnpm-workspace.yaml` at root
	- In npm, a [workspace](https://docs.npmjs.com/cli/v7/using-npm/workspaces) is defined in `package.json`
- => BUT, I already defined workspace `packages/ui-v2` inside `pnpm-workspace.yaml` 

Another Approach
- I will create an example-package under `packages/smartly-ui`
- Make sure it builds with `pnpm i` and `pnpm build`
- Then copy and paste button src over
#### 07 Sept
- Looked into Migration instructions. The SUI components look like many packages inside a monorepo, but looking at the individual component like Button. Button depends on `icons: 5.121.0` instead of `icons: workspace:` - so it is depending on specific package versions.
- To make the packages colocate together in the file tree, I gave it a temporary naming: ui-button
- Run the command in SUI repo to split the `package/button` folder into a branch `git subtree split -P packages/<package name> -b monorepo-migration`
- Run the commend in Frontend repo to push the split package in the branch into a new package  `git subtree add --prefix packages/<package name> git@github.com:smartlyio/<repository>.git monorepo-migration`
- => NOW we have `packages/ui-button` in Frontend!
- => Pedro prefers to have `packages/ui-v2/button` , `packages/ui-v2/tokens` . Copy the files from `example-package` to be the root of `ui-v2`
- => Instead of moving all SUI in monorepo all at once, lets keep the ones in monorepo with new styling to avoid confusion 
- => NOW, we have `packages/ui-v2/button` in the Frontend! 
- Export button component to the root of ui-v2 package
- install the dependencies that `button` package needs by `pnpm i`
- => ALL monorepo packages are built!! 
- => BUT, the button package dependencies are not pulled down..
- => ok, I can move the button/ dependencies to ui-v2 dependencies as they can be shared with other components when they get slowly moved 
- => make the files like `ui-v2/button/Button.tsx`
- `pnpm reinstall` `pnpm build`
- => Build Error!!
- => Pedro wants to be able to build individual packages so that external repos dont need to import all
- => modify the tsconfig.json and tsconfig.build.json files
- Check docs: Turborepo [workspaces](https://turbo.build/repo/docs/handbook/workspaces)
- In `pnpm-workspace.yaml`, add `ui-v2/**`


### Concerns
- How to reserve the Jest snapshot testing and visual regression testing after the migration?
	- Configure it inside of each package
- Make the package available for repos outside of mono-repo
- The outside repo should be able to import specific component packages `ui-v2/button`, instead of all inside `ui-v2`
- Fix CI
- Check over all package.json commands and make sure `**` are taken care of to cover this nested repo

### Investigate later
- OR actually, we can migrate the whole SUI over to Frontend all together  - but we need to make sure all the devDependencies in SUI root are also present in Frontend Root. 

### Q: What were the reasons and tickets that SUI couldn't be moved to monorepo
1. Jest 27 -> 29 upgrade. We resolved issues to upgrade SUI to Jest 29. Compatible with frontend Jest 29!
- https://github.com/smartlyio/smartly-ui/pull/3709
- https://smartlyio.atlassian.net/browse/DUPLO-2140

#### Tech Investigation TODO:
##### Migrate the button package to frontend
```
git subtree add --prefix packages/<package name> git@github.com:smartlyio/<repository>.git master
```

### Other Components: 
- Button: Icon, Tokens, (Tooltip?), inlineSpinner(?),
- Others to breakdown: Dropdown, Input, List,
## Past lesson
- Design created a whole new set of components separately, with new style and capability, and want to use them to replace the existing ones in the system 
	- super risky
		- => because the app is super complex 
		- We don't have dedicated QA engineers for testing
		- Our automated tests cover only functional changes, not UI changes
		- and even if we ask dev teams to test, there are bound to be some pages that were missed out. 
	- requires lots of work, long feedback loop. 
		- The Smartly UI packages are out side of monorepo. We need to publish alpha packages first before and update the SUI consumption in all packages in monorepo
		- Since teams make constant releases, there will be constant merge conflicts to resolve
		- When teams contribute to SUI improvements, SUI need to be updated as well and alpha packages republished
		- pnpm build failures, duped packages, build bundle grow too much




Race Conditions: 
https://github.com/smartlyio/frontend/pull/20797
