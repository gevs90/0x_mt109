const { Item } = require('./item');
function List() {
    this.head = null;
    this.loadMatriz = function(list, matriz) {
        if (Array.isArray(matriz)) {
            matriz.forEach(function(i) {
                list.addNode(list, i);
            });
        } else {
            console.log('Error type data');
        }
        return list;
    }
    this.addNode = function(list, number) {
        const temp = new Item(number);
        let p;
        if (list.head === null) {
            list.head = temp;
        } else {
            p = list.head;
            while(p.link !== null) {
                p = p.link;
            }
            p.link = temp;
        }
    };
    this.rotateLeft = function(list, positions) {
        while(positions >= 1) {
            let number = list.head.number;

            let before = list.head;
            let p = before.link;
            list.head = p;
            this.addNode(list, number)

            positions--;
        }
        // [1, 2, 3, 4, 5],
        // [2, 3, 4, 5, 1],
        // [3, 4, 5, 1, 2],
        return list;
    }
    this.printList = function(list) {
        let items = [];
        if (list.head !== null) {
            let p = this.head;
            items.push(p.number);
            while(p.link !== null) {
                p = p.link;
                items.push(p.number);
            }
        }
        return items;
    }
}

exports.List = List;