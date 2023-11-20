/*

In JS, 0 is a falsy value. Meaning that if one of the arguments provided for price, discount, serviceCharge, or tax is 0, then it is overriden and the default value is used instead. 

If the price is overriden, then an item that would be free would actually have a price.

If the discount is overriden, there is no change to the behaviour since the default discount is 0.

If the serviceCharge is overriden, then an item with no service charge would actually have a 10% service charge.

If the tax is overriden, then an item with no tax would actually have a 15% tax.

*/