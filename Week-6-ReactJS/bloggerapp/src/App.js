import React, { useState } from 'react';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';
import CourseDetails from './components/CourseDetails';
import './App.css';

function App() {
  const [activeTab, setActiveTab] = useState('books');

  const renderContent = () => {
    if (activeTab === 'books') {
      return <BookDetails />;
    } else if (activeTab === 'blogs') {
      return <BlogDetails />;
    } else {
      return <CourseDetails />;
    }
  };

  return (
    <div className="app">
      <header className="app-header">
        <h1>Blogger App</h1>
        <p>Explore Books, Blogs, and Courses</p>
      </header>

      <nav className="tab-nav">
        <button
          className={activeTab === 'books' ? 'active' : ''}
          onClick={() => setActiveTab('books')}
        >
          Book Details
        </button>
        <button
          className={activeTab === 'blogs' ? 'active' : ''}
          onClick={() => setActiveTab('blogs')}
        >
          Blog Details
        </button>
        <button
          className={activeTab === 'courses' ? 'active' : ''}
          onClick={() => setActiveTab('courses')}
        >
          Course Details
        </button>
      </nav>

      <main className="app-main">
        {renderContent()}
      </main>
    </div>
  );
}

export default App;
