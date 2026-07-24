import { Injectable } from '@angular/core';
import { Product } from '../models/product.model';

export interface CartItem {
  product: Product;
  quantity: number;
}

@Injectable({
  providedIn: 'root'
})
export class CartService {
  private cartItems: CartItem[] = [];

  addToCart(product: Product): void {
    const existingItem = this.cartItems.find(item => item.product.id === product.id);
    if (existingItem) {
      existingItem.quantity += 1;
    } else {
      this.cartItems.push({ product: product, quantity: 1 });
    }
  }

  removeFromCart(productId: number): void {
    this.cartItems = this.cartItems.filter(item => item.product.id !== productId);
  }

  increaseQuantity(productId: number): void {
    const item = this.cartItems.find(item => item.product.id === productId);
    if (item) {
      item.quantity += 1;
    }
  }

  decreaseQuantity(productId: number): void {
    const item = this.cartItems.find(item => item.product.id === productId);
    if (item) {
      item.quantity -= 1;
      if (item.quantity <= 0) {
        this.removeFromCart(productId);
      }
    }
  }

  getCartItems(): CartItem[] {
    return this.cartItems;
  }

  getCartCount(): number {
    return this.cartItems.reduce((count, item) => count + item.quantity, 0);
  }

  getGrandTotal(): number {
    return this.cartItems.reduce((total, item) => total + (item.product.price * item.quantity), 0);
  }

  clearCart(): void {
    this.cartItems = [];
  }
}
