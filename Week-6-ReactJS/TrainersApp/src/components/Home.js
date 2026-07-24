import { Link } from 'react-router-dom';

export default function Home() {
  return (
    <div className="home-container">
      <div className="home-card">
        <h1>Welcome to Cognizant Academy</h1>
        <p>This application maintains trainer information.</p>
        <Link to="/trainers" className="btn-primary">
          View Trainers
        </Link>
      </div>
    </div>
  );
}
