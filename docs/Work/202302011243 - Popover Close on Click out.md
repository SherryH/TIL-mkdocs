## TypeScript Syntax Qs
- element is NonNullable<`MyType`> : NonNulable utility-> removing the possibility of `undefined` or `null` from MyType and make sure the element is not nullable.

## Pseudocode 
- Attach a `click` event listener to the `document.body`
- Detect whether the current click position is outside of the PopOver button, menu
	- Recurrsion for going from child to Parent to check if the current element belongs to the Popover
	- Do the recussive check inside the listener
```
// Check if the current click is outside of the Popover 

// the element that is clicked is contained in the event.target
const {target} = event  // html element

// check all Popover parents (button, menu, overlay) are not null
[popBtnRef.current, popMenuRef.current].filter((element): element is NonNullable<HTMLElement> =>(element !== null ))

// The filter function can be extracted

const isNonNullish = <T,>(
  maybeNullish: T | null | undefined
): maybeNullish is T => maybeNullish != null;

```
- Close the Popover if it is

## What are some of the current implementation on internet?
- https://blog.logrocket.com/complete-guide-react-refs/
```
  useEffect(() => {
    document.body.addEventListener("click", onClickOutside);
    return () => document.removeEventListener("click", onClickOutside);
  }, []);


 // state changes in React is async
 // we want to check that the modalRef.current is still present first
  const onClickOutside = (e) => {
    const element = e.target;
    if (modalRef.current && !modalRef.current.contains(element)) {
      e.preventDefault();
      e.stopPropagation();
      onClose();
    }
  };
  
```

## What are some things I would like to check in our own implementation?
- Check for the modalRef.current?
###  ==!!!V Important!!!==
 - Check for multiple handler execution - esp when listen for events bubble up!

## What Qs do I have after reading Jemi's impl?
### Do our popovers use the 3 refs in the original impl? Where are they?
- `internalDivAnchorRef` - the ref for Popover Overlay
- `internalButtonAnchorRef` - the ref for the Popover Button
- `internalContentRef` - the ref for the Popover Menu
### How to set the HTML elements to refs ?
```
<Content ref={this.myRef}>

// the element is passed to the ref
<Content ref={setPopover} />
<Content ref={(element)=>{ myRef.current= element }} />
```
- Jemi: Back in my day we didn't have ref objects 👴. Refs were always functions: `(element) => void`. For backwards compatibility refs can be either now. Passing a ref object `ref` is functionally and semantically equivalent to passing the function `(element) => void (ref.current = element)`.

### Existing way to detect the clickout
- use an overlay to cover the whole page under the Popover button and menu
- Sometimes there is a problem where the overlay gets constaining block, so we added another closing strategy to close by listening to the target outside of the Popover DOM

