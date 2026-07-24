import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { Product } from '../models/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private products: Product[] = [
    {
      id: 1,
      name: 'Laptop',
      description: 'High performance laptop with 16GB RAM',
      price: 65000,
      image: 'https://via.placeholder.com/300x200/667eea/ffffff?text=Laptop',
      quantity: 10
    },
    {
      id: 2,
      name: 'Smartphone',
      description: 'Latest smartphone with 128GB storage',
      price: 25000,
      image: 'https://via.placeholder.com/300x200/764ba2/ffffff?text=Smartphone',
      quantity: 20
    },
    {
      id: 3,
      name: 'Headphones',
      description: 'Wireless noise cancelling headphones',
      price: 2500,
      image: 'https://via.placeholder.com/300x200/f093fb/ffffff?text=Headphones',
      quantity: 50
    },
    {
      id: 4,
      name: 'Keyboard',
      description: 'Mechanical gaming keyboard',
      price: 1500,
      image: 'https://via.placeholder.com/300x200/4facfe/ffffff?text=Keyboard',
      quantity: 30
    },
    {
      id: 5,
      name: 'Mouse',
      description: 'Ergonomic wireless mouse',
      price: 800,
      image: 'https://via.placeholder.com/300x200/43e97b/ffffff?text=Mouse',
      quantity: 40
    },
    {
      id: 6,
      name: 'Monitor',
      description: '27 inch 4K display monitor',
      price: 12000,
      image: 'https://via.placeholder.com/300x200/fa709a/ffffff?text=Monitor',
      quantity: 15
    }
  ];

  getProducts(): Observable<Product[]> {
    return of(this.products);
  }
}
