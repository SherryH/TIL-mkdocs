 links: [[202105131116- TypeScript]]
 
 ## useLabel
 https://react-spectrum.adobe.com/react-aria/useLabel.html
 
 https://github.com/adobe/react-spectrum/blob/d62656bdb6/packages/%40react-aria/label/src/useLabel.ts
 
 ## Observations
 - ElementType and LabelHTMLAttributes are 2 types provided by React for using TypeScript. 
 - The other types seem to be based on them, which is good. The labels have 2 main components: label and htmlFor, which we don't need to define by ourselves separately.
 - [TypeScript React Cheatsheet](https://www.saltycrane.com/cheat-sheets/typescript/react/latest/) has a comprehensive list of the native types provided!
 - When working on other components, it is best to check what available types are present!

### TypeScript Interface Extends Multiple
```
export interface LabelAriaProps extends LabelableProps, DOMProps, AriaLabelingProps {
  /**
   * The HTML element used to render the label, e.g. 'label', or 'span'.
   * @default 'label'
   */
  labelElementType?: ElementType
}
```
- [TypeScript Handbook ](https://www.typescriptlang.org/docs/handbook/interfaces.html#extending-interfaces)talks about multiple extends, where the new interface inherits all of the parents properties.