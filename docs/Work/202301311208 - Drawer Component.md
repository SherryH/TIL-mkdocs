- Try Applying the component Heuristics defined in [[202301291234 - Compound Cards]] and see if I can get a clearer picture faster
- [Design](https://www.figma.com/file/6rzxf0OQLeEHinSiXGPZi8/Feature-onboarding-toolkit?node-id=1540%3A193990&t=BUMNSHgfLWBaWGRw-0)
### What are the states?
- Expanded/ Collapsed
- Tour:
- Step: current (selected), completed, disabled, (ready and error) => what are the designs for these 2? how could a step get into an error state?
- Q: What triggers a step to be in the completed state? Depending on the tour, do we need to modify some product action buttons so that they dispatch the Tour action to mark a step as completed? 🤔 but it does not seem scalable... 
- Q: If we have no backend as the first step, how do we start a tour? Do we use a localStorage or cookie to store whether a tour has been started?
- Draft Example State: 
- Q: Should we have the `steps` as an array and each array element contains such object?
```
https://smartlyio.atlassian.net/browse/DUPLO-1959

{
  userJourneyId: 'reporting_intro',
  collapsed: false,
  selected: 'step_id',
  steps: {
    step_id: 'completed',
    other_step: 'ready'
  }
}
```
- Q: What is implementing drawer against interface?

- => If user abandoned the journey, the state is lost
- => 
### Q: What is the concept / idea behind the creation of the Drawer component?
