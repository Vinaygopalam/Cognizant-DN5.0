import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CartService } from '../../services/cart.service';
import { CartItem } from '../../services/cart.service';

@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.css'
})
export class CartComponent implements OnInit {
  cartItems: CartItem[] = [];
  grandTotal: number = 0;

  constructor(private cartService: CartService) {}

  ngOnInit(): void {
    this.refreshCart();
  }

  refreshCart(): void {
    this.cartItems = this.cartService.getCartItems();
    this.grandTotal = this.cartService.getGrandTotal();
  }

  increaseQuantity(productId: number): void {
    this.cartService.increaseQuantity(productId);
    this.refreshCart();
  }

  decreaseQuantity(productId: number): void {
    this.cartService.decreaseQuantity(productId);
    this.refreshCart();
  }

  removeItem(productId: number): void {
    this.cartService.removeFromCart(productId);
    this.refreshCart();
  }
}
