import Trainer from '../models/trainer';

const TrainersMock = [
  new Trainer(
    1,
    'Rahul Sharma',
    'rahul.sharma@example.com',
    '+91-9876543210',
    'React',
    ['JavaScript', 'Redux', 'React Hooks', 'TypeScript', 'Next.js']
  ),
  new Trainer(
    2,
    'Priya Patel',
    'priya.patel@example.com',
    '+91-9876543211',
    'Angular',
    ['TypeScript', 'RxJS', 'NgRx', 'HTML5', 'SCSS']
  ),
  new Trainer(
    3,
    'Amit Kumar',
    'amit.kumar@example.com',
    '+91-9876543212',
    'Java',
    ['Spring Boot', 'Hibernate', 'Microservices', 'AWS', 'Docker']
  ),
  new Trainer(
    4,
    'Sneha Reddy',
    'sneha.reddy@example.com',
    '+91-9876543213',
    '.NET',
    ['C#', 'ASP.NET Core', 'Entity Framework', 'Azure', 'SQL Server']
  ),
  new Trainer(
    5,
    'Vikram Singh',
    'vikram.singh@example.com',
    '+91-9876543214',
    'Python',
    ['Django', 'Flask', 'Pandas', 'NumPy', 'Machine Learning']
  ),
];

export default TrainersMock;
