import React from "react";

function ListofPlayers() {
  const players = [
    { name: "Virat Kohli", score: 95 },
    { name: "Rohit Sharma", score: 80 },
    { name: "Shubman Gill", score: 68 },
    { name: "KL Rahul", score: 72 },
    { name: "Hardik Pandya", score: 66 },
    { name: "Ravindra Jadeja", score: 85 },
    { name: "R Ashwin", score: 60 },
    { name: "Mohammed Shami", score: 75 },
    { name: "Jasprit Bumrah", score: 90 },
    { name: "Kuldeep Yadav", score: 55 },
    { name: "Surya Kumar Yadav", score: 88 }
  ];

  const below70 = players.filter(player => player.score < 70);

  return (
    <div>
      <h2>List of Players</h2>

      <ul>
        {players.map((player, index) => (
          <li key={index}>
            {player.name} - {player.score}
          </li>
        ))}
      </ul>

      <h2>Players Scoring Below 70</h2>

      <ul>
        {below70.map((player, index) => (
          <li key={index}>
            {player.name} - {player.score}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ListofPlayers;