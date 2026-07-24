import { Link } from 'react-router-dom';
import TrainersMock from '../data/TrainersMock';

export default function TrainersList() {
  return (
    <div className="trainers-list-container">
      <h1>Trainers List</h1>
      <div className="trainers-list">
        {TrainersMock.map((trainer) => (
          <Link
            key={trainer.TrainerId}
            to={`/trainers/${trainer.TrainerId}`}
            className="trainer-link"
          >
            {trainer.Name}
          </Link>
        ))}
      </div>
    </div>
  );
}
