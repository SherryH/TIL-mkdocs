## Icon Buttons
Make the icons aligned with text vertically
``` js
const ImageIcon = styled.img`
  height: 1.25rem;
  vertical-align: bottom;
`;

const EmptyButton = styled.button`
  border: transparent;
  background: transparent;
`;

const IconButton = ({ src, alt }) => (
  <EmptyButton>
    <ImageIcon src={src} alt={alt} />
  </EmptyButton>
);

```