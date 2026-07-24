import React, { useState } from 'react';
import './../App.css';

function ComplaintRegister() {
  const [employeeName, setEmployeeName] = useState('');
  const [complaint, setComplaint] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!employeeName.trim() || !complaint.trim()) {
      alert('Please fill in all fields.');
      return;
    }

    const referenceNumber = 'CMP-' + Math.floor(1000 + Math.random() * 9000);

    alert(
      `Complaint Registered Successfully!\nEmployee Name: ${employeeName}\nReference Number: ${referenceNumber}`
    );

    setEmployeeName('');
    setComplaint('');
  };

  return (
    <div className="form-container">
      <form onSubmit={handleSubmit} className="complaint-form">
        <h2>Complaint Register</h2>

        <label htmlFor="employeeName">Employee Name</label>
        <input
          type="text"
          id="employeeName"
          value={employeeName}
          onChange={(e) => setEmployeeName(e.target.value)}
          placeholder="Enter employee name"
        />

        <label htmlFor="complaint">Complaint</label>
        <textarea
          id="complaint"
          value={complaint}
          onChange={(e) => setComplaint(e.target.value)}
          placeholder="Describe your complaint"
          rows="5"
        />

        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default ComplaintRegister;
