import React, { Component } from 'react';
import Cart from '../models/Cart';
import ShoppingItem from './ShoppingItem';
import '../App.css';

class OnlineShopping extends Component {
  constructor(props) {
    super(props);
    this.state = {
      cartItems: [
        new Cart('Laptop', 65000),
        new Cart('Mouse', 800),
        new Cart('Keyboard', 1500),
        new Cart('Monitor', 12000),
        new Cart('Headphones', 2500)
      ]
    };
  }

  render() {
    return (
      <div className="shopping-container">
        <h1 className="shopping-heading">Online Shopping Cart</h1>
        <div className="table-wrapper">
          <table className="shopping-table">
            <thead>
              <tr>
                <th>Item Name</th>
                <th>Price</th>
              </tr>
            </thead>
            <tbody>
              {this.state.cartItems.map((item, index) => (
                <ShoppingItem
                  key={index}
                  ItemName={item.ItemName}
                  Price={item.Price}
                  index={index}
                />
              ))}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
}

export default OnlineShopping;
