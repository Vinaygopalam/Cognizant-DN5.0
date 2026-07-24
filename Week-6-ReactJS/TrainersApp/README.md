# TrainersApp

A React application for managing trainer information at Cognizant Academy.

## Features

- View welcome page
- Browse list of trainers
- View detailed trainer information
- Responsive design

## Tech Stack

- React 18
- React Router DOM v6
- Functional Components with Hooks

## Installation

```bash
npm install
```

## Running the Application

```bash
npm start
```

The application will open at [http://localhost:3000](http://localhost:3000).

## Project Structure

```
TrainersApp/
├── public/
│   └── index.html
├── src/
│   ├── models/
│   │   └── trainer.js
│   ├── data/
│   │   └── TrainersMock.js
│   ├── components/
│   │   ├── Home.js
│   │   ├── TrainersList.js
│   │   └── TrainerDetails.js
│   ├── App.js
│   ├── App.css
│   ├── index.js
│   └── index.css
├── package.json
└── README.md
```

## Routes

- `/` - Home
- `/trainers` - Trainers List
- `/trainers/:id` - Trainer Details
