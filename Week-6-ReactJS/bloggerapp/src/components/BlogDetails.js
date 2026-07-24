import React from 'react';

const blogs = [
  { id: 1, title: 'Getting Started with React', author: 'John Doe', date: '2024-01-15', category: 'Technology' },
  { id: 2, title: 'Understanding JavaScript Closures', author: 'Jane Smith', date: '2024-02-20', category: 'Programming' },
  { id: 3, title: 'CSS Grid vs Flexbox', author: 'Mike Johnson', date: '2024-03-10', category: 'Design' },
  { id: 4, title: 'Node.js Best Practices', author: 'Sarah Wilson', date: '2024-04-05', category: 'Technology' },
  { id: 5, title: 'TypeScript Tutorial', author: 'David Brown', date: '2024-05-12', category: 'Programming' }
];

function BlogDetails() {
  const [selectedCategory, setSelectedCategory] = React.useState('All');

  const filteredBlogs = selectedCategory === 'All'
    ? blogs
    : blogs.filter(blog => blog.category === selectedCategory);

  return (
    <div className="details-container">
      <h2>Blog Details</h2>

      <div className="button-group">
        <button onClick={() => setSelectedCategory('All')}>All</button>
        <button onClick={() => setSelectedCategory('Technology')}>Technology</button>
        <button onClick={() => setSelectedCategory('Programming')}>Programming</button>
        <button onClick={() => setSelectedCategory('Design')}>Design</button>
      </div>

      <div className="list-container">
        {filteredBlogs.length > 0 ? (
          filteredBlogs.map(blog => (
            <div key={blog.id} className="list-item">
              <h3>{blog.title}</h3>
              <p>By {blog.author} on {blog.date}</p>
              <span className="category-tag">{blog.category}</span>
            </div>
          ))
        ) : (
          <p className="no-data">No blogs found in this category</p>
        )}
      </div>
    </div>
  );
}

export default BlogDetails;
