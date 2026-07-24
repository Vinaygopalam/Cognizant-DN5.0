import { Component } from '@angular/core';
import { CartService } from '../../services/cart.service';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [],
  templateUrl: './header.component.html',
  styleUrl: './header.component.css'
})
export class HeaderComponent {
  cartItemCount = 0;

  constructor(private cartService: CartService) {
    this.cartItemCount = this.cartService.getCartCount();
  }

  refreshCartCount(): void {
    this.cartItemCount = this.cartService.getCartCount();
  }
}
