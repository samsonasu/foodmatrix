angular.module('foodmatrix.services').factory('Lists', function() {
  var lists;
  if (lists = localStorage.getItem('lists')) {
    lists = JSON.parse(lists);
  } else {
    lists = {
      1: {
        id: 1,
        attributes: [
          {name: "Crust"},
          {name: "Sauce"},
          {name: "Cheese"}
        ],
        name: 'Frozen Pizza',
        items: [
          { id: 1, name: "Jacks"},
          { id: 2, name: "Jan's"},
          { id: 3, name: "O'Grady's"}
        ]
      },
      2: { id: 2, name: 'Red Wine'},
      3: { id: 3, name: 'Chicken Wings'}
    };
  }

  return {
    all: function() {
      return lists;
    },
    get: function(listId) {
      // Simple index lookup
      var list = lists[listId];
      if (list)
        list.id = listId;
      return list;
    },
    save: function(list) {
      if (!list.id) {
        list.id = new Date().getTime();
      }
      lists[list.id] = list;
      localStorage.setItem('lists', JSON.stringify(lists));
    }
  };
});