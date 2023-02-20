## Something I am puzzled
### What shall I do first?
- Continue with the spike, but then I will need to make my own context since Den's context is not merged yet
- Create Jira tickets, detailing what I need to do next
- Investigate how to do redirection and mount the Drawer onClick
### What gives the biggest impact?
- I can create the Jira tickets first and clarify the requirements first.

- Minna also wrote her tech planning doc. Check and Learn!
### SO
- I can only ask these detailed Qs after trying to implement a bit. So I will try at least make the first contextualhelper to showup (30min)
- and move to the next one
- and have 1 Drawer to be displayed


### Using DrawerRenderer
- We have different DrawerRenderer for each of the user journey
- `drawerImplementation` object is to be created in a common place for storing all the user journeys right? where shall we place it?
- Contextualhelper: where to put the onClick method for dispatching the event?


### Q: So we have just 1 DrawerRenderer?
- Where is DrawerRenderer used? It is used for rendering the Drawer. Drawer is only rendered in 1 place since we only have 1 Drawer open at one time. and We will pass `drawerImplementations` into the Renderer. (I think)
- We define earch userJourneyImplementations alongside each userJourney
### Q: Create a common folder for containing userJourneys?
### Q: Create a common place for DrawerRenderer?


Q: 
- there is only a journey and one drawer open at one time
- after a contextualhelper is closed, the selectedStepId is null? how do we re-select again? by click on the Drawer(? not clickable) or click the previous step?
- best way to structure the code?
- DrawerProvider and DrawerRenderer and drawerImplementations dela?



- place DrawerRenderer inside ReactRoot(?)
- Q: about the onClick inside ContextualHelper control
- PM
- is it ok to just have the entry point available inside herofeatureRecommender? 

- Drawer Step is currently not clickable - in future they should
- Pavlo: Drawer step clickable?

A:
- open on homepage
- open the feature page, then we can start the user journey (e.g. easy in catalogs, but hard in PivotTable)
- 3rd option, teams create CTA. that opens the journey
- 4th generate links for user journey, - ** value

==> Create URLs in the state now!
==> ok the Steps not clickable

Things happen 
- delete CTA in Reporting since we upgrade product tours
- we will feature gate it
- no feature gate on user level

User Journey enhancement
- user roles
- 
- 

### Issue:
Lots of various build errors!!!!! =o=

