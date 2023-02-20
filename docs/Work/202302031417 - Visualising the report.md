- This is the first story that implements the user journey using the Onboarding Toolkit
- 
## Emotion
- I am feeling like procrastinating again as I am a bit lost and unsure of what I do will be the correct way...
### What smaller tasks can I break it down to?
#### What did Jemi suggest yesterday?
- Think of the tests first. Each test scenario can be generated as a task
- The states are saved inside the Drawer Context.
	- state is in the schema that Den is implementing
	- I can create the action creators or selectors, but these are implementation details
	- We can have a button that triggers the user journey tour. When the button is clicked, the journey information is filled in the Drawer context
	- 
- Example tests are:
	- (assuming there is a button that triggers the user journey and opens the drawer) - onButton click, the Drawer is opened and user journey state is loaded into the context
	- (x) Verify the position of the contextualhelper (x - this is controlled by Popper)
	- For each step, verify each of the 4 Drawer status
	- User can move forward in each step
	- User can move backward in each step
	- (Any Async actions that may be fired in the Drawer?)
	- (What happens when there is an error in the step? What might have triggered it and how can it be resolved?) => In the end, the states are from the backend. We don't store the error information in the backend. We only show the error in the UI. When you refresh the error will go way. 
	- Halfway into the journey, When user clicks away on the same page, the Drawer / contextulhelper closed and reopen to continue the journey
	- Halfway into the journey, When user clicks away on the different page, the Drawer / contextulhelper closed and reopen to continue the journey 
	- After journey completes, when user clicks away and reopens the drawer, we can see the completed state (but it is by design that we lose the state information after switching the journey right?)
	- 
- To Do:
	- Check with the team about the Design. When Design is done, check the exact steps
	- Steps: 
		- Reporting > (Given in the reporting view, Open the Drawer)
		- Table view with graph > 
		- Select column > 
		- Adjust the time frame > 
		- Visualize selected items only > 
		- Change graph dimension
	- We have Drawer and useUserJourney()
	- (Assuming we are using contextulhelp in each step with the Drawer opened)
	- (We gonna put simple copy here and get someone from BobbyTables to update the copies)
	- Investigate how to write tests

