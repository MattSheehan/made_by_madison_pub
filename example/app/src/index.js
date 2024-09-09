// Import React (library !== Framework), ReactDOM, and ReactRouter
import React from 'react';
import { createRoot } from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
// Import local components
import './index.scss';
import Router from './routes/Router';
import reportWebVitals from './utils/performance/reportWebVitals';
// Create root html element, initiate it with the app's entry point 'root'
const root = createRoot(document.getElementById('root'));
// instantiate 'root' entry point with rendered app components
root.render(
  <React.StrictMode>
    <BrowserRouter>
      <div className='root-div'><div className='root-container'>
        <Router />
      </div></div>
    </BrowserRouter>
  </React.StrictMode>
);
// Performance measuring of app logged to console.
reportWebVitals(console.log); 
