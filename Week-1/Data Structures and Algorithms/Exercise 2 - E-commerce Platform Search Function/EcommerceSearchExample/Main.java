public class Main {

    public static void main(String[] args) {

        Product[] products = {
                new Product(101, "Laptop", "Electronics"),
                new Product(102, "Shoes", "Fashion"),
                new Product(103, "Phone", "Electronics"),
                new Product(104, "Watch", "Accessories")
        };

        Product result1 = SearchFunctions.linearSearch(products, "Phone");

        if (result1 != null)
            System.out.println("Linear Search Found : " + result1.productName);

        Product result2 = SearchFunctions.binarySearch(products, "Phone");

        if (result2 != null)
            System.out.println("Binary Search Found : " + result2.productName);
    }
}