import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learns react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/I am on the feature branch/i);
  expect(linkElement).toBeInTheDocument();
});
