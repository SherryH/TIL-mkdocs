### Get the keys of an object as a type (Union of literals)
``` typescript
const columnMetric = {
  date: 'addDateCategory',
  performance: 'selectSpend',
}

// typeof columnMetric gives the type of the object => "object"

keyof typeof columnMetric // gives Type of Union of string literals 'date', 'performance'

// Check if something belongs to the object properties

const isPlatformMetric = (label:string): label is keyof typeof columnMetric =>{
  return Object.keys(columnMetric).includes(label)
}


```
### Make the values satisfy a certain type

### Make the Array values of a type
``` typescript
const journeySteps = ['step1', 'step2', 'step3'] as const // readonly array

// take the type from index access types [number]
// Union of string literals
type JourneySteps = typeof journeySteps[number] // 'step1' | 'step2' | 'step3'
```


### Error
```
Type 'Record<"addDateCategory", UserJourneyStepStatus>' is not assignable to type 'Record<"addDateCategory" | "createNewReport" | "createBlankReport" | "createReport" | "selectDimensions" | "addCampaign" | "applyChangesToDimension" | "selectColumns" | "addColumnMetric" | ... 12 more ... | "saveReport", UserJourneyStepStatus>'.
```