import React from "react";
import ListofPlayers from "./Components/ListofPlayers";
import IndianPlayers from "./Components/IndianPlayers";

function App() {
  const flag = true;

  return (
    <div style={{ padding: "20px" }}>
      <h1>Week 6 - ReactJS Hands-On</h1>
      {flag ? <ListofPlayers /> : <IndianPlayers />}
    </div>
  );
}

export default App;