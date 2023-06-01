class TrieNode {
  bool? isEndOfWord;
  Map<String, TrieNode>? children;

  TrieNode() {
    isEndOfWord = false;
    children = {};
  }
}

class Trie {
  TrieNode? root;

  Trie() {
    root = TrieNode();
  }

  void insert(String word) {
    TrieNode currentNode = root!;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!currentNode.children!.containsKey(char)) {
        currentNode.children![char] = TrieNode();
      }

      currentNode = currentNode.children![char]!;
    }

    currentNode.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode currentNode = root!;

    for (int i = 0; i < word.length; i++) {
      String char = word[i];

      if (!currentNode.children!.containsKey(char)) {
        return false;
      }

      currentNode = currentNode.children![char]!;
    }

    return currentNode.isEndOfWord!;
  }

  bool startsWith(String prefix) {
    TrieNode currentNode = root!;

    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];

      if (!currentNode.children!.containsKey(char)) {
        return false;
      }

      currentNode = currentNode.children![char]!;
    }

    return true;
  }
}

void main() {
  Trie trie = Trie();

  trie.insert("apple");
  trie.insert("banana");
  trie.insert("orange");

  print(trie.search("apple"));
  print(trie.search("banana"));
  print(trie.search("orange"));
  print(trie.search("grape"));

  print(trie.startsWith("app"));
  print(trie.startsWith("ban"));
  print(trie.startsWith("ora"));
  print(trie.startsWith("gr"));
}
