/*

Items should look like: {
  sku: 'xyzlm',
  name: 'applesauce',
  category: 'cannedfoods',
  quantity: 43,
}
*/

class Item {
  constructor(sku, itemName, category, quantity) {
    this.sku = sku;
    this.itemName = itemName;
    this.category = category;
    this.quantity = quantity;
  }
}

/*

ItemCreator is responsible for:
- Making sure all necessary information are present and valid
  - SKU code
    - Consists of the first 3 letters of the item name and the first 2 letters of the item category
  - Item name
    - Must be a minimum of 5 characters, spaces don't count as a character
  - Category
    - Must be a minimum of 5 characters & a single word
  - Quantity
    - cannot be blank
    - can assume valid number will be provided

if any of the information is not valid, return the following object { notValid: true }

*/
class ItemCreator {
  static createItem(itemName, category, quantity) {
    function isValidName(name) {
      return name.replaceAll(/[ ]/g, '').length >= 5;
    }
    
    function isValidCategory(category) {
      return category.length >= 5 && category.trim().split(/[ ]+/g).length === 1;
    }
    
    function isValidQuantity(quantity) {
      return quantity !== undefined;
    }

    function isValidItem(name, category, quantity) {
      return isValidName(name) && isValidCategory(category) && isValidQuantity(quantity);
    }

    function createSku() {
      const FIRST_THREE_LETTERS_REGEX = /^.*?([a-z]).*?([a-z]).*?([a-z]).*$/gi;
      const FIRST_TWO_LETTERS_REGEX = /^.*?([a-z]).*?([a-z]).*$/gi;
      let sku = itemName.replace(FIRST_THREE_LETTERS_REGEX, '$1$2$3') + category.replace(FIRST_TWO_LETTERS_REGEX, '$1$2');

      sku = sku.toUpperCase();

      return sku;
    }

    if (isValidItem(itemName, category, quantity)) {
      return new Item(createSku(), itemName, category, quantity);
    } else {
      return { notValid: true };
    }
  }
}

/*
ItemManager is responsible for creating items, updating information about items, deleting items, and querying information about the items.

Has the following methods:
- create
  - Creates a new item. Returns false if not successful
- update
  - Accepts an SKU Code and an object as an argument. Updates any of the information on an item. Asusme valid values will be provided.
- delete
  - Accepts an SKU code and deletes the item from the list. Assume a valid SKU code is provided
- items
  - Contains a list of all the items
- inStock
  - Lists all the items that have a quantity gretaer than 0.
- itemsInCategory
  - Lists all items for a given category

Can add additional methods as necessary.

*/

class ItemManager {
  static items = []
  
  static create(name, category, quantity) {
    let item = ItemCreator.createItem(name, category, quantity);
    if (item.notValid) {
      return false;
    } else {
      ItemManager.items.push(item);
    }
  }
  
  static update(sku, obj) {
    let item = ItemManager.items.find(i => i.sku === sku);

    Object.assign(item, obj);
  }

  static delete(sku) {
    let index = ItemManager.items.findIndex(i => i.sku === sku);

    ItemManager.items.splice(index, 1);
  }
  
  static inStock() {
    return ItemManager.items.filter(i => i.quantity > 0);
  }

  static itemsInCategory(category) {
    return ItemManager.items.filter(i => i.category === category);
  }
}

/*

ReportManager generates reports for a specific item or ALL items.

Reports for specific items are generated from report objects created from the report manager.

The report manager is responsible for reports for all items.

Has the following methods:
- init
  - Accepts the ItemManager object as an argument and assigns it to the items property
- createReporter
  - Accepts an SKU code as an argument and returns an object
    - Returned object has a single method, itemInfo.
      - itemInfo logs to the console all the properties of an objects as "key:value" pairs (one pair per line).
    - No other properties or methods on the returned object
- reportInStock
  - Logs to the console the item names of all the items that are in stock as comma separated values.

*/

class ReportManager {
  static items
  
  static init(manager) {
    ReportManager.items = manager;
  }

  static createReporter(sku) {
    let item = ReportManager.items.items.find(i => i.sku === sku); // don't like the double items property accessors...
    
    return {
      itemInfo() {
        Object.getOwnPropertyNames(item).forEach(key => {
          console.log(`${key}: ${item[key]}`);
        });
      }
    };
  }

  static reportInStock() {
    let inStockString = ReportManager.items.inStock().map(i => i.itemName).join(',');

    console.log(inStockString);
  }
}


ItemManager.create('basket ball', 'sports', 0);           // valid item
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

ItemManager.items;
// returns list with the 4 valid items

ReportManager.init(ItemManager);
ReportManager.reportInStock();
// // logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
ItemManager.inStock();
// // returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// // logs football,kitchen pot
ItemManager.itemsInCategory('sports');
// // returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
ItemManager.items;
// // returns list with the remaining 3 valid items (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// // logs
// // skuCode: KITCO
// // itemName: kitchen pot
// // category: cooking
// // quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// // logs
// // skuCode: KITCO
// // itemName: kitchen pot
// // category: cooking
// // quantity: 10