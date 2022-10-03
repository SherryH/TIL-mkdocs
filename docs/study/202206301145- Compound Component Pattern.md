One tricky thing bout using the compound component pattern is -> Passing the parent states to children!

- We cannot pass the state as simply as passing in props to children

Some common examples are:
- Tabs, where the Tab parent keeps track of the current active TabItem
- Search Input + List of Results: We want to keep track of the search text and update the results based on the search text.


Some ways to pass the state from outer component to inner component in Compound Component Pattern:
- Render props -> simple and straight forward, but the logic cannot be reused in other places
- Context and Hooks e.g. https://ui.smartly.io/?path=/docs/hooks-usecombobox--basic
