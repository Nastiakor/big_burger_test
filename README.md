# Mobile Technical Test : Big Burger

<img src="https://github.com/Nastiakor/big_burger_test/assets/114946987/550a1328-44f7-4f7b-90e6-a7d45c702846" width="200"> 

This repository contains a draft of a Flutter mobile application for Big Burger, a new fast-food business. This application allows users to consult the menu of Big Burger, compose a cart, and view the total amount.

## Features

1. Fetch and display the menu from an API.
2. Add products to the cart with arbitrary quantities.
3. Display the total amount of the items in the cart.

## Application Structure

The application is structured according to Clean Architecture principles and makes use of the Provider pattern for state management. The application has Domain, Data, Provider, Presentation, App, Config and Utils layers:

### App Layer

- my_app.dart.

### Config Layer

- routes.dart : This file contains the routes of the application.

### Domain Layer

- domain/entities/menu_item.dart : This file contains the MenuItem entity which represents each burger item.
- domain/entities/cart_item.dart : This file contains the CartItem entity which represents each item in the cart.

### Data Layer

- data/burger_api_service.dart : This file contains the BurgerApiService class, which is responsible for fetching the burger menu from an API. It makes a GET request to the given URL and parses the JSON response to a list of BurgerMenu objects.

### Providers Layer

- providers/cart_provider.dart : This file contains the CartProvider class which is responsible for managing the state of the cart. It includes methods to add and remove items from the cart and calculate the total price.

### Presentation Layer

- presentation/pages/cart_page.dart : This page displays the items added to the cart and the total amount.
- presentation/pages/burger_detail_page.dart : This page displays the details of a selected burger. Users can add the item to the cart from this page.
- presentation/pages/home_page.dart : Homepage with the list of articles 
- presentation/widget/cart_icon_button.dart
- presentation/widget/custom_app_bar.dart

### Utils Layer

- theme.dart : In this file the ThemeData is defined.

## How it Works

The application fetches the menu items from an API and displays them in a list. Each menu item has an image, title, and price.
When the user taps on a menu item, they are taken to a detail page where they can view more information about the item.
On the detail page, the user can add the item to the cart.
Users can navigate to the cart page to see all the items they've added to their cart.
In the cart, the total amount is calculated and displayed.

## Additional information

### Customized launcher icon 

<img src="https://github.com/Nastiakor/big_burger_test/assets/114946987/16616038-32ae-4a65-9aac-d19a0f51bd58" width="200"> 

### Default image when an image fails to load 

<img src="https://github.com/Nastiakor/big_burger_test/assets/114946987/2cfda2e0-154b-4f46-8ba3-1b0bcd45d4ee" width="200"> 

### Image when the cart is empty

<img src="https://github.com/Nastiakor/big_burger_test/assets/114946987/5c0479cb-a158-43a4-a289-30fec29fc271" width="200"> 












