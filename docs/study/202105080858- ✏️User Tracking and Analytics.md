# Ads, UX Design Decisions

https://www.hotjar.com/behavior-analytics/tools/
AB Testing
- test hypothesis
- compare variants - homepage, campaign page etc
- Variables: Diff homepage, diff device, diff browsers

Session reply
- understand the result of AB Testing
- record user action
- understand frustration
Heatmap
- red: most interacted, blue: least
- data based decision - website redesign, AB test
Feedback and voice of cutomer
- small quick survey, understand WHY - leave? abandon?

# User Tracking App JS
https://dev.to/romverner/making-a-user-behavior-tracking-app-w-javascript-p1-37fi
## Performance
- Performance - [Web High Resoluton Time API](https://developer.mozilla.org/en-US/docs/Web/API/Performance)
- provides performance related info to current page
- [`performance.now()`](https://developer.mozilla.org/en-US/docs/Web/API/Performance/now) - checks the time
- Elements - we can get by `getElementById` etc
- Listen for events like `focus`, `blur`, `mouseover`,`mouseleave`
- Log the `time` in pairs. `[[focus],[blur]]` n mouseOver `[[mouseover],[mouseleave]]`
- button: mouseover, mouseleave, click
- textarea: mouseover, mouseleave, focus, blur
- `getElementById().nodeName` -> elementType like `span`, `div`
- `_addEventListener(id, type, ref)`
``` js
// data obj for tracking
const _data = {
  meta: {},
  trackers: {}
};
```
- TrackObj created for each elem, record when focus/blur/click happens

``` js
// TrackObj shape, to be pushed into _data 
{
  elId,
  elRef,
  elType,
  events:{
  	focus:[[],[]],
	mouse:[[],[]],
	click:[]
  }
}
```

#### Create trackerObj
```
_data.trackers[id]= createTrackObj(id, elType, elRef)
```
- Assign the TrackObj shape to _data 

#### Push events to trackerObj
- create multiple listeners that push time into the right place in TrackObj
- either we can make `_eventTypes` to be in the same order. e.g. `{mouseover, mouseleave}` or lets just hardcode the position inside the listeners
```
const _focusListen = (id, i) =>{
  _data.trackers[id].events.focus[i].push(_p.now())
}

```