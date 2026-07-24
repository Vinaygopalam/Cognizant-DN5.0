import React from 'react';

const books = [
  { id: 1, title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', price: 10.99 },
  { id: 2, title: '1984', author: 'George Orwell', price: 8.99 },
  { id: 3, title: 'To Kill a Mockingbird', author: 'Harper Lee', price: 12.99 },
  { id: 4, title: 'Pride and Prejudice', author: 'Jane Austen', price: 9.99 },
  { id: 5, title: 'The Catcher in the Rye', author: 'J.D. Salinger', price: 11.99 }
];

function BookDetails() {
  const [showAll, setShowAll] = React.useState(true);
  const [filterMode, setFilterMode] = React.useState('all');

  const displayedBooks = filterMode === 'expensive' ? books.filter(book => book.price > 10) : books;

  return (
    <div className="details-container">
      <h2>Book Details</h2>

      {showAll ? (
        <p className="info-text">Showing all books</p>
      ) : (
        <p className="info-text">Showing selected books</p>
      )}

      <div className="button-group">
        <button onClick={() => { setShowAll(true); setFilterMode('all'); }}>Show All</button>
        <button onClick={() => { setShowAll(false); setFilterMode('expensive'); }}>Show Expensive</button>
      </div>

      <div className="card-grid">
        {displayedBooks.length > 0 ? (
          displayedBooks.map(book => (
            <div key={book.id} className="card">
              <h3>{book.title}</h3>
              <p>Author: {book.author}</p>
              <p>Price: ₹{book.price.toFixed(2)}</p>
              {book.price > 10 && <span className="badge">Expensive</span>}
            </div>
          ))
        ) : (
          <p className="no-data">No books found</p>
        )}
      </div>
    </div>
  );
}

export default BookDetails;
