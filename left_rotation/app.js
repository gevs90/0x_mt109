const  { List } = require('./list')

let myList = new List();

// Load Matriz to list
const array1 = [1,2,3,4,5];

myList = myList.loadMatriz(myList, array1);
myList = myList.rotateLeft(myList, 2);
console.log(myList.printList(myList));
