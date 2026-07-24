import { useParams } from 'react-router-dom';
import TrainersMock from '../data/TrainersMock';

export default function TrainerDetails() {
  const { id } = useParams();
  const trainer = TrainersMock.find((t) => t.TrainerId === parseInt(id));

  if (!trainer) {
    return (
      <div className="trainer-details-container">
        <h1>Trainer Not Found</h1>
      </div>
    );
  }

  return (
    <div className="trainer-details-container">
      <div className="trainer-card">
        <h1>Trainer Details</h1>
        <div className="detail-row">
          <span className="detail-label">Trainer ID:</span>
          <span className="detail-value">{trainer.TrainerId}</span>
        </div>
        <div className="detail-row">
          <span className="detail-label">Name:</span>
          <span className="detail-value">{trainer.Name}</span>
        </div>
        <div className="detail-row">
          <span className="detail-label">Email:</span>
          <span className="detail-value">{trainer.Email}</span>
        </div>
        <div className="detail-row">
          <span className="detail-label">Phone:</span>
          <span className="detail-value">{trainer.Phone}</span>
        </div>
        <div className="detail-row">
          <span className="detail-label">Technology:</span>
          <span className="detail-value">{trainer.Technology}</span>
        </div>
        <div className="detail-row">
          <span className="detail-label">Skills:</span>
          <ul className="skills-list">
            {trainer.Skills.map((skill, index) => (
              <li key={index}>{skill}</li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
}
