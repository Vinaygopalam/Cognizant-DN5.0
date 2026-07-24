import React, { useState } from 'react';
import './../App.css';

function Register() {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const [nameError, setNameError] = useState('');
  const [emailError, setEmailError] = useState('');
  const [passwordError, setPasswordError] = useState('');

  const validateName = (value) => {
    if (value.length === 0) {
      setNameError('');
    } else if (value.length < 5) {
      setNameError('Name must contain at least 5 characters.');
    } else {
      setNameError('');
    }
  };

  const validateEmail = (value) => {
    if (value.length === 0) {
      setEmailError('');
    } else if (!value.includes('@') || !value.includes('.')) {
      setEmailError('Email must contain both "@" and "."');
    } else {
      setEmailError('');
    }
  };

  const validatePassword = (value) => {
    if (value.length === 0) {
      setPasswordError('');
    } else if (value.length < 8) {
      setPasswordError('Password must contain at least 8 characters.');
    } else {
      setPasswordError('');
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    let isValid = true;

    if (name.length < 5) {
      setNameError('Name must contain at least 5 characters.');
      isValid = false;
    }

    if (!email.includes('@') || !email.includes('.')) {
      setEmailError('Email must contain both "@" and "."');
      isValid = false;
    }

    if (password.length < 8) {
      setPasswordError('Password must contain at least 8 characters.');
      isValid = false;
    }

    if (isValid) {
      alert('Registration Successful!');
      setName('');
      setEmail('');
      setPassword('');
      setNameError('');
      setEmailError('');
      setPasswordError('');
    }
  };

  return (
    <div className="form-container">
      <form onSubmit={handleSubmit} className="register-form">
        <h2>Register</h2>

        <label htmlFor="name">Name</label>
        <input
          type="text"
          id="name"
          value={name}
          onChange={(e) => {
            setName(e.target.value);
            validateName(e.target.value);
          }}
          placeholder="Enter your name"
        />
        {nameError && <span className="error">{nameError}</span>}

        <label htmlFor="email">Email</label>
        <input
          type="text"
          id="email"
          value={email}
          onChange={(e) => {
            setEmail(e.target.value);
            validateEmail(e.target.value);
          }}
          placeholder="Enter your email"
        />
        {emailError && <span className="error">{emailError}</span>}

        <label htmlFor="password">Password</label>
        <input
          type="password"
          id="password"
          value={password}
          onChange={(e) => {
            setPassword(e.target.value);
            validatePassword(e.target.value);
          }}
          placeholder="Enter your password"
        />
        {passwordError && <span className="error">{passwordError}</span>}

        <button type="submit">Register</button>
      </form>
    </div>
  );
}

export default Register;
