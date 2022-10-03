### What role is this?
React-testing-library has queries that we can use for selecting the elements on the page. For `<input/>` , it can be 'textbox', or 'spinbutton' ..etc depending on the `type`.

React-testing-library provides very good error message. It prints out a list of components with their names and roles when you try querying for a component using `getByRole` and react-testing-library cannot find it. It is the easier way of knowing the exact role! It may be helpful determining why certain userEvent triggers do not work down the road.

It is better to use testIds for identifying the test elements in case the tests break due to label change.

### User Events not triggered 
Scenario: 
`userEvent.type` does not enter values into `<input type="number" />` as expected! Well, `userEvent` seems to be working with `textbox` role, ie when input type is `text` or `textarea` .... The error message is not very clear.
=> `fireEvent` to the rescue! 
When things don't work, have a hypothesis and try out different combinations!
e.g. try out different event types!