import { render, screen } from '@testing-library/react';
import App from '../../apps/App';

test('renders made_by_madison_PUBLIC link', () => {
  render(<App />);
  const linkElement = screen.getByText(/made_by_madison_PUBLIC/i);
  expect(linkElement).toBeInTheDocument();
});
