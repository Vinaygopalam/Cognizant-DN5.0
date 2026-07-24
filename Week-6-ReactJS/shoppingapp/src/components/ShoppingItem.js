import React, { Component } from 'react';

class ShoppingItem extends Component {
  render() {
    const { ItemName, Price, index } = this.props;
    const rowClass = index % 2 === 0 ? 'even-row' : 'odd-row';

    return (
      <tr className={rowClass}>
        <td>{ItemName}</td>
        <td>₹{Price.toLocaleString('en-IN')}</td>
      </tr>
    );
  }
}

export default ShoppingItem;
