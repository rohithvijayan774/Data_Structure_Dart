import 'dart:io';

class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value) {
    left = null;
    right = null;
  }
}

class BinarySearchTree {
  Node? root;

  isEmpty() {
    // print('Checking null');
    return root == null;
  }

//Inserting Value
  insert(int value) {
    Node newNode = Node(value);

    if (isEmpty()) {
      root = newNode;
    } else {
      insertNode(root!, newNode);
    }
  }

//Inserting Node
  insertNode(Node root, Node newNode) {
    if (newNode.value < root.value) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        insertNode(root.left!, newNode);
      }
    } else {
      if (root.right == null) {
        root.right = newNode;
      } else {
        insertNode(root.right!, newNode);
      }
    }
  }

//Searching Element
  search(Node? root, int value) {
    if (root == null) {
      return 'Element $value is not present';
    } else {
      if (value == root.value) {
        return 'Element $value is present';
      } else if (value < root.value) {
        return search(root.left, value);
      } else {
        return search(root.right, value);
      }
    }
  }

//PreOrder - DFS
  preOrder(Node? root) {
    if (root != null) {
      stdout.write('${root.value} ');
      preOrder(root.left);
      preOrder(root.right);
    }
  }

//Inorder - DFS
  inOrder(Node? root) {
    if (root != null) {
      inOrder(root.left);
      stdout.write('${root.value} ');
      inOrder(root.right);
    }
  }

//PostOrder - DFS
  postOrder(Node? root) {
    if (root != null) {
      postOrder(root.left);
      postOrder(root.right);
      stdout.write('${root.value} ');
    }
  }

//LevelOrder - BFS
  levelOrder() {
    List<Node> queue = [];
    queue.add(root!);
    while (queue.isNotEmpty) {
      final curr = queue.removeAt(0);
      stdout.write("${curr.value} ");
      if (curr.left != null) {
        queue.add(curr.left!);
      }
      if (curr.right != null) {
        queue.add(curr.right!);
      }
    }
  }

//Get Min Value
  int getMinValue(Node? currentNode) {
    if (currentNode!.left == null) {
      return currentNode.value;
    } else {
      return getMinValue(currentNode.left);
    }
  }

//Get Max Value
  int getMaxValue(Node? temp) {
    if (temp!.right == null) {
      return temp.value;
    } else {
      return getMaxValue(temp.right);
    }
  }

//Check tree is a BST
  checkBST(Node? node) {
    if (node == null) {
      return true;
    }
    if (node.left != null && getMaxValue(node.left) > node.value) {
      return false;
    }
    if (node.right != null && getMinValue(node.right) < node.value) {
      return false;
    }
    if (checkBST(node.left) != true || checkBST(node.right) != true) {
      return false;
    }
    return true;
  }
}

void main() {
  final bst = BinarySearchTree();

  bst.insert(10);
  bst.insert(5);
  bst.insert(15);
  bst.insert(3);
  bst.insert(7);

  print('Searching');
  print(bst.search(bst.root, 1));
  print("");
  print("PreOrder");
  bst.preOrder(bst.root);
  print("");
  print("\nInOrder");
  bst.inOrder(bst.root);
  print("");
  print("\nPostOrder");
  bst.postOrder(bst.root);
  print("");
  print("\nLevelOrder");
  bst.levelOrder();

  // print("");
  print("\n");
  print('Min value');
  print(bst.getMinValue(bst.root));
  // print("");
  print("\n");
  print('Max value');
  print(bst.getMaxValue(bst.root));

  print("This tree is BST :${bst.checkBST(bst.root)}");
}
