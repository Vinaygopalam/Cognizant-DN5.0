import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Home from './components/Home';
import TrainersList from './components/TrainersList';
import TrainerDetails from './components/TrainerDetails';
import './App.css';
import './index.css';

export default function App() {
  return (
    <Router>
      <div className="app">
        <header className="app-header">
          <h1>Cognizant Academy</h1>
          <nav className="app-nav">
            <Link to="/" className="nav-link">Home</Link>
            <Link to="/trainers" className="nav-link">Trainer List</Link>
          </nav>
        </header>

        <main className="app-main">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/trainers" element={<TrainersList />} />
            <Route path="/trainers/:id" element={<TrainerDetails />} />
          </Routes>
        </main>

        <footer className="app-footer">
          <p>© 2026 Cognizant Academy. All rights reserved.</p>
        </footer>
      </div>
    </Router>
  );
}
