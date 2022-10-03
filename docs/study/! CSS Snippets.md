## Defaults
``` css
*,

*::before,

*::after {

	box-sizing: border-box;

}

html, body{
  height: 100%;
}
```

## Other Tips
### Full Height View!
``` css
html, body{
  height: 100%;
}
.outer{
  height: 100%; /* if height is not set, inner min-height no effect*/
  min-height: 100%;
}
.inner{
  min-height: 100%;
}
```
- Height by default takes the smallest value possible
- The parent `height` needs to be set a value `px` `%`
- Then set children `min-height` to `100%`!
- `vh` may cause some issue in the tablet/ mobile layout


 
### CurrentColor
``` css
.box {

  color: hotpink;

  border: 1px solid currentColor; /*derived text color*/

  box-shadow: 2px 2px 2px currentColor;

}
```
### Text Alignment in nested container
![[Pasted image 20210406112623.png]]
- The bottom text is wrapped inside another card div which requires extra padding.
- To keep css clean, after adding the padding, use ==-ve margin== to offset!

``` css
.card{
  padding: 24px;
  margin: -24px;
}
```

### Horizontal Padding at line breaks
![[Pasted image 20210407104801.png]]
``` css
strong{
	box-decoration-break: clone;
}
```
![[Pasted image 20210407104933.png]]
- `clone` treats each of its segment as its own box and copy styles to each one

### Remove the \<li> bullet
``` css
ul {
  padding: 0;
  /*
    This nifty declaration removes the round
    circles that function as bullets for
    this list.
  */
  list-style-type: none;
}
```

### Absolute Position fine-tune using margin!
When we set the element in 1 axis (e.g. horizontal) only, the element will stay inflow in the other axis (verticle). If we want to fine-tune the verticle positioning, and use `top/ bottom`, the verticle axis will also be out of flow.
Solution: ==margin==
==Benefits==
+ Still keep inflow position
+ Not affecting other siblings like `position: relative`
![[Pasted image 20210408113909.png]]

### Text Eclipse 
- Eclipse works on block elements `display: block` or `display: inline-block` 
- Adjust `line-height` or `vertical-alignment` if the texts become not aligned
``` css
div.a { 
  white-space: nowrap;  
  overflow: hidden;  
  text-overflow: ellipsis;
}
```

### Text Underline
![[Pasted image 20210410113120.png]]
``` css
h2 { 
  background-image: linear-gradient(to bottom, transparent 55%, #F0FF8A 85% 100%)
  width: fit-content
}
```

### Text Underline Highlight Motion
``` css
::before { 
  content: '';
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  transform: translateX(0);
  transition: transform 0.2s ease-in-out;
  background-image: linear-gradient(to bottom, transparent 55%, #F0FF8A 85% 100%)
  width: fit-content
  
  /* css-in-js */
  ${({ highlight }) =>
  highlight &&
  `::before {
    transform: translateX(100%);
  } `}
}
```

### Center a Modal or big box on screen
- usually these overlays are `position: absolute`
- We can specify all 4 positions but not dimensions
- The overlay dimension will be auto sized to fit the position
![[Pasted image 20210412220411.png]]
Or, we can `center` the overlay using `margin:auto`
``` css
.box {
  position: absolute;
  top: 0px;
  left: 0px;
  right: 0px;
  bottom: 0px;
  height: 100px;
  width: 100px;
  background: deeppink;
  margin: auto;
}
```

### Whimsical Flourishes!
![[Pasted image 20210415090752.png]]
``` html
<div class="box">
  <div class="big circle"></div>
  <div class="medium circle"></div>
  <div class="small circle"></div>
</div>
```

``` css
.box {
  height: 150px;
  margin: 64px;
  border: 4px solid palevioletred;
}
.circle{
  border-radius: 50%;
  border: 4px solid palevioletred;
  background: white;
}

.big {
  width: 60px;
  height: 60px;
  position: absolute;
  margin-top: -30px;
  margin-left:-22px;
  
}

/* OR Josh's solution!! */

.box {
  height: 150px;
  margin: 64px;
  border: 4px solid palevioletred;
  position: relative;
}
.circle{
  border-radius: 50%;
  border: inherit; /* inherit better! */
  background: white;
  position: absolute;
}

/* More specific classs for the elem */
.big.circle{
  width: 60px;
  height: 60px;
  top: -30px;
  left: -25px;
}

```

### What breaks my fixed-positioning?
[![[Pasted image 20210510173255.png]]](https://courses.joshwcomeau.com/css-for-js/02-rendering-logic-2/13-fixed)

### Image horizontal scoll
- images are inline, by default they wrap to next line 
- force nowrap for horizontal overflow!
``` css
.img-wapper{
  overflow: auto;
  white-space: nowrap;
}
```

### Show style when sibling focused
This is useful in context like a custom Checkbox.
- A custom Checkbox showing different icons (checked, unchecked, disabled, indetermined) based on the state pass in. 
- We still want to use `Input type="checkbox"` internally for accessibility. We set the size to be 0, but still make it focusable.
- When `Input` is focused, we want the focused border styling to show up around the Checkbox icon!
- Input and StyledBlock>Checkbox Icons are Siblings here

 ``` css
const Input = styled.input`
  width: 0 !important;
  height: 0;
  overflow: hidden;
  opacity: 0;
  margin: 0 !important;

  &:focus-visible ~ ${StyledBlock} svg {
    box-shadow: 0 0 0 2px ${Colors.blue300};
  }
`; 
