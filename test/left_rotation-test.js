const assert = require('chai').assert;

const  { List } = require('../left_rotation/list');

let myList = new List();
var matriz = [1,2,3,4,5];
myList = myList.loadMatriz(myList, matriz);

describe('Lists tests using assert interface from chai module', function() {
    describe('Check loadMatriz function', function() {
        it('Check array returned value using: assert.equal(): ', function() {
            var result = myList.printList(myList);
            assert.equal(result.toString(), matriz.toString());
        });
        it('Check array returned with 1 rotation using: asset.equal', function() {
            var matriz1 = [2,3,4,5,1];
            myList = myList.rotateLeft(myList, 1);
            var result = myList.printList(myList);
            assert.equal(result.toString(), matriz1.toString())
        })
        it('Check array returned with 2 rotation using: asset.equal', function() {
            var matriz2 = [3,4,5,1,2];
            myList = myList.rotateLeft(myList, 1);
            var result = myList.printList(myList);
            assert.equal(result.toString(), matriz2.toString())
        })
        it('Check array returned with 3 rotation using: asset.equal', function() {
            var matriz3 = [4,5,1,2,3];
            myList = myList.rotateLeft(myList, 1);
            var result = myList.printList(myList);
            assert.equal(result.toString(), matriz3.toString())
        })
        it('Check array returned with 4 rotation using: asset.equal', function() {
            var matriz4 = [5,1,2,3,4];
            myList = myList.rotateLeft(myList, 1);
            var result = myList.printList(myList);
            assert.equal(result.toString(), matriz4.toString())
        })
        it('Check array returned with 5 rotation using: asset.equal', function() {
            var matriz5 = [1,2,3,4,5];
            myList = myList.rotateLeft(myList, 1);
            var result = myList.printList(myList);
            assert.equal(result.toString(), matriz5.toString())
        })
    });
});