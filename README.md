# Mobile Technical Test: Big Burger

<img src="https://github.com/Nastiakor/big_burger_test/assets/114946987/550a1328-44f7-4f7b-90e6-a7d45c702846" width="250"> 

## Scenario
_Big Burger_, a new fast food business, is coming to Paris and would like to launch a mobile app. They want their customers to (1) consult the menu of their restaurants, (2) compose a cart, and (3) pay online. The customers will then come to the restaurant to take out their lunch without waiting.

We are asking you to develop a first draft of the mobile app with the following two functionalities:

1. Fetch the menu from an API, and display it as a product list with pictures and prices;

2. Allow users to compose a cart with arbitrary quantities of each product, and display the total amount.

**No wireframe or mockup is provided.** It's up to you to design these interfaces the most logical and practical way you can imagine.

## Resources

The API is available by making a `GET` request to `https://uad.io/bigburger`

**It is intended behaviour** that the API takes a random time to return, and will randomly fail. You are expected to take this into account by providing a way to refresh the list or retry the request whenever it fails.

**It is also intended behaviour** that the prices are returned in euro cents, which is common practice when dealing with monetary amounts. You are expected to perform calculations, conversions and proper formatting for display on-device according to the user‚Äôs settings.

## Data model

The API call, when it succeeds, will return an array of Burgers. Here is the data model of a Burger object:

Property name | Type | Optional | Notes
`ref` | `String` | Mandatory, unique | The product identifier
`title` | `String` | Mandatory | The name of the product
`description` | `String?` | Optional | A long-form description of the product
`thumbnail` | `URL?` | Optional | The absolute URL to an image of the product, to be used in the list. It may happen that this URL does not respond.
`price` | `Integer` | Mandatory | The price of the product, in Euro cents

