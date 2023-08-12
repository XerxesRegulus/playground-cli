# playground-cli
This exercise is based on the [Marketplacer Code Exercise](https://gist.github.com/alexrogers/63d262d4e07b75a45c646cd4f473accf)

### Version

```
Ruby 3.2.2
```

### Installation

```
git clone git@github.com:XerxesRegulus/playground-cli.git
cd playground-cli
```

### Setup

The gemfile only has rspec in it. If you're not gonna run the test this step can be skipped entirely.
```
bundle install
```

### Usage

`ruby playground.rb [options]`

#### Available options

`-h, --help`

Prints out the available options and their descriptions.

---

`-l, --list`

Lists the available products to be added into the cart. Most importantly this is where you can get the Product # for the `-a` command.

---

`-a, --add-to-cart` 

Will accept a Product # as an argument to add a specific product to the cart.

Example: `ruby playground.rb -a 1`

---

`-c, --cart-list`

Will print the products you have in your cart with the total. The discount is also shown here if its applicable.

### Testing

```
rspec spec
```

### Notes

#### The index is used for the product # instead of the UUID

When you type in `ruby playground.rb -l` you will notice that the product ID is not the same as the product's UUID provided in the json file.

The main drive behind this is that it's generally not a good idea to expose your record's ID for security reasons. Normally it would be encrypted if its gonna be exposed to the world, but to make things simpler I just opted to use the index.
Another benefit to it is its a lot easier to type single digit numbers compared to a multidigit UUID.

#### There is now an amount for each cart item

If you have an item in your cart and type in `ruby playground.rb -c` there is an amount column that wasnt in the spec.

The way playground-cli persists the cart is by using a `cart.json` file in the project folder. If you add a product into the cart it will add a JSON object into the file, now imagine adding the same product again and again into the file. Instead of adding multiple of the same JSON object into the file
its better to just add 1 of that JSON object and append an amount to it. So whenever the same product is added into the cart it will just increase the amount that product has by 1.
